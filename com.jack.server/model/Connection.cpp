//
// Created by jack on 3/10/17.
//

#include "Connection.h"
#include <vector>
#include <boost/bind.hpp>
#include <boost/asio/impl/io_service.hpp>
#include <boost/logic/tribool.hpp>
#include <boost/tuple/detail/tuple_basic.hpp>
#include "../utils/ConnectionManager.h"
#include "../RequestHandler.h"

namespace server {

    Connection::Connection(boost::asio::io_service &io_service,
                           ConnectionManager &manager, RequestHandler &handler)
            : mSocket(io_service),
              connectionManager(manager),
              requestHandler(handler) {
    }

    boost::asio::ip::tcp::socket &Connection::socket() {
        return mSocket;
    }

    void Connection::start() {
        mSocket.async_read_some(boost::asio::buffer(buffer),
                                boost::bind(&Connection::handle_read, shared_from_this(),
                                            boost::asio::placeholders::error,
                                            boost::asio::placeholders::bytes_transferred));
    }

    void Connection::stop() {
        mSocket.close();
    }

    void Connection::handle_read(const boost::system::error_code &e,
                                 std::size_t bytes_transferred) {
        if (!e) {
            boost::tribool result;
            boost::tie(result, boost::tuples::ignore) = requestParser.parse(
                    request, buffer.data(), buffer.data() + bytes_transferred);

            if (result) {
                requestHandler.handleRequest(request, reply);
                boost::asio::async_write(mSocket, reply.to_buffers(),
                                         boost::bind(&Connection::handle_write, shared_from_this(),
                                                     boost::asio::placeholders::error));
            } else if (!result) {
                reply = Reply::stock_reply(Reply::bad_request);
                boost::asio::async_write(mSocket, reply.to_buffers(),
                                         boost::bind(&Connection::handle_write, shared_from_this(),
                                                     boost::asio::placeholders::error));
            } else {
                mSocket.async_read_some(boost::asio::buffer(buffer),
                                        boost::bind(&Connection::handle_read, shared_from_this(),
                                                    boost::asio::placeholders::error,
                                                    boost::asio::placeholders::bytes_transferred));
            }
        } else if (e != boost::asio::error::operation_aborted) {
            connectionManager.stop(shared_from_this());
        }
    }

    void Connection::handle_write(const boost::system::error_code &e) {
        if (!e) {
            // Initiate graceful connection closure.
            boost::system::error_code ignored_ec;
            mSocket.shutdown(boost::asio::ip::tcp::socket::shutdown_both, ignored_ec);
        }

        if (e != boost::asio::error::operation_aborted) {
            connectionManager.stop(shared_from_this());
        }
    }
}
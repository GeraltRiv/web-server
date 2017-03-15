//
// Created by jack on 3/10/17.
//

#ifndef WEBSERVER_CONNECTION_H
#define WEBSERVER_CONNECTION_H


#include <boost/asio.hpp>
#include <boost/array.hpp>
#include <boost/noncopyable.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/enable_shared_from_this.hpp>
#include "Request.h"
#include "../RequestHandler.h"
#include "../utils/RequestParser.h"
#include "../utils/ConnectionManager.h"

namespace server {
    class ConnectionManager;

    class Connection : public boost::enable_shared_from_this<Connection>,
                       private boost::noncopyable {


/// Represents a single connection from a client.
    public:
        /// Construct a connection with the given io_service.
        explicit Connection(boost::asio::io_service &io_service,
                            ConnectionManager &manager, RequestHandler &handler);

        /// Get the socket associated with the connection.
        boost::asio::ip::tcp::socket &socket();

        /// Start the first asynchronous operation for the connection.
        void start();

        /// Stop all asynchronous operations associated with the connection.
        void stop();


    private:
        /// Handle completion of a read operation.
        void handle_read(const boost::system::error_code &e,
                         std::size_t bytes_transferred);

        /// Handle completion of a write operation.
        void handle_write(const boost::system::error_code &e);

        /// Socket for the connection.
        boost::asio::ip::tcp::socket mSocket;

        /// The manager for this connection.
        ConnectionManager &connectionManager;

        /// The handler used to process the incoming request.
        RequestHandler &requestHandler;

        RequestParser requestParser;

        /// Buffer for incoming data.
        boost::array<char, 8192> buffer;

        /// The incoming request.
        Request request;

        Reply reply;


    };

    typedef boost::shared_ptr<Connection> ConnectionPtr;
}


#endif //WEBSERVER_CONNECTION_H

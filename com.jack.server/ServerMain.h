//
// Created by jack on 3/10/17.
//

#ifndef WEBSERVER_SERVERMAIN_H
#define WEBSERVER_SERVERMAIN_H


#include <boost/asio.hpp>
#include <string>
#include <boost/noncopyable.hpp>
#include "utils/ConnectionManager.h"
#include "model/Connection.h"
#include "RequestHandler.h"
#include "../connection.h"

namespace server {

    class ServerMain {

    public:
        /// Construct the server to listen on the specified TCP address and port, and
        /// serve up files from the given directory.
        explicit ServerMain(const std::string &address, const std::string &port);

        /// Run the server's io_service loop.
        void run();

    private:
        /// Initiate an asynchronous accept operation.
        void start_accept();

        /// Handle completion of an asynchronous accept operation.
        void handle_accept(const boost::system::error_code &e);

        /// Handle a request to stop the server.
        void handle_stop();

        boost::asio::io_service io_service_;

        boost::asio::signal_set signals_;

        boost::asio::ip::tcp::acceptor acceptor_;

        ConnectionManager connectionManager;

        ConnectionPtr newConnection;

        /// The handler for all incoming requests.
        RequestHandler requestHandler;
    };

}
#endif //WEBSERVER_SERVERMAIN_H

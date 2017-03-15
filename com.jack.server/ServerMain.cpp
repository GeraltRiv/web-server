//
// Created by jack on 3/10/17.
//

#include "ServerMain.h"
#include <boost/bind.hpp>


namespace server {

    ServerMain::ServerMain(const std::string &address, const std::string &port)
            : io_service_(),
              signals_(io_service_),
              acceptor_(io_service_),
              connectionManager(),
              requestHandler() {
        // Register to handle the signals that indicate when the server should exit.
        // It is safe to register for the same signal multiple times in a program,
        // provided all registration for the specified signal is made through Asio.
        signals_.add(SIGINT);
        signals_.add(SIGTERM);
#if defined(SIGQUIT)
        signals_.add(SIGQUIT);
#endif // defined(SIGQUIT)
        signals_.async_wait(boost::bind(&ServerMain::handle_stop, this));

        // Open the acceptor with the option to reuse the address (i.e. SO_REUSEADDR).
        boost::asio::ip::tcp::resolver resolver(io_service_);
        boost::asio::ip::tcp::resolver::query query(address, port);
        boost::asio::ip::tcp::endpoint endpoint = *resolver.resolve(query);
        acceptor_.open(endpoint.protocol());
        acceptor_.set_option(boost::asio::ip::tcp::acceptor::reuse_address(true));
        acceptor_.bind(endpoint);
        acceptor_.listen();

        start_accept();
    }

    void ServerMain::run() {
        // The io_service::run() call will block until all asynchronous operations
        // have finished. While the server is running, there is always at least one
        // asynchronous operation outstanding: the asynchronous accept call waiting
        // for new incoming connections.
        io_service_.run();
    }

    void ServerMain::start_accept() {
        newConnection.reset(new Connection(io_service_,
                                           connectionManager, requestHandler));
        acceptor_.async_accept(newConnection->socket(),
                               boost::bind(&ServerMain::handle_accept, this,
                                           boost::asio::placeholders::error));
    }

    void ServerMain::handle_accept(const boost::system::error_code &e) {
        // Check whether the server was stopped by a signal before this completion
        // handler had a chance to run.
        if (!acceptor_.is_open()) {
            return;
        }

        if (!e) {
            connectionManager.start(newConnection);
        }

        start_accept();
    }

    void ServerMain::handle_stop() {
        acceptor_.close();
//    connection_manager_.stop_all();
    }
}
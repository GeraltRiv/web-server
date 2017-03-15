//
// Created by jack on 3/10/17.
//

#include "ConnectionManager.h"
#include <boost/bind.hpp>

namespace server {
    void ConnectionManager::start(ConnectionPtr c) {
        connections.insert(c);
        c->start();
    }

    void ConnectionManager::stop(ConnectionPtr c) {
        connections.erase(c);
        c->stop();
    }

    void ConnectionManager::stop_all() {
        std::for_each(connections.begin(), connections.end(),
                      boost::bind(&Connection::stop, _1));
        connections.clear();
    }
}
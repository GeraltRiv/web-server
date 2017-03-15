//
// Created by jack on 3/10/17.
//

#ifndef WEBSERVER_CONNECTIONMANAGER_H
#define WEBSERVER_CONNECTIONMANAGER_H


#include <set>
#include "../model/Connection.h"
#include <boost/noncopyable.hpp>

namespace server {

    class ConnectionManager
            : private boost::noncopyable {

    public:
        void start(ConnectionPtr c);

        void stop(ConnectionPtr c);

        void stop_all();

    private:
        std::set<ConnectionPtr> connections;

    };
}


#endif //WEBSERVER_CONNECTIONMANAGER_H

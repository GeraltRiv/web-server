
//
// Created by jack on 3/10/17.
//

#ifndef WEBSERVER_REQUEST_H
#define WEBSERVER_REQUEST_H

#include <string>
#include <vector>
#include "Header.h"

namespace server {


    class Request {
// A request received from a client.
    public:
        std::string method;
        std::string uri;
        int http_version_major;
        int http_version_minor;
        std::vector<Header> headers;

    };

}
#endif //WEBSERVER_REQUEST_H

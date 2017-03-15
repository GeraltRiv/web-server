//
// Created by jack on 3/10/17.
//

#ifndef WEBSERVER_REQUESTHANDLER_H
#define WEBSERVER_REQUESTHANDLER_H

#include <string>
#include <boost/noncopyable.hpp>
#include "model/Request.h"
#include "model/Reply.h"

using namespace std;

namespace server {
    class RequestHandler {

        struct reply;
        struct request;
    public:
        /// Construct with a directory containing files to be served.
        explicit RequestHandler();

        /// Handle a request and produce a reply.
        void handleRequest(const Request &req, Reply &rep);

    private:
        /// Perform URL-decoding on a string. Returns false if the encoding was
        /// invalid.
        static bool url_decode(const std::string &in, std::string &out);
    };

}
#endif //WEBSERVER_REQUESTHANDLER_H

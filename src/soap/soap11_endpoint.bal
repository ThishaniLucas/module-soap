// Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/mime;

# Object for the SOAP 1.1 client endpoint.
#
# + soap11Client - The HTTP client created to send SOAP 1.1 requests.
public type Soap11Client client object {

    private http:Client soap11Client;

    public function __init(string url, http:ClientConfiguration? config = ()) {
        self.soap11Client = new (url, config = config);
    }

    # Sends SOAP 1.1 request and expects a response.
    #
    # + soapAction - SOAP action
    # + body - SOAP request body as an `XML` or `mime:Entity[]` to work with SOAP attachments
    # + options - SOAP options. E.g., headers, WS-addressing parameters, usernameToken parameters
    # + return - If successful, returns the response object. Else, returns an error
    public remote function sendReceive(string soapAction, xml | mime:Entity[] body, Options? options = ())
    returns @tainted SoapResponse | error {
        return sendReceive(SOAP11, body, self.soap11Client, soapAction = soapAction, options = options);
    }

    # Sends Robust SOAP 1.1 requests and possibly receives an error.
    #
    # + soapAction - SOAP action
    # + body - SOAP request body as an `XML` or `mime:Entity[]` to work with SOAP attachments
    # + options - SOAP options. E.g., headers, WS-addressing parameters, usernameToken parameters
    # + return - If successful, returns `nil`. Else, returns an error.
    public remote function sendRobust(string soapAction, xml | mime:Entity[] body, Options? options = ()) returns error? {
        return sendRobust(SOAP11, body, self.soap11Client, soapAction = soapAction, options = options);
    }

    # Fire and forget requests. Sends the request without the possibility of any response from the
    # service (even an error).
    #
    # + soapAction - SOAP action
    # + body - SOAP request body as an `XML` or `mime:Entity[]` to work with SOAP attachments
    # + options - SOAP options. E.g., headers, WS-addressing parameters, usernameToken parameters
    public remote function sendOnly(string soapAction, xml | mime:Entity[] body, Options? options = ()) {
        sendOnly(SOAP11, body, self.soap11Client, soapAction = soapAction, options = options);
    }
};

# * BSD License
# *     
# * Copyright (c) 2017, AT&T Intellectual Property.  All other rights reserved.       
# * 
# *  Redistribution and use in source and binary forms, with or without modification, are permitted
# *   provided that the following conditions are met:
# *
# *   1. Redistributions of source code must retain the above copyright notice, this list of conditions
# *      and the following disclaimer.
# *   2. Redistributions in binary form must reproduce the above copyright notice, this list of
# *      conditions and the following disclaimer in the documentation and/or other materials provided
# *      with the distribution.
# *   3. All advertising materials mentioning features or use of this software must display the
# *      following acknowledgement:  This product includes software developed by the AT&T.
# *   4. Neither the name of AT&T nor the names of its contributors may be used to endorse or
# *      promote products derived from this software without specific prior written permission.
# *
# *   THIS SOFTWARE IS PROVIDED BY AT&T INTELLECTUAL PROPERTY ''AS IS'' AND ANY EXPRESS OR
# *   IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# *   MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
# *   SHALL AT&T INTELLECTUAL PROPERTY BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# *   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# *   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;  LOSS OF USE, DATA, OR PROFITS;
# *   OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# *   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# *   ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
# *   DAMAGE.
# *******************************************************************************
Feature: Application section
  As a user
  I want to be able to add a new application for Private Key in the system

  @AddApplicationPrivateKey
  Scenario: Add a new application
    ##Given I am enetering credentials for Add Application Private Key
    Given I am on the dash board page for Private Key
    When I enter all the application details in tab one for Private Key
      | applicationName | categoryIndex | environmentIndex | serverName | role  | hostName | ipAddress | userName | privateKey |
      | PrivateKey Test |             1 |                1 | server1    | admin | host1    | 1.0.0.3   | user     | private    |
    When I click the next button on add application page for Private Key
    When I enter all the application details in tab two for Private Key
      | tierIndex | cpuIndex | memoryIndex | osIndex | storageIndex | osTypeIndex |
      |         1 |        1 | 12GB        |       1 | 12GB         |           1 |
    When I click the next button on add application page for Private Key
    When I enter all the application details in tab three for Private Key
      | softwareComponentName | processName |
      | httpd                 | web server  |
    When I click the next button on add application page for Private Key
    When I enter all the application details in tab five for Private Key
      | counterType | monitorApi       |
      | counterType | https://monitor/ |
    When I click the next button on add application page for Private Key
    When I enter all the application details in tab six for Private Key
      | logType | logLocation     |
      | sl4j    | http://tmp/log/ |
    When I click the submit button on add application page for Private Key
    And I click view application link on add application page for Private Key

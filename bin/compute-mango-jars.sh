#!/usr/bin/env bash
#
# Licensed to Big Data Genomics (BDG) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The BDG licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

# Figure out where MANGO is installed
MANGO_REPO="$(cd `dirname $0`/..; pwd)"

CLASSPATH="$(. "$MANGO_REPO"/bin/compute-mango-classpath.sh)"

# list of jars to ship with spark; trim off the first from the CLASSPATH --> this is /etc
# TODO: brittle? assumes appassembler always puts the $BASE/etc first and the CLI jar last
MANGO_JARS="$(echo "$CLASSPATH" | tr ":" "\n" | tail -n +2 | perl -pe 's/\n/,/ unless eof' )"

echo "$MANGO_JARS"

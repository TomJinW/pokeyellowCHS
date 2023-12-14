#!/bin/bash
filepath=$(cd "$(dirname "$0")"; pwd)
cd "$filepath"

# time python3 tools/match2.py xlsx/buildingsA.xlsx 1
# time python3 tools/match2.py xlsx/buildingsB.xlsx 1
# time python3 tools/match2.py xlsx/indoor.xlsx 1
# time python3 tools/match2.py xlsx/routes.xlsx 1
# time python3 tools/match2.py xlsx/core.xlsx 1
# time python3 tools/match2.py xlsx/outdoor.xlsx 1
# time python3 tools/match2.py xlsx/ratings.xlsx 1
#!/bin/sh
SCRIPT=$(readlink -f $0)
SCRIPT_DIR=`dirname $SCRIPT`

echo "The ScriptDir is: $SCRIPT_DIR"
echo "The number of argument is $#"

if [ $# -ne 2 ];then
    echo "Usage: $0 [InputFile.xsd] [OutputFile.rnc]"
fi
InFile="$1"
OutFile="$2"

CUR_DIR=`pwd`
WORK_DIR="$CUR_DIR/.tmp_xsd2rnc_converter"
mkdir -p $WORK_DIR

unzip $SCRIPT_DIR/rngconv-20060319.zip -d $WORK_DIR
unzip $SCRIPT_DIR/trang-20081028.zip -d $WORK_DIR
java -jar $WORK_DIR/rngconv-20060319/rngconv.jar $InFile > $WORK_DIR/res.rng
java -jar $WORK_DIR/trang-20081028/trang.jar -I rng -O rnc $WORK_DIR/res.rng $OutFile

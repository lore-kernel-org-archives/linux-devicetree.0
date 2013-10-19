From: "Chaiken, Alison" <Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: makedts, a script that runs CPP and then dtc to produce a single
 ascii-formatted file
Date: Sat, 19 Oct 2013 15:35:39 +0000
Message-ID: <60BA5429A0E1584BA3633194F6F993B50EAB5218@NA-MBX-03.mgc.mentorg.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org" <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Produces a similar result to fdtdump's output on a matching DTB, but with the advantage of having ASCII-formatted strings rather than hex ones.    With a further manipulation to turn the ASCII codes into hex ones, another transform can match makedts' output with fdtdump's in order to answer the question, "Can this set of DTS files produce this DTB file?"    The transform and matching part of the script is, ahem, not quite finished.

The script assumes that the CPP need not be run on DTS from kernels older than 3.8.

-- 
Alison Chaiken
Mentor Embedded Software

------------

# makedts
# Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
#
# Run dtc on a single device-tree source, invoking the
# C-preprocessor if appropriate, and processing all dependencies,
# to produce a single human-readable ASCII output.  Output is
# similar to fdtdump except that it operates on source files and
# emits strings as characters rather than hex equivalents.
#
# Copyright (c) 2013 Mentor Graphics.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or (at your option) any later version.

#!/bin/bash

CC=arm-none-linux-gnueabi-gcc
SRCARCH=arm
BASE=`basename $1 .dts`
DTC_CPP_FLAGS="-E -Wp,-MD,$BASE.pre.tmp -nostdinc -Iarch/$SRCARCH/boot/dts -Iarch/$SRCARCH/boot/dts/include -undef -D__DTS__  -x assembler-with-cpp"

function usage()
{
    echo ""
    echo "makedts compiles a top-level 'board file' device-tree source file "
    echo "by processing all its dependencies and producing output with the suffix out.dts."
    echo ""
    echo "Run this script from the kernel top-level source directory and "
    echo "provide the name of one device-tree file to preprocess."
    exit 1
}

function calc_kernel_version()
{
    VERSION=0
    VERSION=`head -1 Makefile | awk {'print $3;'}`
    PATCHLEVEL=`grep PATCHLEVEL Makefile | head -1 | awk {'print $3;'}`
    SUBLEVEL=`grep SUBLEVEL Makefile | head -1 | awk {'print $3;'}`
    EXTRAVERSION=`grep EXTRAVERSION Makefile | head -1 | awk {'print $3;'}`

    if [[ $VERSION -eq 0 ]]
       then
        usage
    fi

    KERNELVERSION_HUMAN=$VERSION.$PATCHLEVEL.$SUBLEVEL$EXTRAVERSION
    return $KERNELVERSION_HUMAN
}

if [[ $# -ne 1 ]] ; then
   usage
fi

if ( [ ! -d arch ] || [ ! -d scripts ] ) ; then
   usage
fi

calc_kernel_version
echo "KERNELVERSION_HUMAN is $KERNELVERSION_HUMAN"
KERNELVERSION=`expr $VERSION \* 65536 + $PATCHLEVEL \* 256 + $SUBLEVEL `
echo "KERNELVERSION is $KERNELVERSION"

if [[ $KERNELVERSION -lt 198656 ]]
   then
    echo "Older kernel: no cpp invocation."
    scripts/dtc/dtc -O dts -o $BASE.out.dts $1
    echo "Produced $BASE.out.dts"
    exit 0
fi

$CC $DTC_CPP_FLAGS -o $BASE.tmp $1

if [[ $? -ne 0 ]]
  then
     echo "C preprocessor parsing of DTS failed."
     exit
fi

scripts/dtc/dtc -O dts -o $BASE.out.dts -b 0 -i arch/arm/boot/dts -d $BASE.dtc.tmp $BASE.tmp

if [[ $? -eq 0 ]]
  then
     echo "Produced $BASE.out.dts"
fi

#rm *.tmp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

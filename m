From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: dt_to_config - usage message
Date: Thu, 28 Apr 2016 14:55:31 -0700
Message-ID: <572286D3.1090001@gmail.com>
References: <572284AB.102@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572284AB.102-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org


$ scripts/dtc/dt_to_config --help

Usage: dt_to_config [options] device-tree...

    device_tree is: dts_file | dtb_file | proc_device-tree


Valid options:
     -b                  ignore driver black list
     -c FILE             Read kernel config options from FILE
    --config FILE        synonym for 'c'
    --exclude-flag FLAG  exclude entries with a matching flag
     -h                  Display this message and exit
    --help               synonym for 'h'
    --include-flag FLAG  include only entries with a matching flag
    --include-suspect    include only entries with an uppercase flag
    --show-lists         report of white and black lists
    --version            Display program version and exit


  Report driver source files that match the compatibles in the device
  tree file and the kernel config options that enable the driver source
  files.

  This program must be run in the root directory of a Linux kernel
  source tree.

  CAUTION:
     This program uses heuristics to guess which driver(s) support each
     compatible string and which config option enables the driver(s).
     Do not believe that the reported information is fully correct.
     This program is intended to aid the process of determining the
     proper kernel configuration for a device tree, but this is not
     a fully automated process -- human involvement may still be
     required!

     The driver match heuristic used is to search for source files
     containing the compatible string enclosed in quotes.

     This program might not be able to find all drivers matching a
     compatible string.

     Some makefiles are overly clever.  This program was not made
     complex enough to handle them.  If no config option is listed
     for a driver, look at the makefile for the driver source file.
     Even if a config option is listed for a driver, some other
     available config options may not be listed.


  FLAG values:
     M   multiple compatibles found for this node
     d   driver found for this compatible
     D   multiple drivers found for this compatible
     c   kernel config found for this driver
     C   multiple config options found for this driver
     E   node is not enabled
     W   compatible is white listed
     H   matching driver and/or kernel config is hard coded
     x   kernel config hard coded in Makefile
     n   one or more kernel config file options is not set
     m   one or more kernel config file options is set to 'm'
     y   one or more kernel config file options is set to 'y'
     F   one of more kernel config file options fails to have correct value

     Upper case letters indicate potential issues or problems.


  Return value:
    0   if no error
    1   error processing command line
    2   unable to open or read kernel config file
    3   unable to open or process input device tree file(s)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

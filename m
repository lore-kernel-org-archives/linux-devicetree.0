From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] scripts/dtc: dt_to_config - usage message
Date: Fri, 10 Jun 2016 16:03:01 -0700
Message-ID: <575B4725.7060302@gmail.com>
References: <575B46CE.6080903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575B46CE.6080903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
List-Id: devicetree@vger.kernel.org

$ dt_to_config --help

Usage: dt_to_config [options] device-tree...

    device_tree is: dts_file | dtb_file | proc_device-tree


Valid options:
     -c FILE             Read kernel config options from FILE
    --config FILE        synonym for 'c'
    --config-format      config file friendly output format
    --exclude-flag FLAG  exclude entries with a matching flag
     -h                  Display this message and exit
    --help               synonym for 'h'
    --black-list-driver  use driver black list
    --white-list-config  use config white list
    --white-list-driver  use driver white list
    --include-flag FLAG  include only entries with a matching flag
    --include-suspect    include only entries with an uppercase flag
    --short-name         do not show the path portion of the node name
    --show-lists         report of white and black lists
    --version            Display program version and exit


  Report driver source files that match the compatibles in the device
  tree file and the kernel config options that enable the driver source
  files.

  This program must be run in the root directory of a Linux kernel
  source tree.

  The default format is a report that is intended to be easily human
  scannable.

  An alternate format can be selected by --config-format.  This will
  create output that can easily be edited to create a fragment that can
  be appended to the existing kernel config file.  Each entry consists of
  multiple lines.  The first line reports flags, the node path, compatible
  value, driver file matching the compatible, configuration options, and
  current values of the configuration options.  For each configuration
  option, the following lines report the current value and the value that
  is required for the driver file to be included in the kernel.

  If a large number of drivers or config options is listed for a node,
  and the 'H' flag is set consider using --white-list-config and/or
  --white-list-driver.  If the white list option suppresses the correct
  entry please report that as a bug.

  CAUTION:
     This program uses heuristics to guess which driver(s) support each
     compatible string and which config option(s) enables the driver(s).
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

  The flag:

     H   matching driver and/or kernel config is hard coded

  will be set if the config or driver is in the white lists, even if
  --white-list-config and --white-list-driver are not specified.
  This is a hint that 1) many of these reported lines are likely to
  be incorrect, and 2) using those options will reduce the number of
  drivers and/or config options reported.

  --white-list-config and --white-list-driver may not be accurate if this
  program is not well maintained.  Use them with appropriate skepticism.
  Use the --show-lists option to report the values in the list.

  Return value:
    0   if no error
    1   error processing command line
    2   unable to open or read kernel config file
    3   unable to open or process input device tree file(s)

  EXAMPLES:

     dt_to_config arch/arm/boot/dts/my_dts_file.dts

       Basic report.

     dt_to_config \
        --config ${KBUILD_OUTPUT}/.config \
        arch/${ARCH}/boot/dts/my_dts_file.dts

       Full report, with config file issues noted.

     dt_to_config --include-suspect \
        --config ${KBUILD_OUTPUT}/.config \
        arch/${ARCH}/boot/dts/my_dts_file.dts

       Report of node / compatible string / driver tuples that should
       be further investigated.  A node may have multiple compatible
       strings.  A compatible string may be matched by multiple drivers.
       A driver may have config file issues noted.  The compatible string
       and/or driver may be in the white lists.

     dt_to_config --include-suspect --config-format \
        --config /.config \
        arch/${ARCH}/boot/dts/my_dts_file.dts

       Report of node / compatible string / driver tuples that should
       be further investigated.  The report can be edited to uncomment
       the config options to select the desired tuple for a given node.
       A node may have multiple compatible strings.  A compatible string
       may be matched by multiple drivers.  A driver may have config file
       issues noted.  The compatible string and/or driver may be in the
       white lists.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

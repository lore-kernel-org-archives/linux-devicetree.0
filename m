From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] scripts/dtc: dt_to_config - report kernel config options
 for a devicetree
Date: Thu, 28 Apr 2016 14:46:19 -0700
Message-ID: <572284AB.102@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

=46rom: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

Determining which kernel config options need to be enabled for a
given devicetree can be a painful process.  Create a new tool to
find the drivers that may match a devicetree node compatible,
find the kernel config options that enable the driver, and
optionally report whether the kernel config option is enabled.

Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

---
 scripts/dtc/dt_to_config | 1061 ++++++++++++++++++++++++++++++++++++++=
+++++++++
 1 file changed, 1061 insertions(+)

Index: b/scripts/dtc/dt_to_config
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- /dev/null
+++ b/scripts/dtc/dt_to_config
@@ -0,0 +1,1061 @@
+#!/usr/bin/perl
+
+#   Copyright 2016 by Frank Rowand
+# =A9 Copyright 2016 by Gaurav Minocha
+#
+# This file is subject to the terms and conditions of the GNU General =
Public
+# License v2.
+
+use strict 'refs';
+use strict subs;
+
+use Getopt::Long;
+
+$VUFX =3D "160428a";
+
+$script_name =3D $0;
+$script_name =3D~ s|^.*/||;
+
+
+# ----- constants for print_flags()
+
+# Position in string $pr_flags.  Range of 0..($num_pr_flags - 1).
+$pr_flag_pos_mcompatible       =3D 0;
+$pr_flag_pos_driver            =3D 1;
+$pr_flag_pos_mdriver           =3D 2;
+$pr_flag_pos_config            =3D 3;
+$pr_flag_pos_mconfig           =3D 4;
+$pr_flag_pos_node_not_enabled  =3D 5;
+$pr_flag_pos_white_list        =3D 6;
+$pr_flag_pos_hard_coded        =3D 7;
+$pr_flag_pos_config_hard_coded =3D 8;
+$pr_flag_pos_config_none       =3D 9;
+$pr_flag_pos_config_m          =3D 10;
+$pr_flag_pos_config_y          =3D 11;
+$pr_flag_pos_config_test_fail  =3D 12;
+
+$num_pr_flags =3D $pr_flag_pos_config_test_fail + 1;
+
+# flags in @pr_flag_value must be unique values to allow simple regula=
r
+# expessions to work for --include_flags and --exclude_flags.
+# Convention: use upper case letters for potential issues or problems.
+
+@pr_flag_value =3D ('M', 'd', 'D', 'c', 'C', 'E', 'W', 'H', 'x', 'n', =
'm', 'y', 'F');
+
+@pr_flag_help =3D (
+    "multiple compatibles found for this node",
+    "driver found for this compatible",
+    "multiple drivers found for this compatible",
+    "kernel config found for this driver",
+    "multiple config options found for this driver",
+    "node is not enabled",
+    "compatible is white listed",
+    "matching driver and/or kernel config is hard coded",
+    "kernel config hard coded in Makefile",
+    "one or more kernel config file options is not set",
+    "one or more kernel config file options is set to 'm'",
+    "one or more kernel config file options is set to 'y'",
+    "one of more kernel config file options fails to have correct valu=
e"
+);
+
+
+# -----
+
+%driver_config =3D ();	# driver config array, indexed by driver source=
 file
+%driver_count =3D ();	# driver_cnt, indexed by compatible
+%compat_driver =3D ();	# compatible driver array, indexed by compatibl=
e
+%existing_config =3D ();	# existing config symbols present in given co=
nfig file
+			# expected values are: "y", "m", a decimal number, a
+			# hex number, or a string
+
+# ----- magic compatibles, do not have a driver
+#
+# Will not search for drivers for these compatibles.
+
+%compat_white_list =3D (
+	'fixed-partitions'	=3D> '1',
+	'none'			=3D> '1',
+	'pci'			=3D> '1',
+	'simple-bus'		=3D> '1',
+);
+
+# magic compatibles, have a driver
+#
+# Will not search for drivers for these compatibles.
+# Will instead use the drivers and config options listed here.
+#
+# If you add an entry to this hash, add the corresponding entry
+# to %driver_config_hard_code_list.
+#
+# These compatibles have a very large number of false positives.
+#
+# 'hardcoded_no_driver' is a magic value.  Other code knows this
+# magic value.  Do not use 'no_driver' here!
+#
+# TODO: Revisit each 'hardcoded_no_driver' to see how the compatible
+#       is used.  Are there drivers that can be provided?
+
+%driver_hard_code_list =3D (
+	'cache'			=3D> ['hardcoded_no_driver'],
+	'eeprom'		=3D> ['hardcoded_no_driver'],
+	'gpio'			=3D> ['hardcoded_no_driver'],
+	'gpios'			=3D> ['drivers/leds/leds-tca6507.c'],
+	'gpio-keys'		=3D> ['drivers/input/keyboard/gpio_keys.c'],
+	'i2c-gpio'		=3D> ['drivers/i2c/busses/i2c-gpio.c'],
+	'isa'			=3D> ['arch/mips/mti-malta/malta-dt.c',
+				     'arch/x86/kernel/devicetree.c'],
+	'led'			=3D> ['hardcoded_no_driver'],
+	'm25p32'		=3D> ['hardcoded_no_driver'],
+	'm25p64'		=3D> ['hardcoded_no_driver'],
+	'm25p80'		=3D> ['hardcoded_no_driver'],
+	'mtd_ram'		=3D> ['drivers/mtd/maps/physmap_of.c'],
+	'pwm-backlight'		=3D> ['drivers/video/backlight/pwm_bl.c'],
+	'spidev'		=3D> ['hardcoded_no_driver'],
+	'syscon'		=3D> ['drivers/mfd/syscon.c'],
+	'tlv320aic23'		=3D> ['hardcoded_no_driver'],
+	'wm8731'		=3D> ['hardcoded_no_driver'],
+);
+
+%driver_config_hard_code_list =3D (
+
+	# this one needed even if %driver_hard_code_list is empty
+	'no_driver'				=3D> ['no_config'],
+	'hardcoded_no_driver'			=3D> ['no_config'],
+
+	'drivers/leds/leds-tca6507.c'		=3D> ['CONFIG_LEDS_TCA6507'],
+	'drivers/input/keyboard/gpio_keys.c'	=3D> ['CONFIG_KEYBOARD_GPIO'],
+	'drivers/i2c/busses/i2c-gpio.c'		=3D> ['CONFIG_I2C_GPIO'],
+	'arch/mips/mti-malta/malta-dt.c'	=3D> ['obj-y'],
+	'arch/x86/kernel/devicetree.c'		=3D> ['CONFIG_OF'],
+	'drivers/mtd/maps/physmap_of.c'		=3D> ['CONFIG_MTD_PHYSMAP_OF'],
+	'drivers/video/backlight/pwm_bl.c'	=3D> ['CONFIG_BACKLIGHT_PWM'],
+	'drivers/mfd/syscon.c'			=3D> ['CONFIG_MFD_SYSCON'],
+
+	# drivers/usb/host/ehci-ppc-of.c
+	# drivers/usb/host/ehci-xilinx-of.c
+	#  are included from:
+	#    drivers/usb/host/ehci-hcd.c
+	#  thus the search of Makefile for the included .c files is incorrect
+	# ehci-hcd.c wraps the includes with ifdef CONFIG_USB_EHCI_HCD_..._OF
+	#
+	# similar model for ohci-hcd.c (but no ohci-xilinx-of.c)
+	#
+	# similarly, uhci-hcd.c includes uhci-platform.c
+
+	'drivers/usb/host/ehci-ppc-of.c'	=3D> ['CONFIG_USB_EHCI_HCD',
+						    'CONFIG_USB_EHCI_HCD_PPC_OF'],
+	'drivers/usb/host/ohci-ppc-of.c'	=3D> ['CONFIG_USB_OHCI_HCD',
+						    'CONFIG_USB_OHCI_HCD_PPC_OF'],
+
+	'drivers/usb/host/ehci-xilinx-of.c'	=3D> ['CONFIG_USB_EHCI_HCD',
+						    'CONFIG_USB_EHCI_HCD_XILINX'],
+
+	'drivers/usb/host/uhci-platform.c'	=3D> ['CONFIG_USB_UHCI_HCD',
+						    'CONFIG_USB_UHCI_PLATFORM'],
+
+	# scan_makefile will find only one of these config options:
+	#    ifneq ($(CONFIG_SOC_IMX6)$(CONFIG_SOC_LS1021A),)
+	'arch/arm/mach-imx/platsmp.c'		=3D> ['CONFIG_SOC_IMX6 && CONFIG_SMP',
+						    'CONFIG_SOC_LS1021A && CONFIG_SMP'],
+);
+
+
+# 'virt/kvm/arm/.*' are controlled by makefiles in other directories,
+# using relative paths, such as 'KVM :=3D ../../../virt/kvm'.  Do not
+# add complexity to find_kconfig() to deal with this.  There is a long
+# term intent to change the kvm related makefiles to the normal kernel
+# style.  After that is done, this entry can be removed from the
+# driver_black_list.
+
+@driver_black_list =3D (
+	'virt/kvm/arm/.*',
+);
+
+
+sub usage()
+{
+	print STDERR
+"
+Usage: $script_name [options] device-tree...
+
+    device_tree is: dts_file | dtb_file | proc_device-tree
+
+
+Valid options:
+     -b                  ignore driver black list
+     -c FILE             Read kernel config options from FILE
+    --config FILE        synonym for 'c'
+    --exclude-flag FLAG  exclude entries with a matching flag
+     -h                  Display this message and exit
+    --help               synonym for 'h'
+    --include-flag FLAG  include only entries with a matching flag
+    --include-suspect    include only entries with an uppercase flag
+    --show-lists         report of white and black lists
+    --version            Display program version and exit
+
+
+  Report driver source files that match the compatibles in the device
+  tree file and the kernel config options that enable the driver sourc=
e
+  files.
+
+  This program must be run in the root directory of a Linux kernel
+  source tree.
+
+  CAUTION:
+     This program uses heuristics to guess which driver(s) support eac=
h
+     compatible string and which config option enables the driver(s).
+     Do not believe that the reported information is fully correct.
+     This program is intended to aid the process of determining the
+     proper kernel configuration for a device tree, but this is not
+     a fully automated process -- human involvement may still be
+     required!
+
+     The driver match heuristic used is to search for source files
+     containing the compatible string enclosed in quotes.
+
+     This program might not be able to find all drivers matching a
+     compatible string.
+
+     Some makefiles are overly clever.  This program was not made
+     complex enough to handle them.  If no config option is listed
+     for a driver, look at the makefile for the driver source file.
+     Even if a config option is listed for a driver, some other
+     available config options may not be listed.
+
+
+  FLAG values:
+";
+
+	for ($k =3D 0; $k < $num_pr_flags; $k++) {
+		printf STDERR "     %s   %s\n",
+		              $pr_flag_value[$k], $pr_flag_help[$k];
+	}
+
+	print STDERR
+"
+     Upper case letters indicate potential issues or problems.
+
+
+  Return value:
+    0   if no error
+    1   error processing command line
+    2   unable to open or read kernel config file
+    3   unable to open or process input device tree file(s)
+
+";
+}
+
+sub set_flag()
+{
+	# pr_flags_ref is a reference to $pr_flags
+
+	my $pr_flags_ref =3D shift;
+	my $pos          =3D shift;
+
+	substr $$pr_flags_ref, $pos, 1, $pr_flag_value[$pos];
+
+	return $pr_flags;
+}
+
+sub print_flags()
+{
+	# return 1 if anything printed, else 0
+
+	# some fields of pn_arg_ref might not be used in this function, but
+	# extract all of them anyway.
+	my $pn_arg_ref     =3D shift;
+
+	my $compat         =3D $pn_arg_ref->{compat};
+	my $compatible_cnt =3D $pn_arg_ref->{compatible_cnt};
+	my $config         =3D $pn_arg_ref->{config};
+	my $config_cnt     =3D $pn_arg_ref->{config_cnt};
+	my $driver         =3D $pn_arg_ref->{driver};
+	my $driver_cnt     =3D $pn_arg_ref->{driver_cnt};
+	my $node           =3D $pn_arg_ref->{node};
+	my $node_enabled   =3D $pn_arg_ref->{node_enabled};
+	my $white_list     =3D $pn_arg_ref->{white_list};
+
+	my $pr_flags       =3D '-' x $num_pr_flags;
+
+
+	# ----- set flags in $pr_flags
+
+	if ($compatible_cnt > 1) {
+		&set_flag(\$pr_flags, $pr_flag_pos_mcompatible);
+	}
+
+	if ($config_cnt > 1) {
+		&set_flag(\$pr_flags, $pr_flag_pos_mconfig);
+	}
+
+	if ($driver_cnt >=3D 1) {
+		&set_flag(\$pr_flags, $pr_flag_pos_driver);
+	}
+
+	if ($driver_cnt > 1) {
+		&set_flag(\$pr_flags, $pr_flag_pos_mdriver);
+	}
+
+	# These strings are the same way the linux kernel tests.
+	# The ePapr lists of values is slightly different.
+	if (!(
+	      ($node_enabled eq "") ||
+	      ($node_enabled eq "ok") ||
+	      ($node_enabled eq "okay")
+	     )) {
+		&set_flag(\$pr_flags, $pr_flag_pos_node_not_enabled);
+	}
+
+	if ($white_list) {
+		&set_flag(\$pr_flags, $pr_flag_pos_white_list);
+	}
+
+	if (exists($driver_hard_code_list{$compat}) ||
+	    (exists($driver_config_hard_code_list{$driver}) &&
+	     ($driver ne "no_driver"))) {
+		&set_flag(\$pr_flags, $pr_flag_pos_hard_coded);
+	}
+
+	my @configs =3D split(' && ', $config);
+	for $configs (@configs) {
+		$not =3D $configs =3D~ /^!/;
+		$configs =3D~ s/^!//;
+
+		if (($configs ne "no_config") && ($configs ne "no_makefile")) {
+			&set_flag(\$pr_flags, $pr_flag_pos_config);
+		}
+
+		if (($config_cnt >=3D 1) &&
+		    ($configs !~ /CONFIG_/) &&
+		    (($configs ne "no_config") && ($configs ne "no_makefile"))) {
+			&set_flag(\$pr_flags, $pr_flag_pos_config_hard_coded);
+		}
+
+		my $existing_config =3D $existing_config{$configs};
+		if ($existing_config eq "m") {
+			&set_flag(\$pr_flags, $pr_flag_pos_config_m);
+			if ($not) {
+				&set_flag(\$pr_flags, $pr_flag_pos_config_test_fail);
+			}
+		} elsif ($existing_config eq "y") {
+			&set_flag(\$pr_flags, $pr_flag_pos_config_y);
+			if ($not) {
+				&set_flag(\$pr_flags, $pr_flag_pos_config_test_fail);
+			}
+		} elsif (($config_file) && ($configs =3D~ /CONFIG_/)) {
+			&set_flag(\$pr_flags, $pr_flag_pos_config_none);
+			if (!$not) {
+				&set_flag(\$pr_flags, $pr_flag_pos_config_test_fail);
+			}
+		}
+	}
+
+	# ----- include / exclude filters
+
+	if ($include_flag_pattern && ($pr_flags !~ m/$include_flag_pattern/))=
 {
+		return 0;
+	}
+
+	if ($exclude_flag_pattern && ($pr_flags =3D~ m/$exclude_flag_pattern/=
)) {
+		return 0;
+	}
+
+	print "$pr_flags : ";
+
+	return 1;
+}
+
+
+sub print_node()
+{
+	# return number of lines printed
+
+	# some fields of pn_arg_ref might not be used in this function, but
+	# extract all of them anyway.
+	my $pn_arg_ref     =3D shift;
+
+	my $compat         =3D $pn_arg_ref->{compat};
+	my $compatible_cnt =3D $pn_arg_ref->{compatible_cnt};
+	my $config         =3D $pn_arg_ref->{config};
+	my $config_cnt     =3D $pn_arg_ref->{config_cnt};
+	my $driver         =3D $pn_arg_ref->{driver};
+	my $driver_cnt     =3D $pn_arg_ref->{driver_cnt};
+	my $node           =3D $pn_arg_ref->{node};
+	my $node_enabled   =3D $pn_arg_ref->{node_enabled};
+	my $white_list     =3D $pn_arg_ref->{white_list};
+
+	my $separator;
+
+	if (! &print_flags($pn_arg_ref)) {
+		return 0;
+	}
+
+	print "$node : $compat : $driver : $config : ";
+
+	if ($config_file) {
+		my @configs =3D split(' && ', $config);
+		for $configs (@configs) {
+			$configs =3D~ s/^!//;
+			my $existing_config =3D $existing_config{$configs};
+			if (!$existing_config) {
+				# check for /-m/, /-y/, or /-objs/
+				if (($configs !~ /CONFIG_/) &&
+				    ($configs ne "no_config") &&
+				    ($configs ne "no_makefile")) {
+				$existing_config =3D "x";
+				};
+			};
+			if ($existing_config) {
+				print "$separator", "$existing_config";
+				$separator =3D ", ";
+			} else {
+				print "$separator", "n";
+				$separator =3D ", ";
+			}
+		}
+	} else {
+		print "none";
+	}
+
+	print "\n";
+
+	return 1;
+}
+
+
+sub scan_makefile
+{
+	my $pn_arg_ref    =3D shift;
+	my $driver        =3D shift;
+
+	# ----- Find Kconfig symbols that enable driver
+
+	my ($dir, $base) =3D $driver =3D~ m{(.*)/(.*).c};
+
+	my $makefile =3D $dir . "/Makefile";
+	if (! -r $makefile) {
+		$makefile =3D $dir . "/Kbuild";
+	}
+	if (! -r $makefile) {
+		my $config;
+
+		$config =3D 'no_makefile';
+		push @{ $driver_config{$driver} }, $config;
+		return;
+	}
+
+	if (!open(MAKEFILE_FILE, "<", "$makefile")) {
+		return;
+	}
+
+	my $line;
+	my @config;
+	my @if_config;
+	my @make_var;
+
+	NEXT_LINE:
+	while ($next_line =3D <MAKEFILE_FILE>) {
+		my $config;
+		my $if_config;
+		my $ifdef;
+		my $ifeq;
+		my $ifndef;
+		my $ifneq;
+		my $ifdef_config;
+		my $ifeq_config;
+		my $ifndef_config;
+		my $ifneq_config;
+
+		chomp($next_line);
+		$line =3D $line . $next_line;
+		if ($next_line =3D~ /\\$/) {
+			$line =3D~ s/\\$/ /;
+			next NEXT_LINE;
+		}
+		if ($line =3D~ /^\s*#/) {
+			$line =3D "";
+			next NEXT_LINE;
+		}
+
+		# -----  condition ... else ... endif
+
+		if ($line =3D~ /^([ ]\s*|)else\b/) {
+			$if_config =3D "!" . pop @if_config;
+			$if_config =3D~ s/^!!//;
+			push @if_config, $if_config;
+			$line =3D~ s/^([ ]\s*|)else\b//;
+		}
+
+		($null, $ifeq_config,  $ifeq_config_val )  =3D $line =3D~ /^([ ]\s*|=
)ifeq\b.*\b(CONFIG_[A-Za-z0-9_]*)(.*)/;
+		($null, $ifneq_config, $ifneq_config_val)  =3D $line =3D~ /^([ ]\s*|=
)ifneq\b.*\b(CONFIG_[A-Za-z0-9_]*)(.*)/;
+		($null, $ifdef_config)                     =3D $line =3D~ /^([ ]\s*|=
)ifdef\b.*\b(CONFIG_[A-Za-z0-9_]*)/;
+		($null, $ifndef_config)                    =3D $line =3D~ /^([ ]\s*|=
)ifndef\b.*\b(CONFIG_[A-Za-z0-9_]*)/;
+
+		($null, $ifeq)   =3D $line =3D~ /^([ ]\s*|)ifeq\b\s*(.*)/;
+		($null, $ifneq)  =3D $line =3D~ /^([ ]\s*|)ifneq\b\s*(.*)/;
+		($null, $ifdef)  =3D $line =3D~ /^([ ]\s*|)ifdef\b\s*(.*)/;
+		($null, $ifndef) =3D $line =3D~ /^([ ]\s*|)ifndef\b\s*(.*)/;
+
+		# Order of tests is important.  Prefer "CONFIG_*" regex match over
+		# less specific regex match.
+		if ($ifdef_config) {
+			$if_config =3D $ifdef_config;
+		} elsif ($ifeq_config) {
+			if ($ifeq_config_val =3D~ /y/) {
+				$if_config =3D $ifeq_config;
+			} else {
+				$if_config =3D "!" . $ifeq_config;
+			}
+		} elsif ($ifndef_config) {
+			$if_config =3D "!" . $ifndef_config;
+		} elsif ($ifneq_config) {
+			if ($ifneq_config_val =3D~ /y/) {
+				$if_config =3D "!" . $ifneq_config;
+			} else {
+				$if_config =3D $ifneq_config;
+			}
+		} elsif ($ifdef) {
+			$if_config =3D $ifdef;
+		} elsif ($ifeq) {
+			$if_config =3D $ifeq;
+		} elsif ($ifndef) {
+			$if_config =3D "!" . $ifndef;
+		} elsif ($ifneq) {
+			$if_config =3D "!" . $ifneq;
+		} else {
+			$if_config =3D "";
+		}
+		$if_config =3D~ s/^!!//;
+
+		if ($if_config) {
+			push @if_config, $if_config;
+			$line =3D "";
+			next NEXT_LINE;
+		}
+
+		if ($line =3D~ /^([ ]\s*|)endif\b/) {
+			pop @if_config;
+			$line =3D "";
+			next NEXT_LINE;
+		}
+
+		# ----- simple CONFIG_* =3D *.[co]  or  xxx [+:?]*=3D *.[co]
+		# Most makefiles select on *.o, but
+		# arch/powerpc/boot/Makefile selects on *.c
+
+		($config) =3D $line =3D~ /(CONFIG_[A-Za-z0-9_]+).*\b$base.[co]\b/;
+
+		# ----- match a make variable instead of *.[co]
+		# Recursively expanded variables are not handled.
+
+		if (!$config) {
+			my $make_var;
+			($make_var) =3D $line =3D~ /\s*(\S+?)\s*[+:\?]*=3D.*\b$base.[co]\b/=
;
+			if ($make_var) {
+				if ($make_var =3D~ /[a-zA-Z0-9]+-[ym]/) {
+					$config =3D $make_var;
+				} elsif ($make_var =3D~ /[a-zA-Z0-9]+-objs/) {
+					$config =3D $make_var;
+				} else {
+					push @make_var, $make_var;
+				}
+			}
+		}
+
+		if (!$config) {
+			for $make_var (@make_var) {
+				($config) =3D $line =3D~ /(CONFIG_[A-Za-z0-9_]+).*\b$make_var\b/;
+				last if ($config);
+			}
+		}
+
+		if (!$config) {
+			for $make_var (@make_var) {
+				($config) =3D $line =3D~ /\s*(\S+?)\s*[+:\?]*=3D.*\b$make_var\b/;
+				last if ($config);
+			}
+		}
+
+		# ----- next if no config found
+
+		if (!$config) {
+			$line =3D "";
+			next NEXT_LINE;
+		}
+
+		for $if_config (@if_config) {
+			$config =3D $if_config . " && " . $config;
+		}
+
+		push @{ $driver_config{$driver} }, $config;
+
+		$line =3D "";
+	}
+
+	close(MAKEFILE_FILE);
+
+}
+
+
+sub find_kconfig
+{
+	my $pn_arg_ref    =3D shift;
+	my $driver        =3D shift;
+
+	my $lines_printed =3D 0;
+	my @configs;
+
+	if (!@{ $driver_config{$driver} }) {
+		&scan_makefile($pn_arg_ref, $driver);
+		if (!@{ $driver_config{$driver} }) {
+			push @{ $driver_config{$driver} }, "no_config";
+		}
+	}
+
+	@configs =3D @{ $driver_config{$driver} };
+
+	$$pn_arg_ref{config_cnt} =3D $#configs + 1;
+	for my $config (@configs) {
+		$$pn_arg_ref{config} =3D $config;
+		$lines_printed +=3D &print_node($pn_arg_ref);
+	}
+
+	return $lines_printed;
+}
+
+
+sub handle_compatible()
+{
+	my $node          =3D shift;
+	my $compatible    =3D shift;
+	my $node_enabled  =3D shift;
+
+	my $compat;
+	my $lines_printed =3D 0;
+	my %pn_arg        =3D ();
+
+	return if (!$node or !$compatible);
+
+	# Do not process compatible property of root node,
+	# it is used to match board, not to bind a driver.
+	return if ($node eq "/");
+
+	$pn_arg{node}         =3D $node;
+	$pn_arg{node_enabled} =3D $node_enabled;
+
+	my @compatibles =3D split('", "', $compatible);
+
+	$compatibles[0] =3D~ s/^"//;
+	$compatibles[$#compatibles] =3D~ s/"$//;
+
+	$pn_arg{compatible_cnt} =3D $#compatibles + 1;
+
+	COMPAT:
+	for $compat (@compatibles) {
+
+		$pn_arg{compat}     =3D $compat;
+		$pn_arg{driver_cnt} =3D 0;
+		$pn_arg{white_list} =3D 0;
+
+		if (exists($compat_white_list{$compat})) {
+			$pn_arg{white_list} =3D 1;
+			$pn_arg{driver}     =3D "no_driver";
+			$pn_arg{config_cnt} =3D 1;
+			$pn_arg{config}     =3D "no_config";
+			$lines_printed +=3D &print_node(\%pn_arg);
+			next COMPAT;
+		}
+
+		# ----- if compat previously seen, use cached info
+
+		if (exists($compat_driver{$compat})) {
+
+			for my $driver (@{ $compat_driver{$compat} }) {
+				$pn_arg{driver}     =3D $driver;
+				$pn_arg{driver_cnt} =3D $driver_count{$compat};
+				$pn_arg{config_cnt} =3D $#{ $driver_config{$driver}} + 1;
+
+				for my $config (@{ $driver_config{$driver} }) {
+					$pn_arg{config} =3D $config;
+					$lines_printed +=3D &print_node(\%pn_arg);
+				}
+			}
+			next COMPAT;
+		}
+
+
+		# ----- Find drivers (source files that contain compatible)
+
+		# this will miss arch/sparc/include/asm/parport.h
+		# It is better to move the compatible out of the .h
+		# than to add *.h. to the files list, because *.h generates
+		# a lot of false negatives.
+		my $files =3D '"*.c"';
+		my $drivers =3D `git grep -l '"$compat"' -- $files`;
+		chomp($drivers);
+		if ($drivers eq "") {
+			$pn_arg{driver} =3D "no_driver";
+			$pn_arg{config_cnt} =3D 1;
+			$pn_arg{config} =3D "no_config";
+			push @{ $compat_driver{$compat} }, "no_driver";
+			$lines_printed +=3D &print_node(\%pn_arg);
+			next COMPAT;
+		}
+
+		my @drivers =3D split("\n", $drivers);
+		$driver_count{$compat} =3D $#drivers + 1;
+		$pn_arg{driver_cnt}    =3D $#drivers + 1;
+
+		DRIVER:
+		for my $driver (@drivers) {
+			push @{ $compat_driver{$compat} }, $driver;
+			$pn_arg{driver} =3D $driver;
+
+			# ----- if driver previously seen, use cached info
+
+			$pn_arg{config_cnt} =3D $#{ $driver_config{$driver} } + 1;
+			for my $config (@{ $driver_config{$driver} }) {
+				$pn_arg{config} =3D $config;
+				$lines_printed +=3D &print_node(\%pn_arg);
+			}
+			if (@{ $driver_config{$driver} }) {
+				next DRIVER;
+			}
+
+			if (!$ignore_driver_black_list) {
+				for $black (@driver_black_list) {
+					next DRIVER if ($driver =3D~ /^$black$/);
+				}
+			}
+
+
+			# ----- Find Kconfig symbols that enable driver
+
+			$lines_printed +=3D &find_kconfig(\%pn_arg, $driver);
+
+		}
+	}
+
+	# White space (line) between nodes for readability.
+	# Each node may report several compatibles.
+	# For each compatible, multiple drivers may be reported.
+	# For each driver, multiple CONFIG_ options may be reported.
+	if ($lines_printed) {
+		print "\n";
+	}
+}
+
+sub read_dts()
+{
+	my $file         =3D shift;
+
+	my $compatible   =3D "";
+	my $line;
+	my $node         =3D "";
+	my $node_enabled =3D "";
+
+	if (! -r $file) {
+		print STDERR "file '$file' is not readable or does not exist\n";
+		exit 3;
+	}
+
+	if (! `which dtx_diff`) {
+		print STDERR "\n";
+		print STDERR "file 'dtx_diff' is not executable or does not exist\n"=
;
+		print STDERR "   Is scripts/dtc/ in the shell \$PATH variable?\n";
+		print STDERR "   Are you in the root directory of a kernel tree?\n";
+		print STDERR "\n";
+		exit 3;
+	}
+
+	if (!open(DT_FILE, "-|", "dtx_diff $file")) {
+		print STDERR "\n";
+		print STDERR "shell command failed:\n";
+		print STDERR "   dtx_diff $file\n";
+		print STDERR "\n";
+		exit 3;
+	}
+
+	FILE:
+	while ($line =3D <DT_FILE>) {
+		chomp($line);
+
+		if ($line =3D~ /{/) {
+			&handle_compatible($node, $compatible, $node_enabled);
+
+			$node =3D $line;
+			$node =3D~ s/^\s*(.*)\s+\{.*/$1/;
+			$node =3D~ s/.*: //;
+
+			$compatible =3D "";
+			$node_enabled =3D "";
+			next FILE;
+		}
+
+		if ($line =3D~ /(\s+|^)status =3D/) {
+			$node_enabled =3D $line;
+			$node_enabled =3D~ s/^\t*//;
+			$node_enabled =3D~ s/^status =3D "//;
+			$node_enabled =3D~ s/";$//;
+			next FILE;
+		}
+
+		if ($line =3D~ /(\s+|^)compatible =3D/) {
+			# Extract all compatible entries for this device
+			# White space matching here and in handle_compatible() is
+			# precise, because input format is the output of dtc,
+			# which is invoked by dtx_diff.
+			$compatible =3D $line;
+			$compatible =3D~ s/^\t*//;
+			$compatible =3D~ s/^compatible =3D //;
+			$compatible =3D~ s/;$//;
+		}
+	}
+
+	&handle_compatible($node, $compatible, $node_enabled);
+
+	close(DT_FILE);
+}
+
+
+sub read_config_file()
+{
+	if (! -r $config_file) {
+		print STDERR "file '$config_file' is not readable or does not exist\=
n";
+		exit 2;
+	}
+
+	if (!open(CONFIG_FILE, "<", "$config_file")) {
+		print STDERR "open $config_file failed\n";
+		exit 2;
+	}
+
+	my @line;
+
+	LINE:
+	while ($line =3D <CONFIG_FILE>) {
+		chomp($line);
+		next LINE if ($line =3D~ /^\s*#/);
+		next LINE if ($line =3D~ /^\s*$/);
+		@line =3D split /=3D/, $line;
+		$existing_config{@line[0]} =3D @line[1];
+	}
+
+	close(CONFIG_FILE);
+}
+
+
+sub cmd_line_err()
+{
+	my $msg =3D shift;
+
+	print STDERR "\n";
+	print STDERR "   ERROR processing command line options\n";
+	print STDERR "         $msg\n" if ($msg ne "");
+	print STDERR "\n";
+	print STDERR "   For help, type '$script_name --help'\n";
+	print STDERR "\n";
+}
+
+
+# --------------------------------------------------------------------=
---------
+# program entry point
+
+Getopt::Long::Configure("no_ignore_case", "bundling");
+
+if (!GetOptions(
+	"b"               =3D> \$ignore_driver_black_list,
+	"c=3Ds"             =3D> \$config_file,
+	"h"               =3D> \$help,
+	"config=3Ds"        =3D> \$config_file,
+	"exclude-flag=3Ds"  =3D> \@exclude_flag,
+	"help"            =3D> \$help,
+	"include-flag=3Ds"  =3D> \@include_flag,
+	"include-suspect" =3D> \$include_suspect,
+	"show-lists"      =3D> \$show_lists,
+	"version"         =3D> \$version,
+	)) {
+
+	&cmd_line_err();
+
+	exit 1;
+}
+
+
+my $exit_after_messages =3D 0;
+
+if ($version) {
+	print STDERR "\n$script_name  $VUFX\n\n";
+	$exit_after_messages =3D 1;
+}
+
+
+if ($help) {
+	&usage;
+	$exit_after_messages =3D 1;
+}
+
+
+if ($show_lists) {
+
+	print "\n";
+	print "These compatibles are white listed to have no driver.\n";
+	print "\n";
+	for my $compat (sort keys %compat_white_list) {
+		print "   $compat\n";
+	}
+
+
+	print "\n\n";
+	print "The driver for these compatibles is hard coded.\n";
+	print "\n";
+	my $max_compat_len =3D 0;
+	for my $compat (sort keys %driver_hard_code_list) {
+		if (length $compat > $max_compat_len) {
+			$max_compat_len =3D length $compat;
+		}
+	}
+	for my $compat (sort keys %driver_hard_code_list) {
+		if (($driver ne "hardcoded_no_driver") && ($driver ne "no_driver")) =
{
+			for my $driver (@{ $driver_hard_code_list{$compat} }) {
+				print "   $compat";
+				print " " x ($max_compat_len - length $compat);
+				print "  $driver\n";
+			}
+		}
+	}
+
+
+	print "\n\n";
+	print "The configuration option for these drivers is hard coded.\n";
+	print "\n";
+	my $max_driver_len =3D 0;
+	for my $driver (sort keys %driver_config_hard_code_list) {
+		if (length $driver > $max_driver_len) {
+			$max_driver_len =3D length $driver;
+		}
+	}
+	for my $driver (sort keys %driver_config_hard_code_list) {
+		if (($driver ne "hardcoded_no_driver") && ($driver ne "no_driver")) =
{
+			for my $config (@{ $driver_config_hard_code_list{$driver} }) {
+				print "   $driver";
+				print " " x ($max_driver_len - length $driver);
+				print "  $config\n";
+			}
+		}
+	}
+
+
+	print "\n\n";
+	print "These compatibles are black listed.  They will not be reported=
 without '-b'.\n";
+	print "\n";
+	for my $driver (@driver_black_list) {
+		print "   $driver\n";
+	}
+
+	print "\n";
+
+	$exit_after_messages =3D 1;
+}
+
+
+if ($exit_after_messages) {
+	exit 0;
+}
+
+
+$exclude_flag_pattern =3D "[";
+for my $exclude_flag (@exclude_flag) {
+	$exclude_flag_pattern =3D $exclude_flag_pattern . $exclude_flag;
+}
+$exclude_flag_pattern =3D $exclude_flag_pattern . "]";
+# clean up if empty
+$exclude_flag_pattern =3D~ s/^\[\]$//;
+
+
+$include_flag_pattern =3D "[";
+for my $include_flag (@include_flag) {
+	$include_flag_pattern =3D $include_flag_pattern . $include_flag;
+}
+$include_flag_pattern =3D $include_flag_pattern . "]";
+# clean up if empty
+$include_flag_pattern =3D~ s/^\[\]$//;
+
+
+if ($exclude_flag_pattern) {
+	my $found =3D 0;
+	for $pr_flag_value (@pr_flag_value) {
+		if ($exclude_flag_pattern =3D~ m/$pr_flag_value/) {
+			$found =3D 1;
+		}
+	}
+	if (!$found) {
+		&cmd_line_err("invalid value for FLAG in --exclude-flag\n");
+		exit 1
+	}
+}
+
+if ($include_flag_pattern) {
+	my $found =3D 0;
+	for $pr_flag_value (@pr_flag_value) {
+		if ($include_flag_pattern =3D~ m/$pr_flag_value/) {
+			$found =3D 1;
+		}
+	}
+	if (!$found) {
+		&cmd_line_err("invalid value for FLAG in --include-flag\n");
+		exit 1
+	}
+}
+
+if ($include_suspect) {
+	$include_flag_pattern =3D~ s/\[//;
+	$include_flag_pattern =3D~ s/\]//;
+	$include_flag_pattern =3D "[" . $include_flag_pattern . "A-Z]";
+}
+
+if ($exclude_flag_pattern =3D~ m/$include_flag_pattern/) {
+	&cmd_line_err("the same flag appears in both --exclude-flag and --inc=
lude-flag or --include-suspect\n");
+	exit 1
+}
+
+
+# ($#ARGV < 0) is valid for --help, --version
+if ($#ARGV < 0) {
+	&cmd_line_err("device-tree... is required");
+	exit 1
+}
+
+
+if ($config_file) {
+	&read_config_file();
+}
+
+
+# avoid pushing duplicates for this value
+$driver =3D "hardcoded_no_driver";
+for $config ( @{ $driver_config_hard_code_list{$driver} } ) {
+	push @{ $driver_config{$driver} }, $config;
+}
+
+for my $compat (keys %driver_hard_code_list) {
+	for my $driver (@{ $driver_hard_code_list{$compat} }) {
+		push @{ $compat_driver{$compat} }, $driver;
+		if ($driver ne "hardcoded_no_driver") {
+			$driver_count{$compat} =3D scalar @{ $compat_driver{$compat} };
+		}
+	}
+}
+
+for my $driver (keys %driver_config_hard_code_list) {
+	if ($driver ne "hardcoded_no_driver") {
+		for $config ( @{ $driver_config_hard_code_list{$driver} } ) {
+			push @{ $driver_config{$driver} }, $config;
+		}
+	}
+}
+
+
+for $file (@ARGV) {
+	&read_dts($file);
+}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

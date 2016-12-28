From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [RFC PATCH 1/5] overlay: perl script to convert dts from old overlay style to new overlay style
Date: Tue, 27 Dec 2016 23:20:13 -0800
Message-ID: <1482909617-31950-2-git-send-email-frowand.list@gmail.com>
References: <1482909617-31950-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482909617-31950-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

Convert overlay dts file from hand-coded expanded form to new syntactic
sugar form.

Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---
 overlay_convert | 158 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)
 create mode 100755 overlay_convert

diff --git a/overlay_convert b/overlay_convert
new file mode 100755
index 000000000000..fede0103fb4e
--- /dev/null
+++ b/overlay_convert
@@ -0,0 +1,158 @@
+#!/usr/bin/perl
+
+# Copyright 2016  Frank Rowand  frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org
+# license: GPL V2
+# This file is subject to the terms and conditions of the GNU General Public
+# License v2.
+#
+# Convert overlay dts file from hand-coded expanded form to new syntactic
+# sugar form.
+
+# zzz TODO:
+#  - May need to update the "/plugin/" declaration if dtc has changed.
+
+
+use strict 'refs';
+use strict subs;
+
+use Getopt::Long;
+
+$VUFX = "161227a";
+
+$script_name = $0;
+$script_name =~ s|^.*/||;
+
+
+sub usage()
+{
+	print STDERR
+"
+Usage: $script_name [options] DTS
+
+  Convert overlay dts file from hand-coded expanded form to new syntactic
+  sugar form.
+
+   Node names __symbols__, __fixups__, and __local_fixups__ are not allowed.
+   Their presence suggests that DTS has been compiled into a .dtbo and then
+   de-compiled.  This is not the preferred form of source since phandle
+   references are not of the form: &label.
+
+Valid options:
+
+     -h                 Synonym for  --help
+    --help              Display this message
+    --version           Display program version and exit
+
+
+  Return value:
+     0  no error
+     1  error processing command line
+     2  unable to open or read DTS
+    10  DTS contains a node name other than __overlay__, with leading '_'
+    11  DTS contains a fragment node with no target property
+
+";
+}
+
+
+# -----------------------------------------------------------------------------
+# program entry point
+
+Getopt::Long::Configure("no_ignore_case", "bundling");
+
+if (!GetOptions(
+	"h"              => \$help,
+	"help"           => \$help,
+	"version"        => \$version,
+	)) {
+
+	exit 1;
+}
+
+if ($version) {
+	print STDERR "\n$script_name  $VUFX\n";
+	exit 0;
+}
+
+if ($help) {
+	&usage;
+	exit 0;
+}
+
+
+# ----- scan DTS
+
+$node_depth = 0;
+
+LINE:
+while ($line = <ARGV>) {
+
+	# ----- start of node
+
+	if ($line =~ /{/) {
+		$node_depth++;
+		$node_name = $line;
+		chomp $node_name;
+		$indent = $node_name;
+		$indent =~ s/\S.*//;
+		$node_name =~ s/^\s*//;
+		$node_name =~ s/\s*{.*//;
+
+		$in_fragment = 0;
+		if (($node_depth == 2) && ($node_name =~ /^fragment@\d*$/)) {
+			$in_fragment = 1;
+			$fragment_name = $node_name;
+			push @fragment_depth, $node_depth;
+		} elsif ($node_name =~ /^__overlay__$/) {
+			if (!$save_target) {
+				print STDERR "No 'target' property in node ${fragment_name}\n";
+				exit 11
+			}
+			print "$indent$save_target {\n";
+			undef $save_target;
+		} elsif ($node_name =~ /^_/) {
+			# might be __symbols__, __fixups__, or __local_fixups__
+			print STDERR "\nIllegal node name: $node_name\n\n";
+			exit 10;
+		} elsif ($node_depth > 1) {
+			print "$indent$node_name {\n";
+		}
+
+		next LINE;
+	}
+
+
+	# ----- end of node
+
+	if ($line =~ /}/) {
+
+		$indent = $line;
+		chomp $indent;
+		$indent =~ s/\S.*//;
+
+		$fragment_depth = pop @fragment_depth;
+		if (($node_depth > 2) && ($fragment_depth != $node_depth)) {
+			push @fragment_depth, $fragment_depth;
+			print "$line";
+		}
+
+		$node_depth--;
+
+		next LINE;
+	}
+
+
+	# ----- anything else
+
+	if ($in_fragment && ($line =~ /target = </)) {
+		$save_target = $line;
+		chomp $save_target;
+		$save_target =~ s/.*<\s*//;
+		$save_target =~ s/\s*>.*//;
+	} elsif (!$in_fragment) {
+		print "$line";
+	}
+
+	next LINE;
+
+}
-- 
1.9.1

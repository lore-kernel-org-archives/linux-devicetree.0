From: frowand.list@gmail.com
Subject: [PATCH RESEND] of: add dtc annotations functionality to dtx_diff
Date: Thu, 17 Jan 2019 14:01:14 -0800
Message-ID: <1547762474-7832-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Add -T and --annotations command line arguments to dtx_diff.  These
arguments will be passed through to dtc.  dtc will then add source
location annotations to its output.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---

If dtx_diff is provided with a single devicetree source file then
that source file will be compiled, with all appropriate includes
and pre-processing, and the result will be output as source.  This
provides a convenient mechanism to see what the devicetree looks
like after all processing and replacements occur.  The
--annotations argument will cause dtc to report information about
where the source was located for each line of the output.

 scripts/dtc/dtx_diff | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
index 8c4fbad2055e..0d8572008729 100755
--- a/scripts/dtc/dtx_diff
+++ b/scripts/dtc/dtx_diff
@@ -21,6 +21,7 @@ Usage:
         diff DTx_1 and DTx_2
 
 
+      --annotate    synonym for -T
        -f           print full dts in diff (--unified=99999)
        -h           synonym for --help
        -help        synonym for --help
@@ -28,6 +29,7 @@ Usage:
        -s SRCTREE   linux kernel source tree is at path SRCTREE
                         (default is current directory)
        -S           linux kernel source tree is at root of current git repo
+       -T           Annotate output .dts with input source file and line (-T -T for more details)
        -u           unsorted, do not sort DTx
 
 
@@ -174,6 +176,7 @@ compile_to_dts() {
 
 # -----  start of script
 
+annotate=""
 cmd_diff=0
 diff_flags="-u"
 dtx_file_1=""
@@ -208,6 +211,14 @@ while [ $# -gt 0 ] ; do
 		shift
 		;;
 
+	-T | --annotate )
+		if [ "${annotate}"  = "" ] ; then
+			annotate="-T"
+		elif [ "${annotate}"  = "-T" ] ; then
+			annotate="-T -T"
+		fi
+		shift
+		;;
 	-u )
 		dtc_sort=""
 		shift
@@ -327,7 +338,7 @@ cpp_flags="\
 DTC="\
 	${DTC}                                     \
 	-i ${srctree}/scripts/dtc/include-prefixes \
-	-O dts -qq -f ${dtc_sort} -o -"
+	-O dts -qq -f ${dtc_sort} ${annotate} -o -"
 
 
 # -----  do the diff or decompile
-- 
Frank Rowand <frank.rowand@sony.com>

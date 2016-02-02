From: Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH] scripts/dtc: dtx_diff - add info to error message
Date: Tue, 02 Feb 2016 11:02:35 -0800
Message-ID: <56B0FD4B.8080600@gmail.com>
Reply-To: frowand.list@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sonymobile.com>

If kernel config options are not properly set, "make scripts" will not
compile dtc.  Update the unable to find dtc error message to check
the kernel config and give better advice on how to create dtc.

Reword another error message to increase clarity.

Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
---
 scripts/dtc/dtx_diff |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

Index: b/scripts/dtc/dtx_diff
===================================================================
--- a/scripts/dtc/dtx_diff
+++ b/scripts/dtc/dtx_diff
@@ -136,8 +136,7 @@ compile_to_dts() {
 			echo ""                                              >&2
 			echo "  architecture ${dtx_arch} is in file path,"   >&2
 			echo "  but does not match shell variable \$ARCH"    >&2
-			echo "  (${ARCH}) does not match shell variable"     >&2
-			echo "  \$ARCH (${ARCH})"                            >&2
+			echo "  >>\$ARCH<< is: >>${ARCH}<<"                  >&2
 		fi
 
 		if [ ! -d ${srctree}/arch/${ARCH} ] ; then
@@ -267,6 +266,14 @@ DTC="${__KBUILD_OUTPUT}/scripts/dtc/dtc"
 
 if [ ! -x ${DTC} ] ; then
 	__DTC="dtc"
+	if grep -q "^CONFIG_DTC=y" ${__KBUILD_OUTPUT}/.config ; then
+		make_command='
+         make scripts'
+	else
+		make_command='
+         Enable CONFIG_DTC in the kernel configuration
+         make scripts'
+	fi
 	if ( ! which ${__DTC} >/dev/null ) ; then
 
 		# use spaces instead of tabs in the error message
@@ -280,8 +287,7 @@ ERROR: unable to find a 'dtc' program
       'dtc' is: ${DTC}
 
       If it does not exist, create it from the root of the Linux source tree:
-
-         'make scripts'.
+${make_command}
 
       If not at the root of the Linux kernel source tree -s SRCTREE or -S
       may need to be specified to find 'dtc'.

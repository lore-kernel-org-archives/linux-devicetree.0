From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] scripts/dtc: update dtx_diff cpp and dts include paths to match build
Date: Fri, 15 Sep 2017 15:16:19 -0700
Message-ID: <1505513779-11315-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Update dtx_diff include paths in the same manner as:
commit b12869a8d519 ("of: remove drivers/of/testcase-data from
include search path for CPP"), commit 5ffa2aed389c ("of: remove
arch/$(SRCARCH)/boot/dts from include search path for CPP"), and
commit 50f9ddaf64e1 ("of: search scripts/dtc/include-prefixes path
for both CPP and DTC").

Remove proposed include path kernel/dts/, which was never implemented
for the dtb build.

For the diff case, each source file is compiled separately.  For
each of those compiles, provide the location of the source file
as an include path, not the location of both source files.

---

The referenced commits b12869a8d519, 5ffa2aed389c, 50f9ddaf64e1
are in v4.14-rc1.  No stable kernels need this patch.

 scripts/dtc/dtx_diff |   22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 scripts/dtc/dtx_diff | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/scripts/dtc/dtx_diff b/scripts/dtc/dtx_diff
index f9a3d8d23c64..8c4fbad2055e 100755
--- a/scripts/dtc/dtx_diff
+++ b/scripts/dtc/dtx_diff
@@ -86,6 +86,7 @@ eod
 compile_to_dts() {
 
 	dtx="$1"
+	dtc_include="$2"
 
 	if [ -d "${dtx}" ] ; then
 
@@ -113,7 +114,7 @@ compile_to_dts() {
 		# -----  input is DTS (source)
 
 		if ( cpp ${cpp_flags} -x assembler-with-cpp ${dtx} \
-			| ${DTC} -I dts ) ; then
+			| ${DTC} ${dtc_include} -I dts ) ; then
 			return
 		fi
 
@@ -320,18 +321,13 @@ fi
 
 cpp_flags="\
 	-nostdinc                                  \
-	-I${srctree}/arch/${ARCH}/boot/dts         \
 	-I${srctree}/scripts/dtc/include-prefixes  \
-	-I${srctree}/drivers/of/testcase-data      \
 	-undef -D__DTS__"
 
-dtc_flags="\
-	-i ${srctree}/arch/${ARCH}/boot/dts/ \
-	-i ${srctree}/kernel/dts             \
-	${dtx_path_1_dtc_include}            \
-	${dtx_path_2_dtc_include}"
-
-DTC="${DTC} ${dtc_flags} -O dts -qq -f ${dtc_sort} -o -"
+DTC="\
+	${DTC}                                     \
+	-i ${srctree}/scripts/dtc/include-prefixes \
+	-O dts -qq -f ${dtc_sort} -o -"
 
 
 # -----  do the diff or decompile
@@ -339,11 +335,11 @@ DTC="${DTC} ${dtc_flags} -O dts -qq -f ${dtc_sort} -o -"
 if (( ${cmd_diff} )) ; then
 
 	diff ${diff_flags} --label "${dtx_file_1}" --label "${dtx_file_2}" \
-		<(compile_to_dts "${dtx_file_1}") \
-		<(compile_to_dts "${dtx_file_2}")
+		<(compile_to_dts "${dtx_file_1}" "${dtx_path_1_dtc_include}") \
+		<(compile_to_dts "${dtx_file_2}" "${dtx_path_2_dtc_include}")
 
 else
 
-	compile_to_dts "${dtx_file_1}"
+	compile_to_dts "${dtx_file_1}" "${dtx_path_1_dtc_include}"
 
 fi
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

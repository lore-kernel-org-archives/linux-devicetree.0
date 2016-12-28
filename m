From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [RFC PATCH 2/5] overlay: shell script to make overlay_convert easier to use
Date: Tue, 27 Dec 2016 23:20:14 -0800
Message-ID: <1482909617-31950-3-git-send-email-frowand.list@gmail.com>
References: <1482909617-31950-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1482909617-31950-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

A slightly paranoid wrapper around overlay_convert.  Verifies that
converted dts file is equivalent to original dts file.

Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
---
 overlay_convert_old_to_new | 144 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100755 overlay_convert_old_to_new

diff --git a/overlay_convert_old_to_new b/overlay_convert_old_to_new
new file mode 100755
index 000000000000..bc26c57d4dc1
--- /dev/null
+++ b/overlay_convert_old_to_new
@@ -0,0 +1,144 @@
+#! /bin/bash
+
+#_______________________________________________________________________________
+
+
+function usage
+{
+echo ""                                                                      >&2
+echo "usage:"                                                                >&2
+echo "  `basename $0` -h | -help | --help"                                   >&2
+echo "  `basename $0` [options] OLD_DTS NEW_DTS"                             >&2
+echo ""                                                                      >&2
+echo "  Convert OLD_DTS from old overlay style to new overlay style"         >&2
+echo "  using syntactic sugar."                                              >&2
+echo ""                                                                      >&2
+echo "  Options:"                                                            >&2
+echo "     -h          synonym for --help"                                   >&2
+echo "    --help       print this message"                                   >&2
+echo "     -o          synonym for --overwrite"                              >&2
+echo "    --overwrite  overwrite NEW_DTS if it already exists"               >&2
+echo ""                                                                      >&2
+echo "  The early patches to dtc to support overlays required 'fragment'"    >&2
+echo "  and '__overlay__' nodes in the .dts source.  Later patches to dtc"   >&2
+echo "  will not require these nodes (and may possibly disallow them)."      >&2
+echo "  The new overlay style is expected to be the preferrred form."        >&2
+echo ""                                                                      >&2
+echo "  Will not overwrite NEW_DTS if it already exists."                    >&2
+echo ""                                                                      >&2
+echo "  Exit status is:"                                                     >&2
+echo "    0 success"                                                         >&2
+echo "    1 general error"                                                   >&2
+echo "    2 NEW_DTS already exists"                                          >&2
+echo "    3 conversion problem"                                              >&2
+echo "    4 'dtc -@ -O dts OLD_DTS' is different than 'dtc -@ -O dts NEW_DTS'" >&2
+echo ""                                                                      >&2
+}
+
+
+unset new_dts
+unset old_dts
+unset overwrite
+
+while [[ ($# -gt 0) ]] ; do
+
+	case $1 in
+
+		-o | --overwrite )
+			shift
+			overwrite=1
+			;;
+
+		-h | -help | --help )
+			shift
+			help=1
+			;;
+
+		* )
+			if [[ "${old_dts}" != "" ]] ; then
+
+				if [[ "${new_dts}" != "" ]] ; then
+					echo ""                              >&2
+					echo "ERROR: too many arguments"     >&2
+					echo ""                              >&2
+					exit 1
+				fi
+
+				new_dts=$1
+				shift
+			else
+				old_dts=$1
+				shift
+			fi
+			;;
+
+		esac
+done
+
+
+if [[ (${help} == 1) ]] ; then
+	usage
+	exit 1
+fi
+
+
+#_______________________________________________________________________________
+
+if [[ -f ${new_dts} && overwrite -eq 0 ]] ; then
+
+	echo  ""                                                             >&2
+	echo  "ERROR: file '${new_dts}' already exists"                      >&2
+	echo  ""                                                             >&2
+
+	exit 2
+fi
+
+
+#_______________________________________________________________________________
+
+
+if which overlay_convert >/dev/null ; then
+	OVERLAY_CONVERT=overlay_convert
+elif which ./overlay_convert >/dev/null ; then
+	OVERLAY_CONVERT=./overlay_convert
+else
+	echo  ""                                                             >&2
+	echo "ERROR: overlay_convert not found or not executable"            >&2
+	echo  ""                                                             >&2
+
+	exit 1
+fi
+
+if ! ${OVERLAY_CONVERT} ${old_dts} > ${new_dts} ; then
+
+	echo ""                                                              >&2
+	echo "ERROR: unable to convert ${old_dts}"                           >&2
+	echo ""                                                              >&2
+
+	rm ${new_dts}
+
+	exit 3
+fi
+
+
+if ! which dtc >/dev/null ; then
+
+	echo  ""                                                             >&2
+	echo "ERROR: dtc not found or not executable"                        >&2
+	echo  "      add the location of dtc to \$PATH"                      >&2
+	echo  ""                                                             >&2
+
+	exit 1
+fi
+
+if ! diff -q                                      \
+	<(dtc -@ -O dts ${old_dts} 2>/dev/null) \
+	<(dtc -@ -O dts ${new_dts} 2>/dev/null) ; then
+
+	echo ""                                                              >&2
+	echo "ERROR: ${new_dts} is not equivalent to ${old_dts}"             >&2
+	echo ""                                                              >&2
+
+	exit 4
+fi
+
-- 
1.9.1

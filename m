From: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Import of dtc/libfdt upstream into kernel
Date: Tue, 14 Apr 2015 23:37:05 -0700
Message-ID: <1429079825-14405-1-git-send-email-gaurav.minocha.os@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gaurav <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Gaurav <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The following script is used to import dtc upstream
into kernel. It was missing import of dtc/libfdt, with
this commit it will include the same.

Signed-off-by: Gaurav <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 scripts/dtc/update-dtc-source.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
index feb01ef..a645906 100755
--- a/scripts/dtc/update-dtc-source.sh
+++ b/scripts/dtc/update-dtc-source.sh
@@ -34,6 +34,7 @@ DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c
 		srcpos.h treesource.c util.c util.h version_gen.h Makefile.dtc \
 		dtc-lexer.l dtc-parser.y"
 DTC_GENERATED="dtc-lexer.lex.c dtc-parser.tab.c dtc-parser.tab.h"
+LIBFDT_SOURCE="Makefile.libfdt fdt.c fdt.h fdt_empty_tree.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c fdt_wip.c libfdt.h libfdt_env.h libfdt_internal.h"
 
 # Build DTC
 cd $DTC_UPSTREAM_PATH
@@ -50,5 +51,9 @@ for f in $DTC_GENERATED; do
 	cp ${DTC_UPSTREAM_PATH}/$f ${f}_shipped
 	git add ${f}_shipped
 done
+for f in $LIBFDT_SOURCE; do
+	cp ${DTC_UPSTREAM_PATH}/libfdt/${f} libfdt/${f}
+	git add libfdt/${f}
+done
 
 git commit -e -v -m "scripts/dtc: Update to upstream version [CHANGEME]"
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

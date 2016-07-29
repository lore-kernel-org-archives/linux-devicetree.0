From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v5 6/8] libfdt: Introduce FDT_ERR_BADFIXUP
Date: Fri, 29 Jul 2016 11:55:49 +0200
Message-ID: <20160729095551.13592-7-maxime.ripard@free-electrons.com>
References: <20160729095551.13592-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160729095551.13592-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a FDT_ERR_BADFIXUP error used when an overlay fixup property is not
prooperly formatted.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/fdt_strerror.c | 1 +
 libfdt/libfdt.h       | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
index e6c3ceee8c58..0fbfb78dcd93 100644
--- a/libfdt/fdt_strerror.c
+++ b/libfdt/fdt_strerror.c
@@ -76,6 +76,7 @@ static struct fdt_errtabent fdt_errtable[] = {
 	FDT_ERRTABENT(FDT_ERR_BADVERSION),
 	FDT_ERRTABENT(FDT_ERR_BADSTRUCTURE),
 	FDT_ERRTABENT(FDT_ERR_BADLAYOUT),
+	FDT_ERRTABENT(FDT_ERR_BADFIXUP),
 };
 #define FDT_ERRTABSIZE	(sizeof(fdt_errtable) / sizeof(fdt_errtable[0]))
 
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index e534a34355a4..f49b45c29006 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -126,7 +126,11 @@
 	 * value. For example: a property expected to contain a string list
 	 * is not NUL-terminated within the length of its value. */
 
-#define FDT_ERR_MAX		15
+#define FDT_ERR_BADFIXUP	16
+	/* FDT_ERR_BADFIXUP: One of the device tree overlay fixup is
+	 * not formatted properly. */
+
+#define FDT_ERR_MAX		16
 
 /**********************************************************************/
 /* Low-level functions (you probably don't need these)                */
-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

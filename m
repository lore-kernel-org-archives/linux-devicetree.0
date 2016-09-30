From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v7 1/4] libfdt: Add new errors for the overlay code
Date: Fri, 30 Sep 2016 15:57:14 +0200
Message-ID: <20160930135717.16511-2-maxime.ripard@free-electrons.com>
References: <20160930135717.16511-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160930135717.16511-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a few new error codes to report the failure conditions we might
encounter in the overlay application code:
   - FDT_ERR_BADOVERLAY, when an overlay cannot be parsed, even though its
     structure is correct
   - FDT_ERR_NOPHANDLES, when we ran out of available phandles and we
     cannot use a new phandle without either using an invalid one (-1 or
     0), or one already used.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/fdt_strerror.c |  3 +++
 libfdt/libfdt.h       | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/libfdt/fdt_strerror.c b/libfdt/fdt_strerror.c
index e6c3ceee8c58..3cb357f60454 100644
--- a/libfdt/fdt_strerror.c
+++ b/libfdt/fdt_strerror.c
@@ -76,6 +76,9 @@ static struct fdt_errtabent fdt_errtable[] = {
 	FDT_ERRTABENT(FDT_ERR_BADVERSION),
 	FDT_ERRTABENT(FDT_ERR_BADSTRUCTURE),
 	FDT_ERRTABENT(FDT_ERR_BADLAYOUT),
+	FDT_ERRTABENT(FDT_ERR_BADOVERLAY),
+	FDT_ERRTABENT(FDT_ERR_BADOVERLAY),
+	FDT_ERRTABENT(FDT_ERR_NOPHANDLES),
 };
 #define FDT_ERRTABSIZE	(sizeof(fdt_errtable) / sizeof(fdt_errtable[0]))
 
diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index ecb11fc9e985..361cc6c7198c 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -126,7 +126,16 @@
 	 * value. For example: a property expected to contain a string list
 	 * is not NUL-terminated within the length of its value. */
 
-#define FDT_ERR_MAX		15
+#define FDT_ERR_BADOVERLAY	16
+	/* FDT_ERR_BADOVERLAY: The device tree overlay, while
+	 * correctly structured, cannot be applied due to some
+	 * unexpected or missing value, property or node. */
+
+#define FDT_ERR_NOPHANDLES	17
+	/* FDT_ERR_NOPHANDLES: The device tree doesn't have any
+	 * phandle available anymore without causing an overflow */
+
+#define FDT_ERR_MAX		17
 
 /**********************************************************************/
 /* Low-level functions (you probably don't need these)                */
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

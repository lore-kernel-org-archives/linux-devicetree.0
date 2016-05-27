From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH] fdt: Add a subnodes iterator macro
Date: Fri, 27 May 2016 10:28:45 +0200
Message-ID: <1464337729-7821-2-git-send-email-maxime.ripard@free-electrons.com>
References: <1464337729-7821-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464337729-7821-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The fdt_for_each_subnode() iterator macro provided by this patch can be
used to iterate over a device tree node's subnodes. At each iteration a
loop variable will be set to the next subnode.

Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 libfdt/libfdt.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 2dfc6d9e5ce7..f3cbb637be41 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -163,6 +163,31 @@ int fdt_first_subnode(const void *fdt, int offset);
  */
 int fdt_next_subnode(const void *fdt, int offset);
 
+/**
+ * fdt_for_each_subnode - iterate over all subnodes of a parent
+ *
+ * This is actually a wrapper around a for loop and would be used like so:
+ *
+ *	fdt_for_each_subnode(fdt, node, parent) {
+ *		...
+ *		use node
+ *		...
+ *	}
+ *
+ * Note that this is implemented as a macro and node is used as iterator in
+ * the loop. It should therefore be a locally allocated variable. The parent
+ * variable on the other hand is never modified, so it can be constant or
+ * even a literal.
+ *
+ * @fdt:	FDT blob (const void *)
+ * @node:	child node (int)
+ * @parent:	parent node (int)
+ */
+#define fdt_for_each_subnode(fdt, node, parent)		\
+	for (node = fdt_first_subnode(fdt, parent);	\
+	     node >= 0;					\
+	     node = fdt_next_subnode(fdt, node))
+
 /**********************************************************************/
 /* General functions                                                  */
 /**********************************************************************/
-- 
2.8.2

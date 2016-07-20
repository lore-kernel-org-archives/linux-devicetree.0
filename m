From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 1/6] libfdt: Add a subnodes iterator macro
Date: Wed, 20 Jul 2016 16:20:39 +0200
Message-ID: <20160720142044.27527-2-maxime.ripard@free-electrons.com>
References: <20160720142044.27527-1-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160720142044.27527-1-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The fdt_for_each_subnode() iterator macro provided by this patch can be
used to iterate over a device tree node's subnodes. At each iteration a
loop variable will be set to the next subnode.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/libfdt.h         | 27 +++++++++++++++++++++++++++
 tests/subnode_iterate.c |  8 ++------
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 36222fd4a6f4..70ec39c7104c 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -168,6 +168,33 @@ int fdt_first_subnode(const void *fdt, int offset);
  */
 int fdt_next_subnode(const void *fdt, int offset);
 
+/**
+ * fdt_for_each_subnode - iterate over all subnodes of a parent
+ *
+ * This is actually a wrapper around a for loop and would be used like so:
+ *
+ *	fdt_for_each_subnode(node, fdt, parent) {
+ *		if ((node < 0) && (node != -FDT_ERR_NOT_FOUND)) {
+ *			Error handling
+ *		}
+ *
+ *		Use node
+ *		...
+ *	}
+ *
+ * Note that this is implemented as a macro and @node is used as
+ * iterator in the loop. The parent variable be constant or even a
+ * literal.
+ *
+ * @node:	child node (int)
+ * @fdt:	FDT blob (const void *)
+ * @parent:	parent node (int)
+ */
+#define fdt_for_each_subnode(node, fdt, parent)		\
+	for (node = fdt_first_subnode(fdt, parent);	\
+	     node >= 0;					\
+	     node = fdt_next_subnode(fdt, node))
+
 /**********************************************************************/
 /* General functions                                                  */
 /**********************************************************************/
diff --git a/tests/subnode_iterate.c b/tests/subnode_iterate.c
index b9f379d5963c..0fb5c901ebd7 100644
--- a/tests/subnode_iterate.c
+++ b/tests/subnode_iterate.c
@@ -48,9 +48,7 @@ static void test_node(void *fdt, int parent_offset)
 	subnodes = cpu_to_fdt32(*prop);
 
 	count = 0;
-	for (offset = fdt_first_subnode(fdt, parent_offset);
-	     offset >= 0;
-	     offset = fdt_next_subnode(fdt, offset))
+	fdt_for_each_subnode(offset, fdt, parent_offset)
 		count++;
 
 	if (count != subnodes) {
@@ -65,9 +63,7 @@ static void check_fdt_next_subnode(void *fdt)
 	int offset;
 	int count = 0;
 
-	for (offset = fdt_first_subnode(fdt, 0);
-	     offset >= 0;
-	     offset = fdt_next_subnode(fdt, offset)) {
+	fdt_for_each_subnode(offset, fdt, 0) {
 		test_node(fdt, offset);
 		count++;
 	}
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

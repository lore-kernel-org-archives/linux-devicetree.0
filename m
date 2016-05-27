From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/4] libfdt: Add iterator over properties
Date: Fri, 27 May 2016 10:28:47 +0200
Message-ID: <1464337729-7821-4-git-send-email-maxime.ripard@free-electrons.com>
References: <1464337729-7821-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464337729-7821-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Alexander Kaplan <alex-MflLfwwFzuz+yO7R74ARew@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Implement a macro based on fdt_first_property_offset and
fdt_next_property_offset that provides a convenience to iterate over all
the properties of a given node.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 libfdt/libfdt.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
index 331f32dd04b5..6589e08db7ab 100644
--- a/libfdt/libfdt.h
+++ b/libfdt/libfdt.h
@@ -456,6 +456,30 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset);
 int fdt_next_property_offset(const void *fdt, int offset);
 
 /**
+ * fdt_for_each_property - iterate over all properties of a node
+ * @fdt:	FDT blob (const void *)
+ * @node:	node offset (int)
+ * @property:	property offset (int)
+ *
+ * This is actually a wrapper around a for loop and would be used like so:
+ *
+ *	fdt_for_each_property(fdt, node, property) {
+ *		...
+ *		use property
+ *		...
+ *	}
+ *
+ * Note that this is implemented as a macro and property is used as
+ * iterator in the loop. It should therefore be a locally allocated
+ * variable. The node variable on the other hand is never modified, so
+ * it can be constant or even a literal.
+ */
+#define fdt_for_each_property(fdt, node, property)		\
+	for (property = fdt_first_property_offset(fdt, node);	\
+	     property >= 0;					\
+	     property = fdt_next_property_offset(fdt, property))
+
+/**
  * fdt_get_property_by_offset - retrieve the property at a given offset
  * @fdt: pointer to the device tree blob
  * @offset: offset of the property to retrieve
-- 
2.8.2

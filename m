From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] of: base: use of_property_read_u32()
Date: Sun, 23 Jul 2017 19:55:47 +0300
Message-ID: <20170723165744.310866466@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=of-base-use-of_property_read_u32.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_n_{addr|size}_cells(() predate of_property_read_u32(), so they have to
basically open-code it. Using the modern DT API saves several LoCs and also
adds some prop sanity checks as a bonus...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 drivers/of/base.c |   14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

Index: linux/drivers/of/base.c
===================================================================
--- linux.orig/drivers/of/base.c
+++ linux/drivers/of/base.c
@@ -60,14 +60,13 @@ DEFINE_RAW_SPINLOCK(devtree_lock);
 
 int of_n_addr_cells(struct device_node *np)
 {
-	const __be32 *ip;
+	u32 cells;
 
 	do {
 		if (np->parent)
 			np = np->parent;
-		ip = of_get_property(np, "#address-cells", NULL);
-		if (ip)
-			return be32_to_cpup(ip);
+		if (!of_property_read_u32(np, "#address-cells", &cells))
+			return cells;
 	} while (np->parent);
 	/* No #address-cells property for the root node */
 	return OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
@@ -76,14 +75,13 @@ EXPORT_SYMBOL(of_n_addr_cells);
 
 int of_n_size_cells(struct device_node *np)
 {
-	const __be32 *ip;
+	u32 cells;
 
 	do {
 		if (np->parent)
 			np = np->parent;
-		ip = of_get_property(np, "#size-cells", NULL);
-		if (ip)
-			return be32_to_cpup(ip);
+		if (!of_property_read_u32(np, "#size-cells", &cells))
+			return cells;
 	} while (np->parent);
 	/* No #size-cells property for the root node */
 	return OF_ROOT_NODE_SIZE_CELLS_DEFAULT;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

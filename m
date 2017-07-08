From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/2] of: irq: use of_property_read_u32()
Date: Sat, 08 Jul 2017 23:29:52 +0300
Message-ID: <20170708203322.076876255@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=of-irq-use-of_property_read_u32.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The DT interrupt parsing code predates of_property_read_u32(), so it has to
basically open-code it. Using the modern DT API saves several LoCs and also
adds some prop sanity checks as a bonus...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 drivers/of/irq.c |   30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

Index: linux/drivers/of/irq.c
===================================================================
--- linux.orig/drivers/of/irq.c
+++ linux/drivers/of/irq.c
@@ -59,20 +59,19 @@ EXPORT_SYMBOL_GPL(irq_of_parse_and_map);
 struct device_node *of_irq_find_parent(struct device_node *child)
 {
 	struct device_node *p;
-	const __be32 *parp;
+	phandle parent;
 
 	if (!of_node_get(child))
 		return NULL;
 
 	do {
-		parp = of_get_property(child, "interrupt-parent", NULL);
-		if (parp == NULL)
+		if (of_property_read_u32(child, "interrupt-parent", &parent)) {
 			p = of_get_parent(child);
-		else {
+		} else	{
 			if (of_irq_workarounds & OF_IMAP_NO_PHANDLE)
 				p = of_node_get(of_irq_dflt_pic);
 			else
-				p = of_find_node_by_phandle(be32_to_cpup(parp));
+				p = of_find_node_by_phandle(parent);
 		}
 		of_node_put(child);
 		child = p;
@@ -117,11 +116,8 @@ int of_irq_parse_raw(const __be32 *addr,
 	 * is none, we are nice and just walk up the tree
 	 */
 	do {
-		tmp = of_get_property(ipar, "#interrupt-cells", NULL);
-		if (tmp != NULL) {
-			intsize = be32_to_cpu(*tmp);
+		if (!of_property_read_u32(ipar, "#interrupt-cells", &intsize))
 			break;
-		}
 		tnode = ipar;
 		ipar = of_irq_find_parent(ipar);
 		of_node_put(tnode);
@@ -228,14 +224,14 @@ int of_irq_parse_raw(const __be32 *addr,
 			/* Get #interrupt-cells and #address-cells of new
 			 * parent
 			 */
-			tmp = of_get_property(newpar, "#interrupt-cells", NULL);
-			if (tmp == NULL) {
+			if (of_property_read_u32(newpar, "#interrupt-cells",
+						 &newintsize)) {
 				pr_debug(" -> parent lacks #interrupt-cells!\n");
 				goto fail;
 			}
-			newintsize = be32_to_cpu(*tmp);
-			tmp = of_get_property(newpar, "#address-cells", NULL);
-			newaddrsize = (tmp == NULL) ? 0 : be32_to_cpu(*tmp);
+			if (of_property_read_u32(newpar, "#address-cells",
+						 &newaddrsize))
+				newaddrsize = 0;
 
 			pr_debug(" -> newintsize=%d, newaddrsize=%d\n",
 			    newintsize, newaddrsize);
@@ -296,7 +292,7 @@ EXPORT_SYMBOL_GPL(of_irq_parse_raw);
 int of_irq_parse_one(struct device_node *device, int index, struct of_phandle_args *out_irq)
 {
 	struct device_node *p;
-	const __be32 *intspec, *tmp, *addr;
+	const __be32 *intspec, *addr;
 	u32 intsize, intlen;
 	int i, res;
 
@@ -330,12 +326,10 @@ int of_irq_parse_one(struct device_node
 		return -EINVAL;
 
 	/* Get size of interrupt specifier */
-	tmp = of_get_property(p, "#interrupt-cells", NULL);
-	if (tmp == NULL) {
+	if (of_property_read_u32(p, "#interrupt-cells", &intsize)) {
 		res = -EINVAL;
 		goto out;
 	}
-	intsize = be32_to_cpu(*tmp);
 
 	pr_debug(" intsize=%d intlen=%d\n", intsize, intlen);
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

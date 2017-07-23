From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 2/2] of_pci: use of_property_read_u32_array()
Date: Sun, 23 Jul 2017 22:41:46 +0300
Message-ID: <20170723194327.508593685@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=of_pci-use-of_property_read_u32_array.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_pci_get_devfn() and of_pci_parse_bus_range() somehow didn't use
of_property_read_u32_array() though it was long available, basically
open-coding it.  Using the modern DT API saves several LoCs/bytes and
also adds some prop sanity checks as a bonus...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 drivers/of/of_pci.c |   28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

Index: linux/drivers/of/of_pci.c
===================================================================
--- linux.orig/drivers/of/of_pci.c
+++ linux/drivers/of/of_pci.c
@@ -57,15 +57,14 @@ EXPORT_SYMBOL_GPL(of_pci_find_child_devi
  */
 int of_pci_get_devfn(struct device_node *np)
 {
-	unsigned int size;
-	const __be32 *reg;
+	u32 reg[5];
+	int error;
 
-	reg = of_get_property(np, "reg", &size);
+	error = of_property_read_u32_array(np, "reg", reg, ARRAY_SIZE(reg));
+	if (error)
+		return error;
 
-	if (!reg || size < 5 * sizeof(__be32))
-		return -EINVAL;
-
-	return (be32_to_cpup(reg) >> 8) & 0xff;
+	return (reg[0] >> 8) & 0xff;
 }
 EXPORT_SYMBOL_GPL(of_pci_get_devfn);
 
@@ -78,16 +77,17 @@ EXPORT_SYMBOL_GPL(of_pci_get_devfn);
  */
 int of_pci_parse_bus_range(struct device_node *node, struct resource *res)
 {
-	const __be32 *values;
-	int len;
+	u32 bus_range[2];
+	int error;
 
-	values = of_get_property(node, "bus-range", &len);
-	if (!values || len < sizeof(*values) * 2)
-		return -EINVAL;
+	error = of_property_read_u32_array(node, "bus-range", bus_range,
+					   ARRAY_SIZE(bus_range));
+	if (error)
+		return error;
 
 	res->name = node->name;
-	res->start = be32_to_cpup(values++);
-	res->end = be32_to_cpup(values);
+	res->start = bus_range[0];
+	res->end = bus_range[1];
 	res->flags = IORESOURCE_BUS;
 
 	return 0;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

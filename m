From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] of_pci: use of_property_read_u32()
Date: Sun, 23 Jul 2017 22:41:45 +0300
Message-ID: <20170723194323.872800622@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline; filename=of_pci-use-of_property_read_u32.patch
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_get_pci_domain_nr() somehow didn't use of_property_read_u32() though it
was long available, basically open-coding it. Using the modern DT API saves
several LoCs/bytes and also adds some prop sanity checks as a bonus...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

---
 drivers/of/of_pci.c |   15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

Index: linux/drivers/of/of_pci.c
===================================================================
--- linux.orig/drivers/of/of_pci.c
+++ linux/drivers/of/of_pci.c
@@ -105,17 +105,14 @@ EXPORT_SYMBOL_GPL(of_pci_parse_bus_range
  */
 int of_get_pci_domain_nr(struct device_node *node)
 {
-	const __be32 *value;
-	int len;
-	u16 domain;
+	u32 domain;
+	int error;
 
-	value = of_get_property(node, "linux,pci-domain", &len);
-	if (!value || len < sizeof(*value))
-		return -EINVAL;
+	error = of_property_read_u32(node, "linux,pci-domain", &domain);
+	if (error)
+		return error;
 
-	domain = (u16)be32_to_cpup(value);
-
-	return domain;
+	return (u16)domain;
 }
 EXPORT_SYMBOL_GPL(of_get_pci_domain_nr);
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v9 1/3] of: Provide function to request and map memory
Date: Fri, 20 Jun 2014 13:48:47 +0200
Message-ID: <1403264929-21325-2-git-send-email-matthias.bgg@gmail.com>
References: <1403264929-21325-1-git-send-email-matthias.bgg@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403264929-21325-1-git-send-email-matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, silvio.fricke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, heiko.stuebner-K3U4GQvHnyU@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, anders.berg-M7mHMAq9Yzo@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.brugger-K3U4GQvHnyU@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Matthias Brugger <matthias.brugger-K3U4GQvHnyU@public.gmane.org>

A call to of_iomap does not request the memory region.
This patch adds the function of_io_request_and_map which requests
the memory region before mapping it.

Signed-off-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Suggested-by: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/of/address.c       |   29 +++++++++++++++++++++++++++++
 include/linux/of_address.h |    8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index cb4242a..09074ba 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -721,3 +721,32 @@ void __iomem *of_iomap(struct device_node *np, int index)
 	return ioremap(res.start, resource_size(&res));
 }
 EXPORT_SYMBOL(of_iomap);
+
+/*
+ * of_io_request_and_map - Requests a resource and maps the memory mapped IO
+ *			   for a given device_node
+ * @device:	the device whose io range will be mapped
+ * @index:	index of the io range
+ * @name:	name of the resource
+ *
+ * Returns a pointer to the requested and mapped memory
+ */
+void __iomem *of_io_request_and_map(struct device_node *np, int index,
+					char *name)
+{
+	struct resource res;
+	void __iomem *mem;
+
+	if (of_address_to_resource(np, index, &res))
+		return NULL;
+
+	if (!request_mem_region(res.start, resource_size(&res), name))
+		return NULL;
+
+	mem = ioremap(res.start, resource_size(&res));
+	if (!mem)
+		release_mem_region(res.start, resource_size(&res));
+
+	return mem;
+}
+EXPORT_SYMBOL(of_io_request_and_map);
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 5f6ed6b..725b875 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -96,6 +96,8 @@ static inline struct of_pci_range *of_pci_range_parser_one(
 extern int of_address_to_resource(struct device_node *dev, int index,
 				  struct resource *r);
 void __iomem *of_iomap(struct device_node *node, int index);
+void __iomem *of_io_request_and_map(struct device_node *device,
+					int index, char *name);
 #else
 static inline int of_address_to_resource(struct device_node *dev, int index,
 					 struct resource *r)
@@ -107,6 +109,12 @@ static inline void __iomem *of_iomap(struct device_node *device, int index)
 {
 	return NULL;
 }
+
+static inline void __iomem *of_io_request_and_map(struct device_node *device,
+					int index, char *name)
+{
+	return NULL;
+}
 #endif
 
 #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_PCI)
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

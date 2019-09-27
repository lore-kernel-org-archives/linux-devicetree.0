From: Rob Herring <robh@kernel.org>
Subject: [PATCH 01/11] of: Remove unused of_find_matching_node_by_address()
Date: Thu, 26 Sep 2019 19:24:45 -0500
Message-ID: <20190927002455.13169-2-robh@kernel.org>
References: <20190927002455.13169-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

of_find_matching_node_by_address() is unused, so remove it.

Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c       | 19 -------------------
 include/linux/of_address.h | 12 ------------
 2 files changed, 31 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 978427a9d5e6..0c3cf515c510 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -826,25 +826,6 @@ int of_address_to_resource(struct device_node *dev, int index,
 }
 EXPORT_SYMBOL_GPL(of_address_to_resource);
 
-struct device_node *of_find_matching_node_by_address(struct device_node *from,
-					const struct of_device_id *matches,
-					u64 base_address)
-{
-	struct device_node *dn = of_find_matching_node(from, matches);
-	struct resource res;
-
-	while (dn) {
-		if (!of_address_to_resource(dn, 0, &res) &&
-		    res.start == base_address)
-			return dn;
-
-		dn = of_find_matching_node(dn, matches);
-	}
-
-	return NULL;
-}
-
-
 /**
  * of_iomap - Maps the memory mapped IO for a given device_node
  * @device:	the device whose io range will be mapped
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 30e40fb6936b..e317f375374a 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -33,10 +33,6 @@ extern u64 of_translate_dma_address(struct device_node *dev,
 extern u64 of_translate_address(struct device_node *np, const __be32 *addr);
 extern int of_address_to_resource(struct device_node *dev, int index,
 				  struct resource *r);
-extern struct device_node *of_find_matching_node_by_address(
-					struct device_node *from,
-					const struct of_device_id *matches,
-					u64 base_address);
 extern void __iomem *of_iomap(struct device_node *device, int index);
 void __iomem *of_io_request_and_map(struct device_node *device,
 				    int index, const char *name);
@@ -71,14 +67,6 @@ static inline u64 of_translate_address(struct device_node *np,
 	return OF_BAD_ADDR;
 }
 
-static inline struct device_node *of_find_matching_node_by_address(
-					struct device_node *from,
-					const struct of_device_id *matches,
-					u64 base_address)
-{
-	return NULL;
-}
-
 static inline const __be32 *of_get_address(struct device_node *dev, int index,
 					u64 *size, unsigned int *flags)
 {
-- 
2.20.1

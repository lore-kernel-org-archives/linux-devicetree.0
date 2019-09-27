From: Rob Herring <robh@kernel.org>
Subject: [PATCH 02/11] of: Make of_dma_get_range() private
Date: Thu, 26 Sep 2019 19:24:46 -0500
Message-ID: <20190927002455.13169-3-robh@kernel.org>
References: <20190927002455.13169-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

of_dma_get_range() is only used within the DT core code, so remove the
export and move the header declaration to the private header.

Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c       |  1 -
 drivers/of/of_private.h    | 11 +++++++++++
 include/linux/of_address.h |  8 --------
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 0c3cf515c510..8e354d12fb04 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -972,7 +972,6 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(of_dma_get_range);
 
 /**
  * of_dma_is_coherent - Check if device is coherent
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 24786818e32e..f8c58615c393 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -158,4 +158,15 @@ extern void __of_sysfs_remove_bin_file(struct device_node *np,
 #define for_each_transaction_entry_reverse(_oft, _te) \
 	list_for_each_entry_reverse(_te, &(_oft)->te_list, node)
 
+#ifdef CONFIG_OF_ADDRESS
+extern int of_dma_get_range(struct device_node *np, u64 *dma_addr,
+			    u64 *paddr, u64 *size);
+#else
+static inline int of_dma_get_range(struct device_node *np, u64 *dma_addr,
+				   u64 *paddr, u64 *size)
+{
+	return -ENODEV;
+}
+#endif
+
 #endif /* _LINUX_OF_PRIVATE_H */
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index e317f375374a..ddda3936039c 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -51,8 +51,6 @@ extern int of_pci_dma_range_parser_init(struct of_pci_range_parser *parser,
 extern struct of_pci_range *of_pci_range_parser_one(
 					struct of_pci_range_parser *parser,
 					struct of_pci_range *range);
-extern int of_dma_get_range(struct device_node *np, u64 *dma_addr,
-				u64 *paddr, u64 *size);
 extern bool of_dma_is_coherent(struct device_node *np);
 #else /* CONFIG_OF_ADDRESS */
 static inline void __iomem *of_io_request_and_map(struct device_node *device,
@@ -92,12 +90,6 @@ static inline struct of_pci_range *of_pci_range_parser_one(
 	return NULL;
 }
 
-static inline int of_dma_get_range(struct device_node *np, u64 *dma_addr,
-				u64 *paddr, u64 *size)
-{
-	return -ENODEV;
-}
-
 static inline bool of_dma_is_coherent(struct device_node *np)
 {
 	return false;
-- 
2.20.1

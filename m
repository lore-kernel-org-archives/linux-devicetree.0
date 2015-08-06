From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH v6 1/6] PCI: designware: move calculation of bus addresses to DRA7xx
Date: Thu, 6 Aug 2015 16:09:14 +0800
Message-ID: <1438848559-232109-2-git-send-email-wangzhou1@hisilicon.com>
References: <1438848559-232109-1-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438848559-232109-1-git-send-email-wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>, Liviu.Dudau-5wv7dgnIgG8@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yuanzhichang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhudacai-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiujiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kangfenglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: gabriele paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Commit f4c55c5a3f7f "PCI: designware: Program ATU with untranslated
address" added the calculation of PCI BUS addresses in designware,
storing them in new fields added in "struct pcie_port". This
calculation is done for every designware user even if is only
applicable to DRA7xx.
This patch moves the calculation of the bus addresses to the DRA7xx
driver and is needed to allow the rework of designware to use
the new DT parsing API.

Signed-off-by: Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 drivers/pci/host/pci-dra7xx.c      | 13 +++++++++++++
 drivers/pci/host/pcie-designware.c | 15 ++++-----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/host/pci-dra7xx.c b/drivers/pci/host/pci-dra7xx.c
index 80db09e..18ae7ff 100644
--- a/drivers/pci/host/pci-dra7xx.c
+++ b/drivers/pci/host/pci-dra7xx.c
@@ -61,6 +61,7 @@
 
 #define	PCIECTRL_DRA7XX_CONF_PHY_CS			0x010C
 #define	LINK_UP						BIT(16)
+#define	CPU_TO_BUS_ADDR					0x0FFFFFFF
 
 struct dra7xx_pcie {
 	void __iomem		*base;
@@ -139,6 +140,18 @@ static void dra7xx_pcie_enable_interrupts(struct pcie_port *pp)
 static void dra7xx_pcie_host_init(struct pcie_port *pp)
 {
 	dw_pcie_setup_rc(pp);
+
+	if (pp->io_mod_base)
+		pp->io_mod_base &= CPU_TO_BUS_ADDR;
+
+	if (pp->mem_mod_base)
+		pp->mem_mod_base &= CPU_TO_BUS_ADDR;
+
+	if (pp->cfg0_mod_base) {
+		pp->cfg0_mod_base &= CPU_TO_BUS_ADDR;
+		pp->cfg1_mod_base &= CPU_TO_BUS_ADDR;
+	}
+
 	dra7xx_pcie_establish_link(pp);
 	if (IS_ENABLED(CONFIG_PCI_MSI))
 		dw_pcie_msi_init(pp);
diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pcie-designware.c
index 69486be..c5d407c 100644
--- a/drivers/pci/host/pcie-designware.c
+++ b/drivers/pci/host/pcie-designware.c
@@ -366,14 +366,10 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	struct of_pci_range range;
 	struct of_pci_range_parser parser;
 	struct resource *cfg_res;
-	u32 val, na, ns;
+	u32 val, ns;
 	const __be32 *addrp;
 	int i, index, ret;
 
-	/* Find the address cell size and the number of cells in order to get
-	 * the untranslated address.
-	 */
-	of_property_read_u32(np, "#address-cells", &na);
 	ns = of_n_size_cells(np);
 
 	cfg_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config");
@@ -416,8 +412,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			pp->io_base = range.cpu_addr;
 
 			/* Find the untranslated IO space address */
-			pp->io_mod_base = of_read_number(parser.range -
-							 parser.np + na, ns);
+			pp->io_mod_base = range.cpu_addr;
 		}
 		if (restype == IORESOURCE_MEM) {
 			of_pci_range_to_resource(&range, np, &pp->mem);
@@ -426,8 +421,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			pp->mem_bus_addr = range.pci_addr;
 
 			/* Find the untranslated MEM space address */
-			pp->mem_mod_base = of_read_number(parser.range -
-							  parser.np + na, ns);
+			pp->mem_mod_base = range.cpu_addr;
 		}
 		if (restype == 0) {
 			of_pci_range_to_resource(&range, np, &pp->cfg);
@@ -437,8 +431,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			pp->cfg1_base = pp->cfg.start + pp->cfg0_size;
 
 			/* Find the untranslated configuration space address */
-			pp->cfg0_mod_base = of_read_number(parser.range -
-							   parser.np + na, ns);
+			pp->cfg0_mod_base = range.cpu_addr;
 			pp->cfg1_mod_base = pp->cfg0_mod_base +
 					    pp->cfg0_size;
 		}
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

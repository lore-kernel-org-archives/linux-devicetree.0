From: Ley Foon Tan <ley.foon.tan@intel.com>
Subject: [PATCH v6 1/3] PCI: altera: Add Stratix 10 PCIe support
Date: Thu, 28 Feb 2019 18:52:50 +0800
Message-ID: <1551351172-25424-2-git-send-email-ley.foon.tan@intel.com>
References: <1551351172-25424-1-git-send-email-ley.foon.tan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551351172-25424-1-git-send-email-ley.foon.tan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, lftan.linux@gmail.com, Ley Foon Tan <ley.foon.tan@intel.com>
List-Id: devicetree@vger.kernel.org

Add PCIe Root Port support for Stratix 10 device.

Main differences compare with PCIe Root Port IP on Cyclone V
and Arria 10 devices:

- HIP interface to access Root Port configuration register.
- TLP programming flow:
  - One REG0 register
  - Don't need to check alignment

Signed-off-by: Ley Foon Tan <ley.foon.tan@intel.com>
---
 drivers/pci/controller/pcie-altera.c | 264 ++++++++++++++++++++++++---
 1 file changed, 240 insertions(+), 24 deletions(-)

diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
index 7d05e51205b3..c57fd7f4e848 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -11,6 +11,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/init.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
@@ -37,7 +38,12 @@
 #define RP_LTSSM_MASK			0x1f
 #define LTSSM_L0			0xf
 
-#define PCIE_CAP_OFFSET			0x80
+#define S10_RP_TX_CNTRL			0x2004
+#define S10_RP_RXCPL_REG		0x2008
+#define S10_RP_RXCPL_STATUS		0x200C
+#define S10_RP_CFG_ADDR(pcie, reg)	\
+	(((pcie)->hip_base) + (reg) + (1 << 20))
+
 /* TLP configuration type 0 and 1 */
 #define TLP_FMTTYPE_CFGRD0		0x04	/* Configuration Read Type 0 */
 #define TLP_FMTTYPE_CFGWR0		0x44	/* Configuration Write Type 0 */
@@ -49,18 +55,19 @@
 #define RP_DEVFN			0
 #define TLP_REQ_ID(bus, devfn)		(((bus) << 8) | (devfn))
 #define TLP_CFGRD_DW0(pcie, bus)					\
-    ((((bus == pcie->root_bus_nr) ? TLP_FMTTYPE_CFGRD0			\
-				    : TLP_FMTTYPE_CFGRD1) << 24) |	\
-     TLP_PAYLOAD_SIZE)
+	((((bus == pcie->root_bus_nr) ? pcie->pcie_data->cfgrd0		\
+				: pcie->pcie_data->cfgrd1) << 24) |	\
+				TLP_PAYLOAD_SIZE)
 #define TLP_CFGWR_DW0(pcie, bus)					\
-    ((((bus == pcie->root_bus_nr) ? TLP_FMTTYPE_CFGWR0			\
-				    : TLP_FMTTYPE_CFGWR1) << 24) |	\
-     TLP_PAYLOAD_SIZE)
+	((((bus == pcie->root_bus_nr) ? pcie->pcie_data->cfgwr0		\
+				: pcie->pcie_data->cfgwr1) << 24) |	\
+				TLP_PAYLOAD_SIZE)
 #define TLP_CFG_DW1(pcie, tag, be)	\
-    (((TLP_REQ_ID(pcie->root_bus_nr,  RP_DEVFN)) << 16) | (tag << 8) | (be))
+	(((TLP_REQ_ID(pcie->root_bus_nr,  RP_DEVFN)) << 16) | (tag << 8) | (be))
 #define TLP_CFG_DW2(bus, devfn, offset)	\
 				(((bus) << 24) | ((devfn) << 16) | (offset))
 #define TLP_COMP_STATUS(s)		(((s) >> 13) & 7)
+#define TLP_BYTE_COUNT(s)		(((s) >> 0) & 0xfff)
 #define TLP_HDR_SIZE			3
 #define TLP_LOOP			500
 
@@ -69,14 +76,47 @@
 
 #define DWORD_MASK			3
 
+#define S10_TLP_FMTTYPE_CFGRD0		0x05
+#define S10_TLP_FMTTYPE_CFGRD1		0x04
+#define S10_TLP_FMTTYPE_CFGWR0		0x45
+#define S10_TLP_FMTTYPE_CFGWR1		0x44
+
+enum altera_pcie_version {
+	ALTERA_PCIE_V1 = 0,
+	ALTERA_PCIE_V2,
+};
+
 struct altera_pcie {
 	struct platform_device	*pdev;
-	void __iomem		*cra_base;	/* DT Cra */
+	void __iomem		*cra_base;
+	void __iomem		*hip_base;
 	int			irq;
 	u8			root_bus_nr;
 	struct irq_domain	*irq_domain;
 	struct resource		bus_range;
 	struct list_head	resources;
+	const struct altera_pcie_data	*pcie_data;
+};
+
+struct altera_pcie_ops {
+	int (*tlp_read_pkt)(struct altera_pcie *pcie, u32 *value);
+	void (*tlp_write_pkt)(struct altera_pcie *pcie, u32 *headers,
+			      u32 data, bool align);
+	bool (*get_link_status)(struct altera_pcie *pcie);
+	int (*rp_read_cfg)(struct altera_pcie *pcie, int where,
+			   int size, u32 *value);
+	int (*rp_write_cfg)(struct altera_pcie *pcie, u8 busno,
+			    int where, int size, u32 value);
+};
+
+struct altera_pcie_data {
+	const struct altera_pcie_ops *ops;
+	enum altera_pcie_version version;
+	u32 cap_offset;		/* PCIe capability structure register offset */
+	u32 cfgrd0;
+	u32 cfgrd1;
+	u32 cfgwr0;
+	u32 cfgwr1;
 };
 
 struct tlp_rp_regpair_t {
@@ -101,6 +141,15 @@ static bool altera_pcie_link_up(struct altera_pcie *pcie)
 	return !!((cra_readl(pcie, RP_LTSSM) & RP_LTSSM_MASK) == LTSSM_L0);
 }
 
+static bool s10_altera_pcie_link_up(struct altera_pcie *pcie)
+{
+	void __iomem *addr = S10_RP_CFG_ADDR(pcie,
+				   pcie->pcie_data->cap_offset +
+				   PCI_EXP_LNKSTA);
+
+	return !!(readw(addr) & PCI_EXP_LNKSTA_DLLLA);
+}
+
 /*
  * Altera PCIe port uses BAR0 of RC's configuration space as the translation
  * from PCI bus to native BUS.  Entire DDR region is mapped into PCIe space
@@ -128,12 +177,18 @@ static void tlp_write_tx(struct altera_pcie *pcie,
 	cra_writel(pcie, tlp_rp_regdata->ctrl, RP_TX_CNTRL);
 }
 
+static void s10_tlp_write_tx(struct altera_pcie *pcie, u32 reg0, u32 ctrl)
+{
+	cra_writel(pcie, reg0, RP_TX_REG0);
+	cra_writel(pcie, ctrl, S10_RP_TX_CNTRL);
+}
+
 static bool altera_pcie_valid_device(struct altera_pcie *pcie,
 				     struct pci_bus *bus, int dev)
 {
 	/* If there is no link, then there is no device */
 	if (bus->number != pcie->root_bus_nr) {
-		if (!altera_pcie_link_up(pcie))
+		if (!pcie->pcie_data->ops->get_link_status(pcie))
 			return false;
 	}
 
@@ -183,6 +238,47 @@ static int tlp_read_packet(struct altera_pcie *pcie, u32 *value)
 	return PCIBIOS_DEVICE_NOT_FOUND;
 }
 
+static int s10_tlp_read_packet(struct altera_pcie *pcie, u32 *value)
+{
+	int i;
+	u32 ctrl;
+	u32 comp_status;
+	u32 dw[4];
+	u32 count;
+
+	for (i = 0; i < TLP_LOOP; i++) {
+		ctrl = cra_readl(pcie, S10_RP_RXCPL_STATUS);
+		if (!(ctrl & RP_RXCPL_SOP)) {
+			udelay(5);
+			continue;
+		}
+
+		/* Read first DW */
+		dw[0] = cra_readl(pcie, S10_RP_RXCPL_REG);
+		count = 1;
+
+		/* Poll for EOP */
+		for (i = 0; i < TLP_LOOP && count < ARRAY_SIZE(dw); i++) {
+			ctrl = cra_readl(pcie, S10_RP_RXCPL_STATUS);
+			dw[count++] = cra_readl(pcie, S10_RP_RXCPL_REG);
+			if (ctrl & RP_RXCPL_EOP) {
+				comp_status = TLP_COMP_STATUS(dw[1]);
+				if (comp_status)
+					return PCIBIOS_DEVICE_NOT_FOUND;
+
+				if (value &&
+				    TLP_BYTE_COUNT(dw[1]) == sizeof(u32) &&
+				    count == 4)
+					*value = dw[3];
+
+				return PCIBIOS_SUCCESSFUL;
+			}
+		}
+	}
+
+	return PCIBIOS_DEVICE_NOT_FOUND;
+}
+
 static void tlp_write_packet(struct altera_pcie *pcie, u32 *headers,
 			     u32 data, bool align)
 {
@@ -210,6 +306,15 @@ static void tlp_write_packet(struct altera_pcie *pcie, u32 *headers,
 	tlp_write_tx(pcie, &tlp_rp_regdata);
 }
 
+static void s10_tlp_write_packet(struct altera_pcie *pcie, u32 *headers,
+				 u32 data, bool dummy)
+{
+	s10_tlp_write_tx(pcie, headers[0], RP_TX_SOP);
+	s10_tlp_write_tx(pcie, headers[1], 0);
+	s10_tlp_write_tx(pcie, headers[2], 0);
+	s10_tlp_write_tx(pcie, data, RP_TX_EOP);
+}
+
 static int tlp_cfg_dword_read(struct altera_pcie *pcie, u8 bus, u32 devfn,
 			      int where, u8 byte_en, u32 *value)
 {
@@ -219,9 +324,9 @@ static int tlp_cfg_dword_read(struct altera_pcie *pcie, u8 bus, u32 devfn,
 	headers[1] = TLP_CFG_DW1(pcie, TLP_READ_TAG, byte_en);
 	headers[2] = TLP_CFG_DW2(bus, devfn, where);
 
-	tlp_write_packet(pcie, headers, 0, false);
+	pcie->pcie_data->ops->tlp_write_pkt(pcie, headers, 0, false);
 
-	return tlp_read_packet(pcie, value);
+	return pcie->pcie_data->ops->tlp_read_pkt(pcie, value);
 }
 
 static int tlp_cfg_dword_write(struct altera_pcie *pcie, u8 bus, u32 devfn,
@@ -236,11 +341,13 @@ static int tlp_cfg_dword_write(struct altera_pcie *pcie, u8 bus, u32 devfn,
 
 	/* check alignment to Qword */
 	if ((where & 0x7) == 0)
-		tlp_write_packet(pcie, headers, value, true);
+		pcie->pcie_data->ops->tlp_write_pkt(pcie, headers,
+						    value, true);
 	else
-		tlp_write_packet(pcie, headers, value, false);
+		pcie->pcie_data->ops->tlp_write_pkt(pcie, headers,
+						    value, false);
 
-	ret = tlp_read_packet(pcie, NULL);
+	ret = pcie->pcie_data->ops->tlp_read_pkt(pcie, NULL);
 	if (ret != PCIBIOS_SUCCESSFUL)
 		return ret;
 
@@ -254,6 +361,53 @@ static int tlp_cfg_dword_write(struct altera_pcie *pcie, u8 bus, u32 devfn,
 	return PCIBIOS_SUCCESSFUL;
 }
 
+static int s10_rp_read_cfg(struct altera_pcie *pcie, int where,
+			   int size, u32 *value)
+{
+	void *addr = S10_RP_CFG_ADDR(pcie, where);
+
+	switch (size) {
+	case 1:
+		*value = readb(addr);
+		break;
+	case 2:
+		*value = readw(addr);
+		break;
+	default:
+		*value = readl(addr);
+		break;
+	}
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
+static int s10_rp_write_cfg(struct altera_pcie *pcie, u8 busno,
+			    int where, int size, u32 value)
+{
+	void *addr = S10_RP_CFG_ADDR(pcie, where);
+
+	switch (size) {
+	case 1:
+		writeb(value, addr);
+		break;
+	case 2:
+		writew(value, addr);
+		break;
+	default:
+		writel(value, addr);
+		break;
+	}
+
+	/*
+	 * Monitor changes to PCI_PRIMARY_BUS register on root port
+	 * and update local copy of root bus number accordingly.
+	 */
+	if (busno == pcie->root_bus_nr && where == PCI_PRIMARY_BUS)
+		pcie->root_bus_nr = value & 0xff;
+
+	return PCIBIOS_SUCCESSFUL;
+}
+
 static int _altera_pcie_cfg_read(struct altera_pcie *pcie, u8 busno,
 				 unsigned int devfn, int where, int size,
 				 u32 *value)
@@ -262,6 +416,10 @@ static int _altera_pcie_cfg_read(struct altera_pcie *pcie, u8 busno,
 	u32 data;
 	u8 byte_en;
 
+	if (busno == pcie->root_bus_nr && pcie->pcie_data->ops->rp_read_cfg)
+		return pcie->pcie_data->ops->rp_read_cfg(pcie, where,
+							 size, value);
+
 	switch (size) {
 	case 1:
 		byte_en = 1 << (where & 3);
@@ -302,6 +460,10 @@ static int _altera_pcie_cfg_write(struct altera_pcie *pcie, u8 busno,
 	u32 shift = 8 * (where & 3);
 	u8 byte_en;
 
+	if (busno == pcie->root_bus_nr && pcie->pcie_data->ops->rp_write_cfg)
+		return pcie->pcie_data->ops->rp_write_cfg(pcie, busno,
+						     where, size, value);
+
 	switch (size) {
 	case 1:
 		data32 = (value & 0xff) << shift;
@@ -365,7 +527,8 @@ static int altera_read_cap_word(struct altera_pcie *pcie, u8 busno,
 	int ret;
 
 	ret = _altera_pcie_cfg_read(pcie, busno, devfn,
-				    PCIE_CAP_OFFSET + offset, sizeof(*value),
+				    pcie->pcie_data->cap_offset + offset,
+				    sizeof(*value),
 				    &data);
 	*value = data;
 	return ret;
@@ -375,7 +538,8 @@ static int altera_write_cap_word(struct altera_pcie *pcie, u8 busno,
 				 unsigned int devfn, int offset, u16 value)
 {
 	return _altera_pcie_cfg_write(pcie, busno, devfn,
-				      PCIE_CAP_OFFSET + offset, sizeof(value),
+				      pcie->pcie_data->cap_offset + offset,
+				      sizeof(value),
 				      value);
 }
 
@@ -403,7 +567,7 @@ static void altera_wait_link_retrain(struct altera_pcie *pcie)
 	/* Wait for link is up */
 	start_jiffies = jiffies;
 	for (;;) {
-		if (altera_pcie_link_up(pcie))
+		if (pcie->pcie_data->ops->get_link_status(pcie))
 			break;
 
 		if (time_after(jiffies, start_jiffies + LINK_UP_TIMEOUT)) {
@@ -418,7 +582,7 @@ static void altera_pcie_retrain(struct altera_pcie *pcie)
 {
 	u16 linkcap, linkstat, linkctl;
 
-	if (!altera_pcie_link_up(pcie))
+	if (!pcie->pcie_data->ops->get_link_status(pcie))
 		return;
 
 	/*
@@ -540,12 +704,20 @@ static int altera_pcie_parse_dt(struct altera_pcie *pcie)
 	struct device *dev = &pcie->pdev->dev;
 	struct platform_device *pdev = pcie->pdev;
 	struct resource *cra;
+	struct resource *hip;
 
 	cra = platform_get_resource_byname(pdev, IORESOURCE_MEM, "Cra");
 	pcie->cra_base = devm_ioremap_resource(dev, cra);
 	if (IS_ERR(pcie->cra_base))
 		return PTR_ERR(pcie->cra_base);
 
+	if (pcie->pcie_data->version == ALTERA_PCIE_V2) {
+		hip = platform_get_resource_byname(pdev, IORESOURCE_MEM, "Hip");
+		pcie->hip_base = devm_ioremap_resource(&pdev->dev, hip);
+		if (IS_ERR(pcie->hip_base))
+			return PTR_ERR(pcie->hip_base);
+	}
+
 	/* setup IRQ */
 	pcie->irq = platform_get_irq(pdev, 0);
 	if (pcie->irq < 0) {
@@ -562,6 +734,48 @@ static void altera_pcie_host_init(struct altera_pcie *pcie)
 	altera_pcie_retrain(pcie);
 }
 
+static const struct altera_pcie_ops altera_pcie_ops_1_0 = {
+	.tlp_read_pkt = tlp_read_packet,
+	.tlp_write_pkt = tlp_write_packet,
+	.get_link_status = altera_pcie_link_up,
+};
+
+static const struct altera_pcie_ops altera_pcie_ops_2_0 = {
+	.tlp_read_pkt = s10_tlp_read_packet,
+	.tlp_write_pkt = s10_tlp_write_packet,
+	.get_link_status = s10_altera_pcie_link_up,
+	.rp_read_cfg = s10_rp_read_cfg,
+	.rp_write_cfg = s10_rp_write_cfg,
+};
+
+static const struct altera_pcie_data altera_pcie_1_0_data = {
+	.ops = &altera_pcie_ops_1_0,
+	.cap_offset = 0x80,
+	.version = ALTERA_PCIE_V1,
+	.cfgrd0 = TLP_FMTTYPE_CFGRD0,
+	.cfgrd1 = TLP_FMTTYPE_CFGRD1,
+	.cfgwr0 = TLP_FMTTYPE_CFGWR0,
+	.cfgwr1 = TLP_FMTTYPE_CFGWR1,
+};
+
+static const struct altera_pcie_data altera_pcie_2_0_data = {
+	.ops = &altera_pcie_ops_2_0,
+	.version = ALTERA_PCIE_V2,
+	.cap_offset = 0x70,
+	.cfgrd0 = S10_TLP_FMTTYPE_CFGRD0,
+	.cfgrd1 = S10_TLP_FMTTYPE_CFGRD1,
+	.cfgwr0 = S10_TLP_FMTTYPE_CFGWR0,
+	.cfgwr1 = S10_TLP_FMTTYPE_CFGWR1,
+};
+
+static const struct of_device_id altera_pcie_of_match[] = {
+	{.compatible = "altr,pcie-root-port-1.0",
+	 .data = &altera_pcie_1_0_data },
+	{.compatible = "altr,pcie-root-port-2.0",
+	 .data = &altera_pcie_2_0_data },
+	{},
+};
+
 static int altera_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -570,6 +784,7 @@ static int altera_pcie_probe(struct platform_device *pdev)
 	struct pci_bus *child;
 	struct pci_host_bridge *bridge;
 	int ret;
+	const struct of_device_id *match;
 
 	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
 	if (!bridge)
@@ -578,6 +793,12 @@ static int altera_pcie_probe(struct platform_device *pdev)
 	pcie = pci_host_bridge_priv(bridge);
 	pcie->pdev = pdev;
 
+	match = of_match_device(altera_pcie_of_match, &pdev->dev);
+	if (!match)
+		return -ENODEV;
+
+	pcie->pcie_data = match->data;
+
 	ret = altera_pcie_parse_dt(pcie);
 	if (ret) {
 		dev_err(dev, "Parsing DT failed\n");
@@ -628,11 +849,6 @@ static int altera_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static const struct of_device_id altera_pcie_of_match[] = {
-	{ .compatible = "altr,pcie-root-port-1.0", },
-	{},
-};
-
 static struct platform_driver altera_pcie_driver = {
 	.probe		= altera_pcie_probe,
 	.driver = {
-- 
2.19.0

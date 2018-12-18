From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v3 3/3] PCI: imx6: Add support for i.MX8MQ
Date: Mon, 17 Dec 2018 20:07:02 -0800
Message-ID: <20181218040702.29231-4-andrew.smirnov@gmail.com>
References: <20181218040702.29231-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181218040702.29231-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add code needed to support i.MX8MQ variant.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Leonard Crestez <leonard.crestez@nxp.com>
Cc: "A.s. Dong" <aisheng.dong@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-imx@nxp.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
---
 .../bindings/pci/fsl,imx6q-pcie.txt           |  6 +-
 drivers/pci/controller/dwc/Kconfig            |  4 +-
 drivers/pci/controller/dwc/pci-imx6.c         | 82 ++++++++++++++++++-
 3 files changed, 87 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
index d514c1f2365f..1a10c313e8d7 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.txt
@@ -9,6 +9,7 @@ Required properties:
 	- "fsl,imx6sx-pcie",
 	- "fsl,imx6qp-pcie"
 	- "fsl,imx7d-pcie"
+	- "fsl,imx8mq-pcie"
 - reg: base address and length of the PCIe controller
 - interrupts: A list of interrupt outputs of the controller. Must contain an
   entry for each entry in the interrupt-names property.
@@ -45,7 +46,7 @@ Additional required properties for imx6sx-pcie:
   PCIE_PHY power domains
 - power-domain-names: Must be "pcie", "pcie_phy"
 
-Additional required properties for imx7d-pcie:
+Additional required properties for imx7d-pcie and imx8mq-pcie:
 - power-domains: Must be set to a phandle pointing to PCIE_PHY power domain
 - resets: Must contain phandles to PCIe-related reset lines exposed by SRC
   IP block
@@ -54,6 +55,9 @@ Additional required properties for imx7d-pcie:
 	       - "apps"
 	       - "turnoff"
 
+Additional required properties for imx8mq-pcie:
+- fsl,controller-id: Logical ID of a given PCIE controller. PCIE1 is 0, PCIE2 is 1;
+
 Example:
 
 	pcie@01000000 {
diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 6aafec3fad00..83ea318ad989 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -89,8 +89,8 @@ config PCI_EXYNOS
 	select PCIE_DW_HOST
 
 config PCI_IMX6
-	bool "Freescale i.MX6/7 PCIe controller"
-	depends on SOC_IMX6Q || SOC_IMX7D || (ARM && COMPILE_TEST)
+	bool "Freescale i.MX6/7/8 PCIe controller"
+	depends on SOC_IMX6Q || SOC_IMX7D || (ARM64 && ARCH_MXC) || ((ARM || ARM64) && COMPILE_TEST)
 	depends on PCI_MSI_IRQ_DOMAIN
 	select PCIE_DW_HOST
 
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index caa05104b90b..d71680920155 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -8,6 +8,7 @@
  * Author: Sean Cross <xobs@kosagi.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
@@ -32,6 +33,11 @@
 
 #include "pcie-designware.h"
 
+#define IMX8MQ_GPR_PCIE_REF_USE_PAD		BIT(9)
+#define IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN	BIT(10)
+#define IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE	BIT(11)
+#define IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE	GENMASK(11, 8)
+
 #define to_imx6_pcie(x)	dev_get_drvdata((x)->dev)
 
 enum imx6_pcie_variants {
@@ -39,6 +45,7 @@ enum imx6_pcie_variants {
 	IMX6SX,
 	IMX6QP,
 	IMX7D,
+	IMX8MQ,
 };
 
 #define IMX6_PCIE_FLAG_IMX6_PHY		BIT(0)
@@ -57,6 +64,7 @@ struct imx6_pcie {
 	struct clk		*pcie_inbound_axi;
 	struct clk		*pcie;
 	struct regmap		*iomuxc_gpr;
+	u32			controller_id;
 	struct reset_control	*pciephy_reset;
 	struct reset_control	*apps_reset;
 	struct reset_control	*turnoff_reset;
@@ -275,6 +283,7 @@ static void imx6_pcie_reset_phy(struct imx6_pcie *imx6_pcie)
 	pcie_phy_write(imx6_pcie, PHY_RX_OVRD_IN_LO, tmp);
 }
 
+#ifdef CONFIG_ARM
 /*  Added for PCI abort handling */
 static int imx6q_pcie_abort_handler(unsigned long addr,
 		unsigned int fsr, struct pt_regs *regs)
@@ -308,6 +317,7 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
 
 	return 1;
 }
+#endif
 
 static int imx6_pcie_attach_pd(struct device *dev)
 {
@@ -352,6 +362,7 @@ static void imx6_pcie_assert_core_reset(struct imx6_pcie *imx6_pcie)
 
 	switch (imx6_pcie->drvdata->variant) {
 	case IMX7D:
+	case IMX8MQ:
 		reset_control_assert(imx6_pcie->pciephy_reset);
 		reset_control_assert(imx6_pcie->apps_reset);
 		break;
@@ -390,6 +401,7 @@ static int imx6_pcie_enable_ref_clk(struct imx6_pcie *imx6_pcie)
 {
 	struct dw_pcie *pci = imx6_pcie->pci;
 	struct device *dev = pci->dev;
+	unsigned int offset;
 	int ret = 0;
 
 	switch (imx6_pcie->drvdata->variant) {
@@ -420,6 +432,29 @@ static int imx6_pcie_enable_ref_clk(struct imx6_pcie *imx6_pcie)
 		break;
 	case IMX7D:
 		break;
+	case IMX8MQ:
+		switch (imx6_pcie->controller_id) {
+		case 0:
+			offset = IOMUXC_GPR14;
+			break;
+		case 1:
+			offset = IOMUXC_GPR16;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		/*
+		 * Set the over ride low and enabled
+		 * make sure that REF_CLK is turned on.
+		 */
+		regmap_update_bits(imx6_pcie->iomuxc_gpr, offset,
+				   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE,
+				   0);
+		regmap_update_bits(imx6_pcie->iomuxc_gpr, offset,
+				   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN,
+				   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN);
+		break;
 	}
 
 	return ret;
@@ -496,6 +531,9 @@ static void imx6_pcie_deassert_core_reset(struct imx6_pcie *imx6_pcie)
 	}
 
 	switch (imx6_pcie->drvdata->variant) {
+	case IMX8MQ:
+		reset_control_deassert(imx6_pcie->pciephy_reset);
+		break;
 	case IMX7D:
 		reset_control_deassert(imx6_pcie->pciephy_reset);
 		imx7d_pcie_wait_for_phy_pll_lock(imx6_pcie);
@@ -533,7 +571,36 @@ static void imx6_pcie_deassert_core_reset(struct imx6_pcie *imx6_pcie)
 
 static void imx6_pcie_init_phy(struct imx6_pcie *imx6_pcie)
 {
+
+
+	unsigned int mask, val, offset;
+
+	mask = IMX6Q_GPR12_DEVICE_TYPE;
+	val  = FIELD_PREP(IMX6Q_GPR12_DEVICE_TYPE, PCI_EXP_TYPE_ROOT_PORT);
+
 	switch (imx6_pcie->drvdata->variant) {
+	case IMX8MQ:
+		switch (imx6_pcie->controller_id) {
+		case 0:
+			offset = IOMUXC_GPR14;
+			break;
+		case 1:
+			offset = IOMUXC_GPR16;
+			mask = IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE;
+			val  = FIELD_PREP(IMX8MQ_GPR12_PCIE2_CTRL_DEVICE_TYPE,
+					  PCI_EXP_TYPE_ROOT_PORT);
+			break;
+		default:
+			return;
+		}
+		/*
+		 * TODO: Currently this code assumes external
+		 * oscillator is being used
+		 */
+		regmap_update_bits(imx6_pcie->iomuxc_gpr, offset,
+				   IMX8MQ_GPR_PCIE_REF_USE_PAD,
+				   IMX8MQ_GPR_PCIE_REF_USE_PAD);
+		break;
 	case IMX7D:
 		regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
 				   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL, 0);
@@ -569,8 +636,7 @@ static void imx6_pcie_init_phy(struct imx6_pcie *imx6_pcie)
 		break;
 	}
 
-	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12,
-			IMX6Q_GPR12_DEVICE_TYPE, PCI_EXP_TYPE_ROOT_PORT << 12);
+	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR12, mask, val);
 }
 
 static int imx6_setup_phy_mpll(struct imx6_pcie *imx6_pcie)
@@ -667,6 +733,7 @@ static void imx6_pcie_ltssm_enable(struct device *dev)
 				   IMX6Q_GPR12_PCIE_CTL_2);
 		break;
 	case IMX7D:
+	case IMX8MQ:
 		reset_control_deassert(imx6_pcie->apps_reset);
 		break;
 	}
@@ -954,6 +1021,10 @@ static int imx6_pcie_probe(struct platform_device *pdev)
 	imx6_pcie->pci = pci;
 	imx6_pcie->drvdata = of_device_get_match_data(dev);
 
+	if (of_property_read_u32(node, "fsl,controller-id",
+				 &imx6_pcie->controller_id))
+		imx6_pcie->controller_id = 0;
+
 	dbi_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pci->dbi_base = devm_ioremap_resource(dev, dbi_base);
 	if (IS_ERR(pci->dbi_base))
@@ -1006,6 +1077,7 @@ static int imx6_pcie_probe(struct platform_device *pdev)
 		}
 		break;
 	case IMX7D:
+	case IMX8MQ:
 		imx6_pcie->pciephy_reset = devm_reset_control_get_exclusive(dev,
 									    "pciephy");
 		if (IS_ERR(imx6_pcie->pciephy_reset)) {
@@ -1110,6 +1182,9 @@ static const struct imx6_pcie_drvdata drvdata[] = {
 	[IMX7D] = {
 		.variant = IMX7D,
 	},
+	[IMX8MQ] = {
+		.variant = IMX8MQ,
+	},
 };
 
 static const struct of_device_id imx6_pcie_of_match[] = {
@@ -1117,6 +1192,7 @@ static const struct of_device_id imx6_pcie_of_match[] = {
 	{ .compatible = "fsl,imx6sx-pcie", .data = &drvdata[IMX6SX], },
 	{ .compatible = "fsl,imx6qp-pcie", .data = &drvdata[IMX6QP], },
 	{ .compatible = "fsl,imx7d-pcie",  .data = &drvdata[IMX7D],  },
+	{ .compatible = "fsl,imx8mq-pcie", .data = &drvdata[IMX8MQ], },
 	{},
 };
 
@@ -1133,6 +1209,7 @@ static struct platform_driver imx6_pcie_driver = {
 
 static int __init imx6_pcie_init(void)
 {
+#ifdef CONFIG_ARM
 	/*
 	 * Since probe() can be deferred we need to make sure that
 	 * hook_fault_code is not called after __init memory is freed
@@ -1142,6 +1219,7 @@ static int __init imx6_pcie_init(void)
 	 */
 	hook_fault_code(8, imx6q_pcie_abort_handler, SIGBUS, 0,
 			"external abort on non-linefetch");
+#endif
 
 	return platform_driver_register(&imx6_pcie_driver);
 }
-- 
2.19.1

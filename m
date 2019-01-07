From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 2/2] phy: bcm-ns-usb2: support updated DT binding with the CRU syscon
Date: Mon,  7 Jan 2019 09:25:45 +0100
Message-ID: <20190107082545.5529-2-zajec5@gmail.com>
References: <20190107082545.5529-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107082545.5529-1-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This adds support for the "syscon-cru" DT property which simply requires
using regmap to access CRU registers.

The old binding has been deprecated and stays as a fallback method.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/phy/broadcom/phy-bcm-ns-usb2.c | 44 +++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/broadcom/phy-bcm-ns-usb2.c b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
index 58dff80e9386..8dc6835b941c 100644
--- a/drivers/phy/broadcom/phy-bcm-ns-usb2.c
+++ b/drivers/phy/broadcom/phy-bcm-ns-usb2.c
@@ -13,17 +13,23 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
+#include <linux/regmap.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
+#define CRU_USB2_CONTROL			0x64
+#define CRU_CLKSET_KEY				0x80
+
 struct bcm_ns_usb2 {
 	struct device *dev;
 	struct clk *ref_clk;
 	struct phy *phy;
+	struct regmap *cru;
 	void __iomem *dmu;
 };
 
@@ -31,6 +37,7 @@ static int bcm_ns_usb2_phy_init(struct phy *phy)
 {
 	struct bcm_ns_usb2 *usb2 = phy_get_drvdata(phy);
 	struct device *dev = usb2->dev;
+	struct regmap *cru = usb2->cru;
 	void __iomem *dmu = usb2->dmu;
 	u32 ref_clk_rate, usb2ctl, usb_pll_ndiv, usb_pll_pdiv;
 	int err = 0;
@@ -48,7 +55,10 @@ static int bcm_ns_usb2_phy_init(struct phy *phy)
 		goto err_clk_off;
 	}
 
-	usb2ctl = readl(dmu + BCMA_DMU_CRU_USB2_CONTROL);
+	if (cru)
+		regmap_read(cru, CRU_USB2_CONTROL, &usb2ctl);
+	else
+		usb2ctl = readl(dmu + BCMA_DMU_CRU_USB2_CONTROL);
 
 	if (usb2ctl & BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_PDIV_MASK) {
 		usb_pll_pdiv = usb2ctl;
@@ -62,15 +72,24 @@ static int bcm_ns_usb2_phy_init(struct phy *phy)
 	usb_pll_ndiv = (1920000000 * usb_pll_pdiv) / ref_clk_rate;
 
 	/* Unlock DMU PLL settings with some magic value */
-	writel(0x0000ea68, dmu + BCMA_DMU_CRU_CLKSET_KEY);
+	if (cru)
+		regmap_write(cru, CRU_CLKSET_KEY, 0x0000ea68);
+	else
+		writel(0x0000ea68, dmu + BCMA_DMU_CRU_CLKSET_KEY);
 
 	/* Write USB 2.0 PLL control setting */
 	usb2ctl &= ~BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_NDIV_MASK;
 	usb2ctl |= usb_pll_ndiv << BCMA_DMU_CRU_USB2_CONTROL_USB_PLL_NDIV_SHIFT;
-	writel(usb2ctl, dmu + BCMA_DMU_CRU_USB2_CONTROL);
+	if (cru)
+		regmap_write(cru, CRU_USB2_CONTROL, usb2ctl);
+	else
+		writel(usb2ctl, dmu + BCMA_DMU_CRU_USB2_CONTROL);
 
 	/* Lock DMU PLL settings */
-	writel(0x00000000, dmu + BCMA_DMU_CRU_CLKSET_KEY);
+	if (cru)
+		regmap_write(cru, CRU_CLKSET_KEY, 0x00000000);
+	else
+		writel(0x00000000, dmu + BCMA_DMU_CRU_CLKSET_KEY);
 
 err_clk_off:
 	clk_disable_unprepare(usb2->ref_clk);
@@ -86,6 +105,7 @@ static const struct phy_ops ops = {
 static int bcm_ns_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *cru_np;
 	struct bcm_ns_usb2 *usb2;
 	struct resource *res;
 	struct phy_provider *phy_provider;
@@ -95,11 +115,17 @@ static int bcm_ns_usb2_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	usb2->dev = dev;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dmu");
-	usb2->dmu = devm_ioremap_resource(dev, res);
-	if (IS_ERR(usb2->dmu)) {
-		dev_err(dev, "Failed to map DMU regs\n");
-		return PTR_ERR(usb2->dmu);
+	cru_np = of_parse_phandle(dev->of_node, "syscon-cru", 0);
+	usb2->cru = syscon_node_to_regmap(cru_np);
+	if (IS_ERR(usb2->cru)) {
+		usb2->cru = NULL;
+
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dmu");
+		usb2->dmu = devm_ioremap_resource(dev, res);
+		if (IS_ERR(usb2->dmu)) {
+			dev_err(dev, "Failed to map DMU regs\n");
+			return PTR_ERR(usb2->dmu);
+		}
 	}
 
 	usb2->ref_clk = devm_clk_get(dev, "phy-ref-clk");
-- 
2.13.7

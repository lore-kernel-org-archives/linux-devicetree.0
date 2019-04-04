From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 2/2] phy: fsl-imx8mq-usb: add support for VBUS power control
Date: Thu,  4 Apr 2019 18:41:48 +0200
Message-ID: <20190404164148.11140-2-l.stach@pengutronix.de>
References: <20190404164148.11140-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190404164148.11140-1-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Li Jun <jun.li@nxp.com>
List-Id: devicetree@vger.kernel.org

This adds support to the PHY driver to power up/down the VBUS
voltage rail at the appropriate times.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index d6ea5ce8afa5..0a3e88e37ab5 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 
 #define PHY_CTRL0			0x0
 #define PHY_CTRL0_REF_SSP_EN		BIT(2)
@@ -24,6 +25,7 @@ struct imx8mq_usb_phy {
 	struct phy *phy;
 	struct clk *clk;
 	void __iomem *base;
+	struct regulator *vbus;
 };
 
 static int imx8mq_usb_phy_init(struct phy *phy)
@@ -55,6 +57,11 @@ static int imx8mq_usb_phy_init(struct phy *phy)
 static int imx8mq_phy_power_on(struct phy *phy)
 {
 	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = regulator_enable(imx_phy->vbus);
+	if (ret)
+		return ret;
 
 	return clk_prepare_enable(imx_phy->clk);
 }
@@ -64,6 +71,7 @@ static int imx8mq_phy_power_off(struct phy *phy)
 	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
 
 	clk_disable_unprepare(imx_phy->clk);
+	regulator_disable(imx_phy->vbus);
 
 	return 0;
 }
@@ -101,6 +109,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->phy))
 		return PTR_ERR(imx_phy->phy);
 
+	imx_phy->vbus = devm_regulator_get(dev, "vbus");
+	if (IS_ERR(imx_phy->vbus))
+		return PTR_ERR(imx_phy->vbus);
+
+
 	phy_set_drvdata(imx_phy->phy, imx_phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-- 
2.20.1

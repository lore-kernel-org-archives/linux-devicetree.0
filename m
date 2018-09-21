From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/8] phy: renesas: rcar-gen3-usb2: Check a property to use otg pins
Date: Fri, 21 Sep 2018 20:53:20 +0900
Message-ID: <1537530804-19399-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Since All R-Car Gen3 SoCs have dedicated otg pins actually but
some boards don't use the otg pins (e.g. R-Car D3 Draak and R-Car E3
Ebisu), the driver should not choose SoC model base by using
rcar_gen3_phy_usb2_match_table's data. So, this patch checks a
"renesas,no-otg-pins" property to set the "uses_otg_pins".

Note that since r8a77995-draak.dts and r8a77990-ebisu.dts don't have
'dr_mode = "otg";' for now, if we apply this patch, no behavior
changes (the value of "uses_otg_pins" is false).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d69317e..856056e 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -78,8 +78,6 @@
 #define USB2_ADPCTRL_IDPULLUP		BIT(5)	/* 1 = ID sampling is enabled */
 #define USB2_ADPCTRL_DRVVBUS		BIT(4)
 
-#define RCAR_GEN3_PHY_HAS_DEDICATED_PINS	1
-
 struct rcar_gen3_chan {
 	void __iomem *base;
 	struct extcon_dev *extcon;
@@ -385,21 +383,10 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 }
 
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
-	{
-		.compatible = "renesas,usb2-phy-r8a7795",
-		.data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
-	},
-	{
-		.compatible = "renesas,usb2-phy-r8a7796",
-		.data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
-	},
-	{
-		.compatible = "renesas,usb2-phy-r8a77965",
-		.data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
-	},
-	{
-		.compatible = "renesas,rcar-gen3-usb2-phy",
-	},
+	{ .compatible = "renesas,usb2-phy-r8a7795" },
+	{ .compatible = "renesas,usb2-phy-r8a7796" },
+	{ .compatible = "renesas,usb2-phy-r8a77965" },
+	{ .compatible = "renesas,rcar-gen3-usb2-phy" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb2_match_table);
@@ -445,7 +432,8 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (of_usb_get_dr_mode_by_phy(dev->of_node, 0) == USB_DR_MODE_OTG) {
 		int ret;
 
-		channel->uses_otg_pins = (uintptr_t)of_device_get_match_data(dev);
+		channel->uses_otg_pins = !of_property_read_bool(dev->of_node,
+							"renesas,no-otg-pins");
 		channel->extcon = devm_extcon_dev_allocate(dev,
 							rcar_gen3_phy_cable);
 		if (IS_ERR(channel->extcon))
-- 
1.9.1

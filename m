From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 3/4] phy: rcar-gen3-usb2: add SoC-specific parameter for dedicated pins
Date: Tue, 10 Oct 2017 14:58:29 +0900
Message-ID: <1507615110-26206-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1507615110-26206-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507615110-26206-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch adds SoC-specific parameter to avoid reading/writing
specific registers wrongly if this driver runs on a SoC which doesn't
have dedicated pins (e.g. R-Car D3). This patch also changes the
value "has_otg" to "has_otg_pins" for slightly easier reading of
the code.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 7619468..d097539 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -80,6 +81,8 @@
 #define USB2_ADPCTRL_IDPULLUP		BIT(5)	/* 1 = ID sampling is enabled */
 #define USB2_ADPCTRL_DRVVBUS		BIT(4)
 
+#define RCAR_GEN3_PHY_HAS_DEDICATED_PINS	1
+
 struct rcar_gen3_chan {
 	void __iomem *base;
 	struct extcon_dev *extcon;
@@ -87,7 +90,7 @@ struct rcar_gen3_chan {
 	struct regulator *vbus;
 	struct work_struct work;
 	bool extcon_host;
-	bool has_otg;
+	bool has_otg_pins;
 };
 
 static void rcar_gen3_phy_usb2_work(struct work_struct *work)
@@ -268,7 +271,7 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 	else
 		return -EINVAL;
 
-	if (ch->has_otg)
+	if (ch->has_otg_pins)
 		ret = rcar_gen3_otg_change_role(ch, mode);
 
 	if (ret < 0)
@@ -286,7 +289,7 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 	if (!ch->phy->init_count)
 		return -EIO;
 
-	if (ch->has_otg)
+	if (ch->has_otg_pins)
 		is_host = rcar_gen3_is_host(ch);
 	else
 		return -EIO;
@@ -326,7 +329,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
 
 	/* Initialize otg part */
-	if (channel->has_otg)
+	if (channel->has_otg_pins)
 		rcar_gen3_init_otg(channel);
 
 	return 0;
@@ -400,9 +403,17 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 }
 
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
-	{ .compatible = "renesas,usb2-phy-r8a7795" },
-	{ .compatible = "renesas,usb2-phy-r8a7796" },
-	{ .compatible = "renesas,rcar-gen3-usb2-phy" },
+	{
+		.compatible = "renesas,usb2-phy-r8a7795",
+		.data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
+	},
+	{
+		.compatible = "renesas,usb2-phy-r8a7796",
+		.data = (void *)RCAR_GEN3_PHY_HAS_DEDICATED_PINS,
+	},
+	{
+		.compatible = "renesas,rcar-gen3-usb2-phy",
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rcar_gen3_phy_usb2_match_table);
@@ -448,7 +459,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (of_usb_get_dr_mode_by_phy(dev->of_node, 0) == USB_DR_MODE_OTG) {
 		int ret;
 
-		channel->has_otg = true;
+		channel->has_otg_pins = (uintptr_t)of_device_get_match_data(dev);
 		channel->extcon = devm_extcon_dev_allocate(dev,
 							rcar_gen3_phy_cable);
 		if (IS_ERR(channel->extcon))
@@ -490,7 +501,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed to register PHY provider\n");
 		ret = PTR_ERR(provider);
 		goto error;
-	} else if (channel->has_otg) {
+	} else if (channel->has_otg_pins) {
 		int ret;
 
 		ret = device_create_file(dev, &dev_attr_role);
@@ -510,7 +521,7 @@ static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 {
 	struct rcar_gen3_chan *channel = platform_get_drvdata(pdev);
 
-	if (channel->has_otg)
+	if (channel->has_otg_pins)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
 	pm_runtime_disable(&pdev->dev);
-- 
1.9.1

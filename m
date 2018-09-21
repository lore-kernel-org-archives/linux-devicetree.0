From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/8] phy: renesas: rcar-gen3-usb2: Rename has_otg_pins to uses_otg_pins
Date: Fri, 21 Sep 2018 20:53:19 +0900
Message-ID: <1537530804-19399-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Since R-Car E3 and D3 have dedicated otg pins actually, "has_otg_pins"
is possible to misread in the future. So, this patch renames
has_otg_pins to uses_otg_pins.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index a6db25c..d69317e 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -87,7 +87,7 @@ struct rcar_gen3_chan {
 	struct regulator *vbus;
 	struct work_struct work;
 	bool extcon_host;
-	bool has_otg_pins;
+	bool uses_otg_pins;
 };
 
 static void rcar_gen3_phy_usb2_work(struct work_struct *work)
@@ -234,7 +234,7 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 	bool is_b_device;
 	enum phy_mode cur_mode, new_mode;
 
-	if (!ch->has_otg_pins || !ch->phy->init_count)
+	if (!ch->uses_otg_pins || !ch->phy->init_count)
 		return -EIO;
 
 	if (!strncmp(buf, "host", strlen("host")))
@@ -272,7 +272,7 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 {
 	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
 
-	if (!ch->has_otg_pins || !ch->phy->init_count)
+	if (!ch->uses_otg_pins || !ch->phy->init_count)
 		return -EIO;
 
 	return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
@@ -311,7 +311,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
 
 	/* Initialize otg part */
-	if (channel->has_otg_pins)
+	if (channel->uses_otg_pins)
 		rcar_gen3_init_otg(channel);
 
 	return 0;
@@ -445,7 +445,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (of_usb_get_dr_mode_by_phy(dev->of_node, 0) == USB_DR_MODE_OTG) {
 		int ret;
 
-		channel->has_otg_pins = (uintptr_t)of_device_get_match_data(dev);
+		channel->uses_otg_pins = (uintptr_t)of_device_get_match_data(dev);
 		channel->extcon = devm_extcon_dev_allocate(dev,
 							rcar_gen3_phy_cable);
 		if (IS_ERR(channel->extcon))
@@ -487,7 +487,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed to register PHY provider\n");
 		ret = PTR_ERR(provider);
 		goto error;
-	} else if (channel->has_otg_pins) {
+	} else if (channel->uses_otg_pins) {
 		int ret;
 
 		ret = device_create_file(dev, &dev_attr_role);
@@ -507,7 +507,7 @@ static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 {
 	struct rcar_gen3_chan *channel = platform_get_drvdata(pdev);
 
-	if (channel->has_otg_pins)
+	if (channel->uses_otg_pins)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
 	pm_runtime_disable(&pdev->dev);
-- 
1.9.1

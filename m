From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 8/8] phy: renesas: rcar-gen3-usb2: add is_otg_channel to use "role" sysfs
Date: Fri, 21 Sep 2018 20:53:24 +0900
Message-ID: <1537530804-19399-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537530804-19399-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Even if a board doesn't have otg pins connection, this hardware can
change the role by a register setting. So, this patch adds
"is_otg_channel" for it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 3f2efe5..9903aef 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -86,8 +86,19 @@ struct rcar_gen3_chan {
 	struct work_struct work;
 	enum usb_dr_mode dr_mode;
 	bool extcon_host;
+	bool is_otg_channel;
 	bool uses_otg_pins;
 };
+/*
+ * Combination about is_otg_channel and uses_otg_pins:
+ *
+ * Parameters				|| Behaviors
+ * is_otg_channel	| uses_otg_pins	|| irqs		| role sysfs
+ * ---------------------+---------------++--------------+------------
+ * true			| true		|| enabled	| enabled
+ * true                 | false		|| disabled	| enabled
+ * false                | any		|| disabled	| disabled
+ */
 
 static void rcar_gen3_phy_usb2_work(struct work_struct *work)
 {
@@ -244,7 +255,7 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 	bool is_b_device;
 	enum phy_mode cur_mode, new_mode;
 
-	if (!ch->uses_otg_pins || !ch->phy->init_count)
+	if (!ch->is_otg_channel || !ch->phy->init_count)
 		return -EIO;
 
 	if (!strncmp(buf, "host", strlen("host")))
@@ -282,7 +293,7 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 {
 	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
 
-	if (!ch->uses_otg_pins || !ch->phy->init_count)
+	if (!ch->is_otg_channel || !ch->phy->init_count)
 		return -EIO;
 
 	return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
@@ -320,7 +331,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
 
 	/* Initialize otg part */
-	if (channel->uses_otg_pins)
+	if (channel->is_otg_channel)
 		rcar_gen3_init_otg(channel);
 
 	return 0;
@@ -444,6 +455,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (channel->dr_mode != USB_DR_MODE_UNKNOWN) {
 		int ret;
 
+		channel->is_otg_channel = true;
 		channel->uses_otg_pins = !of_property_read_bool(dev->of_node,
 							"renesas,no-otg-pins");
 		channel->extcon = devm_extcon_dev_allocate(dev,
@@ -487,7 +499,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed to register PHY provider\n");
 		ret = PTR_ERR(provider);
 		goto error;
-	} else if (channel->uses_otg_pins) {
+	} else if (channel->is_otg_channel) {
 		int ret;
 
 		ret = device_create_file(dev, &dev_attr_role);
@@ -507,7 +519,7 @@ static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 {
 	struct rcar_gen3_chan *channel = platform_get_drvdata(pdev);
 
-	if (channel->uses_otg_pins)
+	if (channel->is_otg_channel)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
 	pm_runtime_disable(&pdev->dev);
-- 
1.9.1

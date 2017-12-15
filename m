From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 5/6] phy: renesas: rcar-gen3-usb2: add rcar_gen3_role_swap_ops
Date: Fri, 15 Dec 2017 14:45:25 +0900
Message-ID: <1513316726-14387-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1513316726-14387-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1513316726-14387-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch add rcar_gen3_role_swap_ops to support other feature
(e.g. gpio handling) easily.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 51 +++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index b121f07..f470fb3 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -83,11 +83,23 @@
 
 #define RCAR_GEN3_PHY_HAS_DEDICATED_PINS	1
 
+struct rcar_gen3_chan;
+struct rcar_gen3_role_swap_ops {
+	void (*init)(struct rcar_gen3_chan *ch);
+	void (*set_host)(struct rcar_gen3_chan *ch, int host);
+	bool (*is_host)(struct rcar_gen3_chan *ch);
+	void (*set_vbus_ctrl)(struct rcar_gen3_chan *ch, int enable);
+	bool (*check_id)(struct rcar_gen3_chan *ch);
+	void (*control_irq)(struct rcar_gen3_chan *ch, int enable);
+	irqreturn_t (*irq_handler)(struct rcar_gen3_chan *ch);
+};
+
 struct rcar_gen3_chan {
 	void __iomem *base;
 	struct extcon_dev *extcon;
 	struct phy *phy;
 	struct regulator *vbus;
+	const struct rcar_gen3_role_swap_ops *rs_ops;
 	struct work_struct work;
 	bool extcon_host;
 	bool has_otg_pins;
@@ -203,17 +215,20 @@ static void rcar_gen3_phy_usb2_work(struct work_struct *work)
 
 static void rcar_gen3_set_host_mode(struct rcar_gen3_chan *ch, int host)
 {
-	has_otg_pins_set_host(ch, host);
+	if (ch->rs_ops && ch->rs_ops->set_host)
+		ch->rs_ops->set_host(ch, host);
 }
 
 static void rcar_gen3_set_vbus_ctrl(struct rcar_gen3_chan *ch, int enable)
 {
-	has_otg_pins_set_vbus_ctrl(ch, enable);
+	if (ch->rs_ops && ch->rs_ops->set_vbus_ctrl)
+		ch->rs_ops->set_vbus_ctrl(ch, enable);
 }
 
 static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
 {
-	has_otg_pins_control_irq(ch, enable);
+	if (ch->rs_ops && ch->rs_ops->control_irq)
+		ch->rs_ops->control_irq(ch, enable);
 }
 
 static void rcar_gen3_init_for_host(struct rcar_gen3_chan *ch)
@@ -271,7 +286,10 @@ static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
 
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 {
-	return has_otg_pins_check_id(ch);
+	if (ch->rs_ops && ch->rs_ops->check_id)
+		return ch->rs_ops->check_id(ch);
+
+	return false;
 }
 
 static void rcar_gen3_device_recognition(struct rcar_gen3_chan *ch)
@@ -284,7 +302,10 @@ static void rcar_gen3_device_recognition(struct rcar_gen3_chan *ch)
 
 static bool rcar_gen3_is_host(struct rcar_gen3_chan *ch)
 {
-	return has_otg_pins_is_host(ch);
+	if (ch->rs_ops && ch->rs_ops->is_host)
+		return ch->rs_ops->is_host(ch);
+
+	return false;
 }
 
 static enum phy_mode rcar_gen3_get_phy_mode(struct rcar_gen3_chan *ch)
@@ -350,7 +371,8 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 
 static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 {
-	has_otg_pins_init(ch);
+	if (ch->rs_ops && ch->rs_ops->init)
+		ch->rs_ops->init(ch);
 
 	rcar_gen3_device_recognition(ch);
 }
@@ -425,9 +447,10 @@ static int rcar_gen3_phy_usb2_power_off(struct phy *p)
 static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 {
 	struct rcar_gen3_chan *ch = _ch;
-	irqreturn_t ret;
+	irqreturn_t ret = IRQ_NONE;
 
-	ret = has_otg_pins_irq_handler(ch);
+	if (ch->rs_ops && ch->rs_ops->irq_handler)
+		ret = ch->rs_ops->irq_handler(ch);
 	if (ret == IRQ_HANDLED)
 		rcar_gen3_device_recognition(ch);
 
@@ -456,6 +479,16 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 	EXTCON_NONE,
 };
 
+static const struct rcar_gen3_role_swap_ops has_otg_pins_ops = {
+	.init		= has_otg_pins_init,
+	.set_host	= has_otg_pins_set_host,
+	.is_host	= has_otg_pins_is_host,
+	.set_vbus_ctrl	= has_otg_pins_set_vbus_ctrl,
+	.check_id	= has_otg_pins_check_id,
+	.control_irq	= has_otg_pins_control_irq,
+	.irq_handler	= has_otg_pins_irq_handler,
+};
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -493,6 +526,8 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		int ret;
 
 		channel->has_otg_pins = (uintptr_t)of_device_get_match_data(dev);
+		if (channel->has_otg_pins)
+			channel->rs_ops = &has_otg_pins_ops;
 		channel->extcon = devm_extcon_dev_allocate(dev,
 							rcar_gen3_phy_cable);
 		if (IS_ERR(channel->extcon))
-- 
1.9.1

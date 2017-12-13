From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 5/5] phy: renesas: rcar-gen3-usb2: add gpio handling
Date: Wed, 13 Dec 2017 15:27:40 +0900
Message-ID: <1513146460-20326-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1513146460-20326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1513146460-20326-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Some R-Car SoCs (e.g. R-Car D3) doesn't have dedicated pins of VBUS
and ID. So, they may be connected to gpio pins. To handle the gpio
pins, this patch adds the handling of VBUS and ID pins instead of
dedicated pins.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 77 ++++++++++++++++++++--
 2 files changed, 72 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
index 99b651b..851582f 100644
--- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
+++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
@@ -27,6 +27,8 @@ channel as USB OTG:
 - interrupts: interrupt specifier for the PHY.
 - vbus-supply: Phandle to a regulator that provides power to the VBUS. This
 	       regulator will be managed during the PHY power on/off sequence.
+- renesas,vbus-gpios: use gpio to control vbus instead of dedicated pin.
+- renesas,id-gpios: use gpio to detect id instead of dedicated pin.
 
 Example (R-Car H3):
 
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 5e509a9..0b6333d 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/extcon-provider.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -100,9 +101,12 @@ struct rcar_gen3_chan {
 	struct phy *phy;
 	struct regulator *vbus;
 	const struct rcar_gen3_role_swap_ops *rs_ops;
+	struct gpio_desc *gpio_vbus;
+	struct gpio_desc *gpio_id;
 	struct work_struct work;
 	bool extcon_host;
 	bool has_otg_pins;
+	bool has_gpio;
 };
 
 static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
@@ -199,6 +203,36 @@ static void has_otg_pins_init(struct rcar_gen3_chan *ch)
 	       usb2_base + USB2_LINECTRL1);
 }
 
+static void gpio_enable_vbus(struct rcar_gen3_chan *ch, int vbus)
+{
+	gpiod_set_value(ch->gpio_vbus, vbus);
+}
+
+static bool gpio_check_id(struct rcar_gen3_chan *ch)
+{
+	return gpiod_get_value(ch->gpio_id);
+}
+
+static void gpio_set_host(struct rcar_gen3_chan *ch, int host)
+{
+	/* In gpio ops, this driver will modify the extcon_host by sysfs */
+	if (ch->extcon_host != !!host) {
+		ch->extcon_host = !!host;
+		schedule_work(&ch->work);
+	}
+}
+
+static bool gpio_is_host(struct rcar_gen3_chan *ch)
+{
+	return ch->extcon_host;
+}
+
+static irqreturn_t gpio_irq_handler(struct rcar_gen3_chan *ch)
+{
+	/* Nop because the driver will get gpio value after exited */
+	return IRQ_HANDLED;
+}
+
 static void rcar_gen3_phy_usb2_work(struct work_struct *work)
 {
 	struct rcar_gen3_chan *ch = container_of(work, struct rcar_gen3_chan,
@@ -323,7 +357,7 @@ static ssize_t role_store(struct device *dev, struct device_attribute *attr,
 	bool is_b_device;
 	enum phy_mode cur_mode, new_mode;
 
-	if (!ch->has_otg_pins || !ch->phy->init_count)
+	if (!(ch->has_otg_pins || ch->has_gpio) || !ch->phy->init_count)
 		return -EIO;
 
 	if (!strncmp(buf, "host", strlen("host")))
@@ -361,7 +395,7 @@ static ssize_t role_show(struct device *dev, struct device_attribute *attr,
 {
 	struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
 
-	if (!ch->has_otg_pins || !ch->phy->init_count)
+	if (!(ch->has_otg_pins || ch->has_gpio) || !ch->phy->init_count)
 		return -EIO;
 
 	return sprintf(buf, "%s\n", rcar_gen3_is_host(ch) ? "host" :
@@ -388,7 +422,7 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
 
 	/* Initialize otg part */
-	if (channel->has_otg_pins)
+	if (channel->has_otg_pins || channel->has_gpio)
 		rcar_gen3_init_otg(channel);
 
 	return 0;
@@ -489,6 +523,14 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 	.irq_handler	= has_otg_pins_irq_handler,
 };
 
+static const struct rcar_gen3_role_swap_ops gpio_ops = {
+	.set_host	= gpio_set_host,
+	.is_host	= gpio_is_host,
+	.enable_vbus	= gpio_enable_vbus,
+	.check_id	= gpio_check_id,
+	.irq_handler	= gpio_irq_handler,
+};
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -513,9 +555,30 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 
 	INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
 
-	/* call request_irq for OTG */
+	channel->gpio_vbus = devm_gpiod_get(dev, "renesas,vbus", GPIOD_OUT_LOW);
+	if (IS_ERR(channel->gpio_vbus) &&
+	    PTR_ERR(channel->gpio_vbus) == -EPROBE_DEFER)
+		return PTR_ERR(channel->gpio_vbus);
+
+	channel->gpio_id = devm_gpiod_get(dev, "renesas,id", GPIOD_IN);
+	if (!IS_ERR(channel->gpio_vbus) && !IS_ERR(channel->gpio_id)) {
+		irq = gpiod_to_irq(channel->gpio_id);
+		if (irq > 0) {
+			ret = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
+				IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+				dev_name(dev), channel);
+			if (ret < 0) {
+				dev_err(dev, "No gpio irq handler (%d)\n", irq);
+			} else {
+				channel->has_gpio = true;
+				channel->rs_ops = &gpio_ops;
+			}
+		}
+	}
+
+	/* call request_irq for OTG if doesn't have gpio */
 	irq = platform_get_irq(pdev, 0);
-	if (irq >= 0) {
+	if (!channel->has_gpio && irq >= 0) {
 		irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
 				       IRQF_SHARED, dev_name(dev), channel);
 		if (irq < 0)
@@ -569,7 +632,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed to register PHY provider\n");
 		ret = PTR_ERR(provider);
 		goto error;
-	} else if (channel->has_otg_pins) {
+	} else if (channel->has_otg_pins || channel->has_gpio) {
 		int ret;
 
 		ret = device_create_file(dev, &dev_attr_role);
@@ -589,7 +652,7 @@ static int rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 {
 	struct rcar_gen3_chan *channel = platform_get_drvdata(pdev);
 
-	if (channel->has_otg_pins)
+	if (channel->has_otg_pins || channel->has_gpio)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
 	pm_runtime_disable(&pdev->dev);
-- 
1.9.1

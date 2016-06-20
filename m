From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2] gpio: sx150x: Update OF configuration
Date: Mon, 20 Jun 2016 11:56:44 +0200
Message-ID: <1466416604-19129-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In case of OF probing, the driver fails to initialize :
- gpio_chip.base must be -1
- irq_summary must be either -1 or valid
- There is no way to use the other configurations

Add OF parsing function to complete the HW configuration, make
OF configuration dynamic instead of static with #defines and
update the DT bindings.

Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---

Changes since v1 at http://lkml.kernel.org/r/1466157063-10955-1-git-send-email-narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org:
 - Put back #ifdef CONFIG_OF_GPIO to remove OF code for non-of platforms

 .../devicetree/bindings/gpio/gpio-sx150x.txt       | 17 ++++++
 drivers/gpio/gpio-sx150x.c                         | 67 ++++++++++++++++++++--
 2 files changed, 79 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
index c809acb..d2b5bb3 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-sx150x.txt
@@ -22,6 +22,17 @@ Required properties:
 
 - interrupt-controller: Marks the device as a interrupt controller.
 
+Optional Properties:
+- oscio-is-gpo: Boolean, Indicated the oscio pin can be used as additional
+		output gpo port.
+
+- pull-up-ports: Array of port numbers which must have pull-up enabled.
+- pull-down-ports: Array of port numbers which must have pull-down enabled.
+- open-drain-ports: Array of port numbers which must be configured as open-drain,
+			Push-Pull mode is default.
+- polarity-invert-ports: Array of port numbers whih port polarity must be inverted.
+- probe-reset: Boolean, Indicates the expander must be resetted.
+
 The GPIO expander can optionally be used as an interrupt controller, in
 which case it uses the default two cell specifier as described in
 Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.
@@ -38,4 +49,10 @@ Example:
 
 		gpio-controller;
 		interrupt-controller;
+
+		pull-up-ports = <0 12>;
+		pull-down-ports = <1 8>;
+		open-drain-ports = <6 7 11>;
+		polarity-invert-ports = <3>;
+		probe-reset;
 	};
diff --git a/drivers/gpio/gpio-sx150x.c b/drivers/gpio/gpio-sx150x.c
index a177ebd..1226b5b 100644
--- a/drivers/gpio/gpio-sx150x.c
+++ b/drivers/gpio/gpio-sx150x.c
@@ -588,13 +588,16 @@ static void sx150x_init_chip(struct sx150x_chip *chip,
 	chip->gpio_chip.get              = sx150x_gpio_get;
 	chip->gpio_chip.set              = sx150x_gpio_set;
 	chip->gpio_chip.set_single_ended = sx150x_gpio_set_single_ended;
-	chip->gpio_chip.base             = pdata->gpio_base;
 	chip->gpio_chip.can_sleep        = true;
 	chip->gpio_chip.ngpio            = chip->dev_cfg->ngpios;
 #ifdef CONFIG_OF_GPIO
-	chip->gpio_chip.of_node          = client->dev.of_node;
-	chip->gpio_chip.of_gpio_n_cells  = 2;
+	if (client->dev.of_node) {
+		chip->gpio_chip.of_node          = client->dev.of_node;
+		chip->gpio_chip.of_gpio_n_cells  = 2;
+		chip->gpio_chip.base             = -1;
+	} else
 #endif
+		chip->gpio_chip.base             = pdata->gpio_base;
 	if (pdata->oscio_is_gpo)
 		++chip->gpio_chip.ngpio;
 
@@ -735,16 +738,70 @@ static int sx150x_install_irq_chip(struct sx150x_chip *chip,
 	return err;
 }
 
+#ifdef CONFIG_OF_GPIO
+static u16 sx150x_of_probe_pins(struct device *dev, char *attr_name)
+{
+	struct property *prop;
+	const __be32 *p;
+	u16 pins = 0;
+	u32 u;
+
+	if (!of_find_property(dev->of_node, attr_name, NULL))
+		return 0;
+
+	of_property_for_each_u32(dev->of_node, attr_name, prop, p, u)
+		if (u < 16)
+			pins |= BIT(u);
+
+	return pins;
+}
+
+static struct sx150x_platform_data *sx150x_of_probe(struct device *dev)
+{
+	struct sx150x_platform_data *pdata = devm_kzalloc(dev, sizeof(*pdata),
+								GFP_KERNEL);
+	/* gpio_base is not needed with OF */
+
+	pdata->oscio_is_gpo = of_property_read_bool(dev->of_node,
+						    "oscio-is-gpo");
+
+	pdata->io_pullup_ena = sx150x_of_probe_pins(dev,
+						    "pull-up-ports");
+
+	pdata->io_pulldn_ena = sx150x_of_probe_pins(dev,
+						    "pull-down-ports");
+
+	pdata->io_polarity = sx150x_of_probe_pins(dev,
+						  "polarity-invert-ports");
+
+	pdata->irq_summary = of_irq_get(dev->of_node, 0);
+
+	/* irq_base is not needed with OF */
+
+	pdata->reset_during_probe = of_property_read_bool(dev->of_node,
+							  "probe-reset");
+
+	return pdata;
+}
+#endif
+
 static int sx150x_probe(struct i2c_client *client,
 				const struct i2c_device_id *id)
 {
 	static const u32 i2c_funcs = I2C_FUNC_SMBUS_BYTE_DATA |
 				     I2C_FUNC_SMBUS_WRITE_WORD_DATA;
-	struct sx150x_platform_data *pdata;
+	struct sx150x_platform_data *pdata = NULL;
 	struct sx150x_chip *chip;
 	int rc;
 
-	pdata = dev_get_platdata(&client->dev);
+#ifdef CONFIG_OF_GPIO
+	if (client->dev.of_node)
+		pdata = sx150x_of_probe(&client->dev);
+#endif
+
+	if (!pdata)
+		pdata = dev_get_platdata(&client->dev);
+
 	if (!pdata)
 		return -EINVAL;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

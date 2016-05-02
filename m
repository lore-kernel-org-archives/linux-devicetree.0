From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v2 2/2] pinctrl: iproc: Add v2/v3 GPIO support
Date: Mon,  2 May 2016 13:51:48 -0700
Message-ID: <1462222308-4869-3-git-send-email-ray.jui@broadcom.com>
References: <1462222308-4869-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1462222308-4869-1-git-send-email-ray.jui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>, Pramod Kumar <pramodku@broadcom.com>
List-Id: devicetree@vger.kernel.org

The iProc GPIO controller is shared among multiple iProc based SoCs.
In the 2nd generation of the controller integrated in NSP, the drive
strength pinctrl function is disabled. In the 3rd generation of this
controller integrated in Stingray, pinctrl is handled by another block
and this GPIO controller is solely used as a GPIO controller, and
therefore should not be registered to the pinconf framework

Introducing new compatible strings "brcm,iproc-gpio-v2" for NSP with
drive strength feature disabled and "brcm,iproc-gpio-v3" for stingray
with all PINCONF features disabled

This patch is developed based on the initial work from Yendapally
Reddy Dhananjaya <yrdreddy@broadcom.com> who attempted to disable drive
strength configuration for the iProc based NSP chip. In addition,
Pramod Kumar <pramodku@broadcom.com> also contributed to make the
support more generic across all currently supported PINCONF
functions in the iProc GPIO/PINCONF driver

Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
Signed-off-by: Ray Jui <ray.jui@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 115 +++++++++++++++++++++++++++++--
 1 file changed, 109 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index d530ab4..98f2400 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -66,6 +66,14 @@
 #define GPIO_DRV_STRENGTH_BITS       3
 #define GPIO_DRV_STRENGTH_BIT_MASK   ((1 << GPIO_DRV_STRENGTH_BITS) - 1)
 
+enum iproc_pinconf_param {
+	IPROC_PINCONF_DRIVE_STRENGTH = 0,
+	IPROC_PINCONF_BIAS_DISABLE,
+	IPROC_PINCONF_BIAS_PULL_UP,
+	IPROC_PINCONF_BIAS_PULL_DOWN,
+	IPROC_PINCON_MAX,
+};
+
 /*
  * Iproc GPIO core
  *
@@ -78,6 +86,10 @@
  * @num_banks: number of GPIO banks, each bank supports up to 32 GPIOs
  * @pinmux_is_supported: flag to indicate this GPIO controller contains pins
  * that can be individually muxed to GPIO
+ * @pinconf_disable: contains a list of PINCONF parameters that need to be
+ * disabled
+ * @nr_pinconf_disable: total number of PINCONF parameters that need to be
+ * disabled
  * @pctl: pointer to pinctrl_dev
  * @pctldesc: pinctrl descriptor
  */
@@ -94,6 +106,9 @@ struct iproc_gpio {
 
 	bool pinmux_is_supported;
 
+	enum pin_config_param *pinconf_disable;
+	unsigned int nr_pinconf_disable;
+
 	struct pinctrl_dev *pctl;
 	struct pinctrl_desc pctldesc;
 };
@@ -360,6 +375,65 @@ static int iproc_gpio_get(struct gpio_chip *gc, unsigned gpio)
 	return !!(readl(chip->base + offset) & BIT(shift));
 }
 
+/*
+ * Mapping of the iProc PINCONF parameters to the generic pin configuration
+ * parameters
+ */
+static const enum pin_config_param iproc_pinconf_disable_map[] = {
+	[IPROC_PINCONF_DRIVE_STRENGTH] = PIN_CONFIG_DRIVE_STRENGTH,
+	[IPROC_PINCONF_BIAS_DISABLE] = PIN_CONFIG_BIAS_DISABLE,
+	[IPROC_PINCONF_BIAS_PULL_UP] = PIN_CONFIG_BIAS_PULL_UP,
+	[IPROC_PINCONF_BIAS_PULL_DOWN] = PIN_CONFIG_BIAS_PULL_DOWN,
+};
+
+static bool iproc_pinconf_param_is_disabled(struct iproc_gpio *chip,
+					    enum pin_config_param param)
+{
+	unsigned int i;
+
+	if (!chip->nr_pinconf_disable)
+		return false;
+
+	for (i = 0; i < chip->nr_pinconf_disable; i++)
+		if (chip->pinconf_disable[i] == param)
+			return true;
+
+	return false;
+}
+
+static int iproc_pinconf_disable_map_create(struct iproc_gpio *chip,
+					    unsigned long disable_mask)
+{
+	unsigned int map_size = ARRAY_SIZE(iproc_pinconf_disable_map);
+	unsigned int bit, nbits = 0;
+
+	/* figure out total number of PINCONF parameters to disable */
+	for_each_set_bit(bit, &disable_mask, map_size)
+		nbits++;
+
+	if (!nbits)
+		return 0;
+
+	/*
+	 * Allocate an array to store PINCONF parameters that need to be
+	 * disabled
+	 */
+	chip->pinconf_disable = devm_kcalloc(chip->dev, nbits,
+					     sizeof(*chip->pinconf_disable),
+					     GFP_KERNEL);
+	if (!chip->pinconf_disable)
+		return -ENOMEM;
+
+	chip->nr_pinconf_disable = nbits;
+
+	/* now store these parameters */
+	nbits = 0;
+	for_each_set_bit(bit, &disable_mask, map_size)
+		chip->pinconf_disable[nbits++] = iproc_pinconf_disable_map[bit];
+
+	return 0;
+}
+
 static int iproc_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	return 1;
@@ -500,6 +574,9 @@ static int iproc_pin_config_get(struct pinctrl_dev *pctldev, unsigned pin,
 	bool disable, pull_up;
 	int ret;
 
+	if (iproc_pinconf_param_is_disabled(chip, param))
+		return -ENOTSUPP;
+
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
 		iproc_gpio_get_pull(chip, gpio, &disable, &pull_up);
@@ -548,6 +625,10 @@ static int iproc_pin_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
+
+		if (iproc_pinconf_param_is_disabled(chip, param))
+			return -ENOTSUPP;
+
 		arg = pinconf_to_config_argument(configs[i]);
 
 		switch (param) {
@@ -642,7 +723,9 @@ static const struct of_device_id iproc_gpio_of_match[] = {
 	{ .compatible = "brcm,cygnus-asiu-gpio" },
 	{ .compatible = "brcm,cygnus-crmu-gpio" },
 	{ .compatible = "brcm,iproc-gpio" },
-	{ }
+	{ .compatible = "brcm,iproc-gpio-v2" },
+	{ .compatible = "brcm,iproc-gpio-v3" },
+	{ /* sentinel */ }
 };
 
 static int iproc_gpio_probe(struct platform_device *pdev)
@@ -651,8 +734,16 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct iproc_gpio *chip;
 	struct gpio_chip *gc;
-	u32 ngpios;
+	u32 ngpios, pinconf_disable_mask = 0;
 	int irq, ret;
+	bool no_pinconf = false;
+
+	/* v2 does not support drive strength config */
+	if (of_device_is_compatible(dev->of_node, "brcm,iproc-gpio-v2"))
+		pinconf_disable_mask = BIT(IPROC_PINCONF_DRIVE_STRENGTH);
+	/* v3 does not support pinconf */
+	else if (of_device_is_compatible(dev->of_node, "brcm,iproc-gpio-v3"))
+		no_pinconf = true;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -707,10 +798,22 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = iproc_gpio_register_pinconf(chip);
-	if (ret) {
-		dev_err(dev, "unable to register pinconf\n");
-		goto err_rm_gpiochip;
+	if (!no_pinconf) {
+		ret = iproc_gpio_register_pinconf(chip);
+		if (ret) {
+			dev_err(dev, "unable to register pinconf\n");
+			goto err_rm_gpiochip;
+		}
+
+		if (pinconf_disable_mask) {
+			ret = iproc_pinconf_disable_map_create(chip,
+							 pinconf_disable_mask);
+			if (ret) {
+				dev_err(dev,
+					"unable to create pinconf disable map\n");
+				goto err_unregister_pinconf;
+			}
+		}
 	}
 
 	/* optional GPIO interrupt support */
-- 
2.1.4


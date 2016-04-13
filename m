From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH 2/4] pinctrl: iproc: Allow certain PINCONF functions to be disabled
Date: Tue, 12 Apr 2016 17:15:21 -0700
Message-ID: <1460506523-6249-3-git-send-email-ray.jui@broadcom.com>
References: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>, Pramod Kumar <pramodku@broadcom.com>
List-Id: devicetree@vger.kernel.org

The iProc GPIO controller is shared among multiple iProc based SoCs. In
some of these SoCs, certain PINCONF functions are disabled and registers
associated with these functions are reserved. This patch adds support to
the iProc GPIO/PINCOF driver to allow these unsupported functions to be
disabled through device tree property 'brcm,pinconf-func-off'. Without
disabling these unsupported PINCONF functions, user can potentially
access these functions through sysfs debug entries; as a result, these
reserved registers can be accessed

This patch is developed based on the initial work from Yendapally Reddy
Dhananjaya <yrdreddy@broadcom.com> who attempted to disable drive
strength configuration for the iProc based NSP chip. In addition,
Pramod Kumar <pramodku@broadcom.com> also contributed to make the
support more generic across all currently supported PINCONF functions in
the iProc GPIO/PINCONF driver

Signed-off-by: Pramod Kumar <pramodku@broadcom.com>
Signed-off-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Jon Mason <jon.mason@broadcom.com>
Reviewed-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c      | 91 ++++++++++++++++++++++++++-
 include/dt-bindings/pinctrl/brcm,iproc-gpio.h | 52 +++++++++++++++
 2 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/pinctrl/brcm,iproc-gpio.h

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index d530ab4..12a8922 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -34,6 +34,7 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
+#include <dt-bindings/pinctrl/brcm,iproc-gpio.h>
 #include "../pinctrl-utils.h"
 
 #define IPROC_GPIO_DATA_IN_OFFSET   0x00
@@ -78,6 +79,10 @@
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
@@ -94,6 +99,9 @@ struct iproc_gpio {
 
 	bool pinmux_is_supported;
 
+	enum pin_config_param *pinconf_disable;
+	unsigned nr_pinconf_disable;
+
 	struct pinctrl_dev *pctl;
 	struct pinctrl_desc pctldesc;
 };
@@ -360,6 +368,65 @@ static int iproc_gpio_get(struct gpio_chip *gc, unsigned gpio)
 	return !!(readl(chip->base + offset) & BIT(shift));
 }
 
+/*
+ * Mapping of the iProc PINCONF parameters to the generic pin configuration
+ * parameters
+ */
+static const enum pin_config_param iproc_pinconf_disable_map[] = {
+	[IPROC_PIN_DRIVE_STRENGTH] = PIN_CONFIG_DRIVE_STRENGTH,
+	[IPROC_PIN_BIAS_DISABLE] = PIN_CONFIG_BIAS_DISABLE,
+	[IPROC_PIN_BIAS_PULL_UP] = PIN_CONFIG_BIAS_PULL_UP,
+	[IPROC_PIN_BIAS_PULL_DOWN] = PIN_CONFIG_BIAS_PULL_DOWN,
+};
+
+static bool iproc_pinconf_param_is_disabled(struct iproc_gpio *chip,
+					    enum pin_config_param param)
+{
+	unsigned i;
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
@@ -500,6 +567,9 @@ static int iproc_pin_config_get(struct pinctrl_dev *pctldev, unsigned pin,
 	bool disable, pull_up;
 	int ret;
 
+	if (iproc_pinconf_param_is_disabled(chip, param))
+		return -ENOTSUPP;
+
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
 		iproc_gpio_get_pull(chip, gpio, &disable, &pull_up);
@@ -548,6 +618,10 @@ static int iproc_pin_config_set(struct pinctrl_dev *pctldev, unsigned pin,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
+
+		if (iproc_pinconf_param_is_disabled(chip, param))
+			return -ENOTSUPP;
+
 		arg = pinconf_to_config_argument(configs[i]);
 
 		switch (param) {
@@ -651,7 +725,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct iproc_gpio *chip;
 	struct gpio_chip *gc;
-	u32 ngpios;
+	u32 ngpios, pinconf_disable_mask;
 	int irq, ret;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
@@ -713,6 +787,21 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 		goto err_rm_gpiochip;
 	}
 
+	/*
+	 * Optional DT property to disable unsupported pinconf parameters for
+	 * a particular iProc SoC
+	 */
+	ret = of_property_read_u32(dev->of_node, "brcm,pinconf-func-off",
+				   &pinconf_disable_mask);
+	if (!ret) {
+		ret = iproc_pinconf_disable_map_create(chip,
+						       pinconf_disable_mask);
+		if (ret) {
+			dev_err(dev, "unable to create pinconf disable map\n");
+			goto err_unregister_pinconf;
+		}
+	}
+
 	/* optional GPIO interrupt support */
 	irq = platform_get_irq(pdev, 0);
 	if (irq) {
diff --git a/include/dt-bindings/pinctrl/brcm,iproc-gpio.h b/include/dt-bindings/pinctrl/brcm,iproc-gpio.h
new file mode 100644
index 0000000..82b449e
--- /dev/null
+++ b/include/dt-bindings/pinctrl/brcm,iproc-gpio.h
@@ -0,0 +1,52 @@
+/*
+ *  BSD LICENSE
+ *
+ *  Copyright (C) 2016 Broadcom.  All rights reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+ *  modification, are permitted provided that the following conditions
+ *  are met:
+ *
+ *    * Redistributions of source code must retain the above copyright
+ *      notice, this list of conditions and the following disclaimer.
+ *    * Redistributions in binary form must reproduce the above copyright
+ *      notice, this list of conditions and the following disclaimer in
+ *      the documentation and/or other materials provided with the
+ *      distribution.
+ *    * Neither the name of Broadcom Corporation nor the names of its
+ *      contributors may be used to endorse or promote products derived
+ *      from this software without specific prior written permission.
+ *
+ *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_BRCM_IPROC_GPIO_H__
+#define __DT_BINDINGS_PINCTRL_BRCM_IPROC_GPIO_H__
+
+/*
+ * Bit position for PINCONF functions to be disabled for a given iProc SoC
+ */
+#define IPROC_PIN_DRIVE_STRENGTH        0
+#define IPROC_PIN_BIAS_DISABLE          1
+#define IPROC_PIN_BIAS_PULL_UP          2
+#define IPROC_PIN_BIAS_PULL_DOWN        3
+
+/*
+ * Bit mask for DT property "brcm,pinconf-func-off"
+ */
+#define IPROC_PIN_OFF_DRIVE_STRENGTH    (1 << IPROC_PIN_DRIVE_STRENGTH)
+#define IPROC_PIN_OFF_BIAS_DISABLE      (1 << IPROC_PIN_BIAS_DISABLE)
+#define IPROC_PIN_OFF_BIAS_PULL_UP      (1 << IPROC_PIN_BIAS_PULL_UP)
+#define IPROC_PIN_OFF_BIAS_PULL_DOWN    (1 << IPROC_PIN_BIAS_PULL_DOWN)
+
+#endif
-- 
2.1.4

From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v2 1/5] spmi: pmic-arb: hardcode IRQ counts
Date: Sun,  6 Jan 2019 21:11:41 -0500
Message-ID: <20190107021145.6370-2-masneyb@onstation.org>
References: <20190107021145.6370-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107021145.6370-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, lee.jones@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The probing of this driver calls platform_irq_count, which will setup
all of the IRQs that are available. This is a problem since some of
these IRQs may be setup in an IRQ hierarchy later in the boot process
by spmi-gpio. This will cause these hwirqs to be associated with
multiple Linux virqs and interrupts will not work as expected. This
patch changes the pmic-arb driver so that the IRQ counts are hard
coded in the data field of the of_device_id structure so that IRQs
are setup on an as-needed basis.

This patch also removes the generic qcom,spmi-gpio OF match since we
don't know the number of pins. All of the existing upstream bindings
already include the more-specific binding.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Note: The qcom,pms405-gpio looks suspicious to me. The existing code
will start at gpio1, which is supposed to be a hole according to the
comment. I can fix this in a later patch if there is a desire. I didn't
do it now to try to keep this series as small as possible. Its no
worse than what was there before.

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 37 ++++++++++++------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 4458d44dfcf6..d910fa6c49fe 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -14,6 +14,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
@@ -935,8 +936,23 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
 	return 0;
 }
 
+/* data contains the number of GPIOs */
+static const struct of_device_id pmic_gpio_of_match[] = {
+	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
+	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
+	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
+	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
+	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, pmic_gpio_of_match);
+
 static int pmic_gpio_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *of_id;
 	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pindesc;
 	struct pinctrl_desc *pctrldesc;
@@ -951,13 +967,11 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	npins = platform_irq_count(pdev);
-	if (!npins)
+	of_id = of_match_device(pmic_gpio_of_match, &pdev->dev);
+	if (!of_id)
 		return -EINVAL;
-	if (npins < 0)
-		return npins;
 
-	BUG_ON(npins > ARRAY_SIZE(pmic_gpio_groups));
+	npins = (int) of_id->data;
 
 	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
@@ -1062,19 +1076,6 @@ static int pmic_gpio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id pmic_gpio_of_match[] = {
-	{ .compatible = "qcom,pm8916-gpio" },	/* 4 GPIO's */
-	{ .compatible = "qcom,pm8941-gpio" },	/* 36 GPIO's */
-	{ .compatible = "qcom,pm8994-gpio" },	/* 22 GPIO's */
-	{ .compatible = "qcom,pmi8994-gpio" },  /* 10 GPIO's */
-	{ .compatible = "qcom,pma8084-gpio" },	/* 22 GPIO's */
-	{ .compatible = "qcom,pms405-gpio" },	/* 12 GPIO's, holes on 1 9 10 */
-	{ .compatible = "qcom,spmi-gpio" }, /* Generic */
-	{ },
-};
-
-MODULE_DEVICE_TABLE(of, pmic_gpio_of_match);
-
 static struct platform_driver pmic_gpio_driver = {
 	.driver = {
 		   .name = "qcom-spmi-gpio",
-- 
2.17.2

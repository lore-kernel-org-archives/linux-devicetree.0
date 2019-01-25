From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 1/9] pinctrl: qcom: ssbi-gpio: hardcode IRQ counts
Date: Fri, 25 Jan 2019 11:22:54 -0500
Message-ID: <20190125162302.14036-2-masneyb@onstation.org>
References: <20190125162302.14036-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125162302.14036-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, lee.jones@linaro.org
Cc: tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The probing of this driver calls platform_irq_count, which will
setup all of the IRQs that are configured in device tree. In
preparation for converting this driver to be a hierarchical IRQ
chip, hardcode the IRQ count based on the hardware type so that all
the IRQs are not configured immediately and are configured on an
as-needed basis later in the boot process. This change will also
allow for the removal of the interrupts property later in this
patch series once the hierarchical IRQ chip support is in.

This patch also removes the generic qcom,ssbi-gpio OF match since we
don't know the number of pins. All of the existing upstream bindings
already include the more-specific binding.

This change was not tested on any actual hardware, however the same
change was made to spmi-gpio and tested on a LG Nexus 5 (hammerhead)
phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index ded7d765af2e..9a9e9cb80cc5 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -665,12 +665,11 @@ static int pm8xxx_pin_populate(struct pm8xxx_gpio *pctrl,
 }
 
 static const struct of_device_id pm8xxx_gpio_of_match[] = {
-	{ .compatible = "qcom,pm8018-gpio" },
-	{ .compatible = "qcom,pm8038-gpio" },
-	{ .compatible = "qcom,pm8058-gpio" },
-	{ .compatible = "qcom,pm8917-gpio" },
-	{ .compatible = "qcom,pm8921-gpio" },
-	{ .compatible = "qcom,ssbi-gpio" },
+	{ .compatible = "qcom,pm8018-gpio", .data = (void *) 6 },
+	{ .compatible = "qcom,pm8038-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm8058-gpio", .data = (void *) 44 },
+	{ .compatible = "qcom,pm8917-gpio", .data = (void *) 38 },
+	{ .compatible = "qcom,pm8921-gpio", .data = (void *) 44 },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8xxx_gpio_of_match);
@@ -687,13 +686,7 @@ static int pm8xxx_gpio_probe(struct platform_device *pdev)
 	if (!pctrl)
 		return -ENOMEM;
 
-	pctrl->dev = &pdev->dev;
-	npins = platform_irq_count(pdev);
-	if (!npins)
-		return -EINVAL;
-	if (npins < 0)
-		return npins;
-	pctrl->npins = npins;
+	npins = (uintptr_t) device_get_match_data(&pdev->dev);
 
 	pctrl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	if (!pctrl->regmap) {
-- 
2.17.2

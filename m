From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v3 1/6] pinctrl: qcom: spmi-gpio: hardcode IRQ counts
Date: Wed,  9 Jan 2019 20:12:53 -0500
Message-ID: <20190110011258.17227-2-masneyb@onstation.org>
References: <20190110011258.17227-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110011258.17227-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The probing of this driver calls platform_irq_count, which will
setup all of the IRQs that are configured in device tree. In
preparation for converting this driver to be a hierarchical IRQ
chip, hardcode the IRQ count based on the hardware type so that all
the IRQs are not configured immediately and are configured on an
as-needed basis later in the boot process. This change will also
allow for the removal of the interrupts property later in this
patch series once the hierarchical IRQ chip support is in.

This patch also removes the generic qcom,spmi-gpio OF match since we
don't know the number of pins. All of the existing upstream bindings
already include the more-specific binding.

The pm8941 code was tested on a LG Nexus 5 (hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v2:
- Don't move pmic_gpio_of_match block. Use device_get_match_data instead
  of of_match_device.
- Correct build warning on arm64: warning: cast from pointer to integer
  of different size

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 4458d44dfcf6..d3ce7a0e1203 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -951,13 +951,7 @@ static int pmic_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	npins = platform_irq_count(pdev);
-	if (!npins)
-		return -EINVAL;
-	if (npins < 0)
-		return npins;
-
-	BUG_ON(npins > ARRAY_SIZE(pmic_gpio_groups));
+	npins = (u16)(uintptr_t) device_get_match_data(&pdev->dev);
 
 	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
@@ -1062,14 +1056,15 @@ static int pmic_gpio_remove(struct platform_device *pdev)
 	return 0;
 }
 
+/* data contains the number of GPIOs */
 static const struct of_device_id pmic_gpio_of_match[] = {
-	{ .compatible = "qcom,pm8916-gpio" },	/* 4 GPIO's */
-	{ .compatible = "qcom,pm8941-gpio" },	/* 36 GPIO's */
-	{ .compatible = "qcom,pm8994-gpio" },	/* 22 GPIO's */
-	{ .compatible = "qcom,pmi8994-gpio" },  /* 10 GPIO's */
-	{ .compatible = "qcom,pma8084-gpio" },	/* 22 GPIO's */
-	{ .compatible = "qcom,pms405-gpio" },	/* 12 GPIO's, holes on 1 9 10 */
-	{ .compatible = "qcom,spmi-gpio" }, /* Generic */
+	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
+	{ .compatible = "qcom,pm8994-gpio", .data = (void *) 22 },
+	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
+	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
+	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
 	{ },
 };
 
-- 
2.17.2

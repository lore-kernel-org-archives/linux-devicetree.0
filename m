From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v6 02/15] pinctrl: qcom: spmi-gpio: add support for three new variants
Date: Sat, 19 Jan 2019 15:42:39 -0500
Message-ID: <20190119204252.18370-3-masneyb@onstation.org>
References: <20190119204252.18370-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190119204252.18370-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com
Cc: shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for qcom,pm8005-gpio, qcom,pm8998-gpio, and
qcom,pmi8998-gpio. These three variants are already in use in some
arm64 dtsi files. Those boards work since the generic binding
qcom,spmi-gpio is also specified.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes since v5:
- None

Changes since v4:
- None

Patch introduced in v4.

 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 4458d44dfcf6..5f2977982ef1 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1063,10 +1063,13 @@ static int pmic_gpio_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id pmic_gpio_of_match[] = {
+	{ .compatible = "qcom,pm8005-gpio" },	/* 4 GPIO's */
 	{ .compatible = "qcom,pm8916-gpio" },	/* 4 GPIO's */
 	{ .compatible = "qcom,pm8941-gpio" },	/* 36 GPIO's */
 	{ .compatible = "qcom,pm8994-gpio" },	/* 22 GPIO's */
 	{ .compatible = "qcom,pmi8994-gpio" },  /* 10 GPIO's */
+	{ .compatible = "qcom,pm8998-gpio" },	/* 26 GPIO's */
+	{ .compatible = "qcom,pmi8998-gpio" },	/* 14 GPIO's */
 	{ .compatible = "qcom,pma8084-gpio" },	/* 22 GPIO's */
 	{ .compatible = "qcom,pms405-gpio" },	/* 12 GPIO's, holes on 1 9 10 */
 	{ .compatible = "qcom,spmi-gpio" }, /* Generic */
-- 
2.17.2

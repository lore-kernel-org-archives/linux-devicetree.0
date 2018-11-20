Return-Path: <SRS0=jbWM=N7=linaro.org=shawn.guo@kernel.org>
From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/2] pinctrl: qcom: spmi-gpio: add compatible for pms405 GPIO
Date: Tue, 20 Nov 2018 13:45:22 +0800
Message-Id: <20181120054522.18698-2-shawn.guo@linaro.org>
In-Reply-To: <20181120054522.18698-1-shawn.guo@linaro.org>
References: <20181120054522.18698-1-shawn.guo@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Let's add "qcom,pms405-gpio" to match table, as commit ed80f6eb799a
("dt-bindings: pinctrl: qcom-pmic-gpio: Add pms405 support") already
adds the compatible.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index a29efbe08f48..21ccf94b22ea 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1055,6 +1055,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8994-gpio" },	/* 22 GPIO's */
 	{ .compatible = "qcom,pmi8994-gpio" },  /* 10 GPIO's */
 	{ .compatible = "qcom,pma8084-gpio" },	/* 22 GPIO's */
+	{ .compatible = "qcom,pms405-gpio" },	/* 12 GPIO's, holes on 1 9 10 */
 	{ .compatible = "qcom,spmi-gpio" }, /* Generic */
 	{ },
 };
-- 
2.18.0

From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 3/3] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8150l support
Date: Wed, 14 Aug 2019 18:05:12 +0530
Message-ID: <20190814123512.6017-3-vkoul@kernel.org>
References: <20190814123512.6017-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814123512.6017-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for the PM8150l GPIO support to the Qualcomm PMIC GPIO
binding.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 457459d17e79..c32bf3237545 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -99,6 +99,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio10 for pm8150 (holes on gpio2, gpio5, gpio7
 					     and gpio8)
 		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
+		    gpio1-gpio12 for pm8150l (hole on gpio7)
 
 - function:
 	Usage: required
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 931c9349f145..6f935e46f12c 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1159,6 +1159,8 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
 	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
 	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
+	/* pm8150l has 12 GPIOs with holes on 7 */
+	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
 	{ },
 };
 
-- 
2.20.1

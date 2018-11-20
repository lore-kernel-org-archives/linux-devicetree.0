Return-Path: <SRS0=jbWM=N7=linaro.org=shawn.guo@kernel.org>
From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: fix qcom-pmic-gpio for pms405
Date: Tue, 20 Nov 2018 13:45:21 +0800
Message-Id: <20181120054522.18698-1-shawn.guo@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Rather than gpio1-gpio11 for pms405, there are 12 GPIOs for pms405.
But gpio1, gpio9 and gpio10 are not available.  Fix the bindings doc
to make it correct for pms405.

Fixes: ed80f6eb799a ("dt-bindings: pinctrl: qcom-pmic-gpio: Add pms405 support")
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index ab4000eab07d..759aa1732e48 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -92,7 +92,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio26 for pm8998
 		    gpio1-gpio22 for pma8084
 		    gpio1-gpio10 for pmi8994
-		    gpio1-gpio11 for pms405
+		    gpio1-gpio12 for pms405 (holes on gpio1, gpio9 and gpio10)
 
 - function:
 	Usage: required
-- 
2.18.0

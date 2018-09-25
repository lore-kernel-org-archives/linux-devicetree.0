From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pms405 support
Date: Mon, 24 Sep 2018 17:06:56 -0700
Message-ID: <20180925000656.23869-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Add support for the PMS405 GPIO support to the Qualcomm PMIC GPIO
binding.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Dropped unnecessary driver update
- Updated subject

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index ffd4345415f3..ab4000eab07d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -19,6 +19,7 @@ PMIC's from Qualcomm.
 		    "qcom,pm8998-gpio"
 		    "qcom,pma8084-gpio"
 		    "qcom,pmi8994-gpio"
+		    "qcom,pms405-gpio"
 
 		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
 		    if the device is on an spmi bus or an ssbi bus respectively
@@ -91,6 +92,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio26 for pm8998
 		    gpio1-gpio22 for pma8084
 		    gpio1-gpio10 for pmi8994
+		    gpio1-gpio11 for pms405
 
 - function:
 	Usage: required
-- 
2.18.0

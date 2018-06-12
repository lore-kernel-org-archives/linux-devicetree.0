From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] pinctrl: qcom: spmi-gpio: Add pm8998 and pm8005 to binding
Date: Tue, 12 Jun 2018 16:06:04 -0700
Message-ID: <20180612230604.137880-1-swboyd@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Update the binding for two more PMICs supported by the same driver.
While we're here, remove the duplicate pmi8994 lines because that
support got merged twice.

Cc: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: <devicetree@vger.kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt          | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 5c25fcb29fb5..ffd4345415f3 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -7,6 +7,7 @@ PMIC's from Qualcomm.
 	Usage: required
 	Value type: <string>
 	Definition: must be one of:
+		    "qcom,pm8005-gpio"
 		    "qcom,pm8018-gpio"
 		    "qcom,pm8038-gpio"
 		    "qcom,pm8058-gpio"
@@ -15,7 +16,7 @@ PMIC's from Qualcomm.
 		    "qcom,pm8921-gpio"
 		    "qcom,pm8941-gpio"
 		    "qcom,pm8994-gpio"
-		    "qcom,pmi8994-gpio"
+		    "qcom,pm8998-gpio"
 		    "qcom,pma8084-gpio"
 		    "qcom,pmi8994-gpio"
 
@@ -78,6 +79,7 @@ to specify in a pin configuration subnode:
 	Value type: <string-array>
 	Definition: List of gpio pins affected by the properties specified in
 		    this subnode.  Valid pins are:
+		    gpio1-gpio4 for pm8005
 		    gpio1-gpio6 for pm8018
 		    gpio1-gpio12 for pm8038
 		    gpio1-gpio40 for pm8058
@@ -86,7 +88,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio44 for pm8921
 		    gpio1-gpio36 for pm8941
 		    gpio1-gpio22 for pm8994
-		    gpio1-gpio10 for pmi8994
+		    gpio1-gpio26 for pm8998
 		    gpio1-gpio22 for pma8084
 		    gpio1-gpio10 for pmi8994
 
-- 
Sent by a computer through tubes

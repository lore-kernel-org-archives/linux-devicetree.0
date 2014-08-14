From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH] pinctrl: qcom: apq8064: Correct interrupts in example
Date: Thu, 14 Aug 2014 15:59:21 -0700
Message-ID: <1408057161-6940-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kiran Padwal <kiran.padwal@smartplayin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The example in the binding document indicates that interrupt 32 is used
for the TLMM summary IRQ. Correct this to reduce the confusion.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 .../bindings/pinctrl/qcom,apq8064-pinctrl.txt      |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
index 0211c6d..92fae82 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
@@ -62,7 +62,7 @@ Example:
 		#gpio-cells = <2>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		interrupts = <0 32 0x4>;
+		interrupts = <0 16 0x4>;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&gsbi5_uart_default>;
-- 
1.7.9.5

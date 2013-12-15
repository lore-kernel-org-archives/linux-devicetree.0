From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH 4/4] pinctrl-msm: Rename compatible to be more specific
Date: Sat, 14 Dec 2013 23:01:54 -0800
Message-ID: <1387090914-4755-5-git-send-email-bjorn.andersson@sonymobile.com>
References: <1387090914-4755-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387090914-4755-1-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Use the more specific form 8974 for the compatible to reduce the
risk of future mishaps.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 ...sm8x74-pinctrl.txt => qcom,msm8974-pinctrl.txt} |    4 ++--
 drivers/pinctrl/pinctrl-msm8x74.c                  |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,msm8x74-pinctrl.txt => qcom,msm8974-pinctrl.txt} (97%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8x74-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
similarity index 97%
rename from Documentation/devicetree/bindings/pinctrl/qcom,msm8x74-pinctrl.txt
rename to Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
index 70ab78f..4c352be 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8x74-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.txt
@@ -1,4 +1,4 @@
-Qualcomm MSM8x74 TLMM block
+Qualcomm MSM8974 TLMM block
 
 Required properties:
 - compatible: "qcom,msm8x74-pinctrl"
@@ -59,7 +59,7 @@ Valid values for qcom,function are:
 Example:
 
 	msmgpio: pinctrl@fd510000 {
-		compatible = "qcom,msm8x74-pinctrl";
+		compatible = "qcom,msm8974-pinctrl";
 		reg = <0xfd510000 0x4000>;
 
 		gpio-controller;
diff --git a/drivers/pinctrl/pinctrl-msm8x74.c b/drivers/pinctrl/pinctrl-msm8x74.c
index c702e77..f944bf2 100644
--- a/drivers/pinctrl/pinctrl-msm8x74.c
+++ b/drivers/pinctrl/pinctrl-msm8x74.c
@@ -603,7 +603,7 @@ static int msm8x74_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id msm8x74_pinctrl_of_match[] = {
-	{ .compatible = "qcom,msm8x74-pinctrl", },
+	{ .compatible = "qcom,msm8974-pinctrl", },
 	{ },
 };
 
-- 
1.7.9.5

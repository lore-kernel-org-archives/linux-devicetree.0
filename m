From: Eric Engestrom <eric@engestrom.ch>
Subject: [PATCH 20/41] Documentation: dt: pinctrl: fix spelling mistake
Date: Mon, 25 Apr 2016 01:24:17 +0100
Message-ID: <1461543878-3639-21-git-send-email-eric@engestrom.ch>
References: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461543878-3639-1-git-send-email-eric@engestrom.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Eric Engestrom <eric@engestrom.ch>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn.andersson@sonymobile.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Eric Engestrom <eric@engestrom.ch>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index a90c812..a54c39e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -122,7 +122,7 @@ to specify in a pin configuration subnode:
 		    2: 1.5uA                    (PMIC_GPIO_PULL_UP_1P5)
 		    3: 31.5uA                   (PMIC_GPIO_PULL_UP_31P5)
 		    4: 1.5uA + 30uA boost       (PMIC_GPIO_PULL_UP_1P5_30)
-		    If this property is ommited 30uA strength will be used if
+		    If this property is omitted 30uA strength will be used if
 		    pull up is selected
 
 - bias-high-impedance:
-- 
2.8.0

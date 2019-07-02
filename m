From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: qcom: Document missing gpio nodes
Date: Tue,  2 Jul 2019 16:20:43 +0530
Message-ID: <20190702105045.27646-2-vkoul@kernel.org>
References: <20190702105045.27646-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702105045.27646-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The bindings for msm8998-pinctrl was missing gpio-ranges and
gpio-reserved-ranges, so document them as well

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../bindings/pinctrl/qcom,msm8998-pinctrl.txt          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
index e70c79bbbc5b..280af41eb86e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8998-pinctrl.txt
@@ -40,6 +40,14 @@ MSM8998 platform.
 	Definition: must be 2. Specifying the pin number and flags, as defined
 		    in <dt-bindings/gpio/gpio.h>
 
+- gpio-ranges:
+	Usage: required
+	Definition:  see ../gpio/gpio.txt
+
+- gpio-reserved-ranges:
+	Usage: optional
+	Definition: see ../gpio/gpio.txt
+
 Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
 a general description of GPIO and interrupt bindings.
 
@@ -175,6 +183,8 @@ Example:
 		interrupts = <0 208 0>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-ranges = <&tlmm 0 0 175>;
+		gpio-reserved-ranges = <0 4>, <81 4>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
-- 
2.20.1

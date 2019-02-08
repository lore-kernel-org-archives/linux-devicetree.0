From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v2 08/11] arm: dts: qcom: msm8660: add interrupt controller properties
Date: Thu,  7 Feb 2019 21:16:28 -0500
Message-ID: <20190208021631.30252-9-masneyb@onstation.org>
References: <20190208021631.30252-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208021631.30252-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, lee.jones@linaro.org
Cc: tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add interrupt controller properties now that ssbi-gpio is a proper
hierarchical IRQ chip. The interrupts property is no longer needed so
remove it.

This change was tested on an APQ8060 DragonBoard.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Tested-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes since v1:
- None

 arch/arm/boot/dts/qcom-msm8660.dtsi | 47 ++---------------------------
 1 file changed, 2 insertions(+), 45 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 993107ed1476..65a994f0e09b 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -292,51 +292,8 @@
 					compatible = "qcom,pm8058-gpio",
 						     "qcom,ssbi-gpio";
 					reg = <0x150>;
-					interrupt-parent = <&pm8058>;
-					interrupts = <192 IRQ_TYPE_NONE>,
-						     <193 IRQ_TYPE_NONE>,
-						     <194 IRQ_TYPE_NONE>,
-						     <195 IRQ_TYPE_NONE>,
-						     <196 IRQ_TYPE_NONE>,
-						     <197 IRQ_TYPE_NONE>,
-						     <198 IRQ_TYPE_NONE>,
-						     <199 IRQ_TYPE_NONE>,
-						     <200 IRQ_TYPE_NONE>,
-						     <201 IRQ_TYPE_NONE>,
-						     <202 IRQ_TYPE_NONE>,
-						     <203 IRQ_TYPE_NONE>,
-						     <204 IRQ_TYPE_NONE>,
-						     <205 IRQ_TYPE_NONE>,
-						     <206 IRQ_TYPE_NONE>,
-						     <207 IRQ_TYPE_NONE>,
-						     <208 IRQ_TYPE_NONE>,
-						     <209 IRQ_TYPE_NONE>,
-						     <210 IRQ_TYPE_NONE>,
-						     <211 IRQ_TYPE_NONE>,
-						     <212 IRQ_TYPE_NONE>,
-						     <213 IRQ_TYPE_NONE>,
-						     <214 IRQ_TYPE_NONE>,
-						     <215 IRQ_TYPE_NONE>,
-						     <216 IRQ_TYPE_NONE>,
-						     <217 IRQ_TYPE_NONE>,
-						     <218 IRQ_TYPE_NONE>,
-						     <219 IRQ_TYPE_NONE>,
-						     <220 IRQ_TYPE_NONE>,
-						     <221 IRQ_TYPE_NONE>,
-						     <222 IRQ_TYPE_NONE>,
-						     <223 IRQ_TYPE_NONE>,
-						     <224 IRQ_TYPE_NONE>,
-						     <225 IRQ_TYPE_NONE>,
-						     <226 IRQ_TYPE_NONE>,
-						     <227 IRQ_TYPE_NONE>,
-						     <228 IRQ_TYPE_NONE>,
-						     <229 IRQ_TYPE_NONE>,
-						     <230 IRQ_TYPE_NONE>,
-						     <231 IRQ_TYPE_NONE>,
-						     <232 IRQ_TYPE_NONE>,
-						     <233 IRQ_TYPE_NONE>,
-						     <234 IRQ_TYPE_NONE>,
-						     <235 IRQ_TYPE_NONE>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
 					gpio-controller;
 					#gpio-cells = <2>;
 
-- 
2.17.2

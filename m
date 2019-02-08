From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v2 09/11] arm: dts: qcom: mdm9615: add interrupt controller properties
Date: Thu,  7 Feb 2019 21:16:29 -0500
Message-ID: <20190208021631.30252-10-masneyb@onstation.org>
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

Note that the IRQs started at 24 instead of 192 like all of the other
PMICs. This is the same IRQs as the MPP for this board. qcom-pm8xxx.c
doesn't set the shared IRQs so this is highly likely to be a copy and
paste error.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v1:
- None

 arch/arm/boot/dts/qcom-mdm9615.dtsi | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index e49f67ad5dbc..02afc6a42005 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -323,13 +323,8 @@
 
 				pmicgpio: gpio@150 {
 					compatible = "qcom,pm8018-gpio", "qcom,ssbi-gpio";
-					interrupt-parent = <&pmicintc>;
-					interrupts = <24 IRQ_TYPE_NONE>,
-						     <25 IRQ_TYPE_NONE>,
-						     <26 IRQ_TYPE_NONE>,
-						     <27 IRQ_TYPE_NONE>,
-						     <28 IRQ_TYPE_NONE>,
-						     <29 IRQ_TYPE_NONE>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
 					gpio-controller;
 					#gpio-cells = <2>;
 				};
-- 
2.17.2

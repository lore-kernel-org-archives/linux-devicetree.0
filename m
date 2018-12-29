From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 3/3] ARM: dts: qcom: msm8974: add interrupt properties
Date: Sat, 29 Dec 2018 06:47:55 -0500
Message-ID: <20181229114755.8711-4-masneyb@onstation.org>
References: <20181229114755.8711-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181229114755.8711-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add interrupt properties now that spmi-gpio is a proper hierarchical IRQ
chip.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index 9a91b758f7aa..d0b7f0eff288 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -65,6 +65,9 @@
 			gpio-controller;
 			gpio-ranges = <&pm8941_gpios 0 0 36>;
 			#gpio-cells = <2>;
+			interrupt-parent = <&spmi_bus>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
 			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
 				     <0 0xc1 0 IRQ_TYPE_NONE>,
 				     <0 0xc2 0 IRQ_TYPE_NONE>,
-- 
2.17.2

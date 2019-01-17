From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v5 08/14] ARM: dts: qcom: pm8941: add interrupt controller properties
Date: Wed, 16 Jan 2019 19:32:28 -0500
Message-ID: <20190117003234.22127-9-masneyb@onstation.org>
References: <20190117003234.22127-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117003234.22127-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add interrupt controller properties now that spmi-gpio is a proper
hierarchical IRQ chip. The interrupts property is no longer needed so
remove it. Code was tested on the LG Nexus 5 (hammerhead) phone.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes since v4:
- None

Changes since v3:
- None

Changes since v2:
- Remove interrupt-parent property

Changes since v1:
- Interrupts are now two cells instead of four cells.
- Drop unnecessary interrupts property.

 arch/arm/boot/dts/qcom-pm8941.dtsi | 38 ++----------------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index 2515c5c217ac..e65049e0fb45 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -64,42 +64,8 @@
 			reg = <0xc000>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
-				     <0 0xc1 0 IRQ_TYPE_NONE>,
-				     <0 0xc2 0 IRQ_TYPE_NONE>,
-				     <0 0xc3 0 IRQ_TYPE_NONE>,
-				     <0 0xc4 0 IRQ_TYPE_NONE>,
-				     <0 0xc5 0 IRQ_TYPE_NONE>,
-				     <0 0xc6 0 IRQ_TYPE_NONE>,
-				     <0 0xc7 0 IRQ_TYPE_NONE>,
-				     <0 0xc8 0 IRQ_TYPE_NONE>,
-				     <0 0xc9 0 IRQ_TYPE_NONE>,
-				     <0 0xca 0 IRQ_TYPE_NONE>,
-				     <0 0xcb 0 IRQ_TYPE_NONE>,
-				     <0 0xcc 0 IRQ_TYPE_NONE>,
-				     <0 0xcd 0 IRQ_TYPE_NONE>,
-				     <0 0xce 0 IRQ_TYPE_NONE>,
-				     <0 0xcf 0 IRQ_TYPE_NONE>,
-				     <0 0xd0 0 IRQ_TYPE_NONE>,
-				     <0 0xd1 0 IRQ_TYPE_NONE>,
-				     <0 0xd2 0 IRQ_TYPE_NONE>,
-				     <0 0xd3 0 IRQ_TYPE_NONE>,
-				     <0 0xd4 0 IRQ_TYPE_NONE>,
-				     <0 0xd5 0 IRQ_TYPE_NONE>,
-				     <0 0xd6 0 IRQ_TYPE_NONE>,
-				     <0 0xd7 0 IRQ_TYPE_NONE>,
-				     <0 0xd8 0 IRQ_TYPE_NONE>,
-				     <0 0xd9 0 IRQ_TYPE_NONE>,
-				     <0 0xda 0 IRQ_TYPE_NONE>,
-				     <0 0xdb 0 IRQ_TYPE_NONE>,
-				     <0 0xdc 0 IRQ_TYPE_NONE>,
-				     <0 0xdd 0 IRQ_TYPE_NONE>,
-				     <0 0xde 0 IRQ_TYPE_NONE>,
-				     <0 0xdf 0 IRQ_TYPE_NONE>,
-				     <0 0xe0 0 IRQ_TYPE_NONE>,
-				     <0 0xe1 0 IRQ_TYPE_NONE>,
-				     <0 0xe2 0 IRQ_TYPE_NONE>,
-				     <0 0xe3 0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 
 			boost_bypass_n_pin: boost-bypass {
 				pins = "gpio21";
-- 
2.17.2

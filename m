From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v2 2/2] arm64: dts: mt8173: Fixup pinctrl nodes
Date: Fri, 1 May 2015 14:49:31 +0800
Message-ID: <1430462971-28195-2-git-send-email-yingjoe.chen@mediatek.com>
References: <1430462971-28195-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430462971-28195-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, srv_heupstream@mediatek.com, Hongzhou Yang <hongzhou.yang@mediatek.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>
List-Id: devicetree@vger.kernel.org

The 8173 pinctrl node doesn't follow dts convention. Fix them.
Also add a comment to explain pinctrl register usage to make it
more clear.

Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 924fdb6..4595196 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -106,14 +106,13 @@
 		compatible = "simple-bus";
 		ranges;
 
-		syscfg_pctl_a: syscfg_pctl_a@10005000 {
-			compatible = "mediatek,mt8173-pctl-a-syscfg", "syscon";
-			reg = <0 0x10005000 0 0x1000>;
-		};
-
-		pio: pinctrl@0x10005000 {
+		/*
+		 * Pinctrl access register at 0x10005000 through regmap.
+		 * Register 0x1000b000 is used by EINT.
+		 */
+		pio: pinctrl@10005000 {
 			compatible = "mediatek,mt8173-pinctrl";
-			reg = <0 0x1000B000 0 0x1000>;
+			reg = <0 0x1000b000 0 0x1000>;
 			mediatek,pctl-regmap = <&syscfg_pctl_a>;
 			pins-are-numbered;
 			gpio-controller;
@@ -121,8 +120,13 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-						<GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
-						<GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		syscfg_pctl_a: syscfg_pctl_a@10005000 {
+			compatible = "mediatek,mt8173-pctl-a-syscfg", "syscon";
+			reg = <0 0x10005000 0 0x1000>;
 		};
 
 		sysirq: intpol-controller@10200620 {
-- 
1.8.1.1.dirty

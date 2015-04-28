From: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/2] arm64: dts: mt8173: Fixup pinctrl nodes
Date: Tue, 28 Apr 2015 17:23:57 +0800
Message-ID: <1430213037-23831-2-git-send-email-yingjoe.chen@mediatek.com>
References: <1430213037-23831-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430213037-23831-1-git-send-email-yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The 8173 pinctrl node doesn't follow dts convention. Fix them.
Also add a comment to explain pinctrl register usage to make it
more clear.

Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 8346c0f..e4a30cd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -128,6 +128,7 @@
 		compatible = "simple-bus";
 		ranges;
 
+		/* Provide regmap for pinctrl driver */
 		syscfg_pctl_a: syscfg_pctl_a@10005000 {
 			compatible = "mediatek,mt8173-pctl-a-syscfg", "syscon";
 			reg = <0 0x10005000 0 0x1000>;
@@ -159,9 +160,13 @@
 			#reset-cells = <1>;
 		};
 
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
@@ -169,8 +174,8 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
-						<GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
-						<GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		sysirq: intpol-controller@10200620 {
-- 
1.8.1.1.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

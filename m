From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] arm: dts: mt2701: Sort DT nodes by register address
Date: Fri, 2 Dec 2016 10:06:39 +0800
Message-ID: <1480644399-14865-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch rearrange MT2701 DT nodes to keep them in ascending order.

Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
This patch is based on latest v4.9-next/dts branch of [1], to fix MT2701
DT nodes ordering.

[1] https://github.com/mbgg/linux-mediatek/tree/v4.9-next/dts

 arch/arm/boot/dts/mt2701.dtsi | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 7eab6f4..73f4b7c 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -96,24 +96,6 @@
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 	};
 
-	pio: pinctrl@10005000 {
-		compatible = "mediatek,mt2701-pinctrl";
-		reg = <0 0x1000b000 0 0x1000>;
-		mediatek,pctl-regmap = <&syscfg_pctl_a>;
-		pins-are-numbered;
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	syscfg_pctl_a: syscfg@10005000 {
-		compatible = "mediatek,mt2701-pctl-a-syscfg", "syscon";
-		reg = <0 0x10005000 0 0x1000>;
-	};
-
 	topckgen: syscon@10000000 {
 		compatible = "mediatek,mt2701-topckgen", "syscon";
 		reg = <0 0x10000000 0 0x1000>;
@@ -134,6 +116,24 @@
 		#reset-cells = <1>;
 	};
 
+	pio: pinctrl@10005000 {
+		compatible = "mediatek,mt2701-pinctrl";
+		reg = <0 0x1000b000 0 0x1000>;
+		mediatek,pctl-regmap = <&syscfg_pctl_a>;
+		pins-are-numbered;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	syscfg_pctl_a: syscfg@10005000 {
+		compatible = "mediatek,mt2701-pctl-a-syscfg", "syscon";
+		reg = <0 0x10005000 0 0x1000>;
+	};
+
 	watchdog: watchdog@10007000 {
 		compatible = "mediatek,mt2701-wdt",
 			     "mediatek,mt6589-wdt";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

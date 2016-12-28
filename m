From: James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH 1/3] arm: dts: mt2701: Sort DT nodes by register address
Date: Wed, 28 Dec 2016 13:46:44 +0800
Message-ID: <1482904006-44232-2-git-send-email-jamesjj.liao@mediatek.com>
References: <1482904006-44232-1-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482904006-44232-1-git-send-email-jamesjj.liao@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, James Liao <jamesjj.liao@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch rearrange MT2701 DT nodes to keep them in ascending order.

Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
---
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

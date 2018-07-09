Return-Path: <SRS0=UTzV=JZ=atomide.com=tony@kernel.org>
From: Tony Lindgren <tony@atomide.com>
Subject: [PATCH 3/5] ARM: dts: omap4: Probe watchdog 3 with ti-sysc
Date: Sun,  8 Jul 2018 23:36:10 -0700
Message-Id: <20180709063612.12025-4-tony@atomide.com>
In-Reply-To: <20180709063612.12025-1-tony@atomide.com>
References: <20180709063612.12025-1-tony@atomide.com>
To: linux-omap@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

Before updating wdt2 to probe with ti-sysc we want to have wdt3
probed with ti-sysc to avoid having them unnecessarily swap order.

With ti-sysc, we probe child devices at module_init time while
and until l4 abe interconnect is converted to use ti-sysc, wdt3
will probe earlier with legacy platform data.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -787,12 +787,33 @@
 			ti,hwmods = "wd_timer2";
 		};
 
-		wdt3: wdt@40130000 {
-			compatible = "ti,omap4-wdt", "ti,omap3-wdt";
-			reg = <0x40130000 0x80>, /* MPU private access */
-			      <0x49030000 0x80>; /* L3 Interconnect */
-			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+		target-module@40130000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
 			ti,hwmods = "wd_timer3";
+			reg = <0x40130000 0x4>,
+			      <0x40130010 0x4>,
+			      <0x40130014 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_EMUFREE |
+					 SYSC_OMAP2_SOFTRESET)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>,
+					<SYSC_IDLE_SMART_WKUP>;
+			ti,syss-mask = <1>;
+			/* Domains (V, P, C): abe, abe_pwrdm, abe_clkdm */
+			clocks = <&abe_clkctrl OMAP4_WD_TIMER3_CLKCTRL 0>;
+			clock-names = "fck";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x00000000 0x40130000 0x1000>, /* MPU private access */
+				 <0x49030000 0x49030000 0x0080>; /* L3 Interconnect */
+
+			wdt3: wdt@0 {
+				compatible = "ti,omap4-wdt", "ti,omap3-wdt";
+				reg = <0x0 0x80>;
+				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		mcpdm: mcpdm@40132000 {
-- 
2.17.1

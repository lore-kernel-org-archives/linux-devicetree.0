From: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 6/8] ARM: dts: keystone-hk-clocks: Add missing unit name to  clock nodes that have regs
Date: Fri, 15 Dec 2017 07:21:00 -0600
Message-ID: <20171215132102.435-7-nm@ti.com>
References: <20171215132102.435-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215132102.435-1-nm-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add the control register as the base for the clock nodes which are
missing them. This squashes some 36 warnings of the effect when built
with W=1.

Reported-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2hk-clocks.dtsi | 74 ++++++++++++++---------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2hk-clocks.dtsi b/arch/arm/boot/dts/keystone-k2hk-clocks.dtsi
index 142c8491ff54..c2a5fd19ff49 100644
--- a/arch/arm/boot/dts/keystone-k2hk-clocks.dtsi
+++ b/arch/arm/boot/dts/keystone-k2hk-clocks.dtsi
@@ -50,7 +50,7 @@ clocks {
 		reg-names = "control";
 	};
 
-	clktsip: clktsip {
+	clktsip: clktsip@2350000 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk16>;
@@ -60,7 +60,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clksrio: clksrio {
+	clksrio: clksrio@235002c {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk1rstiso13>;
@@ -70,7 +70,7 @@ clocks {
 		domain-id = <4>;
 	};
 
-	clkhyperlink0: clkhyperlink0 {
+	clkhyperlink0: clkhyperlink0@2350030 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk12>;
@@ -80,7 +80,7 @@ clocks {
 		domain-id = <5>;
 	};
 
-	clkgem1: clkgem1 {
+	clkgem1: clkgem1@2350040 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk1>;
@@ -90,7 +90,7 @@ clocks {
 		domain-id = <9>;
 	};
 
-	clkgem2: clkgem2 {
+	clkgem2: clkgem2@2350044 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk1>;
@@ -100,7 +100,7 @@ clocks {
 		domain-id = <10>;
 	};
 
-	clkgem3: clkgem3 {
+	clkgem3: clkgem3@2350048 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk1>;
@@ -110,7 +110,7 @@ clocks {
 		domain-id = <11>;
 	};
 
-	clkgem4: clkgem4 {
+	clkgem4: clkgem4@235004c {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk1>;
@@ -120,7 +120,7 @@ clocks {
 		domain-id = <12>;
 	};
 
-	clkgem5: clkgem5 {
+	clkgem5: clkgem5@2350050 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk1>;
@@ -130,7 +130,7 @@ clocks {
 		domain-id = <13>;
 	};
 
-	clkgem6: clkgem6 {
+	clkgem6: clkgem6@2350054 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk1>;
@@ -140,7 +140,7 @@ clocks {
 		domain-id = <14>;
 	};
 
-	clkgem7: clkgem7 {
+	clkgem7: clkgem7@2350058 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk1>;
@@ -150,7 +150,7 @@ clocks {
 		domain-id = <15>;
 	};
 
-	clkddr31: clkddr31 {
+	clkddr31: clkddr31@2350060 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -160,7 +160,7 @@ clocks {
 		domain-id = <16>;
 	};
 
-	clktac: clktac {
+	clktac: clktac@2350064 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -170,7 +170,7 @@ clocks {
 		domain-id = <17>;
 	};
 
-	clkrac01: clkrac01 {
+	clkrac01: clkrac01@2350068 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -180,7 +180,7 @@ clocks {
 		domain-id = <17>;
 	};
 
-	clkrac23: clkrac23 {
+	clkrac23: clkrac23@235006c {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -190,7 +190,7 @@ clocks {
 		domain-id = <18>;
 	};
 
-	clkfftc0: clkfftc0 {
+	clkfftc0: clkfftc0@2350070 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -200,7 +200,7 @@ clocks {
 		domain-id = <19>;
 	};
 
-	clkfftc1: clkfftc1 {
+	clkfftc1: clkfftc1@2350074 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -210,7 +210,7 @@ clocks {
 		domain-id = <19>;
 	};
 
-	clkfftc2: clkfftc2 {
+	clkfftc2: clkfftc2@2350078 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -220,7 +220,7 @@ clocks {
 		domain-id = <20>;
 	};
 
-	clkfftc3: clkfftc3 {
+	clkfftc3: clkfftc3@235007c {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -230,7 +230,7 @@ clocks {
 		domain-id = <20>;
 	};
 
-	clkfftc4: clkfftc4 {
+	clkfftc4: clkfftc4@2350080 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -240,7 +240,7 @@ clocks {
 		domain-id = <20>;
 	};
 
-	clkfftc5: clkfftc5 {
+	clkfftc5: clkfftc5@2350084 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -250,7 +250,7 @@ clocks {
 		domain-id = <20>;
 	};
 
-	clkaif: clkaif {
+	clkaif: clkaif@2350088 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -260,7 +260,7 @@ clocks {
 		domain-id = <21>;
 	};
 
-	clktcp3d0: clktcp3d0 {
+	clktcp3d0: clktcp3d0@235008c {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -270,7 +270,7 @@ clocks {
 		domain-id = <22>;
 	};
 
-	clktcp3d1: clktcp3d1 {
+	clktcp3d1: clktcp3d1@2350090 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -280,7 +280,7 @@ clocks {
 		domain-id = <22>;
 	};
 
-	clktcp3d2: clktcp3d2 {
+	clktcp3d2: clktcp3d2@2350094 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -290,7 +290,7 @@ clocks {
 		domain-id = <23>;
 	};
 
-	clktcp3d3: clktcp3d3 {
+	clktcp3d3: clktcp3d3@2350098 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -300,7 +300,7 @@ clocks {
 		domain-id = <23>;
 	};
 
-	clkvcp0: clkvcp0 {
+	clkvcp0: clkvcp0@235009c {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -310,7 +310,7 @@ clocks {
 		domain-id = <24>;
 	};
 
-	clkvcp1: clkvcp1 {
+	clkvcp1: clkvcp1@23500a0 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -320,7 +320,7 @@ clocks {
 		domain-id = <24>;
 	};
 
-	clkvcp2: clkvcp2 {
+	clkvcp2: clkvcp2@23500a4 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -330,7 +330,7 @@ clocks {
 		domain-id = <24>;
 	};
 
-	clkvcp3: clkvcp3 {
+	clkvcp3: clkvcp3@23500a8 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -340,7 +340,7 @@ clocks {
 		domain-id = <24>;
 	};
 
-	clkvcp4: clkvcp4 {
+	clkvcp4: clkvcp4@23500ac {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -350,7 +350,7 @@ clocks {
 		domain-id = <25>;
 	};
 
-	clkvcp5: clkvcp5 {
+	clkvcp5: clkvcp5@23500b0 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -360,7 +360,7 @@ clocks {
 		domain-id = <25>;
 	};
 
-	clkvcp6: clkvcp6 {
+	clkvcp6: clkvcp6@23500b4 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -370,7 +370,7 @@ clocks {
 		domain-id = <25>;
 	};
 
-	clkvcp7: clkvcp7 {
+	clkvcp7: clkvcp7@23500b8 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -380,7 +380,7 @@ clocks {
 		domain-id = <25>;
 	};
 
-	clkbcp: clkbcp {
+	clkbcp: clkbcp@23500bc {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -390,7 +390,7 @@ clocks {
 		domain-id = <26>;
 	};
 
-	clkdxb: clkdxb {
+	clkdxb: clkdxb@23500c0 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
@@ -400,7 +400,7 @@ clocks {
 		domain-id = <27>;
 	};
 
-	clkhyperlink1: clkhyperlink1 {
+	clkhyperlink1: clkhyperlink1@23500c4 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk12>;
@@ -410,7 +410,7 @@ clocks {
 		domain-id = <28>;
 	};
 
-	clkxge: clkxge {
+	clkxge: clkxge@23500c8 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk13>;
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

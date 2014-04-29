From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 8/8] ARM: dts: rockchip: convert pinctrl nodes to new bindings
Date: Wed, 30 Apr 2014 00:10:41 +0200
Message-ID: <6633845.bKvtTVmUrN@diego>
References: <1414506.B4e2jZujVm@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414506.B4e2jZujVm@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, max.schwarz-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce the grf syscon and convert the pinctrl drivers for rk3066 and rk3188
to use it, instead of mapping the grf registers themselfs.

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/rk3066a.dtsi | 2 +-
 arch/arm/boot/dts/rk3188.dtsi  | 9 ++++-----
 arch/arm/boot/dts/rk3xxx.dtsi  | 9 +++++++--
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 4d4dfbb..048c5de 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -79,7 +79,7 @@
 
 		pinctrl@20008000 {
 			compatible = "rockchip,rk3066a-pinctrl";
-			reg = <0x20008000 0x150>;
+			rockchip,grf = <&grf>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
diff --git a/arch/arm/boot/dts/rk3188.dtsi b/arch/arm/boot/dts/rk3188.dtsi
index ed9a70a..a494fb0 100644
--- a/arch/arm/boot/dts/rk3188.dtsi
+++ b/arch/arm/boot/dts/rk3188.dtsi
@@ -75,17 +75,16 @@
 
 		pinctrl@20008000 {
 			compatible = "rockchip,rk3188-pinctrl";
-			reg = <0x20008000 0xa0>,
-			      <0x20008164 0x1a0>;
-			reg-names = "base", "pull";
+			rockchip,grf = <&grf>;
+			rockchip,pmu = <&pmu>;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
 
 			gpio0: gpio0@0x2000a000 {
 				compatible = "rockchip,rk3188-gpio-bank0";
-				reg = <0x2000a000 0x100>,
-				      <0x20004064 0x8>;
+				reg = <0x2000a000 0x100>;
 				interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk_gates8 9>;
 
diff --git a/arch/arm/boot/dts/rk3xxx.dtsi b/arch/arm/boot/dts/rk3xxx.dtsi
index 26e5a96..2adf1cc9e 100644
--- a/arch/arm/boot/dts/rk3xxx.dtsi
+++ b/arch/arm/boot/dts/rk3xxx.dtsi
@@ -31,11 +31,16 @@
 			reg = <0x1013c000 0x100>;
 		};
 
-		pmu@20004000 {
-			compatible = "rockchip,rk3066-pmu";
+		pmu: pmu@20004000 {
+			compatible = "rockchip,rk3066-pmu", "syscon";
 			reg = <0x20004000 0x100>;
 		};
 
+		grf: grf@20008000 {
+			compatible = "syscon";
+			reg = <0x20008000 0x200>;
+		};
+
 		gic: interrupt-controller@1013d000 {
 			compatible = "arm,cortex-a9-gic";
 			interrupt-controller;
-- 
1.9.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

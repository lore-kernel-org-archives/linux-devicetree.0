From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: dts: berlin: correct BG2Q's SM GPIO location.
Date: Fri, 26 Dec 2014 16:58:01 +0800
Message-ID: <1419584281-4811-4-git-send-email-jszhang@marvell.com>
References: <1419584281-4811-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419584281-4811-1-git-send-email-jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The gpio4 and gpio5 are in 0xf7fc0000 apb which is located in the SM domain.
This patch moves gpio4 and gpio5 to the correct location. This patch also
renames them as the following to match the names we internally used in
marvell:
	gpio4 -> sm_gpio1
	gpio5 -> sm_gpio0
	porte -> portf
	portf -> porte

This also matches what we did for BG2 and BG2CD's SM GPIO.

Signed-off-by: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/berlin2q.dtsi | 60 ++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin2q.dtsi
index 41a683f..f0ddbec 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -356,36 +356,6 @@
 				interrupt-parent = <&gic>;
 				interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			};
-
-			gpio4: gpio@5000 {
-				compatible = "snps,dw-apb-gpio";
-				reg = <0x5000 0x400>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				porte: gpio-port@4 {
-					compatible = "snps,dw-apb-gpio-port";
-					gpio-controller;
-					#gpio-cells = <2>;
-					snps,nr-gpios = <32>;
-					reg = <0>;
-				};
-			};
-
-			gpio5: gpio@c000 {
-				compatible = "snps,dw-apb-gpio";
-				reg = <0xc000 0x400>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				portf: gpio-port@5 {
-					compatible = "snps,dw-apb-gpio-port";
-					gpio-controller;
-					#gpio-cells = <2>;
-					snps,nr-gpios = <32>;
-					reg = <0>;
-				};
-			};
 		};
 
 		chip: chip-control@ea0000 {
@@ -474,6 +444,21 @@
 			ranges = <0 0xfc0000 0x10000>;
 			interrupt-parent = <&sic>;
 
+			sm_gpio1: gpio@5000 {
+				compatible = "snps,dw-apb-gpio";
+				reg = <0x5000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				portf: gpio-port@5 {
+					compatible = "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells = <2>;
+					snps,nr-gpios = <32>;
+					reg = <0>;
+				};
+			};
+
 			i2c2: i2c@7000 {
 				compatible = "snps,designware-i2c";
 				#address-cells = <1>;
@@ -524,6 +509,21 @@
 				status = "disabled";
 			};
 
+			sm_gpio0: gpio@c000 {
+				compatible = "snps,dw-apb-gpio";
+				reg = <0xc000 0x400>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				porte: gpio-port@4 {
+					compatible = "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells = <2>;
+					snps,nr-gpios = <32>;
+					reg = <0>;
+				};
+			};
+
 			sysctrl: pin-controller@d000 {
 				compatible = "marvell,berlin2q-system-ctrl";
 				reg = <0xd000 0x100>;
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

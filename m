From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2 01/23] ARM: dts: emev2: Fix W=1 dtc warnings
Date: Fri, 20 May 2016 09:09:52 +0200
Message-ID: <1463728214-13838-2-git-send-email-geert+renesas@glider.be>
References: <1463728214-13838-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463728214-13838-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Warning (unit_address_vs_reg): Node /clocks@e0110000/iic0_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/iic0_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/iic1_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/iic1_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usia_u0_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u1_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u2_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u3_sclkdiv has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usia_u0_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u1_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u2_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/usib_u3_sclk has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /clocks@e0110000/sti_sclk has a reg or ranges property, but no unit name

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
v2:
  - No changes.
---
 arch/arm/boot/dts/emev2.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/emev2.dtsi b/arch/arm/boot/dts/emev2.dtsi
index bcce6f50c93d9d25..cd119400f440bb5a 100644
--- a/arch/arm/boot/dts/emev2.dtsi
+++ b/arch/arm/boot/dts/emev2.dtsi
@@ -69,25 +69,25 @@
 			clock-frequency = <32768>;
 			#clock-cells = <0>;
 		};
-		iic0_sclkdiv: iic0_sclkdiv {
+		iic0_sclkdiv: iic0_sclkdiv@624,0 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x624 0>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		iic0_sclk: iic0_sclk {
+		iic0_sclk: iic0_sclk@48c,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x48c 1>;
 			clocks = <&iic0_sclkdiv>;
 			#clock-cells = <0>;
 		};
-		iic1_sclkdiv: iic1_sclkdiv {
+		iic1_sclkdiv: iic1_sclkdiv@624,16 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x624 16>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		iic1_sclk: iic1_sclk {
+		iic1_sclk: iic1_sclk@490,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x490 1>;
 			clocks = <&iic1_sclkdiv>;
@@ -100,55 +100,55 @@
 			clock-mult = <7000>;
 			#clock-cells = <0>;
 		};
-		usia_u0_sclkdiv: usia_u0_sclkdiv {
+		usia_u0_sclkdiv: usia_u0_sclkdiv@610,0 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x610 0>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		usib_u1_sclkdiv: usib_u1_sclkdiv {
+		usib_u1_sclkdiv: usib_u1_sclkdiv@65c,0 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x65c 0>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		usib_u2_sclkdiv: usib_u2_sclkdiv {
+		usib_u2_sclkdiv: usib_u2_sclkdiv@65c,16 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x65c 16>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		usib_u3_sclkdiv: usib_u3_sclkdiv {
+		usib_u3_sclkdiv: usib_u3_sclkdiv@660,0 {
 			compatible = "renesas,emev2-smu-clkdiv";
 			reg = <0x660 0>;
 			clocks = <&pll3_fo>;
 			#clock-cells = <0>;
 		};
-		usia_u0_sclk: usia_u0_sclk {
+		usia_u0_sclk: usia_u0_sclk@4a0,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x4a0 1>;
 			clocks = <&usia_u0_sclkdiv>;
 			#clock-cells = <0>;
 		};
-		usib_u1_sclk: usib_u1_sclk {
+		usib_u1_sclk: usib_u1_sclk@4b8,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x4b8 1>;
 			clocks = <&usib_u1_sclkdiv>;
 			#clock-cells = <0>;
 		};
-		usib_u2_sclk: usib_u2_sclk {
+		usib_u2_sclk: usib_u2_sclk@4bc,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x4bc 1>;
 			clocks = <&usib_u2_sclkdiv>;
 			#clock-cells = <0>;
 		};
-		usib_u3_sclk: usib_u3_sclk {
+		usib_u3_sclk: usib_u3_sclk@4c0,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x4c0 1>;
 			clocks = <&usib_u3_sclkdiv>;
 			#clock-cells = <0>;
 		};
-		sti_sclk: sti_sclk {
+		sti_sclk: sti_sclk@528,1 {
 			compatible = "renesas,emev2-smu-gclk";
 			reg = <0x528 1>;
 			clocks = <&c32ki>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

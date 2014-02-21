From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2] ARM: bcm2835: fix clock DT node names
Date: Thu, 20 Feb 2014 22:29:47 -0700
Message-ID: <1392960587-29355-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

DT nodes should be named according to the type of object that they
represent rather than the identity. DT nodes that contain a reg
property should include a unit address in their name. Fix these issues.

Add clock-output-names properties to the nodes so that the clocks get
named something meaningful. This works around the fact that the fixed
clock driver names clocks after the short node name, i.e. not including
the unit address.

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
v2: Add clock-output-names properties.
---
 arch/arm/boot/dts/bcm2835.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index a2d4889..b8473c4 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -155,24 +155,27 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		clk_mmc: mmc {
+		clk_mmc: clock@0 {
 			compatible = "fixed-clock";
 			reg = <0>;
 			#clock-cells = <0>;
+			clock-output-names = "mmc";
 			clock-frequency = <100000000>;
 		};
 
-		clk_i2c: i2c {
+		clk_i2c: clock@1 {
 			compatible = "fixed-clock";
 			reg = <1>;
 			#clock-cells = <0>;
+			clock-output-names = "i2c";
 			clock-frequency = <250000000>;
 		};
 
-		clk_spi: spi {
+		clk_spi: clock@2 {
 			compatible = "fixed-clock";
 			reg = <2>;
 			#clock-cells = <0>;
+			clock-output-names = "spi";
 			clock-frequency = <250000000>;
 		};
 	};
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

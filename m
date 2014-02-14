From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] ARM: bcm2835: fix clock DT node names
Date: Thu, 13 Feb 2014 23:16:53 -0700
Message-ID: <1392358613-19962-2-git-send-email-swarren@wwwdotorg.org>
References: <1392358613-19962-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392358613-19962-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

DT nodes should be named according to the type of object that they
represent rather than the identity. DT nodes that contain a reg
property should include a unit address in their name. Fix these issues.

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
This is the bcm2835 patch which depends on patch 1. I guess this could
also go through the clk tree if that makes it easier, although there's
always the small risk of conflicts if you do that.

 arch/arm/boot/dts/bcm2835.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index a2d4889..1cf1ae7 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -155,21 +155,21 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		clk_mmc: mmc {
+		clk_mmc: clock@0 {
 			compatible = "fixed-clock";
 			reg = <0>;
 			#clock-cells = <0>;
 			clock-frequency = <100000000>;
 		};
 
-		clk_i2c: i2c {
+		clk_i2c: clock@1 {
 			compatible = "fixed-clock";
 			reg = <1>;
 			#clock-cells = <0>;
 			clock-frequency = <250000000>;
 		};
 
-		clk_spi: spi {
+		clk_spi: clock@2 {
 			compatible = "fixed-clock";
 			reg = <2>;
 			#clock-cells = <0>;
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

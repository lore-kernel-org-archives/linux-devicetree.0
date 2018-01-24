From: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
Subject: [PATCH] ARM: dts: consistently use 'atmel' as at24 manufacturer in cyclone5
Date: Wed, 24 Jan 2018 22:33:14 +0100
Message-ID: <20180124213314.4546-1-brgl@bgdev.pl>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Using 'at' or 'at24' as the <manufacturer> part of the compatible
string is now deprecated. Use a correct value: 'atmel,<model>'.

Signed-off-by: Bartosz Golaszewski <brgl-ARrdPY/1zhM@public.gmane.org>
---
 arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
index 2459d133f1be..f50b19447de6 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
+++ b/arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dts
@@ -161,7 +161,7 @@
 	};
 
 	at24@50 {
-		compatible = "at24,24c01";
+		compatible = "atmel,24c01";
 		pagesize = <8>;
 		reg = <0x50>;
 	};
@@ -213,7 +213,7 @@
 			#size-cells = <0>;
 			reg = <6>;
 			eeprom@51 {
-				compatible = "at,24c01";
+				compatible = "atmel,24c01";
 				pagesize = <8>;
 				reg = <0x51>;
 			};
@@ -224,7 +224,7 @@
 			#size-cells = <0>;
 			reg = <7>;
 			eeprom@51 {
-				compatible = "at,24c01";
+				compatible = "atmel,24c01";
 				pagesize = <8>;
 				reg = <0x51>;
 			};
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Javier Martinez Canillas <javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [RESEND PATCH 3/4] ARM: dts: lpc18xx: Add generic compatible string for I2C EEPROM
Date: Fri, 24 Nov 2017 17:27:49 +0100
Message-ID: <20171124162750.18756-3-javierm@redhat.com>
References: <20171124162750.18756-1-javierm@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171124162750.18756-1-javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Javier Martinez Canillas <javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

So add this generic fallback to the device node compatible string to make
the device to match the driver using the OF device ID table.

Signed-off-by: Javier Martinez Canillas <javierm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---

 arch/arm/boot/dts/lpc4337-ciaa.dts          | 6 +++---
 arch/arm/boot/dts/lpc4350-hitex-eval.dts    | 2 +-
 arch/arm/boot/dts/lpc4357-ea4357-devkit.dts | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/lpc4337-ciaa.dts b/arch/arm/boot/dts/lpc4337-ciaa.dts
index 7c16d639a1b4..beddaba85393 100644
--- a/arch/arm/boot/dts/lpc4337-ciaa.dts
+++ b/arch/arm/boot/dts/lpc4337-ciaa.dts
@@ -174,17 +174,17 @@
 	clock-frequency = <400000>;
 
 	eeprom@50 {
-		compatible = "microchip,24c512";
+		compatible = "microchip,24c512", "atmel,24c512";
 		reg = <0x50>;
 	};
 
 	eeprom@51 {
-		compatible = "microchip,24c02";
+		compatible = "microchip,24c02", "atmel,24c02";
 		reg = <0x51>;
 	};
 
 	eeprom@54 {
-		compatible = "microchip,24c512";
+		compatible = "microchip,24c512", "atmel,24c512";
 		reg = <0x54>;
 	};
 };
diff --git a/arch/arm/boot/dts/lpc4350-hitex-eval.dts b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
index 874c75d44013..8b973f537d3a 100644
--- a/arch/arm/boot/dts/lpc4350-hitex-eval.dts
+++ b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
@@ -429,7 +429,7 @@
 	};
 
 	eeprom@50 {
-		compatible = "nxp,24c02";
+		compatible = "nxp,24c02", "atmel,24c02";
 		reg = <0x50>;
 	};
 
diff --git a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
index 9b5fad622522..02b23fa29d75 100644
--- a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
+++ b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
@@ -490,7 +490,7 @@
 	};
 
 	eeprom@57 {
-		compatible = "microchip,24c64";
+		compatible = "microchip,24c64", "atmel,24c64";
 		reg = <0x57>;
 	};
 };
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH v2 09/22] ARM: dts: lpc18xx: Add generic compatible string for I2C EEPROM
Date: Thu, 13 Apr 2017 15:28:26 -0300
Message-ID: <20170413182839.25381-10-javier@osg.samsung.com>
References: <20170413182839.25381-1-javier@osg.samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170413182839.25381-1-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The at24 driver allows to register I2C EEPROM chips using different vendor
and devices, but the I2C subsystem does not take the vendor into account
when matching using the I2C table since it only has device entries.

But when matching using an OF table, both the vendor and device has to be
taken into account so the driver defines only a set of compatible strings
using the "atmel" vendor as a generic fallback for compatible I2C devices.

So add this generic fallback to the device node compatible string to make
the device to match the driver using the OF device ID table.

Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
---

Changes in v2: None

 arch/arm/boot/dts/lpc4337-ciaa.dts          | 6 +++---
 arch/arm/boot/dts/lpc4350-hitex-eval.dts    | 2 +-
 arch/arm/boot/dts/lpc4357-ea4357-devkit.dts | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/lpc4337-ciaa.dts b/arch/arm/boot/dts/lpc4337-ciaa.dts
index 7c16d639a1b4..8b584b39db7d 100644
--- a/arch/arm/boot/dts/lpc4337-ciaa.dts
+++ b/arch/arm/boot/dts/lpc4337-ciaa.dts
@@ -174,17 +174,17 @@
 	clock-frequency = <400000>;
 
 	eeprom@50 {
-		compatible = "microchip,24c512";
+		compatible = "microchip,24c512","atmel,24c512";
 		reg = <0x50>;
 	};
 
 	eeprom@51 {
-		compatible = "microchip,24c02";
+		compatible = "microchip,24c02","atmel,24c02";
 		reg = <0x51>;
 	};
 
 	eeprom@54 {
-		compatible = "microchip,24c512";
+		compatible = "microchip,24c512","atmel,24c512";
 		reg = <0x54>;
 	};
 };
diff --git a/arch/arm/boot/dts/lpc4350-hitex-eval.dts b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
index 874c75d44013..32a512926a8f 100644
--- a/arch/arm/boot/dts/lpc4350-hitex-eval.dts
+++ b/arch/arm/boot/dts/lpc4350-hitex-eval.dts
@@ -429,7 +429,7 @@
 	};
 
 	eeprom@50 {
-		compatible = "nxp,24c02";
+		compatible = "nxp,24c02","atmel,24c02";
 		reg = <0x50>;
 	};
 
diff --git a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
index 9b5fad622522..7000a565f50b 100644
--- a/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
+++ b/arch/arm/boot/dts/lpc4357-ea4357-devkit.dts
@@ -490,7 +490,7 @@
 	};
 
 	eeprom@57 {
-		compatible = "microchip,24c64";
+		compatible = "microchip,24c64","atmel,24c64";
 		reg = <0x57>;
 	};
 };
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

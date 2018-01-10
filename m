From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: [PATCH] ARM: lpc3250: fix uda1380 gpio numbers
Date: Wed, 10 Jan 2018 17:22:00 +0100
Message-ID: <20180110162220.224945-1-arnd@arndb.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

dtc warns about obviously incorrect GPIO numbers for the audio codec
on both lpc32xx boards:

arch/arm/boot/dts/lpc3250-phy3250.dtb: Warning (gpios_property): reset-gpio property size (12) too small for cell size 3 in /ahb/apb/i2c@400A0000/uda1380@18
arch/arm/boot/dts/lpc3250-phy3250.dtb: Warning (gpios_property): power-gpio property size (12) too small for cell size 3 in /ahb/apb/i2c@400A0000/uda1380@18
arch/arm/boot/dts/lpc3250-ea3250.dtb: Warning (gpios_property): reset-gpio property size (12) too small for cell size 3 in /ahb/apb/i2c@400A0000/uda1380@18
arch/arm/boot/dts/lpc3250-ea3250.dtb: Warning (gpios_property): power-gpio property size (12) too small for cell size 3 in /ahb/apb/i2c@400A0000/uda1380@18

It looks like the nodes are written for a different binding that combines
the GPIO number into a single number rather than a bank/number pair.
I found the right numbers on stackexchange.com, so this patch fixes
the warning and has a reasonable chance of getting things to actually
work.

Link: https://unix.stackexchange.com/questions/59497/alsa-asoc-how-to-correctly-load-devices-drivers/62217#62217
Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 arch/arm/boot/dts/lpc3250-ea3250.dts  | 4 ++--
 arch/arm/boot/dts/lpc3250-phy3250.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/lpc3250-ea3250.dts b/arch/arm/boot/dts/lpc3250-ea3250.dts
index c43adb7b4d7c..58ea0a4e7afa 100644
--- a/arch/arm/boot/dts/lpc3250-ea3250.dts
+++ b/arch/arm/boot/dts/lpc3250-ea3250.dts
@@ -156,8 +156,8 @@
 	uda1380: uda1380@18 {
 		compatible = "nxp,uda1380";
 		reg = <0x18>;
-		power-gpio = <&gpio 0x59 0>;
-		reset-gpio = <&gpio 0x51 0>;
+		power-gpio = <&gpio 3 10 0>;
+		reset-gpio = <&gpio 3 2 0>;
 		dac-clk = "wspll";
 	};
 
diff --git a/arch/arm/boot/dts/lpc3250-phy3250.dts b/arch/arm/boot/dts/lpc3250-phy3250.dts
index c72eb9845603..1e1c2f517a82 100644
--- a/arch/arm/boot/dts/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/lpc3250-phy3250.dts
@@ -81,8 +81,8 @@
 	uda1380: uda1380@18 {
 		compatible = "nxp,uda1380";
 		reg = <0x18>;
-		power-gpio = <&gpio 0x59 0>;
-		reset-gpio = <&gpio 0x51 0>;
+		power-gpio = <&gpio 3 10 0>;
+		reset-gpio = <&gpio 3 2 0>;
 		dac-clk = "wspll";
 	};
 
-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

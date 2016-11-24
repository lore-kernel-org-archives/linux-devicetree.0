From: Fabien Parent <fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] ARM: dts: da850-lcdk: Add ethernet0 alias to DT
Date: Thu, 24 Nov 2016 15:35:45 +0100
Message-ID: <20161124143545.12817-1-fparent@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Fabien Parent <fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to avoid Linux generating a random mac address on every boot,
add an ethernet0 alias that will allow u-boot to patch the dtb with
the MAC address programmed into the EEPROM.

Signed-off-by: Fabien Parent <fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/da850-lcdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
index 7b8ab21..18dfec93 100644
--- a/arch/arm/boot/dts/da850-lcdk.dts
+++ b/arch/arm/boot/dts/da850-lcdk.dts
@@ -13,6 +13,7 @@
 
 	aliases {
 		serial2 = &serial2;
+		ethernet0 = &eth0;
 	};
 
 	chosen {
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

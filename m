From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 5/9] ARM64: dts: meson-gxl: libretech-cc: add card regulator settle times
Date: Thu, 31 Aug 2017 15:52:22 +0200
Message-ID: <20170831135226.19784-6-jbrunet@baylibre.com>
References: <20170831135226.19784-1-jbrunet@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170831135226.19784-1-jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Changing the card voltage on the cc is not instantaneous, especially
when switching from 3.3v to 1.8v.

It take at least 30ms for the regulator to go from 3.3v to 1.8v. Add
margin to that to make sure we don't upset the sdcard during the voltage
switch

Fixes: 61ff2af9b278 ("ARM64: dts: fixup libretech cc definition")
Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index a014c052241e..7d252168c2fa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -91,6 +91,9 @@
 
 		states = <3300000 0>,
 			 <1800000 1>;
+
+		regulator-settling-time-up-us = <200>;
+		regulator-settling-time-down-us = <50000>;
 	};
 
 	vddio_boot: regulator-vddio_boot {
-- 
2.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

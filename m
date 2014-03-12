From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ARM: dts: bcm28155-ap: leave camldo1 on to fix reboot
Date: Wed, 12 Mar 2014 09:14:39 -0400
Message-ID: <1394630079-12063-1-git-send-email-mporter@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The BCM28155-AP board has a bootloader that expects the camldo1
regulator to be enabled on entry. Currently, the camldo1 regulator
is disabled when no longer in use as is the case during a reboot /
warm reset. This causes the early bootloader to hang upon entry. Add
regulator-always-on to the camldo1 constraint to fix reboot.

Reported-by: Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
[Depends on BCM59056 regulator series dts support:
 http://www.gossamer-threads.com/lists/linux/kernel/1885489]

 arch/arm/boot/dts/bcm28155-ap.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/bcm28155-ap.dts b/arch/arm/boot/dts/bcm28155-ap.dts
index 99ff0c1..cc1303c 100644
--- a/arch/arm/boot/dts/bcm28155-ap.dts
+++ b/arch/arm/boot/dts/bcm28155-ap.dts
@@ -94,6 +94,7 @@
 		camldo1_reg: camldo1 {
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
 		};
 
 		sdldo_reg: sdldo {
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

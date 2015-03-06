From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/2] ARM: imx6sl-evk: set swbst_reg as vbus's parent reg
Date: Fri, 6 Mar 2015 16:04:21 +0800
Message-ID: <1425629061-8995-2-git-send-email-peter.chen@freescale.com>
References: <1425629061-8995-1-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425629061-8995-1-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

USB vbus 5V is from PMIC SWBST, so set swbst_reg as vbus's
parent reg, it fixed a bug that the voltage of vbus is incorrect
due to swbst_reg is disabled after boots up.

Cc: stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6sl-evk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6sl-evk.dts b/arch/arm/boot/dts/imx6sl-evk.dts
index fda4932..945887d 100644
--- a/arch/arm/boot/dts/imx6sl-evk.dts
+++ b/arch/arm/boot/dts/imx6sl-evk.dts
@@ -52,6 +52,7 @@
 			regulator-max-microvolt = <5000000>;
 			gpio = <&gpio4 0 0>;
 			enable-active-high;
+			vin-supply = <&swbst_reg>;
 		};
 
 		reg_usb_otg2_vbus: regulator@1 {
@@ -62,6 +63,7 @@
 			regulator-max-microvolt = <5000000>;
 			gpio = <&gpio4 2 0>;
 			enable-active-high;
+			vin-supply = <&swbst_reg>;
 		};
 
 		reg_aud3v: regulator@2 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

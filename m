From: Winter Wang <wente.wang-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6ul-pico-hobbit: add adc081c support
Date: Wed, 31 Aug 2016 20:26:34 +0800
Message-ID: <1472646394-23772-1-git-send-email-wente.wang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

enable ADC081C on pico-hobbit

Change-Id: Ib1575b50dcf32b74abe0ab618ddc55999d19ee47
Signed-off-by: Winter Wang <wente.wang-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/imx6ul-pico-hobbit.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
index c72ee8b..b400582 100644
--- a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
+++ b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
@@ -220,6 +220,12 @@
 			};
 		};
 	};
+
+	adc: adc081c {
+		compatible = "ti,adc081c";
+		reg = <0x50>;
+		vref-supply = <&reg_3p3v>;
+	};
 };
 
 &i2c2 {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH] ARM: dts: mx23: fix iio-hwmon support
Date: Tue,  2 Jun 2015 22:03:28 +0000
Message-ID: <1433282608-16257-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In order to get iio-hwmon support, the lradc must be declared as an
iio provider. So fix this issue by adding the #io-channel-cells property.

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Fixes: bd798f9c7b30 ("ARM: dts: mxs: Add iio-hwmon to mx23 soc")
---
 arch/arm/boot/dts/imx23.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx23.dtsi b/arch/arm/boot/dts/imx23.dtsi
index c892d58..b995333 100644
--- a/arch/arm/boot/dts/imx23.dtsi
+++ b/arch/arm/boot/dts/imx23.dtsi
@@ -468,6 +468,7 @@
 				interrupts = <36 37 38 39 40 41 42 43 44>;
 				status = "disabled";
 				clocks = <&clks 26>;
+				#io-channel-cells = <1>;
 			};
 
 			spdif@80054000 {
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

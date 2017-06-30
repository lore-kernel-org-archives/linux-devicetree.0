From: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6q-bx50v3: disable SD card
Date: Fri, 30 Jun 2017 15:35:57 +0200
Message-ID: <20170630133557.17129-1-romain.perier@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>, Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>

Default boot medium must be internal eMMC, we don't want the SDIO to be
used for these devices. This commit disables the SD card interface
for GE Healthcare Bx50v3 devices.

Signed-off-by: Ian Ray <ian.ray-JJi787mZWgc@public.gmane.org>
Signed-off-by: Romain Perier <romain.perier-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-bx50v3.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6q-bx50v3.dtsi b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
index 75201ca..25466372 100644
--- a/arch/arm/boot/dts/imx6q-bx50v3.dtsi
+++ b/arch/arm/boot/dts/imx6q-bx50v3.dtsi
@@ -326,3 +326,7 @@
 		tcxo-clock-frequency = <26000000>;
 	};
 };
+
+&usdhc2 {
+	status = "disabled";
+};
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

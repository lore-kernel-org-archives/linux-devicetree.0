From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 3/4] ARM: dts: imx7d-cl-som: Fix OTG power pinctrl
Date: Thu, 19 Jan 2017 10:09:23 +0100
Message-ID: <20170119090924.19636-4-s.hauer@pengutronix.de>
References: <20170119090924.19636-1-s.hauer@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170119090924.19636-1-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

GPIO01_IO05 is controlled by the LPSR iomux controller, so attach
the corresponding pin to this controller.

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx7d-cl-som-imx7.dts | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
index 58b09bf1ba2d..1135bc99b3e7 100644
--- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
+++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
@@ -261,12 +261,6 @@
 		>;
 	};
 
-	pinctrl_usbotg1: usbotg1grp {
-		fsl,pins = <
-			MX7D_PAD_GPIO1_IO05__GPIO1_IO5		0x14 /* OTG PWREN */
-		>;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX7D_PAD_SD3_CMD__SD3_CMD		0x59
@@ -283,3 +277,11 @@
 		>;
 	};
 };
+
+&iomuxc_lpsr {
+	pinctrl_usbotg1: usbotg1grp {
+		fsl,pins = <
+			MX7D_PAD_GPIO1_IO05__GPIO1_IO5		0x14 /* OTG PWREN */
+		>;
+	};
+};
\ No newline at end of file
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

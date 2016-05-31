From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 1/3] ARM: dts: imx28: Use generic uart-has-rtscts DT property
Date: Tue, 31 May 2016 16:31:50 +0200
Message-ID: <1464705112-21609-2-git-send-email-geert+renesas@glider.be>
References: <1464705112-21609-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464705112-21609-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As of commit 182cdcb8bb16e687 ("serial: mxs-auart: Use generic
uart-has-rtscts DT property"), the Freescale MXS AUART driver recognizes
the generic "uart-has-rtscts" DT property, deprecating the
vendor-specific "fsl,uart-has-rtscts" DT property. Hence replace the
latter by the former in all DTS files.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 arch/arm/boot/dts/imx28-apf28dev.dts | 2 +-
 arch/arm/boot/dts/imx28-evk.dts      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx28-apf28dev.dts b/arch/arm/boot/dts/imx28-apf28dev.dts
index 1eaa131e2d1809fb..c4fadbc1b40040f4 100644
--- a/arch/arm/boot/dts/imx28-apf28dev.dts
+++ b/arch/arm/boot/dts/imx28-apf28dev.dts
@@ -140,7 +140,7 @@
 			auart0: serial@8006a000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&auart0_pins_a>;
-				fsl,uart-has-rtscts;
+				uart-has-rtscts;
 				status = "okay";
 			};
 
diff --git a/arch/arm/boot/dts/imx28-evk.dts b/arch/arm/boot/dts/imx28-evk.dts
index e3ef94ac159f75b2..a5ba669b4eaa4ce3 100644
--- a/arch/arm/boot/dts/imx28-evk.dts
+++ b/arch/arm/boot/dts/imx28-evk.dts
@@ -224,7 +224,7 @@
 			auart0: serial@8006a000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&auart0_pins_a>;
-				fsl,uart-has-rtscts;
+				uart-has-rtscts;
 				status = "okay";
 			};
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

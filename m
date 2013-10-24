From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v5 6/8] ARM: dts: imx27 phycore move uart1 to rdk
Date: Thu, 24 Oct 2013 17:38:32 +0200
Message-ID: <1382629114-8628-7-git-send-email-mpa@pengutronix.de>
References: <1382629114-8628-1-git-send-email-mpa@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382629114-8628-1-git-send-email-mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

uart1 is not used on SOM. It is passed directly to the rdk board.

Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts | 1 +
 arch/arm/boot/dts/imx27-phytec-phycore-som.dts | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts b/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
index 0fc6551..ad76d88 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
+++ b/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
@@ -29,6 +29,7 @@
 
 &uart1 {
 	fsl,uart-has-rtscts;
+	status = "okay";
 };
 
 &uart2 {
diff --git a/arch/arm/boot/dts/imx27-phytec-phycore-som.dts b/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
index 4ec402c..648541a 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
+++ b/arch/arm/boot/dts/imx27-phytec-phycore-som.dts
@@ -165,10 +165,6 @@
 	status = "okay";
 };
 
-&uart1 {
-	status = "okay";
-};
-
 &weim {
 	status = "okay";
 
-- 
1.8.4.rc3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

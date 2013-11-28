From: Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Subject: [PATCHv2 2/3] ARM: dts: imx27: imx27-apf27: add pinctrl for fec and uart1
Date: Thu, 28 Nov 2013 08:19:31 +0100
Message-ID: <1385623172-87429-2-git-send-email-gwenhael.goavec-merou@armadeus.com>
References: <1385623172-87429-1-git-send-email-gwenhael.goavec-merou@armadeus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385623172-87429-1-git-send-email-gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou-d2DlULPkwbNWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/imx27-apf27.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/imx27-apf27.dts b/arch/arm/boot/dts/imx27-apf27.dts
index ba4c6df..8bc75c7 100644
--- a/arch/arm/boot/dts/imx27-apf27.dts
+++ b/arch/arm/boot/dts/imx27-apf27.dts
@@ -34,11 +34,27 @@
 	};
 };
 
+&iomuxc {
+	imx27-apf27 {
+		pinctrl_fec1: fec1grp {
+			fsl,pins = <MX27_FEC1_PINGRP1>;
+		};
+
+		pinctrl_uart1: uart1grp {
+			fsl,pins = <MX27_UART1_PINGRP1>;
+		};
+	};
+};
+
 &uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
 	status = "okay";
 };
 
 &fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
 	status = "okay";
 };
 
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: i.MX53: dts: NAND flash controller
Date: Wed, 27 Nov 2013 00:53:15 +0100
Message-ID: <1385509996-17769-2-git-send-email-lisovy@gmail.com>
References: <1385509996-17769-1-git-send-email-lisovy@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385509996-17769-1-git-send-email-lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org, Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi b/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
index 9304d0a..fa7309f5 100644
--- a/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
+++ b/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
@@ -72,6 +72,10 @@
 		pinctrl_uart1: uart1grp {
 			fsl,pins = <MX53_UART1_PINGRP2>;
 		};
+
+		pinctrl_nand: nandgrp {
+			fsl,pins = <MX53_NAND_PINGRP1>;
+		};
 	};
 };
 
@@ -205,6 +209,14 @@
 	};
 };
 
+&nfc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_nand>;
+	nand-bus-width = <8>;
+	nand-ecc-mode = "hw";
+	status = "okay";
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

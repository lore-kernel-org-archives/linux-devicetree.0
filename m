From: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v2 4/8] ARM: dts: imx: imx7d-sbd add iomuxc-lpsr hoggrp-2 pads
Date: Tue, 1 Sep 2015 17:49:09 -0500
Message-ID: <1441147753-13239-4-git-send-email-aalonso@freescale.com>
References: <1441147753-13239-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441147753-13239-1-git-send-email-aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, yibin.gong-KZfg59tc24xl57MIdRCFDg@public.gmane.org, nitin.garg-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add imx7d-sdb iomuxc-lpsr hoggrp-2 default pads settings

Signed-off-by: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
Changes for V2: Resend

 arch/arm/boot/dts/imx7d-sdb.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index fdd1d7c..63af4ea 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -406,3 +406,18 @@
 
 	};
 };
+
+&iomuxc_lpsr {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog_2>;
+
+	imx7d-sdb {
+		pinctrl_hog_2: hoggrp-2 {
+			fsl,pins = <
+				MX7D_PAD_GPIO1_IO05__GPIO1_IO5    0x14
+				MX7D_PAD_GPIO1_IO07__GPIO1_IO7    0x59
+				MX7D_PAD_GPIO1_IO00__WDOD1_WDOG_B 0x74
+			>;
+		};
+	};
+};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

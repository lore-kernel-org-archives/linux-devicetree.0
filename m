From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/10] ARM: dts: imx6q-apalis-ixora: fix usdhc2 pinctrl property
Date: Mon,  7 Aug 2017 12:52:33 +0530
Message-ID: <c2b690b2e2355914827f91beda81170635a0b267.1502087184.git.maitysanchayan@gmail.com>
References: <cover.1502087184.git.maitysanchayan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The SD1 pinctrl-0 property is overridden but only the card detect pin
is muxed, the control and data signals are not referenced at all.
It worked because the bootloader muxed them to a sensible state though.
Fix this.

Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-apalis-ixora.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
index 88cc7f51a4e9..89d99b4c6eed 100644
--- a/arch/arm/boot/dts/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
@@ -1,5 +1,5 @@
 /*
- * Copyright 2014-2016 Toradex AG
+ * Copyright 2014-2017 Toradex AG
  * Copyright 2012 Freescale Semiconductor, Inc.
  * Copyright 2011 Linaro Ltd.
  *
@@ -268,7 +268,7 @@
 /* SD1 */
 &usdhc2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_sd_cd>;
+	pinctrl-0 = <&pinctrl_usdhc2 &pinctrl_sd_cd>;
 	cd-gpios = <&gpio6 14 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

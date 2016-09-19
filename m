From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 3/3] ARM: dts: imx6qdl-apalis: Use enable-gpios property for backlight
Date: Mon, 19 Sep 2016 10:41:53 +0530
Message-ID: <2206aa18153f33a2b6763e2bc6c87bf83eadb674.1474260360.git.maitysanchayan@gmail.com>
References: <2263d508999ada9476268138b2922702eb50131f.1474260360.git.maitysanchayan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2263d508999ada9476268138b2922702eb50131f.1474260360.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <2263d508999ada9476268138b2922702eb50131f.1474260360.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <2263d508999ada9476268138b2922702eb50131f.1474260360.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use enable-gpios property of PWM backlight driver for backlight
control.

Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Changes since v1:

Fix commit message

v1: https://lkml.org/lkml/2016/9/14/55
---
 arch/arm/boot/dts/imx6qdl-apalis.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
index 8c67dd8..9100bde 100644
--- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -49,7 +49,10 @@
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_bl_on>;
 		pwms = <&pwm4 0 5000000>;
+		enable-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 		status = "disabled";
 	};
 
@@ -614,6 +617,12 @@
 		>;
 	};
 
+	pinctrl_gpio_bl_on: gpioblon {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_DA13__GPIO3_IO13 0x1b0b0
+		>;
+	};
+
 	pinctrl_gpio_keys: gpio1io04grp {
 		fsl,pins = <
 			/* Power button */
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

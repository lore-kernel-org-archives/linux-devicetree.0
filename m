From: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: i.MX53: dts: USB host controller
Date: Wed, 27 Nov 2013 00:53:16 +0100
Message-ID: <1385509996-17769-3-git-send-email-lisovy@gmail.com>
References: <1385509996-17769-1-git-send-email-lisovy@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385509996-17769-1-git-send-email-lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org, Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

diff --git a/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi b/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
index fa7309f5..04a2895 100644
--- a/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
+++ b/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
@@ -38,6 +38,16 @@
 			regulator-max-microvolt = <3300000>;
 			regulator-always-on;
 		};
+
+		reg_usb_vbus: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "usb_vbus";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			gpio = <&gpio3 31 0>; /* PEN */
+			enable-active-high;
+		};
 	};
 };
 
@@ -222,3 +232,9 @@
 	pinctrl-0 = <&pinctrl_uart1>;
 	status = "okay";
 };
+
+&usbh1 {
+	vbus-supply = <&reg_usb_vbus>;
+	phy_type = "utmi";
+	status = "okay";
+};
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

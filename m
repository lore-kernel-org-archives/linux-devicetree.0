From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 4/4] ARM: dts: vf-colibri: USB device/host switch using extcon gpio
Date: Tue, 15 Mar 2016 14:08:30 +0530
Message-ID: <b5960001225698c620f1236bc053df7e7127f9e3.1458030082.git.maitysanchayan@gmail.com>
References: <cover.1458030082.git.maitysanchayan@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1458030082.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1458030082.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1458030082.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter.Chen-3arQi8VN3Tc@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use USBC_DET feature of standard Colibri SODIMM pin 137 for USB
device/host switching using the generic extcon USB gpio implementation.

Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/vf-colibri-eval-v3.dtsi | 12 ++++++++++++
 arch/arm/boot/dts/vf-colibri.dtsi         |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
index 4d8b7f6..794c02e 100644
--- a/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
+++ b/arch/arm/boot/dts/vf-colibri-eval-v3.dtsi
@@ -50,6 +50,14 @@
 		clock-frequency = <16000000>;
 	};
 
+	extcon_usbc_det: usbc_det {
+		compatible = "linux,extcon-usb-gpio";
+		debounce = <25>;
+		id-gpio = <&gpio3 6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usbc_det>;
+	};
+
 	reg_3v3: regulator-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "3.3V";
@@ -146,6 +154,10 @@
 	status = "okay";
 };
 
+&usbdev0 {
+	extcon = <&extcon_usbc_det>, <&extcon_usbc_det>;
+};
+
 &usbh1 {
 	vbus-supply = <&reg_usbh_vbus>;
 };
diff --git a/arch/arm/boot/dts/vf-colibri.dtsi b/arch/arm/boot/dts/vf-colibri.dtsi
index fda7f28..551b6a1 100644
--- a/arch/arm/boot/dts/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/vf-colibri.dtsi
@@ -171,6 +171,7 @@
 
 &usbdev0 {
 	disable-over-current;
+	dr_mode = "otg";
 	status = "okay";
 };
 
@@ -326,6 +327,12 @@
 			>;
 		};
 
+		pinctrl_usbc_det: gpio_usbc_det {
+			fsl,pins = <
+				VF610_PAD_PTC29__GPIO_102		0x22ed
+			>;
+		};
+
 		pinctrl_usbh1_reg: gpio_usb_vbus {
 			fsl,pins = <
 				VF610_PAD_PTD4__GPIO_83			0x22ed
-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/10] ARM: dts: imx6qdl-apalis: imx6q-apalis-ixora: use i2c from dwc hdmi
Date: Mon,  7 Aug 2017 12:52:40 +0530
Message-ID: <3f1aa78a25f8f2973a58ba160252cefa2f27aef8.1502087184.git.maitysanchayan@gmail.com>
References: <cover.1502087184.git.maitysanchayan@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1502087184.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>

Migrate to using functionally-reduced I2C master contained in the DWC
HDMI. Therefore drop the GPIO bitbanging based i2cddc definition and
modify resp. pinctrl.

While at it re-order the I2C aliases to start with the generic, followed
by the camera and concluded by the power I2C one.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-apalis-ixora.dts | 10 ++--------
 arch/arm/boot/dts/imx6qdl-apalis.dtsi    | 25 +++++++++----------------
 2 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
index 73c1ec883ff5..60d33e99de76 100644
--- a/arch/arm/boot/dts/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
@@ -55,10 +55,9 @@
 		     "fsl,imx6q";
 
 	aliases {
-		i2c0 = &i2cddc;
-		i2c1 = &i2c1;
+		i2c0 = &i2c1;
+		i2c1 = &i2c3;
 		i2c2 = &i2c2;
-		i2c3 = &i2c3;
 		rtc0 = &rtc_i2c;
 		rtc1 = &snvs_rtc;
 	};
@@ -161,11 +160,6 @@
 };
 
 &hdmi {
-	ddc-i2c-bus = <&i2cddc>;
-	status = "okay";
-};
-
-&i2cddc {
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
index 6658c659b7d7..ea339fa58f4a 100644
--- a/arch/arm/boot/dts/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-apalis.dtsi
@@ -56,18 +56,6 @@
 		status = "disabled";
 	};
 
-	/* DDC_I2C: I2C2_SDA/SCL on MXM3 205/207 */
-	i2cddc: i2c@0 {
-		compatible = "i2c-gpio";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_i2c_ddc>;
-		gpios = <&gpio3 16 GPIO_ACTIVE_HIGH /* sda */
-			 &gpio2 30 GPIO_ACTIVE_HIGH /* scl */
-			>;
-		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
-		status = "disabled";
-	};
-
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "1P8V";
@@ -210,6 +198,12 @@
 	};
 };
 
+&hdmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi_ddc>;
+	status = "disabled";
+};
+
 /* I2C1_SDA/SCL on MXM3 209/211 (e.g. RTC on carrier board) */
 &i2c1 {
 	clock-frequency = <100000>;
@@ -638,11 +632,10 @@
 		>;
 	};
 
-	pinctrl_i2c_ddc: gpioi2cddcgrp {
+	pinctrl_hdmi_ddc: hdmiddcgrp {
 		fsl,pins = <
-			/* DDC bitbang */
-			MX6QDL_PAD_EIM_EB2__GPIO2_IO30 0x1b0b0
-			MX6QDL_PAD_EIM_D16__GPIO3_IO16 0x1b0b0
+			MX6QDL_PAD_EIM_EB2__HDMI_TX_DDC_SCL 0x4001b8b1
+			MX6QDL_PAD_EIM_D16__HDMI_TX_DDC_SDA 0x4001b8b1
 		>;
 	};
 
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

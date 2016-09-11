From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/5] ARM: dts: sun8i: Add touchscreen node for sun8i-a23-polaroid-mid2407pxe03
Date: Sun, 11 Sep 2016 20:23:25 +0200
Message-ID: <20160911182327.824-4-hdegoede@redhat.com>
References: <20160911182327.824-1-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160911182327.824-1-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a node enabling the gsl1680 touchscreen controller found on
sun8i-a23-polaroid-mid2407pxe03 tablets.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
-Make ldo_io1 vddio-supply for the touchscreen rather then marking it as
 regulator-always-on
---
 arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts
index 4789aac..6662127 100644
--- a/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts
+++ b/arch/arm/boot/dts/sun8i-a23-polaroid-mid2407pxe03.dts
@@ -90,3 +90,22 @@
 		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 	};
 };
+
+&reg_ldo_io1 {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-touchscreen";
+	status = "okay";
+};
+
+&touchscreen {
+	reg = <0x40>;
+	compatible = "silead,gsl1680";
+	firmware-name = "gsl1680-polaroid-mid2407pxe03.fw";
+	touchscreen-size-x = <960>;
+	touchscreen-size-y = <640>;
+	touchscreen-inverted-x;
+	touchscreen-inverted-y;
+	vddio-supply = <&reg_ldo_io1>;
+	status = "okay";
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

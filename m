From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM-i.MX6Q-dts : Added USB_OTG Support
Date: Fri, 24 Jan 2014 10:15:08 -0200
Message-ID: <CAOMZO5B=2mYWeoj1snSMpDzxHK8H3_DKevuaA4T4bXiV=64vkg@mail.gmail.com>
References: <1390555724-9779-1-git-send-email-ashutosh.s@phytec.in>
	<20140124115005.GG814@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140124115005.GG814-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ashutosh singh <ashuleapyear-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ashutosh singh <ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Fri, Jan 24, 2014 at 9:50 AM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:

>> +
>> +     regulators {
>> +             compatible = "simple-bus";
>
> This is _not_ a simple bus. It doesn't have the required ranges
> property.
>
> Why do these need to be in a regulators container node? We don't group
> dma controllers under a dmas node, or uarts under a uarts node.

It seems we have this same issue on several imx6 dts files.

Would the below address your suggestion?

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-
index e75e11b..ba35560 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -15,33 +15,29 @@
                reg = <0x10000000 0x40000000>;
        };

-       regulators {
-               compatible = "simple-bus";
-
-               reg_usb_otg_vbus: usb_otg_vbus {
-                       compatible = "regulator-fixed";
-                       regulator-name = "usb_otg_vbus";
-                       regulator-min-microvolt = <5000000>;
-                       regulator-max-microvolt = <5000000>;
-                       gpio = <&gpio3 22 0>;
-                       enable-active-high;
-               };
+       reg_usb_otg_vbus: regulator@0 {
+               compatible = "regulator-fixed";
+               regulator-name = "usb_otg_vbus";
+               regulator-min-microvolt = <5000000>;
+               regulator-max-microvolt = <5000000>;
+               gpio = <&gpio3 22 0>;
+               enable-active-high;
+       };

-               reg_usb_h1_vbus: usb_h1_vbus {
-                       compatible = "regulator-fixed";
-                       regulator-name = "usb_h1_vbus";
-                       regulator-min-microvolt = <5000000>;
-                       regulator-max-microvolt = <5000000>;
-                       gpio = <&gpio1 29 0>;
-                       enable-active-high;
-               };
+       reg_usb_h1_vbus: regulator@1 {
+               compatible = "regulator-fixed";
+               regulator-name = "usb_h1_vbus";
+               regulator-min-microvolt = <5000000>;
+               regulator-max-microvolt = <5000000>;
+               gpio = <&gpio1 29 0>;
+               enable-active-high;
+       };

-               reg_audio: wm8962_supply {
-                       compatible = "regulator-fixed";
-                       regulator-name = "wm8962-supply";
-                       gpio = <&gpio4 10 0>;
-                       enable-active-high;
-               };
+       reg_audio: regulator@2 {
+               compatible = "regulator-fixed";
+               regulator-name = "wm8962-supply";
+               gpio = <&gpio4 10 0>;
+               enable-active-high;
        };

        gpio-keys {

If so, I will prepare some patches to update other dts files.

Thanks,

Fabio Estevam
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

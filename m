From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [RFC][PATCH] devicetree: Add DTS file to support the Nexus7 2013
 (flo) device.
Date: Fri, 11 Dec 2015 10:59:16 -0800
Message-ID: <20151211185916.GM4000@usrtlx11787.corpusers.net>
References: <1449290162-4485-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449290162-4485-1-git-send-email-john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri 04 Dec 20:36 PST 2015, John Stultz wrote:

> This patch adds a dts file to support the Nexus7 2013
> device. Its based off of the qcom-apq8064-ifc6410.dts
> which is similar hardware.
> 
> Also includes some comments and context folded in
> from Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> This is my first DTS submission, so thoughts or feedback
> on would be appreciated.

Please remove this from the commit message ;)

[..]

> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 30bbc37..c0f9076a 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -502,6 +502,7 @@ dtb-$(CONFIG_ARCH_PRIMA2) += \
>  dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-apq8064-cm-qs600.dtb \
>  	qcom-apq8064-ifc6410.dtb \
> +	qcom-apq8064-nexus7-flo.dtb \

The format for the Sony products are <platform>-sony-<product>.dts, I
think we should try to follow this for other devices as well.

>  	qcom-apq8074-dragonboard.dtb \
>  	qcom-apq8084-ifc6540.dtb \
>  	qcom-apq8084-mtp.dtb \
> diff --git a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> new file mode 100644
> index 0000000..5183d18
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> @@ -0,0 +1,306 @@
> +#include "qcom-apq8064-v2.0.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +/ {
> +	model = "Qualcomm APQ8064/Nexus7(flo)";
> +	compatible = "qcom,apq8064-nexus7-flo", "qcom,apq8064";

The Nexus7 isn't a Qualcomm product, so you should omit that from the
model and I believe the compatible should be "asus,something-flo",
"qcom,apq8064".

> +
> +	aliases {
> +		serial0 = &gsbi7_serial;
> +		serial1 = &gsbi6_serial;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	soc {
> +		rpm@108000 {
> +			regulators {
> +				vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
> +				vin_lvs1_3_6-supply = <&pm8921_s4>;
> +				vin_lvs4_5_7-supply = <&pm8921_s4>;
> +
> +
> +				vdd_l24-supply = <&pm8921_s1>;
> +				vdd_l25-supply = <&pm8921_s1>;
> +				vin_lvs2-supply = <&pm8921_s1>;
> +
> +				vdd_l26-supply = <&pm8921_s7>;
> +				vdd_l27-supply = <&pm8921_s7>;
> +				vdd_l28-supply = <&pm8921_s7>;
> +
> +				vdd_ncp-supply = <&pm8921_l6>;
> +
> +				/* Buck SMPS */
> +				pm8921_s1: s1 {

These nodes already have labels, from the dtsi. So please omit the
labels.

> +					regulator-always-on;
> +					regulator-min-microvolt = <1225000>;
> +					regulator-max-microvolt = <1225000>;
> +					qcom,switch-mode-frequency = <3200000>;
> +					bias-pull-down;
> +				};
> +
[..]
> +		};
> +
> +		ext_3p3v: regulator-fixed@1 {

This regulator does not sit on the mmio bus should as such be moved
outside of the soc {}.

> +			compatible = "regulator-fixed";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-name = "ext_3p3v";
> +			regulator-type = "voltage";
> +			startup-delay-us = <0>;
> +			gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
> +			enable-active-high;
> +			regulator-boot-on;
> +		};
> +
> +		gsbi3: gsbi@16200000 {

Please omit this label.

> +			status = "okay";
> +			qcom,mode = <GSBI_PROT_I2C>;
> +			i2c3: i2c@16280000 {

Please omit this label.

> +				status = "okay";
> +				clock-frequency = <200000>;
> +				pinctrl-0 = <&i2c3_pins>;
> +				pinctrl-names = "default";
> +
> +				trackpad: trackpad@10 {

Please omit this label.

> +					compatible = "elan,ekth3500";
> +					reg = <0x10>;
> +					interrupt-parent = <&tlmm_pinmux>;
> +					interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> +				};
> +			};
> +		};
[..]
> +
> +		/* OTG */
> +		usb1_phy: phy@12500000 {

Please omit this label.

> +			status		= "okay";
> +			vddcx-supply	= <&pm8921_s3>;
> +			v3p3-supply	= <&pm8921_l3>;
> +			v1p8-supply	= <&pm8921_l4>;
> +		};
> +
> +		usb3_phy: phy@12520000 {

Please omit this label.

> +			status		= "okay";
> +			vddcx-supply	= <&pm8921_s3>;
> +			v3p3-supply	= <&pm8921_l3>;
> +			v1p8-supply	= <&pm8921_l23>;
> +		};
> +
> +		usb4_phy: phy@12530000 {

Please omit this label.

> +			status		= "okay";
> +			vddcx-supply	= <&pm8921_s3>;
> +			v3p3-supply	= <&pm8921_l3>;
> +			v1p8-supply	= <&pm8921_l23>;
> +		};

Why do you have 3 USB phys enabled on this board? How is this board
designed?

> +
> +		gadget1: gadget@12500000 {

Please omit this label.

> +			status = "okay";
> +		};
> +
> +		/* OTG */
> +		usb1: usb@12500000 {

Please omit this label.

> +			status = "okay";
> +		};
> +
> +		usb3: usb@12520000 {

Please omit this label.

> +			status = "okay";
> +		};
> +
> +		usb4: usb@12530000 {

Please omit this label.

> +			status = "okay";
> +		};

Again, 3 usb gadgets?

> +
> +		amba {
> +			/* eMMC */
> +			sdcc1: sdcc@12400000 {

Please omit this label.

> +				status = "okay";
> +				vmmc-supply = <&pm8921_l5>;
> +				vqmmc-supply = <&pm8921_s4>;
> +			};
> +
> +			/* WLAN */
> +			sdcc4: sdcc@121c0000 {

I believe the Nexus7 sports a Qualcomm wifi chip, if so then please
remove this node entirely (it doesn't use sdio)


> +				status = "okay";
> +				vmmc-supply = <&ext_3p3v>;
> +				vqmmc-supply = <&pm8921_lvs1>;
> +			};
> +		};
> +
> +		gpio-keys {

gpio-keys doesn't sit on the mmio bus, so please move it outside soc {}.

> +			compatible = "gpio-keys";
> +			power {
> +				label = "Power";
> +				gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
> +				linux,code = <KEY_POWER>;
> +				gpio-key,wakeup;
> +			};
> +			volume_up {
> +				label = "Volume Up";
> +				gpios = <&pm8921_gpio 4 GPIO_ACTIVE_HIGH>;
> +				linux,code = <KEY_VOLUMEUP>;
> +			};
> +			volume_down {
> +				label = "Volume Down";
> +				gpios = <&pm8921_gpio 38 GPIO_ACTIVE_HIGH>;
> +				linux,code = <KEY_VOLUMEDOWN>;
> +			};
> +		};
> +
> +	};
> +};
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index a4c1762..d541438 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -288,6 +288,8 @@
>  				clocks = <&gcc GSBI3_QUP_CLK>,
>  					 <&gcc GSBI3_H_CLK>;
>  				clock-names = "core", "iface";
> +				#address-cells = <1>;
> +				#size-cells = <0>;

Please send this as a separate patch, with my Ack.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

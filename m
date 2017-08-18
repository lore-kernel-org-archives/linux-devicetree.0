From: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RESEND PATCH 1/1] arm64: dts: Add Variscite DART-SD410
 Evaluation board dts
Date: Fri, 18 Aug 2017 15:35:05 -0500
Message-ID: <20170818203505.GB4042@hector.attlocal.net>
References: <014701d31418$8e419670$aac4c350$@variscite.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <014701d31418$8e419670$aac4c350$@variscite.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leonid Segal <leonid.s-/HTLZasLZWtl57MIdRCFDg@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Aug 13, 2017 at 12:42:59PM +0300, Leonid Segal wrote:
> Add initial device tree support for Variscite DART-SD410 Evalueation board.
> This board is also known as VAR-SD410CustomBoard.
> 
> Signed-off-by: Leonid Segal <leonid.s-/HTLZasLZWtl57MIdRCFDg@public.gmane.org>
> ---

A few comments, mainly about your documentation on the Variscite
website.  Specifically the schematics.  Please tell your hardware
people to be consistent in your naming conventions for pins.

MPP_GPIO/PM_GPIO appear to be interchangeable.  And it's usually
best to split out the PMIC pins from the non-pmic.  That's my 2
cents at least.


>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/apq8016-var-dart-pmic-pins.dtsi  |  53 +++
>  .../boot/dts/qcom/apq8016-var-dart-soc-pins.dtsi   |  88 ++++
>  arch/arm64/boot/dts/qcom/apq8016-var-dart.dts      |  21 +
>  arch/arm64/boot/dts/qcom/apq8016-var-dart.dtsi     | 525

<snip>

> +			pins = "gpio32";
> +		};
> +		pinconf {
> +			pins = "gpio32";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
> +	msm_key_volp_n_default: msm_key_volp_n_default {

Schematics show this to be a Home button.  If so this needs to be
updated to reflect that.

> +		pinmux {
> +			function = "gpio";
> +			pins = "gpio107";
> +		};
> +		pinconf {
> +			pins = "gpio107";
> +			drive-strength = <8>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-var-dart.dts

<snip>

> +/dts-v1/;
> +
> +#include "apq8016-var-dart.dtsi"
> +
> +/ {
> +	model = "Variscite LTD. VAR-DART410";
> +	compatible = "qcom,apq8016-dart", "qcom,apq8016", "qcom,dart";

qcom isnt making this board.  Please use something like "variscite,dart",
"qcom,apq8016"

> +};
> diff --git a/arch/arm64/boot/dts/qcom/apq8016-var-dart.dtsi
> b/arch/arm64/boot/dts/qcom/apq8016-var-dart.dtsi
> new file mode 100644
> index 000000000000..f214d0b101a4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/apq8016-var-dart.dtsi

<snip>
> +
> +		usb@78d9000 {
> +			extcon = <&usb_id>, <&usb_id>;
> +			status = "okay";
> +		};
> +
> +		ehci@78d9000 {
> +			status = "okay";

Can you try removing the echi and using the chipidea instead.  Take a
look at the current db410c in -next.  Try it out and see if that works
for you.  If it does, modify your nodes to match up.

> +		};
> +
> +		phy@78d9000 {
> +			v1p8-supply = <&pm8916_l7>;
> +			v3p3-supply = <&pm8916_l13>;
> +			vddcx-supply = <&pm8916_s1>;
> +			extcon = <&usb_id>, <&usb_id>;
> +			dr_mode = "otg";
> +			status = "okay";
> +			switch-gpio = <&pm8916_gpios 4 GPIO_ACTIVE_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&usb_sw_sel_pm>;

Same here, I think some things changed here.  Need to update.
switch-gpio went away.

> +		};
> +
> +		lpass@07708000 {
> +			status = "okay";
> +		};
> +

<snip>


Regards,

Andy Gross
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

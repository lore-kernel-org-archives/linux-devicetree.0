From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 1/2] ARM: dts: imx6: Add support for Toradex Apalis
 iMX6Q/D SoM
Date: Mon, 29 Aug 2016 16:28:50 +0300
Message-ID: <97a3d506-35a0-2a15-18ef-2719c0596cc1@mentor.com>
References: <1454688741-4238-1-git-send-email-marcel.ziswiler@toradex.com>
 <1454688741-4238-2-git-send-email-marcel.ziswiler@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454688741-4238-2-git-send-email-marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz-knWk7/PSn+s@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Marcel,

On 02/05/2016 06:12 PM, Marcel Ziswiler wrote:
> From: Petr Štetiar <ynezz-knWk7/PSn+s@public.gmane.org>
>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Petr Štetiar <ynezz-knWk7/PSn+s@public.gmane.org>
> Reviewed-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>

because the change is in mainline now below is kind of out of date
information, but you may find it helpful.

[snip]

> - fixed HDMI DDC (requires GPIO-based bitbanging I2C to be enabled)

This is not needed.

[snip]

> +	/* DDC_I2C: I2C2_SDA/SCL on MXM3 205/207 */
> +	i2cddc: i2c@0 {
> +		compatible = "i2c-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_i2c_ddc>;
> +		gpios = <&gpio3 16 GPIO_ACTIVE_HIGH /* sda */
> +			 &gpio2 30 GPIO_ACTIVE_HIGH /* scl */
> +			>;
> +		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
> +		status = "disabled";
> +	};
> +

This is not needed.

[snip]

> +	pinctrl_i2c_ddc: gpioi2cddcgrp {
> +		fsl,pins = <
> +			/* DDC bitbang */
> +			MX6QDL_PAD_EIM_EB2__GPIO2_IO30 0x1b0b0
> +			MX6QDL_PAD_EIM_D16__GPIO3_IO16 0x1b0b0
> +		>;
> +	};
> +

Practically you don't need this overcomplicated GPIO-based bitbanging
to emulate I2C, because the DW HDMI controller has a reduced I2C
controller on board, you may take a look at its support published here:

    http://www.spinics.net/lists/dri-devel/msg116308.html

To utilize it the pads should be set to HDMI function instead of
I2C or GPIO.

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

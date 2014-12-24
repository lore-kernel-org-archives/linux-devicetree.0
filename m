From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: socfpga: dts: Add adxl34x
Date: Wed, 24 Dec 2014 10:45:17 +0100
Message-ID: <20141224094516.GI13070@pengutronix.de>
References: <1419339862-29852-1-git-send-email-walter@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1419339862-29852-1-git-send-email-walter-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Walter Lozano <walter-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

On Tue, Dec 23, 2014 at 10:04:22AM -0300, Walter Lozano wrote:
> This patch adds the DTS bindings for the adxl34x digital
> accelerometer.
> 

Thanks for doing this. Does the ADXL34 work now? Last time I
tried it, I didn't get any interrupts, but as I didn't really
care for the accelerometer I didn't dig deeper.

> Signed-off-by: Walter Lozano <walter-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
> ---
>  arch/arm/boot/dts/socfpga_cyclone5_sockit.dts |   17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
> index 16ea6f5..f99d7dec 100644
> --- a/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
> +++ b/arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
> @@ -68,3 +68,20 @@
>  &usb1 {
>  	status = "okay";
>  };
> +
> +&gpio2 {
> +	status = "okay";
> +};
> +
> +&i2c1{
       ^^^

Add a space here and ...

> +	status = "okay";
> +
> +	accel1: accel1@53{
			^^^
here. Also, this should be accelerometer@53.

> +		compatible = "adxl34x";
> +		reg = <0x53>;
> +
> +		interrupt-parent = < &portc >;
				   ^^^    ^^^
Please remove the spaces here.
> +		interrupts = <3 2>;
> +
> +	};
> +};

Finally, please sort the nodes alphabetically and not just append them.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v7 5/5] ARM: dts: rockchip: add support mipi panel tv080wum-nl0
Date: Tue, 19 Jan 2016 20:26:04 +0100
Message-ID: <1649978.zzK0Pex4sR@phil>
References: <1452053038-32098-1-git-send-email-zyw@rock-chips.com> <1452053038-32098-6-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452053038-32098-6-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Chris,

Am Mittwoch, 6. Januar 2016, 12:03:57 schrieb Chris Zhong:
> This tv080wum-nl0 panel is a mipi panel, it can use in MIPI_TX socket
> of rk3288 evb board.
> 
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

[...]

> diff --git a/arch/arm/boot/dts/rk3288-evb-act8846.dts
> b/arch/arm/boot/dts/rk3288-evb-act8846.dts index e662147..7d5475b 100644
> --- a/arch/arm/boot/dts/rk3288-evb-act8846.dts
> +++ b/arch/arm/boot/dts/rk3288-evb-act8846.dts
> @@ -50,6 +50,8 @@
>  		gpio = <&gpio7 3 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&lcd_en>;
> +		regulator-always-on;
> +		regulator-boot-on;

Is this only needed for the panel itself and can you try to get the panel 
supplies set up correctly instead in that case please?


>  		regulator-name = "vcc_lcd";
>  		vin-supply = <&vcc_io>;
>  	};
> diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi
> b/arch/arm/boot/dts/rk3288-evb.dtsi index 4faabdb..0c91858 100644
> --- a/arch/arm/boot/dts/rk3288-evb.dtsi
> +++ b/arch/arm/boot/dts/rk3288-evb.dtsi
> @@ -47,7 +47,7 @@
>  		reg = <0x0 0x80000000>;
>  	};
> 
> -	backlight {
> +	backlight: backlight {
>  		compatible = "pwm-backlight";
>  		brightness-levels = <
>  			  0   1   2   3   4   5   6   7
> @@ -183,6 +183,16 @@
>  	status = "okay";
>  };
> 
> +&mipi_dsi {
> +	status = "okay";
> +	panel {
> +		compatible ="boe,tv080wum-nl0";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		status = "okay";

in the evb-schematics I see, vcc_lcd as supply for the panel.

So I'd think the panel node here should have a
	power-supply = <&vcc_lcd>;
instead of having the always-on above?


Thanks
Heiko

> +	};
> +};
> +
>  &sdmmc {
>  	bus-width = <4>;
>  	cap-mmc-highspeed;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

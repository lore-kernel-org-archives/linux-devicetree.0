From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: dts: armada388-clearfog: add phy reset gpio-hog
Date: Wed, 04 Jan 2017 17:26:08 +0100
Message-ID: <871swig5b3.fsf@free-electrons.com>
References: <E1cO4UH-0008SR-GW@rmk-PC.armlinux.org.uk>
        <E1cO4Vz-00005t-8n@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1cO4Vz-00005t-8n-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org> (Russell King's
        message of "Mon, 02 Jan 2017 15:27:11 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell,
 
 On lun., janv. 02 2017, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:


It would be nice to have some word here about this patch. Especially why
we need it now. I guess it is for being less dependent on the
initialization done by the bootloader but maybe you have other reasons.

Thanks,

Gregory

> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-388-clearfog-base.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/armada-388-clearfog-base.dts b/arch/arm/boot/dts/armada-388-clearfog-base.dts
> index f86e1876fb38..da788ea40717 100644
> --- a/arch/arm/boot/dts/armada-388-clearfog-base.dts
> +++ b/arch/arm/boot/dts/armada-388-clearfog-base.dts
> @@ -74,7 +74,17 @@
>  	phy = <&phy1>;
>  };
>  
> +&gpio0 {
> +	phy1_reset {
> +		gpio-hog;
> +		gpios = <19 GPIO_ACTIVE_LOW>;
> +		output-low;
> +		line-name = "phy1-reset";
> +	};
> +};
> +
>  &mdio {
> +	pinctrl-0 = <&mdio_pins &microsom_phy_clk_pins &clearfog_phy_pins>;
>  	phy1: ethernet-phy@1 {
>  		/*
>  		 * Annoyingly, the marvell phy driver configures the LED
> @@ -87,6 +97,11 @@
>  };
>  
>  &pinctrl {
> +	/* phy1 reset */
> +	clearfog_phy_pins: clearfog-phy-pins {
> +		marvell,pins = "mpp19";
> +		marvell,function = "gpio";
> +	};
>  	rear_button_pins: rear-button-pins {
>  		marvell,pins = "mpp44";
>  		marvell,function = "gpio";
> -- 
> 2.7.4
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

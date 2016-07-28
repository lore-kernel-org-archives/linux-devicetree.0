From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 11/18] ARM: mvebu: a39x: add missing nodes describing GPIO's
Date: Thu, 28 Jul 2016 12:25:13 +0200
Message-ID: <87bn1ikqk6.fsf@free-electrons.com>
References: <1469105055-25181-1-git-send-email-jaz@semihalf.com>
	<1469105055-25181-13-git-send-email-jaz@semihalf.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469105055-25181-13-git-send-email-jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org> (Grzegorz
	Jaszczyk's message of "Thu, 21 Jul 2016 14:44:08 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grzegorz,
 
 On jeu., juil. 21 2016, Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org> wrote:

> The whole Armada 39x SoC family of processors has GPIO's which all can be
> supported with existing driver.
>

Change the prefix to "ARM: dts: mvebu: armada-39x:"

Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks,

Gregory

> Signed-off-by: Grzegorz Jaszczyk <jaz-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-39x.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
> index 5e01438..0749878 100644
> --- a/arch/arm/boot/dts/armada-39x.dtsi
> +++ b/arch/arm/boot/dts/armada-39x.dtsi
> @@ -55,6 +55,8 @@
>  	compatible = "marvell,armada390";
>  
>  	aliases {
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
>  		serial0 = &uart0;
>  		serial1 = &uart1;
>  		serial2 = &uart2;
> @@ -274,6 +276,34 @@
>  				};
>  			};
>  
> +			gpio0: gpio@18100 {
> +				compatible = "marvell,orion-gpio";
> +				reg = <0x18100 0x40>;
> +				ngpios = <32>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			gpio1: gpio@18140 {
> +				compatible = "marvell,orion-gpio";
> +				reg = <0x18140 0x40>;
> +				ngpios = <28>;
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
>  			system-controller@18200 {
>  				compatible = "marvell,armada-390-system-controller",
>  					     "marvell,armada-370-xp-system-controller";
> -- 
> 1.8.3.1
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

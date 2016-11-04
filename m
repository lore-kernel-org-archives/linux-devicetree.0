From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: Update comment for main PLL frequency
Date: Fri, 04 Nov 2016 13:33:59 +0100
Message-ID: <874m3no24o.fsf@free-electrons.com>
References: <20161025235242.31764-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161025235242.31764-1-chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> (Chris
        Packham's message of "Wed, 26 Oct 2016 12:52:42 +1300")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Chris,
 
 On mer., oct. 26 2016, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org> wrote:

> The actual frequency was updated in commit ae142bd99765 ("ARM: mvebu:
> Fix the main PLL frequency on Armada 375, 38x and 39x SoCs") but the
> comment was not updated. Update it now.
>
> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>

Applied on mvebu/dt

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/armada-375.dtsi | 2 +-
>  arch/arm/boot/dts/armada-38x.dtsi | 2 +-
>  arch/arm/boot/dts/armada-39x.dtsi | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-375.dtsi b/arch/arm/boot/dts/armada-375.dtsi
> index cc952cf8ec30..45fa92f9cf5c 100644
> --- a/arch/arm/boot/dts/armada-375.dtsi
> +++ b/arch/arm/boot/dts/armada-375.dtsi
> @@ -65,7 +65,7 @@
>  	};
>  
>  	clocks {
> -		/* 2 GHz fixed main PLL */
> +		/* 1 GHz fixed main PLL */
>  		mainpll: mainpll {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> index 2d7668848c5a..7450e9fea45d 100644
> --- a/arch/arm/boot/dts/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/armada-38x.dtsi
> @@ -661,7 +661,7 @@
>  	};
>  
>  	clocks {
> -		/* 2 GHz fixed main PLL */
> +		/* 1 GHz fixed main PLL */
>  		mainpll: mainpll {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
> diff --git a/arch/arm/boot/dts/armada-39x.dtsi b/arch/arm/boot/dts/armada-39x.dtsi
> index 34cba87f9200..de171baffcf6 100644
> --- a/arch/arm/boot/dts/armada-39x.dtsi
> +++ b/arch/arm/boot/dts/armada-39x.dtsi
> @@ -573,7 +573,7 @@
>  	};
>  
>  	clocks {
> -		/* 2 GHz fixed main PLL */
> +		/* 1 GHz fixed main PLL */
>  		mainpll: mainpll {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
> -- 
> 2.10.1
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

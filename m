From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 4/5] ARM: dts: Fix the sort ordering of EHCI and HSIC in rk3288.dtsi
Date: Fri, 01 Aug 2014 11:17:27 +0200
Message-ID: <5965899.y405fxfhDg@diego>
References: <1406846976-23127-4-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406846976-23127-4-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 31. Juli 2014, 15:49:35 schrieb Doug Anderson:
> The EHCI and HSIC device tree nodes were added in the wrong place.
> Fix them.
> 
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

hmm, not sure if this counts as fix ... aka material for 3.17-rc2 or should 
wait for 3.18. Simply because it's more a cosmetic thing.

If it is a fix, could base it on the appropriate dts revision, because here 
it's in the middle of the dwc2 series, including the
	usb_host1: usb@ff540000
nodes.


Heiko

> ---
> Changes in v4:
> - Based on the proper patch
> 
> Changes in v3:
> - EHCI and HSIC move new for version 3.
> 
>  arch/arm/boot/dts/rk3288.dtsi | 41
> ++++++++++++++++++++--------------------- 1 file changed, 20 insertions(+),
> 21 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 9713054..49c99f2 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -156,6 +156,17 @@
>  		status = "disabled";
>  	};
> 
> +	usb_host0_ehci: usb@ff500000 {
> +		compatible = "generic-ehci";
> +		reg = <0xff500000 0x100>;
> +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_USBHOST0>;
> +		clock-names = "usbhost";
> +		status = "disabled";
> +	};
> +
> +	/* NOTE: ohci@ff520000 doesn't actually work on hardware */
> +
>  	usb_host1: usb@ff540000 {
>  		compatible = "rockchip,rk3288-usb", "rockchip,rk3066-usb",
>  				"snps,dwc2";
> @@ -176,6 +187,15 @@
>  		status = "disabled";
>  	};
> 
> +	usb_hsic: usb@ff5c0000 {
> +		compatible = "generic-ehci";
> +		reg = <0xff5c0000 0x100>;
> +		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_HSIC>;
> +		clock-names = "usbhost";
> +		status = "disabled";
> +	};
> +
>  	uart2: serial@ff690000 {
>  		compatible = "rockchip,rk3288-uart", "snps,dw-apb-uart";
>  		reg = <0xff690000 0x100>;
> @@ -270,27 +290,6 @@
>  		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
>  		status = "disabled";
>  	};
> -
> -	usb_host0_ehci: usb@ff500000 {
> -		compatible = "generic-ehci";
> -		reg = <0xff500000 0x100>;
> -		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cru HCLK_USBHOST0>;
> -		clock-names = "usbhost";
> -		status = "disabled";
> -	};
> -
> -	/* NOTE: ohci@ff520000 doesn't actually work on hardware */
> -
> -	usb_hsic: usb@ff5c0000 {
> -		compatible = "generic-ehci";
> -		reg = <0xff5c0000 0x100>;
> -		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> -		clocks = <&cru HCLK_HSIC>;
> -		clock-names = "usbhost";
> -		status = "disabled";
> -	};
> -
>  	gic: interrupt-controller@ffc01000 {
>  		compatible = "arm,gic-400";
>  		interrupt-controller;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

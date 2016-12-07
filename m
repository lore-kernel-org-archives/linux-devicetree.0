From: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH V2 2/5] ARM: BCM5301X: Specify USB controllers in DT
Date: Wed, 7 Dec 2016 09:19:36 -0800
Message-ID: <64e06cd3-4834-c924-4345-ff88bd49236d@broadcom.com>
References: <20161207075655.7396-1-zajec5@gmail.com>
 <20161207075655.7396-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161207075655.7396-2-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 12/6/2016 11:56 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> There are 3 separated controllers, one per USB /standard/. With PHY
> drivers in place they can be simply supported with generic drivers.
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> V2: Fix node names and reorder ehci with ohci. Thanks Ray!
> ---
>  arch/arm/boot/dts/bcm5301x.dtsi | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm5301x.dtsi
> index f09a2bb..a4614c9 100644
> --- a/arch/arm/boot/dts/bcm5301x.dtsi
> +++ b/arch/arm/boot/dts/bcm5301x.dtsi
> @@ -248,8 +248,26 @@
>  
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +			ranges;
>  
> -			phys = <&usb2_phy>;
> +			interrupt-parent = <&gic>;
> +
> +			ehci: ehci@21000 {
> +				#usb-cells = <0>;
> +
> +				compatible = "generic-ehci";
> +				reg = <0x00021000 0x1000>;
> +				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb2_phy>;
> +			};
> +
> +			ohci: ohci@22000 {
> +				#usb-cells = <0>;
> +
> +				compatible = "generic-ohci";
> +				reg = <0x00022000 0x1000>;
> +				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +			};
>  		};
>  
>  		usb3: usb3@23000 {
> @@ -257,6 +275,19 @@
>  
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +			ranges;
> +
> +			interrupt-parent = <&gic>;
> +
> +			xhci: xhci@23000 {
> +				#usb-cells = <0>;
> +
> +				compatible = "generic-xhci";
> +				reg = <0x00023000 0x1000>;
> +				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +				phys = <&usb3_phy>;
> +				phy-names = "usb";
> +			};
>  		};
>  
>  		spi@29000 {
> 

Looks good to me! Thanks!

Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

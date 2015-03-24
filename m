From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: hummingboard: enable PCF8523 RTC support
Date: Tue, 24 Mar 2015 20:14:31 +0800
Message-ID: <20150324121430.GH28410@dragon>
References: <E1YSWZG-0002As-7I@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1YSWZG-0002As-7I-eh5Bv4kxaXIANfyc6IWni62ZND6+EDdj@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 02, 2015 at 08:03:54PM +0000, Russell King wrote:
> Enable the commented out PCF8523 RTC support for Hummingboard pro
> base boards.
> 
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> ---
> For acks please.

Russell,

What do you mean by "For acks please"?  Not for apply?  I'm asking if I
should pick up the patches.

Shawn

> 
>  arch/arm/boot/dts/imx6qdl-hummingboard.dtsi | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
> index 674cb237298f..93588c987d2c 100644
> --- a/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-hummingboard.dtsi
> @@ -113,16 +113,13 @@
>  &i2c1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_hummingboard_i2c1>;
> -
> -	/*
> -	 * Not fitted on Carrier-1 board... yet
>  	status = "okay";
>  
> +	/* Pro baseboard model */
>  	rtc: pcf8523@68 {
>  		compatible = "nxp,pcf8523";
>  		reg = <0x68>;
>  	};
> -	 */
>  };
>  
>  &i2c2 {
> -- 
> 1.8.3.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCHv5 06/10] arm: mvebu: define and use common Armada 370
 UART pinctrl settings
Date: Fri, 21 Nov 2014 21:26:48 +0100
Message-ID: <20141121202648.GF20238@lunn.ch>
References: <cover.1416598536.git.arno@natisbad.org>
 <455f2c2ebd8075c43f1fe60b99de10160310f780.1416598537.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <455f2c2ebd8075c43f1fe60b99de10160310f780.1416598537.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnaud
> 
> This patch defines common Armada 370 pinctrl settings for uart0 and
> uart1 interfaces:
> 
>  uart0: MPP0-1 as default
>  uart1: MPP41-42 as default
> 
> Note: this patch has the potential to break out-of-tree users w/o
> specific pinctrl settings for their uart interfaces if the default
> above does not match their config.
> 
> Suggested-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
> ---
>  arch/arm/boot/dts/armada-370.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/armada-370.dtsi b/arch/arm/boot/dts/armada-370.dtsi
> index f1284ae0cddd..b8de32b2a265 100644
> --- a/arch/arm/boot/dts/armada-370.dtsi
> +++ b/arch/arm/boot/dts/armada-370.dtsi
> @@ -211,6 +211,21 @@
>  				pinctrl-names = "default";
>  			};
>  
> +			/*
> +			 * Default UART pinctrl setting without RTS/CTS, can
> +			 * be overwritten on board level if a different
> +			 * configuration is used.
> +			 */
> +			uart0: serial@12000 {
> +				pinctrl-0 = <&uart0_pins>;
> +				pinctrl-names = "default";
> +			};
> +
> +			uart1: serial@12100 {
> +				pinctrl-0 = <&uart1_pins>;
> +				pinctrl-names = "default";
> +			};
> +

And again.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

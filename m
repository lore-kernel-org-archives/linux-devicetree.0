From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: armada-38x: label USB and SATA nodes
Date: Fri, 31 Mar 2017 18:50:15 +0200
Message-ID: <20170331165015.GJ12814@lunn.ch>
References: <20170331074115.8111-1-ralph.sennhauser@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170331074115.8111-1-ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> -			sata@a8000 {
> +			satac0: sata@a8000 {

Hi Ralph

Why the c in satac0?

>  
> -			usb3@f0000 {
> +			usb3_0: usb3@f0000 {
>  				compatible = "marvell,armada-380-xhci";
>  				reg = <0xf0000 0x4000>,<0xf4000 0x4000>;
>  				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> @@ -598,7 +598,7 @@
>  				status = "disabled";
>  			};
>  
> -			usb3@f8000 {
> +			usb3_1: usb3@f8000 {
>  				compatible = "marvell,armada-380-xhci";
>  				reg = <0xf8000 0x4000>,<0xfc000 0x4000>;
>  				interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;

I can understand what you are saying. But does anybody else care? Are
there other .dtsi files differentiating between USB 1.1, 2 and 3?

      Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: dts: pxa: add pxa-timer to pxa27x
Date: Sun, 1 Feb 2015 13:07:55 +0000
Message-ID: <20150201130755.GA25767@leverpostej>
References: <1422744510-3179-1-git-send-email-robert.jarzmik@free.fr>
 <1422744510-3179-5-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422744510-3179-5-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 31, 2015 at 10:48:30PM +0000, Robert Jarzmik wrote:
> Each pxa has an embedded OS Timers IP. The kernel cannot work without a
> valid clocksource, and this adds the OS Timers to the pxa device-tree
> description.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> ---
>  arch/arm/boot/dts/pxa27x.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
> index 7f93828..9e6bf60 100644
> --- a/arch/arm/boot/dts/pxa27x.dtsi
> +++ b/arch/arm/boot/dts/pxa27x.dtsi
> @@ -97,5 +97,18 @@
>  			status = "okay";
>  		};
>  	};
> +
> +	clocksources {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +

There is absolutely no need for this container node.

Please get rid of it and place the node below directly under the parent
node.

Mark.

> +		pxa-timer@40a00000 {
> +			compatible = "marvell,pxa-timer";
> +			reg = <0x40a00000 0x20>;
> +			interrupts = <26>;
> +			clocks = <&pxa2xx_clks CLK_OSTIMER>;
> +			status = "okay";
> +		};
>  	};
>  };
> -- 
> 2.1.0
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 11/19] ARM: dts: imx: replace legacy *,wakeup property
 with wakeup-source
Date: Mon, 23 Nov 2015 13:37:05 +0800
Message-ID: <20151123053705.GH13744@tiger>
References: <1445422216-29375-1-git-send-email-sudeep.holla@arm.com>
 <1445422216-29375-12-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445422216-29375-12-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 21, 2015 at 11:10:08AM +0100, Sudeep Holla wrote:
> Though the keyboard and other driver will continue to support the legacy
> "gpio-key,wakeup", "linux,wakeup" boolean property to enable the wakeup
> source, "wakeup-source" is the new standard binding.
> 
> This patch replaces all the legacy wakeup properties with the unified
> "wakeup-source" property in order to avoid any futher copy-paste
> duplication.
> 
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

<snip>

> diff --git a/arch/arm/boot/dts/imx51-digi-connectcore-som.dtsi b/arch/arm/boot/dts/imx51-digi-connectcore-som.dtsi
> index 321662f53e33..16fc69c69ab2 100644
> --- a/arch/arm/boot/dts/imx51-digi-connectcore-som.dtsi
> +++ b/arch/arm/boot/dts/imx51-digi-connectcore-som.dtsi
> @@ -156,7 +156,7 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_esdhc2>;
>  	cap-sdio-irq;
> -	enable-sdio-wakeup;
> +	wakeup-source;

I do not see this be mentioned in commit log.  I do not see relevant
kernel changes in v4.4-rc1 to support that.  Am I missing anything? 

Shawn

>  	keep-power-in-suspend;
>  	max-frequency = <50000000>;
>  	no-1-8-v;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

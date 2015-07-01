From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] keystone: dts: add psci command definition
Date: Wed, 1 Jul 2015 13:41:01 +0100
Message-ID: <20150701124101.GB2310@leverpostej>
References: <1435752784-30639-1-git-send-email-vitalya@ti.com>
 <1435752784-30639-2-git-send-email-vitalya@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1435752784-30639-2-git-send-email-vitalya-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vitaly Andrianov <vitalya-l0cyMroinI0@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 01, 2015 at 01:13:04PM +0100, Vitaly Andrianov wrote:
> This commit adds definition for cpu_on, cpu_off and cpu_suspend commands.
> These definitions must match the corresponding PSCI definitions in
> boot monitor.
> 
> Signed-off-by: Vitaly Andrianov <vitalya-l0cyMroinI0@public.gmane.org>
> ---
>  arch/arm/boot/dts/keystone.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/keystone.dtsi b/arch/arm/boot/dts/keystone.dtsi
> index c06542b..ab60fca 100644
> --- a/arch/arm/boot/dts/keystone.dtsi
> +++ b/arch/arm/boot/dts/keystone.dtsi
> @@ -58,6 +58,14 @@
>  			     <GIC_SPI 23 IRQ_TYPE_EDGE_RISING>;
>  	};
>  
> +	psci {
> +		compatible	= "arm,psci";
> +		method		= "smc";
> +		cpu_suspend	= <0x84000001>;
> +		cpu_off		= <0x84000002>;
> +		cpu_on		= <0x84000003>;
> +	};

It would be nice to have this injected automatically by the bootlaoder
when PSCI is present, as that way users of existing systems can upgrade
their DTB and still have things boot.

Thanks,
Mark.

> +
>  	soc {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

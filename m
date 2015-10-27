From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: Added syscon-reboot node for FSL's LS2085A
 SoC
Date: Tue, 27 Oct 2015 16:34:41 +0000
Message-ID: <20151027163441.GK3091@leverpostej>
References: <1445650280-9966-1-git-send-email-German.Rivera@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445650280-9966-1-git-send-email-German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "J. German Rivera" <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org, stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 23, 2015 at 08:31:20PM -0500, J. German Rivera wrote:
> Added sys-reboot node to the FSL's LS2085A SoC DT to leverage
> the ARM-generic reboot mechanism for this SoC. This mechanism
> is enabled through CONFIG_POWER_RESET_SYSCON.

Per the comments in arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi, the
platform has PSCI 0.2+, and therefore already has system reset
functionality.

Given that, why is this necessary?

Thanks,
Mark.

> Signed-off-by: J. German Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> index e281ceb..6f82163 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi
> @@ -131,6 +131,18 @@
>  		interrupts = <1 9 0x4>;
>  	};
>  
> +	rst_ccsr: rstccsr@1E60000 {
> +	        compatible = "syscon";
> +		reg = <0x0 0x1E60000 0x0 0x10000>;
> +	};
> +
> +	reboot@65024000 {
> +		compatible ="syscon-reboot";
> +		regmap = <&rst_ccsr>;
> +		offset = <0x0>;
> +		mask = <0x2>;
> +	};
> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupts = <1 13 0x8>, /* Physical Secure PPI, active-low */
> -- 
> 2.3.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

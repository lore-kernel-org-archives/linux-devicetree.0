From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 4/9] arm64: dts: m3ulcb: enable GPIO leds
Date: Mon, 7 Nov 2016 13:57:37 +0100
Message-ID: <20161107125737.GF12319@verge.net.au>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1478196451-1298-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478196451-1298-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 03, 2016 at 09:07:31PM +0300, Vladimir Barinov wrote:
> This supports GPIO leds on M3ULCB board

Are GPIO leds and keys also present on the H3ULCB.
If so could you consider sending patches to enable them?

> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> index fb694b8..3329f78 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
> @@ -31,6 +31,17 @@
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0x0 0x48000000 0x0 0x38000000>;
>  	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led5 {
> +			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> +		};
> +		led6 {
> +			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
>  };
>  
>  &extal_clk {
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

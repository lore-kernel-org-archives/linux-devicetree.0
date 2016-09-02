From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 1/4] arm64: dts: h3ulcb: enable GPIO leds
Date: Fri, 2 Sep 2016 19:28:30 +0300
Message-ID: <e5033864-e7b0-8bbd-ba6f-af20e2232b6e@cogentembedded.com>
References: <1472817881-11860-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472817909-11901-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472817909-11901-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 09/02/2016 03:05 PM, Vladimir Barinov wrote:

> This supports GPIO leds on H3ULCB board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> ---
> Changes in version 3:
> - initially added
> Changes in version 4:
> - removed led4 in favor of gpio-keys
> - added label
>
>  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> index fb694b8..3329f78 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> @@ -31,6 +31,19 @@
>  		/* first 128MB is reserved for secure area. */
>  		reg = <0x0 0x48000000 0x0 0x38000000>;
>  	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led5 {
> +			label = "LED5";

    Do we need the "label" prop? Based on the feedback to my former LED 
patches, no?

> +			gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> +		};
> +		led6 {
> +			label = "LED6";
> +			gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
>  };
>
>  &extal_clk {

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

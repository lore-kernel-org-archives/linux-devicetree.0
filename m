From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 12/12] arm64: dts: h3ulcb: Sound SSI support
Date: Fri, 2 Sep 2016 15:38:00 +0300
Message-ID: <159bb1fc-aa36-d30f-5064-b61efa34c663@cogentembedded.com>
References: <1472817881-11860-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472817933-12018-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472817933-12018-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 9/2/2016 3:05 PM, Vladimir Barinov wrote:

> This supports SSI sound for H3ULCB board.
> SSI DMA mode used. CS2000 used as AUDIO_CLK_B.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes in version 3:
> - initially added
> Changes in version 4:
> - added comment for audio_clkout
>
>  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 115 +++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> index bbd7928..a254231 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> @@ -45,6 +45,12 @@
>  		};
>  	};
>
> +	x12_clk: x12_clk {

    If the crystal name is X12, name the node "x12" too, this way the output 
clock will be named just "x12".

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24576000>;
> +	};
> +
>  	vcc_sdhi0: regulator-vcc-sdhi0 {
>  		compatible = "regulator-fixed";
>
[...]
> @@ -136,6 +176,73 @@
[...]
> +
> +	cs2000: clk_multiplier@4f {

    Don't use underscores in the node names, use hyphens instead.

> +		#clock-cells = <0>;
> +		compatible = "cirrus,cs2000-cp";
> +		reg = <0x4f>;
> +		clocks = <&audio_clkout>, <&x12_clk>;
> +		clock-names = "clk_in", "ref_clk";
> +
> +		assigned-clocks = <&cs2000>;
> +		assigned-clock-rates = <24576000>; /* 1/1 divide */
> +	};
> +};
[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

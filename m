From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: v3msk: add EtherAVB support
Date: Wed, 29 Nov 2017 10:51:13 +0100
Message-ID: <20171129095113.ca4vc3ppbzs3plwq@verge.net.au>
References: <20171124210317.285946395@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171124210317.285946395-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 24, 2017 at 11:59:45PM +0300, Sergei Shtylyov wrote:
> Define the V3M Starter Kit board dependent part of the EtherAVB
> device node.
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> ---
>  arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts |   11 +++++++++++
>  1 file changed, 11 insertions(+)

For consistency with other Renesas boards please consider reposing with the
following added to the chosen node.

		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";

> 
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> @@ -31,6 +31,17 @@
>  	};
>  };
>  
> +&avb {
> +	renesas,no-ether-link;
> +	phy-handle = <&phy0>;
> +	status = "okay";
> +
> +	phy0: ethernet-phy@0 {
> +		rxc-skew-ps = <1500>;
> +		reg = <0>;
> +	};
> +};
> +
>  &extal_clk {
>  	clock-frequency = <16666666>;
>  };
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

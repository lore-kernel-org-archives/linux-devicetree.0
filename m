From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: initial Eagle board device
 tree
Date: Mon, 18 Sep 2017 10:13:38 +0200
Message-ID: <20170918081338.GD4644@verge.net.au>
References: <20170915194445.950496886@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170915194445.950496886-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 15, 2017 at 10:43:25PM +0300, Sergei Shtylyov wrote:
> Add the initial device  tree for  the R8A77970 SoC based Eagle board.
> The board has 1 debug serial port (SCIF0); include support for it,
> so that the serial console can work.
> 
> Based on the original (and large) patch by Vladimir Barinov
> <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> ---
>  arch/arm64/boot/dts/renesas/Makefile           |    1 
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |   45 +++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
> 
> Index: renesas/arch/arm64/boot/dts/renesas/Makefile
> ===================================================================
> --- renesas.orig/arch/arm64/boot/dts/renesas/Makefile
> +++ renesas/arch/arm64/boot/dts/renesas/Makefile
> @@ -2,6 +2,7 @@ dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-sa
>  dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-xs.dtb
>  dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-es1-salvator-x.dtb r8a7795-es1-h3ulcb.dtb
>  dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-x.dtb r8a7796-m3ulcb.dtb
> +dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
>  dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb

Please consider submitting a patch to enable CONFIG_ARCH_R8A77970
in the ARM64 defconfig.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

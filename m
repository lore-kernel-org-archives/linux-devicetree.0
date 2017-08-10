From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7743: Add IIC cores to dtsi
Date: Thu, 10 Aug 2017 10:01:21 +0200
Message-ID: <20170810080121.GE16647@verge.net.au>
References: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
 <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <12d923ba-184c-ef59-f27b-41a7592a5f93-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 09, 2017 at 12:17:06PM +0300, Sergei Shtylyov wrote:
> On 8/8/2017 3:46 PM, Biju Das wrote:
> 
> >Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> >---
> >This patch has been tested against Linux-next tag 20170727 and renesas-dev branch.
> >This patch depends on https://www.spinics.net/lists/arm-kernel/msg599220.html
> >
> >  arch/arm/boot/dts/r8a7743.dtsi | 55 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >
> >diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
> >index 14222c72..5c2b140 100644
> >--- a/arch/arm/boot/dts/r8a7743.dtsi
> >+++ b/arch/arm/boot/dts/r8a7743.dtsi
> [...]
> >@@ -436,6 +439,58 @@
> >  			status = "disabled";
> >  		};
> >+		i2c6: i2c@e60b0000 {
> 
>    I'd use iic0 as the label.

I have no preference here other than that we try to be consistent
in DT for different R-Car SoCs. Wolfram, do you have an opinion on this?

> 
> >+			/* doesn't need pinmux */
> >+			#address-cells = <1>;
> >+			#size-cells = <0>;
> >+			compatible = "renesas,iic-r8a7743",
> >+				     "renesas,rcar-gen2-iic",
> >+				     "renesas,rmobile-iic";
> >+			reg = <0 0xe60b0000 0 0x425>;
> >+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> >+			clocks = <&cpg CPG_MOD 926>;
> >+			dmas = <&dmac0 0x77>, <&dmac0 0x78>,
> >+			       <&dmac1 0x77>, <&dmac1 0x78>;
> >+			dma-names = "tx", "rx", "tx", "rx";
> >+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
> >+			resets = <&cpg CPG_MOD 926>;
> 
>    CPG_MOD not needed here, it's not a "clocks" prop.
> 
> [...]
> 
> MBR, Sergei
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

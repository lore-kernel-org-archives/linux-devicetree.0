From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: r8a7795: add IMR-LX4 support
Date: Wed, 5 Jul 2017 11:45:47 +0100
Message-ID: <20170705104547.GE24043@verge.net.au>
References: <20170627173152.532417992@cogentembedded.com>
 <CAMuHMdV9o0HhZgJS2cyWPmsdqgRmXpjSfKrKQMN=x5VTpXZoUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdV9o0HhZgJS2cyWPmsdqgRmXpjSfKrKQMN=x5VTpXZoUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 05, 2017 at 12:18:01PM +0200, Geert Uytterhoeven wrote:
> Hi Sergei,
> 
> On Tue, Jun 27, 2017 at 7:30 PM, Sergei Shtylyov
> <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> > Describe the IMR-LX4 devices in the R8A7795 device tree.
> >
> > Based on the original (and large) patch by Konstantin Kozhevnikov
> > <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.
> >
> > Signed-off-by: Konstantin Kozhevnikov <Konstantin.Kozhevnikov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >
> > ---
> > This patch is against the 'renesas-devel-20170626-v4.12-rc7' tag of Simon
> > Horman's 'renesas.git' repo.
> >
> > The IMR-LX4 bindings were documented in the IMR driver patch and ACK'ed by Rob
> > Herring, so I don't expect them to change...
> >
> > Changes in version 2:
> > - added SoC specific "compatible" prop values;
> > - refreshed the patch;
> > - added Geert's tag.
> 
> In the mean time, r8a7795.dtsi gained reset controller support, so
> you should add "resets" properties were appropriate.

Thanks, I have squashed-in the following.

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index f76cb360e110..31d1ba586ec2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1542,6 +1542,7 @@
 			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 823>;
 			power-domains = <&sysc R8A7795_PD_A3VC>;
+			resets = <&cpg 823>;
 		};
 
 		imr-lx4@fe870000 {
@@ -1551,6 +1552,7 @@
 			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 822>;
 			power-domains = <&sysc R8A7795_PD_A3VC>;
+			resets = <&cpg 822>;
 		};
 
 		imr-lx4@fe880000 {
@@ -1560,6 +1562,7 @@
 			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 821>;
 			power-domains = <&sysc R8A7795_PD_A3VC>;
+			resets = <&cpg 821>;
 		};
 
 		imr-lx4@fe890000 {
@@ -1569,6 +1572,7 @@
 			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 820>;
 			power-domains = <&sysc R8A7795_PD_A3VC>;
+			resets = <&cpg 820>;
 		};
 
 		vspbc: vsp@fe920000 {
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

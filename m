From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77970: add I2C support
Date: Wed, 29 Nov 2017 10:38:22 +0100
Message-ID: <20171129093817.bbcdlggh7i2vuril@verge.net.au>
References: <20171116210757.729290426@cogentembedded.com>
 <CAMuHMdV1RFyvPSZjEiJvdnu6QfHC9s-oUubvph0atGqx27MjnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdV1RFyvPSZjEiJvdnu6QfHC9s-oUubvph0atGqx27MjnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 22, 2017 at 02:06:59PM +0100, Geert Uytterhoeven wrote:
> Hi Sergei,
> 
> On Thu, Nov 16, 2017 at 10:06 PM, Sergei Shtylyov
> <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> > Define the generic R8A77970 parts of the I2C[0-4] device node.
> >
> > Based on the original (and large) patch by Daisuke Matsushita
> > <daisuke.matsushita.ns-FCd8Q96Dh0JBDgjK7y7TUQ@public.gmane.org>.
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> Thanks for your patch!
> 
> > --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> 
> > @@ -483,5 +491,85 @@
> >                         #address-cells = <1>;
> >                         #size-cells = <0>;
> >                 };
> > +
> > +               i2c0: i2c@e6500000 {
> > +                       compatible = "renesas,i2c-r8a77970",
> > +                                    "renesas,rcar-gen3-i2c";
> > +                       reg = <0 0xe6500000 0 0x40>;
> > +                       interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 931>;
> > +                       power-domains = <&sysc 32>;
> > +                       resets = <&cpg 931>;
> > +                       dmas = <&dmac1 0x91>, <&dmac1 0x90>;
> 
> Can't all five i2c interfaces be used with both dmac1 and dmac2?
> 
> With that fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Hi Sergei,

I have marked this series as "Changes Requested" in light of Geert's review
above. 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a7795: Move nodes which have
 no reg property out of bus
Date: Wed, 29 Nov 2017 09:20:30 +0100
Message-ID: <20171129082029.wzjrxupgfnj7tp4u@verge.net.au>
References: <20171124105234.25774-1-horms+renesas@verge.net.au>
 <CAMuHMdW9V6Bkh5uS9qNA7awtygEs=qRd7jigwSHmpV2VM3n9dA@mail.gmail.com>
 <20171127110430.ulgjrzgy3pdugs2s@verge.net.au>
 <CAMuHMdUm=PiGVWVg9pyNTR5z2WjLcoG1uecBNBeKsSxbAxBt8w@mail.gmail.com>
 <20171128085645.ofrk33bfqd736sip@verge.net.au>
 <CAMuHMdXoDNt7j-hEZmDA2BFFPUAfsi1ukZWowJ3=kTswyYMk5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXoDNt7j-hEZmDA2BFFPUAfsi1ukZWowJ3=kTswyYMk5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 28, 2017 at 10:04:00AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Tue, Nov 28, 2017 at 9:56 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> > On Mon, Nov 27, 2017 at 12:15:39PM +0100, Geert Uytterhoeven wrote:
> >> On Mon, Nov 27, 2017 at 12:04 PM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> >> > I just noticed that with this patch applied I now see:
> >> >
> >> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a57
> >> > arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a53
> >> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a57
> >> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /pmu_a53arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dtb: Warning (interrupts_property): Missing interrupt-parent for /timer
> >> >
> >> > arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dtb: Warning (interrupts_property): Missing interrupt-parent for /timer
> >>
> >> Right, the "interrupt-parent = <&gic>;" inside the /soc node applies to child
> >> nodes of the /soc node only.
> >>
> >> You can find this in two ways:
> 
> s/find/fix/
> 
> >>
> >>   1. Add "interrupt-parent = <&gic>;" to the /pmu_a57 and /pmu_a53 nodes.
> >>   2. Switch those nodes from "interrupt" to "interrupts-extended", e.g. turn
> >>
> >>         interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
> >>
> >>      into
> >>
> >>         interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
> >>
> >> The latter is what e.g. arch/arm/boot/dts/armada-375.dtsi does.
> >
> > Thanks, I took option 1 as it seems consistent with the rest of the
> > Renesas DT files. I also added it to the /timer node.
> 
> Actually we recently had a discussion about this on IRC, triggered by a
> similar issue in board files (see e.g, Ethernet PHY interrupts).
> 
> Given the following comment:
> 
> drivers/of/irq.c:       /* Try the new-style interrupts-extended first */
> drivers/of/irq.c:       res = of_parse_phandle_with_args(device,
> "interrupts-extended",
> 
> I think it would be better to use interrupts-extended for individual/isolated
> use outside the /soc node.

Sure, will do.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

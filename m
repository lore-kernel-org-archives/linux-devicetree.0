From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] irqchip/renesas-intc-irqpin: Add R-Car Gen1 fallback
 binding
Date: Mon, 12 Dec 2016 12:43:11 -0600
Message-ID: <20161212184311.2gciuj5lgkp5x7st@rob-hp-laptop>
References: <1481280650-9258-1-git-send-email-horms+renesas@verge.net.au>
 <1481280650-9258-3-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdX_Cg6T10pMXe420kOwQn27_PRm-osNb7L4_M==fJnE_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdX_Cg6T10pMXe420kOwQn27_PRm-osNb7L4_M==fJnE_Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 09, 2016 at 01:52:20PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Dec 9, 2016 at 11:50 AM, Simon Horman
> <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> > In the case of Renesas R-Car hardware we know that there are generations of
> > SoCs, e.g. Gen 1, Gen 2 and Gen 3. But beyond that its not clear what the
> 
> it's
> 
> > relationship between IP blocks might be. For example, I believe that
> > r8a7779 is older than r8a7778 but that doesn't imply that the latter is a
> > descendant of the former or vice versa.
> >
> > We can, however, by examining the documentation and behaviour of the
> > hardware at run-time observe that the current driver implementation appears
> > to be compatible with the IP blocks on SoCs within a given generation.
> >
> > For the above reasons and convenience when enabling new SoCs a
> > per-generation fallback compatibility string scheme being adopted for
> > drivers for Renesas SoCs.
> >
> > Signed-off-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> > ---
> >  .../interrupt-controller/renesas,intc-irqpin.txt   | 44 ++++++++++++----------
> >  drivers/irqchip/irq-renesas-intc-irqpin.c          |  2 +
> >  2 files changed, 26 insertions(+), 20 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
> > index 772c550d3b4b..e5a5251be9f5 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
> > @@ -2,13 +2,19 @@ DT bindings for the R-/SH-Mobile irqpin controller
> >
> >  Required properties:
> >
> > -- compatible: has to be "renesas,intc-irqpin-<soctype>", "renesas,intc-irqpin"
> > -  as fallback.
> > -  Examples with soctypes are:
> > +- compatible:
> >      - "renesas,intc-irqpin-r8a7740" (R-Mobile A1)
> >      - "renesas,intc-irqpin-r8a7778" (R-Car M1A)
> >      - "renesas,intc-irqpin-r8a7779" (R-Car H1)
> >      - "renesas,intc-irqpin-sh73a0" (SH-Mobile AG5)
> > +    - "renesas,rcar-gen1-intc-irqpin" (generic R-Car Gen1 compatible device)
> 
> Does it make sense to add a new family-specific compatible value to a driver
> that's unlikely to receive more users in the future? More recent SoCs use
> renesas,irqc.

If that's the case, then no. Please don't go crazy with your generic 
strings. I don't mind them, but I don't know that I'd call it best 
practice.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

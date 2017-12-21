From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] irqchip: add support for LS1021A external interrupt lines
Date: Thu, 21 Dec 2017 16:45:45 -0600
Message-ID: <20171221224545.vd3qcwmvw23ng6w2@rob-hp-laptop>
References: <48d2d08c-c57a-ce49-5958-0fd5ad4a2dc7@arm.com>
 <1512743580-15358-1-git-send-email-rasmus.villemoes@prevas.dk>
 <20171212232839.yy3jtn6amktqjo4g@rob-hp-laptop>
 <62c4af0c-ffe5-23c9-9ef6-2e4b8ab90050@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <62c4af0c-ffe5-23c9-9ef6-2e4b8ab90050-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 15, 2017 at 11:55:34PM +0100, Rasmus Villemoes wrote:
> On 2017-12-13 00:28, Rob Herring wrote:
> > On Fri, Dec 08, 2017 at 03:33:00PM +0100, Rasmus Villemoes wrote:
> >>
> >>  .../interrupt-controller/fsl,ls1021a-extirq.txt    |  19 +++
> > 
> > Please split to separate patch.
> 
> Will do.
> 
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls1021a-extirq.txt
> >> @@ -0,0 +1,19 @@
> >> +* Freescale LS1021A external IRQs
> >> +
> >> +The LS1021A supports inverting the polarity of six external interrupt lines.
> >> +
> >> +Required properties:
> >> +- compatible: should be "fsl,ls1021a-extirq"
> >> +- interrupt-controller: Identifies the node as an interrupt controller
> >> +- #interrupt-cells: Use the same format as specified by GIC in arm,gic.txt.
> >> +- interrupt-parent: phandle of GIC.
> >> +- syscon: phandle of Supplemental Configuration Unit (scfg).
> > 
> > Can this be a child of that node instead?
> 
> I suppose it could, but I don't think it would make much sense. In any
> case, I did it this way because that seemed to be the way the syscon
> driver is used in lots of other cases, cf. all the occurrences of
> syscon_regmap_lookup_by_phandle() and the corresponding bindings - I
> don't think I've seen any of those cases represent the syscon-using node
> as a child of the syscon node.

I'm sure there are examples because this is a frequent review comment. 
In any case, define the binding by what the h/w looks like, not what the 
kernel *currently* wants.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

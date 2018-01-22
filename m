From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/9] irqchip: Add the ingenic-tcu-intc driver
Date: Mon, 22 Jan 2018 11:46:39 +0000
Message-ID: <20180122114639.yjfdbvizs6fcpfdq@dell>
References: <20180101143344.2099-1-paul@crapouillou.net>
 <20180110224838.16711-1-paul@crapouillou.net>
 <20180110224838.16711-6-paul@crapouillou.net>
 <58349291-93cd-f803-52a9-f88120ace4dc@arm.com>
 <1515687945.2170.1@smtp.crapouillou.net>
 <20180120130649.7f326f75@why.wild-wind.fr.eu.org>
 <20180122092617.36ggqqike4gwwgrd@dell>
 <bdae1be4-0ed2-1b7d-8b08-7439ce06e762@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <bdae1be4-0ed2-1b7d-8b08-7439ce06e762-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 22 Jan 2018, Marc Zyngier wrote:

> On 22/01/18 09:26, Lee Jones wrote:
> > On Sat, 20 Jan 2018, Marc Zyngier wrote:
> > 
> >> On Thu, 11 Jan 2018 17:25:45 +0100
> >> Paul Cercueil <paul-icTtO2rgO2OTuSrc4Mpeew@public.gmane.org> wrote:
> >>
> >>> Hi Marc,
> >>>
> >>>>>  +static int __init ingenic_tcu_intc_of_init(struct device_node 
> >>>>> *node,
> >>>>>  +	struct device_node *parent)
> >>>>>  +{
> >>>>>  +	struct irq_domain *domain;
> >>>>>  +	struct irq_chip_generic *gc;
> >>>>>  +	struct irq_chip_type *ct;
> >>>>>  +	int err, i, num_parent_irqs;
> >>>>>  +	unsigned int parent_irqs[3];  
> >>>>
> >>>> 3 parent interrupts? Really? How do you pick one? Also, given the 
> >>>> useage
> >>>> model below, "int" is the wrong type. Probably should be u32.  
> >>>
> >>> See below.
> >>>
> >>>>>  +	struct regmap *map;
> >>>>>  +
> >>>>>  +	num_parent_irqs = of_property_count_elems_of_size(
> >>>>>  +			node, "interrupts", 4);  
> >>>>
> >>>> Nit: on a single line, as here is nothing that hurts my eyes more than
> >>>> reading something like(
> >>>> this). Also, 4 is better expressed as sizeof(u32).  
> >>>
> >>> That will make checkpatch.pl unhappy :(
> >>
> >> And I don't care about checkpatch. I maintain the irqchip stuff, while
> >> checkpatch doesn't. Hence, I win.
> > 
> > 	num_parent_irqs =
> > 		of_property_count_elems_of_size(node, "interrupts", 4);  
> > 
> > Everybody wins!
> 
> <old_git_rant>
> 
> As I said before, I've stopped using a physical DEC VT100 around 1990,
> and gained the ability to extend my terminal to a bit more that 80
> columns. And even the VT100 could be coerced into using a 132 column mode...
> 
> </old_git_rant>

Right, Greg has spoken about this before.

> Adhering to a convention can be good, but common sense must apply first.
> Splitting an assignment is visually annoying and in that case, it
> doesn't make much sense. I'll happily take a line that goes beyond 80
> cols

I'm not adverse to the idea, but we should agree to do this centrally,
rather than a few of us going rouge.  This way we can go ahead and
change all of the documentation and tooling (inc. Checkpatch) too,
which will save on countless inevitable conversations/patches
attempting to 'fix' non-conforming lines/files.

> and if you really wanted to stay within boundaries, how about
> turning "num_parent_irqs" something shorter?


-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

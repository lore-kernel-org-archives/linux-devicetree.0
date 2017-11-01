From: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 05/13] irqchip: add initial support for ompic
Date: Wed, 1 Nov 2017 21:17:16 +0900
Message-ID: <20171101121716.GH29237@lianli.shorne-pla.net>
References: <20171029231123.27281-1-shorne@gmail.com>
 <20171029231123.27281-6-shorne@gmail.com>
 <86mv4974ht.fsf@arm.com>
 <20171030041806.GA29237@lianli.shorne-pla.net>
 <86vaix5fmr.fsf@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <86vaix5fmr.fsf-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonas Bonn <jonas-A9uVI2HLR7kOP4wsBPIw7w@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, openrisc-cunTk1MwBs9a3B2Vnqf2dGD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 30, 2017 at 06:11:40AM +0000, Marc Zyngier wrote:
> On Mon, Oct 30 2017 at  1:18:06 pm GMT, Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Mon, Oct 30, 2017 at 02:29:18AM +0000, Marc Zyngier wrote:
> >> On Mon, Oct 30 2017 at  8:11:15 am GMT, Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> > From: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
> >> >
> >> > IPI driver for the Open Multi-Processor Interrupt Controller (ompic) as
> >> > described in the Multi-core support section of the OpenRISC 1.2
> >> > architecture specification:
> >> >
> >> >   https://github.com/openrisc/doc/raw/master/openrisc-arch-1.2-rev0.pdf
> >> >
> >> > Each OpenRISC core contains a full interrupt controller which is used in
> >> > the SMP architecture for interrupt balancing.  This IPI device, the
> >> > ompic, is the only external device required for enabling SMP on
> >> > OpenRISC.
> >> >
> >> > Pending ops are stored in a memory bit mask which can allow multiple
> >> > pending operations to be set and serviced at a time. This is mostly
> >> > borrowed from the alpha IPI implementation.
> >> >
> >> > Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> >> > Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> > Signed-off-by: Stefan Kristiansson <stefan.kristiansson-MbMCFXIvDHJFcC0YU169RA@public.gmane.org>
> >> > [shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org: converted ops to bitmask, wrote commit message]
> >> > Signed-off-by: Stafford Horne <shorne-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> 
> >> Reviewed-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> >
> > Thanks
> >
> >> Side question: what is your merge strategy for this? I can take it
> >> through the irqchip tree as it is standalone, but I'm open to other
> >> suggestions.
> >
> > For me its easier if I just take it through the openrisc tree, as
> > there are dependencies between this series and the irqchip driver.
> > If you are ok with that I can make a note to Linus indicating so in
> > the pull request.
> 
> No problem, that's OK with me.

Acknowledged

> > My plan is to send this series during the 4.15 merge window.
> 
> Make sure this is in -next (when it comes back to life...).

Its there now, and it looks like -next is almost back to life.

-Stafford
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

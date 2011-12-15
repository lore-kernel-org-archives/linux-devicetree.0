From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/9] irq: convert generic-chip to use irq_domain
Date: Thu, 15 Dec 2011 22:08:28 +0800
Message-ID: <20111215140827.GB2963@S2100-06.ap.freescale.net>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com>
 <1323876538-20406-4-git-send-email-robherring2@gmail.com>
 <20111215052512.GB21815@S2101-09.ap.freescale.net>
 <20111215055501.GC21815@S2101-09.ap.freescale.net>
 <4EE9F899.7010402@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4EE9F899.7010402-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 15, 2011 at 07:39:37AM -0600, Rob Herring wrote:
> On 12/14/2011 11:55 PM, Shawn Guo wrote:
> > On Thu, Dec 15, 2011 at 01:25:20PM +0800, Shawn Guo wrote:
> >> On Wed, Dec 14, 2011 at 09:28:52AM -0600, Rob Herring wrote:
> >>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >>>
> >>> Add irq domain support to irq generic-chip. This enables users of
> >>> generic-chip to support dynamic irq assignment needed for DT interrupt
> >>> binding. Users must be converted to use irq_data.hwirq for determining
> >>> local interrupt numbers rather than using the Linux irq number.
> >>>
> >>> irq_base is kept for now as there are a few users of it. Once they
> >>> are converted to use the irq domain, it can be removed.
> >>>
> >>> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >>> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> >>> ---
> >>
> >> Tested-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>
> > Sorry, I have to take that tag back after I correct my test setup.
> > It does not work for imx5 TZIC case, because the following change
> > I suggested before is missed.
> > 
> > diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> > index eb763f7..2a2aac1 100644
> > --- a/kernel/irq/irqdomain.c
> > +++ b/kernel/irq/irqdomain.c
> > @@ -39,7 +39,7 @@ void irq_domain_add(struct irq_domain *domain)
> >                         return;
> >                 }
> >                 d->domain = domain;
> > -               d->hwirq = hwirq;
> > +               d->hwirq = hwirq - domain->hwirq_base;
> 
> This is a problem. It entirely defeats the point of hwirq_base and it
> would break the GIC. We need to fix this in the generic irq chip.
> 
Actually I do not quite understand why we need to make the following
change all over generic-chip.c.

-       u32 mask = 1 << (d->irq - gc->irq_base);
+       u32 mask = 1 << d->hwirq;

Though d->irq is the Linux irq number, "d->irq - gc->irq_base" is
really just what we need here.

-- 
Regards,
Shawn

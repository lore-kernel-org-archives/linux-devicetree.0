From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH]  of/base: Fix PowerPC address parsing hack
Date: Thu, 13 Nov 2014 10:08:45 +1100
Message-ID: <1415833725.5124.53.camel@kernel.crashing.org>
References: <1415771461.5124.33.camel@kernel.crashing.org>
	 <20141113091036.4e9ec43d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141113091036.4e9ec43d-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2014-11-13 at 09:10 +1100, Stephen Rothwell wrote:
> Hi Ben,
> 
> Urk!  :-)
> 
> How about:
> 
> On Wed, 12 Nov 2014 16:51:01 +1100 Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> >
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index e371825..e37f017 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -7,6 +7,10 @@
> >  #include <linux/pci_regs.h>
> >  #include <linux/string.h>
> >  
> > +#ifdef CONFIG_PPC
> > +#include <asm/machdep.h>
> 
> #define IS_PMAC	machine_is(pmac)
> #else
> #define IS_PMAC	(0)

I'll just do an of machine compatible check instead, so there's no ifdef
at all, I'll send a new patch later today.

> > +#endif
> > +
> >  /* Max address size we deal with */
> >  #define OF_MAX_ADDR_CELLS	4
> >  #define OF_CHECK_ADDR_COUNT(na)	((na) > 0 && (na) <= OF_MAX_ADDR_CELLS)
> > @@ -428,12 +432,13 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
> >  	 * This code is only enabled on powerpc. --gcl
> >  	 */
> >  	ranges = of_get_property(parent, rprop, &rlen);
> > -#if !defined(CONFIG_PPC)
> > +#if defined(CONFIG_PPC)
> > +	if (!machine_is(powermac))
> > +#endif /* defined(CONFIG_PPC) */
> >  	if (ranges == NULL) {
> 
> if ((!IS_PMAC) && (ranges == NULL)) {
> 
> > -		pr_err("OF: no ranges; cannot translate\n");
> > +		pr_debug("OF: no ranges; cannot translate\n");
> >  		return 1;
> >  	}
> > -#endif /* !defined(CONFIG_PPC) */
> >  	if (ranges == NULL || rlen == 0) {
> >  		offset = of_read_number(addr, na);
> >  		memset(addr, 0, pna * 4);
> 
> There might be a better identifier than IS_PMAC ...
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

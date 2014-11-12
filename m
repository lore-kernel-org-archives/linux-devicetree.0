From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/base: Fix PowerPC address parsing hack
Date: Wed, 12 Nov 2014 17:02:51 +0000
Message-ID: <20141112170251.DA1B7C41C04@trevor.secretlab.ca>
References: <1415771461.5124.33.camel@kernel.crashing.org>
	<CAL_JsqKfBGdpFV_XuE4DEhFrkhN33kOMkiZE_TOnAZDm2qjwMw@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKfBGdpFV_XuE4DEhFrkhN33kOMkiZE_TOnAZDm2qjwMw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linuxppc-dev <linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 12 Nov 2014 08:39:32 -0600
, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 wrote:
> On Tue, Nov 11, 2014 at 11:51 PM, Benjamin Herrenschmidt
> <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org> wrote:
> > We have a historical hack that treats missing ranges properties as the
> > equivalent of an empty one. This is needed for ancient PowerMac "bad"
> > device-trees, and shouldn't be enabled for any other PowerPC platform,
> > otherwise we get some nasty layout of devices in sysfs or even
> > duplication when a set of otherwise identically named devices is
> > created multiple times under a different parent node with no ranges
> > property.
> >
> > This fix is needed for the PowerNV i2c busses to be exposed properly
> > and will fix a number of other embedded cases.
> >
> > Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> > CC: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> > ---
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
> > +#endif
> > +
> >  /* Max address size we deal with */
> >  #define OF_MAX_ADDR_CELLS      4
> >  #define OF_CHECK_ADDR_COUNT(na)        ((na) > 0 && (na) <= OF_MAX_ADDR_CELLS)
> > @@ -428,12 +432,13 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
> >          * This code is only enabled on powerpc. --gcl
> >          */
> >         ranges = of_get_property(parent, rprop, &rlen);
> > -#if !defined(CONFIG_PPC)
> > +#if defined(CONFIG_PPC)
> > +       if (!machine_is(powermac))
> 
> Can we use a machine compatible here or something not PPC specific?
> Then we can use IS_ENABLED(CONFIG_PPC) instead of ifdefs.

Yeah, that's kind of nasty!

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

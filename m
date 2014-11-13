From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] of/base: Fix PowerPC address parsing hack
Date: Thu, 13 Nov 2014 23:53:47 +1100
Message-ID: <1415883227.666.6.camel@kernel.crashing.org>
References: <1415771461.5124.33.camel@kernel.crashing.org>
	 <20141113091036.4e9ec43d@canb.auug.org.au>
	 <1415833725.5124.53.camel@kernel.crashing.org>
	 <1415839522.5124.58.camel@kernel.crashing.org>
	 <CACxGe6s0CXL2oRKCLhzzycOKWJStxdZsc1pn_X8fLuAqCguBMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACxGe6s0CXL2oRKCLhzzycOKWJStxdZsc1pn_X8fLuAqCguBMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robherring2@gmail.com>, Olof Johansson <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev <linuxppc-dev@ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2014-11-13 at 12:44 +0000, Grant Likely wrote:
> On Thu, Nov 13, 2014 at 12:45 AM, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> > What about this one instead ? I want to cache it because that function
> > can be called quite a while and doing two additional property lookup
> > and string compares every time might hurt some platforms.
> >
> > ----
> >
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
> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > CC: <stable@vger.kernel.org>
> 
> How far back does this need to go? I assume I need to get this in for v3.18.

I'd like some distro to pick it up in 3.16

> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index e371825..5eae0cd 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -403,6 +403,17 @@ static struct of_bus *of_match_bus(struct device_node *np)
> >         return NULL;
> >  }
> >
> > +static int of_empty_ranges_quirk(void)
> > +{
> > +       /* To save cycles, we cache the result */
> > +       static int quirk_state = -1;
> > +
> 
> if (IS_ENABLED(CONFIG_POWERPC)) {
> 
> > +       if (quirk_state < 0)
> > +               quirk_state = of_machine_is_compatible("Power Macintosh") ||
> > +                       of_machine_is_compatible("MacRISC");
> > +       return quirk_state;
> 
> }
> return 0;
> 
> So it gets compiled out for non powerpc.

Yeah, I'm set in my ways, keep forgetting about all the shiny new stuff.

> > +}
> > +
> >  static int of_translate_one(struct device_node *parent, struct of_bus *bus,
> >                             struct of_bus *pbus, __be32 *addr,
> >                             int na, int ns, int pna, const char *rprop)
> > @@ -428,12 +439,10 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
> >          * This code is only enabled on powerpc. --gcl
> >          */
> >         ranges = of_get_property(parent, rprop, &rlen);
> > -#if !defined(CONFIG_PPC)
> > -       if (ranges == NULL) {
> > +       if (ranges == NULL && !of_empty_ranges_quirk()) {
> >                 pr_err("OF: no ranges; cannot translate\n");
> >                 return 1;
> >         }
> > -#endif /* !defined(CONFIG_PPC) */
> >         if (ranges == NULL || rlen == 0) {
> >                 offset = of_read_number(addr, na);
> >                 memset(addr, 0, pna * 4);
> >
> >
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/5] PCI: st: Provide support for the sti PCIe controller
Date: Wed, 21 Jan 2015 20:59:21 +0100
Message-ID: <1421870361.3430.12.camel@pengutronix.de>
References: <1418812486-12394-1-git-send-email-gabriel.fernandez@linaro.org>
	 <1682713.ac5OoTJoOr@wuerfel>
	 <CAG374jCRByNZuuYxi5+-mKvV7p5-tCf2G+8mTYfzU4rRV4yfYQ@mail.gmail.com>
	 <6574269.bTBzFhcnBx@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6574269.bTBzFhcnBx@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Magnus Damm <damm@opensource.>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 21.01.2015, 20:35 +0100 schrieb Arnd Bergmann:
> On Wednesday 21 January 2015 16:47:36 Gabriel Fernandez wrote:
> > On 19 January 2015 at 14:49, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > > On Monday 19 January 2015 13:37:33 Gabriel Fernandez wrote:
> > >> On 17 December 2014 at 23:14, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > >> > On Wednesday 17 December 2014 11:34:44 Gabriel FERNANDEZ wrote:
> > >> > > +/*
> > >> > > + * On ARM platforms, we actually get a bus error returned when the PCIe
> > >> > IP
> > >> > > + * returns a UR or CRS instead of an OK.
> > >> > > + */
> > >> > > +static int st_pcie_abort_
> > >> >
> > >> > handler(unsigned long addr, unsigned int fsr,
> > >> > > +                              struct pt_regs *regs)
> > >> > > +{
> > >> > > +     return 0;
> > >> > > +}
> > >> >
> > >> > You should check that it's actually PCI that caused the abort. Don't
> > >> > just ignore a hard error condition.
> > >> >
> > >> > Usually there are registers in the PCI core that let you identify what
> > >> > happened.
> > >> >
> > >>
> > >>
> > >> We return 0 because abort handler is not activated during boot.
> > >>
> > >
> > > Can you just remove the handler then? We should never have exception
> > > handlers that unconditionally return 0.
> > >
> > 
> > Ah sorry, we need the handler because we can received aborts from
> > user-land after the boot.
> > 
> > I have 2 solutions, the first to simplify we can only return 0.
> > The second is to manage handler during boot. Then i need for that a
> > new patch from Fabrice
> > https://lkml.org/lkml/2014/2/7/631
> 
> I still don't get it. What is causing the abort? Is that something
> user space does, or is it just a condition that gets stuck the pcie
> device after probing that gets delivered once as soon as the aborts
> are enabled?
> 
The abort is caused by the kernel trying to access a non-existent device
while probing the bus. It isn't delivered to the ARM core, as it is an
imprecise external abort which are masked during boot.
Once pid1 is started and we do the first schedule imprecise aborts get
unmasked and pid1 will be hit by the stale abort.

The above patch does the right thing by unmasking imprecise abort early
during boot, so they can get handled once they are hit.

The abort handling for the DW PCIe core right now is a complete
disaster. Hooking the fault code means we possibly overwrite any other
handler for the same abort. Also as the configuration space is mapped as
device memory the abort actually happens on the *next* instruction after
the read that caused it. Improving this is something I had on my to-do
list for quite some time now. 

Regards,
Lucas


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

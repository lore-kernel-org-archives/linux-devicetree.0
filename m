From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/5] PCI: st: Provide support for the sti PCIe controller
Date: Wed, 21 Jan 2015 20:35:41 +0100
Message-ID: <6574269.bTBzFhcnBx@wuerfel>
References: <1418812486-12394-1-git-send-email-gabriel.fernandez@linaro.org> <1682713.ac5OoTJoOr@wuerfel> <CAG374jCRByNZuuYxi5+-mKvV7p5-tCf2G+8mTYfzU4rRV4yfYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAG374jCRByNZuuYxi5+-mKvV7p5-tCf2G+8mTYfzU4rRV4yfYQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Magnus Damm <damm-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Tanmay
List-Id: devicetree@vger.kernel.org

On Wednesday 21 January 2015 16:47:36 Gabriel Fernandez wrote:
> On 19 January 2015 at 14:49, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Monday 19 January 2015 13:37:33 Gabriel Fernandez wrote:
> >> On 17 December 2014 at 23:14, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> >> > On Wednesday 17 December 2014 11:34:44 Gabriel FERNANDEZ wrote:
> >> > > +/*
> >> > > + * On ARM platforms, we actually get a bus error returned when the PCIe
> >> > IP
> >> > > + * returns a UR or CRS instead of an OK.
> >> > > + */
> >> > > +static int st_pcie_abort_
> >> >
> >> > handler(unsigned long addr, unsigned int fsr,
> >> > > +                              struct pt_regs *regs)
> >> > > +{
> >> > > +     return 0;
> >> > > +}
> >> >
> >> > You should check that it's actually PCI that caused the abort. Don't
> >> > just ignore a hard error condition.
> >> >
> >> > Usually there are registers in the PCI core that let you identify what
> >> > happened.
> >> >
> >>
> >>
> >> We return 0 because abort handler is not activated during boot.
> >>
> >
> > Can you just remove the handler then? We should never have exception
> > handlers that unconditionally return 0.
> >
> 
> Ah sorry, we need the handler because we can received aborts from
> user-land after the boot.
> 
> I have 2 solutions, the first to simplify we can only return 0.
> The second is to manage handler during boot. Then i need for that a
> new patch from Fabrice
> https://lkml.org/lkml/2014/2/7/631

I still don't get it. What is causing the abort? Is that something
user space does, or is it just a condition that gets stuck the pcie
device after probing that gets delivered once as soon as the aborts
are enabled?

> >>
> >> msi_data is a virtual address, it's obtained through a   __get_free_pages()
> >> function in dw_pcie_msi_init() procedure.
> >
> > I guess you need dma_map_single() then, or use dma_alloc_coherent instead
> > of __get_free_pages(). There is no guarantee that the page you allocate
> > there is actually visible to the PCI host at the same address that the CPU
> > uses, so you need to map from a CPU address to a DMA address that the PCI
> > host bridge uses.
> >
> >         Arnd
> 
> This is only to check the msi magic address given to ip, we never read
> or write in this area.
> this code is only a check

But doesn't the hardware access the pointer?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drivers/of: Add devm_of_iomap()
Date: Fri, 15 Jun 2018 08:16:46 +0200
Message-ID: <CAMuHMdWPQPZxvG6JhGGqsqYpzp74PgABDjMKVCBetKSAnLqhkw@mail.gmail.com>
References: <23be2945b593a36d8fa1970bb579389c0f892a3e.camel@kernel.crashing.org>
 <CAMuHMdVixknUDYZUHafCqNY02z=T-WC2s+Qh6GkpejmoJU0fuQ@mail.gmail.com> <3312487e2b61b8c2f265d210d14bbed8681a9ecc.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3312487e2b61b8c2f265d210d14bbed8681a9ecc.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Ben,

On Fri, Jun 15, 2018 at 1:51 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Thu, 2018-06-14 at 10:27 +0200, Geert Uytterhoeven wrote:
> > > --- a/include/linux/of_address.h
> > > +++ b/include/linux/of_address.h
> > > @@ -40,6 +40,11 @@ extern void __iomem *of_iomap(struct device_node *device, int index);
> > >   void __iomem *of_io_request_and_map(struct device_node *device,
> > >                                      int index, const char *name);
> > >
> > > +/* Request and map, wrapper on devm_ioremap_resource */
> > > +extern void __iomem *devm_of_iomap(struct device *dev,
> > > +                                  struct device_node *node, int index,
> > > +                                  resource_size_t *size);
> > > +
> > >   /* Extract an address from a device, returns the region size and
> > >    * the address space flags too. The PCI version uses a BAR number
> > >    * instead of an absolute index
> >
> > Do you need a dummy for !CONFIG_OF_ADDRESS, to aid compile-testing?
>
> I didn't think so, as of_address_to_resource() already has a dummy, so
> it should build fine.

That dummy doesn't matter, as drivers/of/address won't be built if
!CONFIG_OF_ADDRESS anyway.
I mean for compile-testing users of devm_of_iomap().

And according to kbuild test robot <lkp@intel.com>:

>> (.text+0x1882): undefined reference to `devm_ioremap_resource'

devm_ioremap_resource() has no dummy for !HAS_IOMEM and
OF_ADDRESS depends on !SPARC && (HAS_IOMEM || UML),
bypassing the HAS_IOMEM check on UML.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

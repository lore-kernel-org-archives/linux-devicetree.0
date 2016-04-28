From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [RFC v4 3/8] gpio: generic: add DT support for generic memory-mapped GPIOs
Date: Fri, 29 Apr 2016 01:39:55 +0200
Message-ID: <3841493.Kd66QyCgCc@debian64>
References: <cover.1461806071.git.chunkeey@googlemail.com> <a5d6bb7bb73ff9396c9e8053a8e8e0975b857934.1461806071.git.chunkeey@googlemail.com> <CAHp75VeSf_=rQBRQ+1ox=fn7aJ53mGg_huH7HRbZck0HEhxBAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VeSf_=rQBRQ+1ox=fn7aJ53mGg_huH7HRbZck0HEhxBAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?ISO-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, April 28, 2016 12:58:03 PM Andy Shevchenko wrote:
> On Thu, Apr 28, 2016 at 12:05 PM, Christian Lamparter
> <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> > From: =C1lvaro Fern=E1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > This patch adds support for defining memory-mapped GPIOs
> > which provide a compatible interface for the existing
> > generic-gpio driver.

Thanks for your comments! I've prepared a new series which
I'm going to post tomorrow. I've incorporated most of the
remarks, but there's something I have to say about:=20

> > +static inline void set_resource_address(struct resource *res,
> > +                                       resource_size_t start,
> > +                                       resource_size_t len)
> > +{
> > +       res->start =3D start;
> > +       res->end =3D start + len - 1;
> > +}
>=20
> It might make sense to put this in the generic (resource related, e.g=
=2E
> ioport.h) header. There are plenty users of such already and who know=
s
> how many will come.

I looked around and found plenty of code in drivers/
alone doing the same song and dance around it:

acpi/pci_root.c acpi/resource.c
bus/mvebu-mbus.c
i2c/busses/i2c-i801.c
irqchip/irq-mips-gic.c
memory/omap-gpmc.c
mfd/janz-cmodio.c mfd/lpc_ich.c mfd/sm501.c mtd/devices/ms02-nv.c
nvdimm/namespace_devs.c
of/address.c
parisc/ccio-dma.c parisc/dino.c parisc/lba_pci.c
pci/hotplug/ibmphp_res.c pci/bus.c pci/iov.c pci/setup-res.c
pci/setup-bus.c pci/hotplug/ibmphp_res.c
pcmcia/rsrc_mgr.c pcmcia/pcmcia_resource.c
pnp/manager.c
platform/x86/intel_pmc_ipc.c
pinctrl/sh-pfc/core.c
etc...

I think arch/ will have a few more. If anything this will require
help from coccinelle and more stuff. For now I'll convert the code
to do the same thing as everybody else. And after the "linux,gpio-mmio"
has been successfully mainlined I can worry about how to write the
perfect set_resource_address or set_resource_range (needs to handle
over- and underflows, etc...) and setup the automatic tools to convert
the whole tree. So, unless someone else beats me to this, this would
be my plan.

Regards,
Christian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

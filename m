From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 2/6] pci: OF: Fix the conversion of IO ranges into IO
 resources.
Date: Mon, 17 Mar 2014 13:41:03 +0000
Message-ID: <20140317134103.GD6457@e106497-lin.cambridge.arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <201403141946.23921.arnd@arndb.de>
 <20140314190017.GA6457@e106497-lin.cambridge.arm.com>
 <201403142016.11105.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201403142016.11105.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 14, 2014 at 07:16:10PM +0000, Arnd Bergmann wrote:
> On Friday 14 March 2014, Liviu Dudau wrote:
> > On Fri, Mar 14, 2014 at 06:46:23PM +0000, Arnd Bergmann wrote:
> > > On Friday 14 March 2014, Liviu Dudau wrote:
> > >=20
> > > > +int of_pci_range_to_resource(struct of_pci_range *range,
> > > > +       struct device_node *np, struct resource *res)
> > > > +{
> > > > +       res->flags =3D range->flags;
> > > > +       res->parent =3D res->child =3D res->sibling =3D NULL;
> > > > +       res->name =3D np->full_name;
> > > > +
> > > > +       if (res->flags & IORESOURCE_IO) {
> > > > +               unsigned long port =3D -1;
> > > > +               int err =3D pci_register_io_range(range->cpu_ad=
dr, range->size);
> > > > +               if (err)
> > > > +                       goto invalid_range;
> > > > +               port =3D pci_address_to_pio(range->cpu_addr);
> > > > +               if (port =3D=3D (unsigned long)-1) {
> > > > +                       err =3D -EINVAL;
> > > > +                       goto invalid_range;
> > > > +               }
> > > > +               res->start =3D port;
> > > > +       } else {
> > >=20
> > > This one concatenates the I/O spaces and assumes that each space =
starts
> > > at bus address zero, and takes little precaution to avoid filling=
 up IO_SPACE_LIMIT
> > > if the sizes are too big.
> >=20
> > Actually, you are attaching too much meaning to this one. pci_regis=
ter_io_range()
> > only tries to remember the ranges, nothing else. And it *does* chec=
k that the
> > total sum of registered ranges does not exceed IO_SPACE_LIMIT. This=
 is used before
> > we have any resource mapped for that range (actually it is used to =
*create* the
> > resource for the range) so there is no other helping hand.
> >=20
> > It doesn't assume that space starts at bus address zero, it ignores=
 the bus address.
> > It only handles CPU addresses for the range, to help with generatin=
g logical IO ports.
> > If you have overlapping CPU addresses with different bus addresses =
it will not work,
> > but then I guess you will have different problems then.
>=20
> The problem is that it tries to set up a mapping so that pci_address_=
to_pio
> returns the actual port number, but the port that you assign to res->=
start
> above is assumed to match the 'start' variable below. If the value en=
ds
> up different, the BARs that get set by the PCI bus scan are not in th=
e
> same place that got ioremapped into the virtual I/O aperture.

Yes, after writting a reply trying to justify why it would actually wor=
k I've realised
where the fault of my logic stands (short version, two host controllers=
 will get different
io_offsets but the ports numbers will start from zero leading to confus=
ion about which
host controller the resource belongs to).

I will try to split your function into two parts, one that calculates t=
he io_offset and
another that does the ioremap_page_range() side and replace my cooked f=
unction.

Best regards,
Liviu

>=20
> > > >+unsigned long pci_ioremap_io(const struct resource *res, phys_a=
ddr_t phys_addr)
> > > >+{
> > > >+       unsigned long start, len, virt_start;
> > > >+       int err;
> > > >+
> > > >+       if (res->end > IO_SPACE_LIMIT)
> > > >+               return -EINVAL;
> > > >+
> > > >+       /*
> > > >+        * try finding free space for the whole size first,
> > > >+        * fall back to 64K if not available
> > > >+        */
> > > >+       len =3D resource_size(res);
> > > >+       start =3D bitmap_find_next_zero_area(pci_iospace, IO_SPA=
CE_PAGES,
> > > >+                               res->start / PAGE_SIZE, len / PA=
GE_SIZE, 0);
> > > >+       if (start =3D=3D IO_SPACE_PAGES && len > SZ_64K) {
> > > >+               len =3D SZ_64K;
> > > >+               start =3D 0;
> > > >+               start =3D bitmap_find_next_zero_area(pci_iospace=
, IO_SPACE_PAGES,
> > > >+                                       start, len / PAGE_SIZE, =
0);
> > > >+       }
> > > >+
> > > >+       /* no 64K area found */
> > > >+       if (start =3D=3D IO_SPACE_PAGES)
> > > >+               return -ENOMEM;
> > > >+
> > > >+       /* ioremap physical aperture to virtual aperture */
> > > >+       virt_start =3D start * PAGE_SIZE + (unsigned long)PCI_IO=
BASE;
> > > >+       err =3D ioremap_page_range(virt_start, virt_start + len,
> > > >+                               phys_addr, __pgprot(PROT_DEVICE_=
nGnRE));
> > > >+       if (err)
> > > >+               return err;
> > > >+
> > > >+       bitmap_set(pci_iospace, start, len / PAGE_SIZE);
> > > >+
> > > >+       /* return io_offset */
> > > >+       return start * PAGE_SIZE - res->start;
> > > >+}
>=20
> 	Arnd
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

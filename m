From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 3/9] pci: Introduce pci_register_io_range() helper
 function.
Date: Wed, 2 Jul 2014 14:20:42 +0100
Message-ID: <20140702132042.GG2173@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-4-git-send-email-Liviu.Dudau@arm.com>
 <4751391.BGkeOrZGt8@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4751391.BGkeOrZGt8@wuerfel>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 02, 2014 at 01:38:04PM +0100, Arnd Bergmann wrote:
> Some more detailed comments now
>=20
> On Tuesday 01 July 2014 19:43:28 Liviu Dudau wrote:
> > +/*
> > + * Record the PCI IO range (expressed as CPU physical address + si=
ze).
> > + * Return a negative value if an error has occured, zero otherwise
> > + */
> > +int __weak pci_register_io_range(phys_addr_t addr, resource_size_t=
 size)
> > +{
> > +#ifdef PCI_IOBASE
> > +       struct io_range *res;
>=20
> I was confused by the variable naming here: A variable named 'res' is
> normally a 'struct resource'. Maybe better call this 'range'.
>=20
> > +       resource_size_t allocated_size =3D 0;
> > +
> > +       /* check if the range hasn't been previously recorded */
> > +       list_for_each_entry(res, &io_range_list, list) {
> > +               if (addr >=3D res->start && addr + size <=3D res->s=
tart + size)
> > +                       return 0;
> > +               allocated_size +=3D res->size;
> > +       }
>=20
> A spin_lock around the list lookup should be sufficient to get around
> the race that Will mentioned.
>=20
> > +       /* range not registed yet, check for available space */
> > +       if (allocated_size + size - 1 > IO_SPACE_LIMIT)
> > +               return -E2BIG;
>=20
> It might be better to limit the size to 64K if it doesn't fit at firs=
t.

Thanks Arnd for review. Will update and post a new patch soon if I don'=
t
get any other comments.

Best regards,
Liviu

>=20
>=20
> 	Arnd
>=20
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

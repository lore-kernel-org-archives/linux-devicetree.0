From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 9/9] pci: Remap I/O bus resources into CPU space with
 pci_remap_iospace()
Date: Mon, 14 Jul 2014 17:56:53 +0100
Message-ID: <20140714165653.GD825@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-10-git-send-email-Liviu.Dudau@arm.com>
 <20140714165443.GI1112@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140714165443.GI1112@arm.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 14, 2014 at 05:54:43PM +0100, Catalin Marinas wrote:
> On Tue, Jul 01, 2014 at 07:43:34PM +0100, Liviu Dudau wrote:
> > Introduce a default implementation for remapping PCI bus I/O resour=
ces
> > onto the CPU address space. Architectures with special needs may
> > provide their own version, but most should be able to use this one.
> [...]
> > +/**
> > + *	pci_remap_iospace - Remap the memory mapped I/O space
> > + *	@res: Resource describing the I/O space
> > + *	@phys_addr: physical address where the range will be mapped.
> > + *
> > + *	Remap the memory mapped I/O space described by the @res
> > + *	into the CPU physical address space. Only architectures
> > + *	that have memory mapped IO defined (and hence PCI_IOBASE)
> > + *	should call this function.
> > + */
> > +int __weak pci_remap_iospace(const struct resource *res, phys_addr=
_t phys_addr)
> > +{
> > +	int err =3D -ENODEV;
> > +
> > +#ifdef PCI_IOBASE
> > +	if (!(res->flags & IORESOURCE_IO))
> > +		return -EINVAL;
> > +
> > +	if (res->end > IO_SPACE_LIMIT)
> > +		return -EINVAL;
> > +
> > +	err =3D ioremap_page_range(res->start + (unsigned long)PCI_IOBASE=
,
> > +				res->end + 1 + (unsigned long)PCI_IOBASE,
> > +				phys_addr, __pgprot(PROT_DEVICE_nGnRE));
>=20
> Except that PROT_DEVICE_nGnRE is arm64 only. I think that's a functio=
n
> that should remain arch specific.

Yes, I was following Arnd's suggestion and lost track of the fact that
PROT_DEVICE_nGnRE is arm64 specific.

Best regards,
Liviu

>=20
> --=20
> Catalin

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

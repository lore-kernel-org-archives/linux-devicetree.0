From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 3/9] pci: Introduce pci_register_io_range() helper
 function.
Date: Wed, 9 Jul 2014 10:13:20 +0100
Message-ID: <20140709091320.GQ6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <20140708212951.GA4555@google.com>
 <20140708224529.GB4980@e106497-lin.cambridge.arm.com>
 <201407090832.37918.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <201407090832.37918.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 09, 2014 at 07:32:37AM +0100, Arnd Bergmann wrote:
> On Wednesday 09 July 2014, Liviu Dudau wrote:
> > > Maybe that assumption is guaranteed by OF, but it doesn't hold fo=
r ACPI;
> > > ACPI can describe several I/O port apertures for a single bridge,=
 each
> > > associated with a different CPU physical memory region.
> >=20
> > That is actually a good catch, I've completely missed the fact that
> > io_range->pci_addr could be non-zero.
>=20
> Hmm, that's what I thought in my initial review, but you convinced me
> that it's actually correct later on, and I still believe it is. Maybe
> now you got confused by your own code?

Man, it has been too long. Yes, I am now confused by my own code, which
is not a good sign.

>=20
> Please have another look, I think your code in pci_host_bridge_of_get=
_ranges
> sufficiently handles the registration to the PCI code with the correc=
t
> io_offset. The only thing that we might want to add is to record the
> PCI address along with the bridge->io_base: For the host driver to
> set up the mapping window correctly, you either need both of them, or
> you assume they are already set up.

Hmm, having another look at pci_host_bridge_of_get_range() I'm not conv=
inced
that we need another storage for pci_addr. The resource gets added to t=
he
list of resources used by the bridge offsetted by range.pci_addr, so wh=
en
re-creating the PCI bus address the value should come in play.

I will double check but I think the code is correct as it is. Sorry for=
 the
early confusion.

Best regards,
Liviu

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

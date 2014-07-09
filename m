From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 3/9] pci: Introduce pci_register_io_range() helper
 function.
Date: Wed, 9 Jul 2014 09:59:11 +0100
Message-ID: <20140709085910.GP6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <20140708001418.GB22939@google.com>
 <20140708104050.GA6501@e106497-lin.cambridge.arm.com>
 <201407081614.18304.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <201407081614.18304.arnd@arndb.de>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 08, 2014 at 03:14:17PM +0100, Arnd Bergmann wrote:
> On Tuesday 08 July 2014, Liviu Dudau wrote:
> > > Here's what these look like in /proc/iomem and /proc/ioports (not=
e that
> > > there are two resource structs for each memory-mapped IO port spa=
ce: one
> > > IORESOURCE_MEM for the memory-mapped area (used only by the host =
bridge
> > > driver), and one IORESOURCE_IO for the I/O port space (this becom=
es the
> > > parent of a region used by a regular device driver):
> > >=20
> > >   /proc/iomem:
> > >     PCI Bus 0000:00 I/O Ports 00000000-00000fff
> > >     PCI Bus 0001:00 I/O Ports 01000000-01000fff
> > >=20
> > >   /proc/ioports:
> > >     00000000-00000fff : PCI Bus 0000:00
> > >     01000000-01000fff : PCI Bus 0001:00
> >=20
> > OK, I have a question that might be ovbious to you but I have misse=
d the answer
> > so far: how does the IORESOURCE_MEM area gets created? Is it the ho=
st bridge
> > driver's job to do it? Is it something that the framework should do=
 when it
> > notices that the IORESOURCE_IO is memory mapped?
>=20
> The host bridge driver should either register the IORESOURCE_MEM reso=
urce
> itself from its probe or setup function, or it should get registered =
behind
> the covers in drivers using of_create_pci_host_bridge().
>=20
> Your new pci_host_bridge_of_get_ranges already loops over all the=20
> resources, so it would be a good place to put that.

OK, so it is not something that I've missed, just something that x86-64=
 does and
my version doesn't yet.

Thanks for confirming that.

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

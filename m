From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 8/9] pci: Add support for creating a generic
 host_bridge from device tree
Date: Tue, 8 Jul 2014 23:57:55 +0100
Message-ID: <20140708225755.GE4980@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-9-git-send-email-Liviu.Dudau@arm.com>
 <20140708010103.GD22939@google.com>
 <20140708102940.GZ6501@e106497-lin.cambridge.arm.com>
 <20140708213305.GB4555@google.com>
 <20140708222738.GA4980@e106497-lin.cambridge.arm.com>
 <20140708223737.GA19512@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140708223737.GA19512@google.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 08, 2014 at 11:37:37PM +0100, Bjorn Helgaas wrote:
> On Tue, Jul 08, 2014 at 11:27:38PM +0100, Liviu Dudau wrote:
> > On Tue, Jul 08, 2014 at 10:33:05PM +0100, Bjorn Helgaas wrote:
> > > On Tue, Jul 08, 2014 at 11:29:40AM +0100, Liviu Dudau wrote:
> > > > On Tue, Jul 08, 2014 at 02:01:04AM +0100, Bjorn Helgaas wrote:
> > > > > On Tue, Jul 01, 2014 at 07:43:33PM +0100, Liviu Dudau wrote:
> > > > > > ...
> > > > > > +int __weak pcibios_fixup_bridge_ranges(struct list_head *r=
esources)
> > > > > > +{
> > > > > > +     return 0;
> > > > > > +}
> > > > >=20
> > > > > I'd wait to add this until there's a platform that needs to i=
mplement it.
> > > > > Splitting it out will make this patch that much smaller and e=
asier to
> > > > > understand.
> > > >=20
> > > > I need this as this is the default implementation (i.e. do noth=
ing). Otherwise the
> > > > link phase will give errors.=20
> > >=20
> > > I meant that you could remove the default implementation *and* th=
e call of
> > > it, since it currently does nothing.
> >=20
> > True. But it looks like converting Will's pci-host-generic.c driver=
 will make use of this.
>=20
> I think we should move this part of the patch to the conversion of
> that driver.  That will keep related changes grouped together, which=20
> makes them easier to review and easier to backport, e.g., to distro
> kernels.
>=20
> > > > > > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > > > > > index 7e7b939..556dc5f 100644
> > > > > > --- a/include/linux/pci.h
> > > > > > +++ b/include/linux/pci.h
> > > > > > @@ -402,6 +402,7 @@ struct pci_host_bridge {
> > > > > >       struct device dev;
> > > > > >       struct pci_bus *bus;            /* root bus */
> > > > > >       int domain_nr;
> > > > > > +     resource_size_t io_base;        /* physical address f=
or the start of I/O area */
> > > > >=20
> > > > > I don't see where this is used yet.
> > > >=20
> > > > It's used in pci_host_bridge_of_get_ranges() (earlier in this p=
atch).
> > >=20
> > > of_create_pci_host_bridge() fills in bridge->io_base, but I don't=
 see
> > > anything that ever *reads* bridge->io_base.
> >=20
> > Ah, understood. It is used by the host bridge drivers to set their =
ATR registers to the
> > correct CPU address values.
>=20
> Same applies here.

Except I have no idea which host bridge driver is going to be submitted=
 first. There are
at least a couple of public series for HB drivers based on my series pl=
us the one I have yet
to submit for my platform.

Maybe an associated documentation patch that explains the intended use =
for io_base could
persuade you on the value of keeping the io_base patch here?

Best regards,
Liviu

>=20
> Bjorn
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

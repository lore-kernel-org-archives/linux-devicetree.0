From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v8 2/9] pci: Export find_pci_host_bridge() function.
Date: Tue, 8 Jul 2014 11:42:48 +0100
Message-ID: <20140708104248.GB6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-3-git-send-email-Liviu.Dudau@arm.com>
 <20140707232749.GA22939@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140707232749.GA22939-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Suravee Suthikulanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Device Tree ML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 08, 2014 at 12:27:49AM +0100, Bjorn Helgaas wrote:
> On Tue, Jul 01, 2014 at 07:43:27PM +0100, Liviu Dudau wrote:
> > This is a useful function and we should make it visible outside the
> > generic PCI code. Export it as a GPL symbol.
> >=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > Tested-by: Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>
> > ---
> >  drivers/pci/host-bridge.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/pci/host-bridge.c b/drivers/pci/host-bridge.c
> > index 0e5f3c9..36c669e 100644
> > --- a/drivers/pci/host-bridge.c
> > +++ b/drivers/pci/host-bridge.c
> > @@ -16,12 +16,13 @@ static struct pci_bus *find_pci_root_bus(struct=
 pci_bus *bus)
> >  	return bus;
> >  }
> > =20
> > -static struct pci_host_bridge *find_pci_host_bridge(struct pci_bus=
 *bus)
> > +struct pci_host_bridge *find_pci_host_bridge(struct pci_bus *bus)
> >  {
> >  	struct pci_bus *root_bus =3D find_pci_root_bus(bus);
> > =20
> >  	return to_pci_host_bridge(root_bus->bridge);
> >  }
> > +EXPORT_SYMBOL_GPL(find_pci_host_bridge);
>=20
> There's nothing in this series that uses find_pci_host_bridge(), so=20
> how about we just wait until we have something that needs it?
>=20
> Also, if/when we export this, I'd prefer a name that starts with "pci=
_"
> as most of the other interfaces do.

Understood.

I was using the function in the other patch series that adds PCIe suppo=
rt to arm64
in order to provide a pci_domain_nr() implementation. But I might not n=
eed it
in the end if I go ahead with separating pci_host_bridge creation from =
bus
creation.

Best regards,
Liviu

>=20
> >  void pci_set_host_bridge_release(struct pci_host_bridge *bridge,
> >  				 void (*release_fn)(struct pci_host_bridge *),
> > --=20
> > 2.0.0
> >=20
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

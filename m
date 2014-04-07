From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 5/6] pci: Export find_pci_host_bridge() function.
Date: Mon, 7 Apr 2014 15:20:45 +0100
Message-ID: <20140407142045.GO17163@e106497-lin.cambridge.arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811272-1547-6-git-send-email-Liviu.Dudau@arm.com>
 <20140404233948.GC15806@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140404233948.GC15806@google.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 05, 2014 at 12:39:48AM +0100, Bjorn Helgaas wrote:
> On Fri, Mar 14, 2014 at 03:34:31PM +0000, Liviu Dudau wrote:
> > This is a useful function and we should make it visible outside the
> > generic PCI code. Export it as a GPL symbol.
> >=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > Tested-by: Tanmay Inamdar <tinamdar@apm.com>
> > ---
> >  drivers/pci/host-bridge.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/pci/host-bridge.c b/drivers/pci/host-bridge.c
> > index 06ace62..8708b652 100644
> > --- a/drivers/pci/host-bridge.c
> > +++ b/drivers/pci/host-bridge.c
> > @@ -17,12 +17,13 @@ static struct pci_bus *find_pci_root_bus(struct=
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
> Do you have a place where you actually need to use find_pci_host_brid=
ge()?
> I'd rather not export it, even as _GPL, unless we have a user.

The code in arm64 series is using it to implement pci_domain_nr().

>=20
> If we *do* export it, I'd like it to have a more conventional name, e=
=2Eg.,
> something starting with "pci_".

Understood. pci_find_host_bridge() ?

Best regards,
Liviu

>=20
> > =20
> >  void pci_set_host_bridge_release(struct pci_host_bridge *bridge,
> >  				 void (*release_fn)(struct pci_host_bridge *),
> > --=20
> > 1.9.0
> >=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
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

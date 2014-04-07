From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 4/6] pci: Introduce a domain number for
 pci_host_bridge.
Date: Mon, 7 Apr 2014 09:46:23 +0100
Message-ID: <20140407084623.GG17163@e106497-lin.cambridge.arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811272-1547-5-git-send-email-Liviu.Dudau@arm.com>
 <20140405000007.GD15806@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140405000007.GD15806@google.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 05, 2014 at 01:00:07AM +0100, Bjorn Helgaas wrote:
> On Fri, Mar 14, 2014 at 03:34:30PM +0000, Liviu Dudau wrote:
> > Make it easier to discover the domain number of a bus by storing
> > the number in pci_host_bridge for the root bus. Several architectur=
es
> > have their own way of storing this information, so it makes sense
> > to try to unify the code.=20
>=20
> I like the idea of unifying the way we handle the domain number.  But=
=20
> I'd like to see more of the strategy before committing to this approa=
ch.

*My* strategy is to get rid of pci_domain_nr(). I don't see why we need
to have arch specific way of providing the number, specially after look=
ing
at the existing implementations that return a value from a variable tha=
t
is never touched or incremented. My guess is that pci_domain_nr() was
created to work around the fact that there was no domain_nr maintainanc=
e in
the generic code.

>=20
> This patch adds struct pci_host_bridge.domain_nr, but of course
> pci_domain_nr() doesn't use it.  It can't today, because
> pci_create_root_bus() relies on pci_domain_nr() to fill in
> pci_host_bridge.domain_nr.
>=20
> But I suppose the intent is that someday we can make pci_domain_nr()
> arch-independent somehow.  I'd just like to see more of the path to
> that happening.

The path would be to send a patch that removes all existing pci_domain_=
nr()
macros/inline functions and rely on the generic function.

>=20
> > While at this, add a new function that
> > creates a root bus in a given domain and make pci_create_root_bus()
> > a wrapper around this function.
>=20
> I'm a little concerned about adding a new "create root bus" interface=
,
> partly because we have quite a few already, and I'd like to reduce th=
e
> number of them instead of adding more.  And I think there might be ot=
her
> similar opportunities for unification, so I could easily see us addin=
g new
> functions in the future to unify NUMA node info, ECAM info, etc.

The reason for creating the wrapper function was to allow for explicit =
passing
of domain_nr. If we find architectures where generic allocation of doma=
in_nr
doesn't work for them, we can make them use this wrapper to pass the do=
main_nr
into the host bridge when creating the root bus.

>=20
> I wonder if we need some sort of descriptor structure that the arch c=
ould
> fill in and pass to the PCI core.  Then we could add new members with=
out
> having to create new interfaces each time.

I'm trying to reduce the number of variables being passed between archi=
tectures
and generic code. host_bridge (with the associated root bus), domain_nr=
 those
are needed. Is there anything else that you have in your mind that need=
s to
be shared?

My approach would be in sharing of the data: PCI is a standard, and the=
 core
framework implements it. What is so broken in your architecture that yo=
u need
to work around the core code? And I'm not talking about drivers and qui=
rks,
but architectural level support.

Best regards,
Liviu

>=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > Tested-by: Tanmay Inamdar <tinamdar@apm.com>
> > ---
> >  drivers/pci/probe.c | 41 +++++++++++++++++++++++++++++++++--------
> >  include/linux/pci.h |  4 ++++
> >  2 files changed, 37 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index fd11c12..172c615 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -1714,8 +1714,9 @@ void __weak pcibios_remove_bus(struct pci_bus=
 *bus)
> >  {
> >  }
> > =20
> > -struct pci_bus *pci_create_root_bus(struct device *parent, int bus=
,
> > -		struct pci_ops *ops, void *sysdata, struct list_head *resources)
> > +struct pci_bus *pci_create_root_bus_in_domain(struct device *paren=
t,
> > +		int domain, int bus, struct pci_ops *ops, void *sysdata,
> > +		struct list_head *resources)
> >  {
> >  	int error;
> >  	struct pci_host_bridge *bridge;
> > @@ -1728,30 +1729,34 @@ struct pci_bus *pci_create_root_bus(struct =
device *parent, int bus,
> > =20
> >  	bridge =3D pci_alloc_host_bridge();
> >  	if (!bridge)
> > -		return NULL;
> > +		return ERR_PTR(-ENOMEM);
> > =20
> >  	bridge->dev.parent =3D parent;
> >  	bridge->dev.release =3D pci_release_host_bridge_dev;
> > +	bridge->domain_nr =3D domain;
> >  	error =3D pcibios_root_bridge_prepare(bridge);
> >  	if (error)
> >  		goto err_out;
> > =20
> >  	b =3D pci_alloc_bus();
> > -	if (!b)
> > +	if (!b) {
> > +		error =3D -ENOMEM;
> >  		goto err_out;
> > +	}
> > =20
> >  	b->sysdata =3D sysdata;
> >  	b->ops =3D ops;
> >  	b->number =3D b->busn_res.start =3D bus;
> > -	b2 =3D pci_find_bus(pci_domain_nr(b), bus);
> > +	b2 =3D pci_find_bus(bridge->domain_nr, bus);
> >  	if (b2) {
> >  		/* If we already got to this bus through a different bridge, ign=
ore it */
> >  		dev_dbg(&b2->dev, "bus already known\n");
> > +		error =3D -EEXIST;
> >  		goto err_bus_out;
> >  	}
> > =20
> >  	bridge->bus =3D b;
> > -	dev_set_name(&bridge->dev, "pci%04x:%02x", pci_domain_nr(b), bus)=
;
> > +	dev_set_name(&bridge->dev, "pci%04x:%02x", bridge->domain_nr, bus=
);
> >  	error =3D device_register(&bridge->dev);
> >  	if (error) {
> >  		put_device(&bridge->dev);
> > @@ -1766,7 +1771,7 @@ struct pci_bus *pci_create_root_bus(struct de=
vice *parent, int bus,
> > =20
> >  	b->dev.class =3D &pcibus_class;
> >  	b->dev.parent =3D b->bridge;
> > -	dev_set_name(&b->dev, "%04x:%02x", pci_domain_nr(b), bus);
> > +	dev_set_name(&b->dev, "%04x:%02x", bridge->domain_nr, bus);
> >  	error =3D device_register(&b->dev);
> >  	if (error)
> >  		goto class_dev_reg_err;
> > @@ -1816,7 +1821,27 @@ err_bus_out:
> >  	kfree(b);
> >  err_out:
> >  	kfree(bridge);
> > -	return NULL;
> > +	return ERR_PTR(error);
> > +}
> > +
> > +struct pci_bus *pci_create_root_bus(struct device *parent, int bus=
,
> > +		struct pci_ops *ops, void *sysdata, struct list_head *resources)
> > +{
> > +	int domain_nr;
> > +	struct pci_bus *b =3D pci_alloc_bus();
> > +	if (!b)
> > +		return NULL;
> > +
> > +	b->sysdata =3D sysdata;
> > +	domain_nr =3D pci_domain_nr(b);
> > +	kfree(b);
> > +
> > +	b =3D pci_create_root_bus_in_domain(parent, domain_nr, bus,
> > +				ops, sysdata, resources);
> > +	if (IS_ERR(b))
> > +		return NULL;
> > +
> > +	return b;
> >  }
> > =20
> >  int pci_bus_insert_busn_res(struct pci_bus *b, int bus, int bus_ma=
x)
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 33aa2ca..1eed009 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -394,6 +394,7 @@ struct pci_host_bridge_window {
> >  struct pci_host_bridge {
> >  	struct device dev;
> >  	struct pci_bus *bus;		/* root bus */
> > +	int domain_nr;
> >  	struct list_head windows;	/* pci_host_bridge_windows */
> >  	void (*release_fn)(struct pci_host_bridge *);
> >  	void *release_data;
> > @@ -747,6 +748,9 @@ struct pci_bus *pci_scan_bus(int bus, struct pc=
i_ops *ops, void *sysdata);
> >  struct pci_bus *pci_create_root_bus(struct device *parent, int bus=
,
> >  				    struct pci_ops *ops, void *sysdata,
> >  				    struct list_head *resources);
> > +struct pci_bus *pci_create_root_bus_in_domain(struct device *paren=
t,
> > +			int domain, int bus, struct pci_ops *ops,
> > +			void *sysdata, struct list_head *resources);
> >  int pci_bus_insert_busn_res(struct pci_bus *b, int bus, int busmax=
);
> >  int pci_bus_update_busn_res_end(struct pci_bus *b, int busmax);
> >  void pci_bus_release_busn_res(struct pci_bus *b);
> > --=20
> > 1.9.0
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

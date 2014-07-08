From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 6/9] pci: Introduce a domain number for
 pci_host_bridge.
Date: Tue, 8 Jul 2014 11:46:56 +0100
Message-ID: <20140708104655.GC6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-7-git-send-email-Liviu.Dudau@arm.com>
 <20140708005954.GC22939@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140708005954.GC22939@google.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 08, 2014 at 01:59:54AM +0100, Bjorn Helgaas wrote:
> On Tue, Jul 01, 2014 at 07:43:31PM +0100, Liviu Dudau wrote:
> > Make it easier to discover the domain number of a bus by storing
> > the number in pci_host_bridge for the root bus. Several architectur=
es
> > have their own way of storing this information, so it makes sense
> > to try to unify the code. While at this, add a new function that
> > creates a root bus in a given domain and make pci_create_root_bus()
> > a wrapper around this function.
>=20
> "While at this" is always a good clue that maybe something should be
> split into a separate patch :)  This is a very good example, since it
> adds a new interface that deserves its own changelog.

Yes, I'm coming to the same conclusion. :)

>=20
> > Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
> > Tested-by: Tanmay Inamdar <tinamdar@apm.com>
> > ---
> >  drivers/pci/probe.c | 41 +++++++++++++++++++++++++++++++++--------
> >  include/linux/pci.h |  4 ++++
> >  2 files changed, 37 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 2c92662..abf5e82 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -1748,8 +1748,9 @@ void __weak pcibios_remove_bus(struct pci_bus=
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
>=20
> I don't think we should do it this way; this makes it possible to hav=
e a
> host bridge where "bridge->domain_nr !=3D pci_domain_nr(bridge->bus)"=
=2E
>=20
> I wonder if it would help to make a weak pci_domain_nr() function tha=
t
> returns "bridge->domain_nr".  Then each arch could individually drop =
its
> pci_domain_nr() definition as it was converted, e.g., something like =
this:
>=20
>   - Convert every arch pci_domain_nr() from a #define to a non-inline
>     function
>   - Add bridge.domain_nr, initialized from pci_domain_nr()
>   - Add a weak generic pci_domain_nr() that returns bridge.domain_nr
>   - Add a way to create a host bridge in a specified domain, so we ca=
n
>     initialize bridge.domain_nr without using pci_domain_nr()
>   - Convert each arch to use the new creation mechanism and drop its
>     pci_domain_nr() implementation

I will try to propose a patch implementing this.

Best regards,
Liviu

>=20
> >  {
> >  	int error;
> >  	struct pci_host_bridge *bridge;
> > @@ -1762,27 +1763,31 @@ struct pci_bus *pci_create_root_bus(struct =
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
> >  	error =3D pcibios_root_bridge_prepare(bridge);
> >  	if (error)
> >  		goto err_out;
> > @@ -1801,7 +1806,7 @@ struct pci_bus *pci_create_root_bus(struct de=
vice *parent, int bus,
> > =20
> >  	b->dev.class =3D &pcibus_class;
> >  	b->dev.parent =3D b->bridge;
> > -	dev_set_name(&b->dev, "%04x:%02x", pci_domain_nr(b), bus);
> > +	dev_set_name(&b->dev, "%04x:%02x", bridge->domain_nr, bus);
> >  	error =3D device_register(&b->dev);
> >  	if (error)
> >  		goto class_dev_reg_err;
> > @@ -1851,7 +1856,27 @@ err_bus_out:
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
> > index 466bcd1..7e7b939 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -401,6 +401,7 @@ struct pci_host_bridge_window {
> >  struct pci_host_bridge {
> >  	struct device dev;
> >  	struct pci_bus *bus;		/* root bus */
> > +	int domain_nr;
> >  	struct list_head windows;	/* pci_host_bridge_windows */
> >  	void (*release_fn)(struct pci_host_bridge *);
> >  	void *release_data;
> > @@ -769,6 +770,9 @@ struct pci_bus *pci_scan_bus(int bus, struct pc=
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

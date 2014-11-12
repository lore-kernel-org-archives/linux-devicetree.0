From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [RFC PATCH v2] drivers: pci: move PCI domain assignment to
 generic PCI code
Date: Wed, 12 Nov 2014 10:19:07 +0000
Message-ID: <20141112101907.GS12037@e106497-lin.cambridge.arm.com>
References: <1415637706-2195-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20141112100944.GC6759@red-moon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20141112100944.GC6759@red-moon>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 12, 2014 at 10:09:44AM +0000, Lorenzo Pieralisi wrote:
> On Mon, Nov 10, 2014 at 04:41:46PM +0000, Lorenzo Pieralisi wrote:
> > The current logic used for PCI domain assignment in arm64
> > pci_bus_assign_domain_nr() is flawed in that, depending on the host
> > controllers configuration for a platform and the respective initial=
ization
> > sequence, core code may end up allocating PCI domain numbers from b=
oth DT and
> > the core code generic domain counter, which would result in PCI dom=
ain
> > allocation aliases/errors.
> >=20
> > This patch fixes the logic behind the PCI domain number assignment =
and
> > moves the resulting code to generic PCI core code so that the same =
domain
> > allocation logic is used on all platforms selecting
> >=20
> > CONFIG_PCI_DOMAINS_GENERIC
> >=20
> > instead of resorting to an arch specific implementation that might =
end up
> > duplicating the PCI domain assignment logic wrongly.
> >=20
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > ---
> > v1 =3D> v2:
> >=20
> > - Moved generic pci_bus_assign_domain_nr() code to PCI core instead=
 of
> >   adding an OF layer API
> > - Updated commit log and code comments
>=20
> Is this approach ok with everyone ? I would need to have this patch
> queued so that I can rebase the ARM32 pcibios pci_sys_data domain rem=
oval
> on top of it, if everyone agrees of course.

Acked-by: Liviu Dudau <Liviu.Dudau@arm.com>

Best regards,
Liviu

>=20
> Thanks !
> Lorenzo
>=20
> >=20
> >  arch/arm64/kernel/pci.c | 22 ----------------------
> >  drivers/pci/pci.c       | 50 +++++++++++++++++++++++++++++++++++++=
++++++++++++
> >  2 files changed, 50 insertions(+), 22 deletions(-)
> >=20
> > diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> > index ce5836c..6f93c24 100644
> > --- a/arch/arm64/kernel/pci.c
> > +++ b/arch/arm64/kernel/pci.c
> > @@ -46,25 +46,3 @@ int pcibios_add_device(struct pci_dev *dev)
> > =20
> >  	return 0;
> >  }
> > -
> > -
> > -#ifdef CONFIG_PCI_DOMAINS_GENERIC
> > -static bool dt_domain_found =3D false;
> > -
> > -void pci_bus_assign_domain_nr(struct pci_bus *bus, struct device *=
parent)
> > -{
> > -	int domain =3D of_get_pci_domain_nr(parent->of_node);
> > -
> > -	if (domain >=3D 0) {
> > -		dt_domain_found =3D true;
> > -	} else if (dt_domain_found =3D=3D true) {
> > -		dev_err(parent, "Node %s is missing \"linux,pci-domain\" propert=
y in DT\n",
> > -			parent->of_node->full_name);
> > -		return;
> > -	} else {
> > -		domain =3D pci_get_new_domain_nr();
> > -	}
> > -
> > -	bus->domain_nr =3D domain;
> > -}
> > -#endif
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 625a4ac..2279414 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -10,6 +10,8 @@
> >  #include <linux/kernel.h>
> >  #include <linux/delay.h>
> >  #include <linux/init.h>
> > +#include <linux/of.h>
> > +#include <linux/of_pci.h>
> >  #include <linux/pci.h>
> >  #include <linux/pm.h>
> >  #include <linux/slab.h>
> > @@ -4447,6 +4449,54 @@ int pci_get_new_domain_nr(void)
> >  {
> >  	return atomic_inc_return(&__domain_nr);
> >  }
> > +
> > +#ifdef CONFIG_PCI_DOMAINS_GENERIC
> > +
> > +void pci_bus_assign_domain_nr(struct pci_bus *bus, struct device *=
parent)
> > +{
> > +	static int use_dt_domains =3D -1;
> > +	int domain =3D of_get_pci_domain_nr(parent->of_node);
> > +
> > +	/*
> > +	 * Check DT domain and use_dt_domains values.
> > +	 *
> > +	 * If DT domain property is valid (domain >=3D 0) and
> > +	 * use_dt_domains !=3D 0, the DT assignment is valid since this m=
eans
> > +	 * we have not previously allocated a domain number by using
> > +	 * pci_get_new_domain_nr(); we should also update use_dt_domains =
to
> > +	 * 1, to indicate that we have just assigned a domain number from
> > +	 * DT.
> > +	 *
> > +	 * If DT domain property value is not valid (ie domain < 0), and =
we
> > +	 * have not previously assigned a domain number from DT
> > +	 * (use_dt_domains !=3D 1) we should assign a domain number by
> > +	 * using the:
> > +	 *
> > +	 * pci_get_new_domain_nr()
> > +	 *
> > +	 * API and update the use_dt_domains value to keep track of metho=
d we
> > +	 * are using to assign domain numbers (use_dt_domains =3D 0).
> > +	 *
> > +	 * All other combinations imply we have a platform that is trying
> > +	 * to mix domain numbers obtained from DT and pci_get_new_domain_=
nr(),
> > +	 * which is a recipe for domain mishandling and it is prevented b=
y
> > +	 * invalidating the domain value (domain =3D -1) and printing a
> > +	 * corresponding error.
> > +	 */
> > +	if (domain >=3D 0 && use_dt_domains) {
> > +		use_dt_domains =3D 1;
> > +	} else if (domain < 0 && use_dt_domains !=3D 1) {
> > +		use_dt_domains =3D 0;
> > +		domain =3D pci_get_new_domain_nr();
> > +	} else {
> > +		dev_err(parent, "Node %s has inconsistent \"linux,pci-domain\" p=
roperty in DT\n",
> > +			parent->of_node->full_name);
> > +		domain =3D -1;
> > +	}
> > +
> > +	bus->domain_nr =3D domain;
> > +}
> > +#endif
> >  #endif
> > =20
> >  /**
> > --=20
> > 2.1.2
> >=20
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

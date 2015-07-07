From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 1/5] ARM/PCI: remove align_resource callback in
 pcibios_align_resource
Date: Tue, 7 Jul 2015 10:22:21 +0100
Message-ID: <20150707092220.GA980@e106497-lin.cambridge.arm.com>
References: <1435743817-19083-1-git-send-email-wangzhou1@hisilicon.com>
 <1435743817-19083-2-git-send-email-wangzhou1@hisilicon.com>
 <20150702175056.GX944@e106497-lin.cambridge.arm.com>
 <559B6721.4080305@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <559B6721.4080305-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, James Morse <James.Morse-5wv7dgnIgG8@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "yuanzhichang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <yuanzhichang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "zhudacai-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <zhudacai-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org" <liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 07, 2015 at 06:44:01AM +0100, Zhou Wang wrote:
> On 2015/7/3 1:50, Liviu Dudau wrote:
> > On Wed, Jul 01, 2015 at 10:43:33AM +0100, Zhou Wang wrote:
> >> This patch had added by Arnd Bergmann during last reviewing of v1 =
patchset[1].
> >>
> >> PCI core codes call pcibios_align_resource(). In ARM specific one,=
 it will
> >> dereference pci_sys_data and call sys->align_resource. If we try t=
o unify ARM
> >> and ARM64 PCIe API in pcie-designware. it will bring kernel crash =
when run into
> >> this dereferencing.
> >>
> >> However, in ARM there is only pci-mvebu which implements align_res=
ource. So
> >> add align_resource call back in pci_host_bridge structure and over=
ride
> >> pcibios_align_resource with it.
> >>
> >> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> >> Signed-off-by: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> >> Tested-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> >>
> >> [1] http://www.spinics.net/lists/linux-pci/msg41671.html
> >> ---
> >>  arch/arm/kernel/bios32.c     |  6 ------
> >>  drivers/pci/host/pci-mvebu.c | 47 ++++++++++++++++++++++++++++---=
-------------
> >>  drivers/pci/setup-res.c      | 27 ++++++++++++++++++++-----
> >>  include/linux/pci.h          |  3 +++
> >>  4 files changed, 55 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
> >> index fcbbbb1..b01189f 100644
> >> --- a/arch/arm/kernel/bios32.c
> >> +++ b/arch/arm/kernel/bios32.c
> >> @@ -468,7 +468,6 @@ static void pcibios_init_hw(struct device *par=
ent, struct hw_pci *hw,
> >>  		sys->busnr   =3D busnr;
> >>  		sys->swizzle =3D hw->swizzle;
> >>  		sys->map_irq =3D hw->map_irq;
> >> -		sys->align_resource =3D hw->align_resource;
> >>  		INIT_LIST_HEAD(&sys->resources);
> >> =20
> >>  		if (hw->private_data)
> >> @@ -588,8 +587,6 @@ char * __init pcibios_setup(char *str)
> >>  resource_size_t pcibios_align_resource(void *data, const struct r=
esource *res,
> >>  				resource_size_t size, resource_size_t align)
> >>  {
> >> -	struct pci_dev *dev =3D data;
> >> -	struct pci_sys_data *sys =3D dev->sysdata;
> >>  	resource_size_t start =3D res->start;
> >> =20
> >>  	if (res->flags & IORESOURCE_IO && start & 0x300)
> >> @@ -597,9 +594,6 @@ resource_size_t pcibios_align_resource(void *d=
ata, const struct resource *res,
> >> =20
> >>  	start =3D (start + align - 1) & ~(align - 1);
> >> =20
> >> -	if (sys->align_resource)
> >> -		return sys->align_resource(dev, res, start, size, align);
> >> -
> >>  	return start;
> >>  }
> >> =20
> >> diff --git a/drivers/pci/host/pci-mvebu.c b/drivers/pci/host/pci-m=
vebu.c
> >> index 1ab8635..155d05f 100644
> >> --- a/drivers/pci/host/pci-mvebu.c
> >> +++ b/drivers/pci/host/pci-mvebu.c
> >> @@ -22,6 +22,8 @@
> >>  #include <linux/of_pci.h>
> >>  #include <linux/of_platform.h>
> >> =20
> >> +#include "../pci.h" /* HACK to see pci_find_host_bridge */
> >> +
> >>  /*
> >>   * PCIe unit register offsets.
> >>   */
> >> @@ -751,27 +753,20 @@ static int mvebu_pcie_setup(int nr, struct p=
ci_sys_data *sys)
> >>  	return 1;
> >>  }
> >> =20
> >> -static struct pci_bus *mvebu_pcie_scan_bus(int nr, struct pci_sys=
_data *sys)
> >> +static resource_size_t mvebu_pcie_align_resource(void *data,
> >> +						 const struct resource *res,
> >> +						 resource_size_t size,
> >> +						 resource_size_t align)
> >>  {
> >> -	struct mvebu_pcie *pcie =3D sys_to_pcie(sys);
> >> -	struct pci_bus *bus;
> >> +	struct pci_dev *dev =3D data;
> >> =20
> >> -	bus =3D pci_create_root_bus(&pcie->pdev->dev, sys->busnr,
> >> -				  &mvebu_pcie_ops, sys, &sys->resources);
> >> -	if (!bus)
> >> -		return NULL;
> >> +	resource_size_t start =3D res->start;
> >> =20
> >> -	pci_scan_child_bus(bus);
> >> +	if (res->flags & IORESOURCE_IO && start & 0x300)
> >> +		start =3D (start + 0x3ff) & ~0x3ff;
> >> =20
> >> -	return bus;
> >> -}
> >> +	start =3D (start + align - 1) & ~(align - 1);
> >=20
> > Honestly, I don't see here anything that is mvebu specific. Could y=
ou move
>=20
> What I mean is that there is only mvebu who implemented sys->align_re=
source callback in ARM
> arch.
>=20
> > this function in the generic pci/host area and have a flag in the p=
ci_host_bridge
> > structure whether the function should be called or not? I know that=
 in a way
> > that looks very close to the existing implementation which uses pci=
bios_align_resource,
>=20
> I am confused about "the existing implementation". Now pcibios_align_=
resource are
> implemented by each arch code and are called directly. Did I miss any=
thing about
> pcibios_align_resource?

Sorry, I meant existing implementation_s_ and yes, I was reffering to t=
he arch specific
code. If you look at the cris, frv/mb93090-mb00, m68k, microblaze, powe=
rpc, unicore32
and x86 they all share the code with your version, plus or minus additi=
onal checks.
I was thinking that for those arch versions that match your version you=
 can create just
one version and use it as the alignf function.

Best regards,
Liviu

>=20
> Best rgards,
> Zhou
>=20
> > but the problem with pcibios_ version is that it is arch specific a=
nd not driver
> > specific the way we want.
> >=20
> > Having this version as a generic implementation would also remove a=
t least 2 more
> > arch version, possibly more after testing by the arch maintainers.
> >=20
> > Best regards,
> > Liviu
> >=20
> >> =20
> >> -static resource_size_t mvebu_pcie_align_resource(struct pci_dev *=
dev,
> >> -						 const struct resource *res,
> >> -						 resource_size_t start,
> >> -						 resource_size_t size,
> >> -						 resource_size_t align)
> >> -{
> >>  	if (dev->bus->number !=3D 0)
> >>  		return start;
> >> =20
> >> @@ -796,6 +791,25 @@ static resource_size_t mvebu_pcie_align_resou=
rce(struct pci_dev *dev,
> >>  		return start;
> >>  }
> >> =20
> >> +static struct pci_bus *mvebu_pcie_scan_bus(int nr, struct pci_sys=
_data *sys)
> >> +{
> >> +	struct mvebu_pcie *pcie =3D sys_to_pcie(sys);
> >> +	struct pci_host_bridge *phb;
> >> +	struct pci_bus *bus;
> >> +
> >> +	bus =3D pci_create_root_bus(&pcie->pdev->dev, sys->busnr,
> >> +				  &mvebu_pcie_ops, sys, &sys->resources);
> >> +	if (!bus)
> >> +		return NULL;
> >> +
> >> +	phb =3D pci_find_host_bridge(bus);
> >> +	phb->align_resource =3D mvebu_pcie_align_resource;
> >> +
> >> +	pci_scan_child_bus(bus);
> >> +
> >> +	return bus;
> >> +}
> >> +
> >>  static void mvebu_pcie_enable(struct mvebu_pcie *pcie)
> >>  {
> >>  	struct hw_pci hw;
> >> @@ -812,7 +826,6 @@ static void mvebu_pcie_enable(struct mvebu_pci=
e *pcie)
> >>  	hw.scan           =3D mvebu_pcie_scan_bus;
> >>  	hw.map_irq        =3D of_irq_parse_and_map_pci;
> >>  	hw.ops            =3D &mvebu_pcie_ops;
> >> -	hw.align_resource =3D mvebu_pcie_align_resource;
> >> =20
> >>  	pci_common_init(&hw);
> >>  }
> >> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> >> index 232f925..73abca7 100644
> >> --- a/drivers/pci/setup-res.c
> >> +++ b/drivers/pci/setup-res.c
> >> @@ -200,7 +200,11 @@ static int pci_revert_fw_address(struct resou=
rce *res, struct pci_dev *dev,
> >>  }
> >> =20
> >>  static int __pci_assign_resource(struct pci_bus *bus, struct pci_=
dev *dev,
> >> -		int resno, resource_size_t size, resource_size_t align)
> >> +		int resno, resource_size_t size, resource_size_t align,
> >> +		resource_size_t (*alignf)(void *,
> >> +					  const struct resource *,
> >> +					  resource_size_t,
> >> +					  resource_size_t))
> >>  {
> >>  	struct resource *res =3D dev->resource + resno;
> >>  	resource_size_t min;
> >> @@ -217,7 +221,7 @@ static int __pci_assign_resource(struct pci_bu=
s *bus, struct pci_dev *dev,
> >>  	 */
> >>  	ret =3D pci_bus_alloc_resource(bus, res, size, align, min,
> >>  				     IORESOURCE_PREFETCH | IORESOURCE_MEM_64,
> >> -				     pcibios_align_resource, dev);
> >> +				     alignf, dev);
> >>  	if (ret =3D=3D 0)
> >>  		return 0;
> >> =20
> >> @@ -229,7 +233,7 @@ static int __pci_assign_resource(struct pci_bu=
s *bus, struct pci_dev *dev,
> >>  	     (IORESOURCE_PREFETCH | IORESOURCE_MEM_64)) {
> >>  		ret =3D pci_bus_alloc_resource(bus, res, size, align, min,
> >>  					     IORESOURCE_PREFETCH,
> >> -					     pcibios_align_resource, dev);
> >> +					     alignf, dev);
> >>  		if (ret =3D=3D 0)
> >>  			return 0;
> >>  	}
> >> @@ -242,7 +246,7 @@ static int __pci_assign_resource(struct pci_bu=
s *bus, struct pci_dev *dev,
> >>  	 */
> >>  	if (res->flags & (IORESOURCE_PREFETCH | IORESOURCE_MEM_64))
> >>  		ret =3D pci_bus_alloc_resource(bus, res, size, align, min, 0,
> >> -					     pcibios_align_resource, dev);
> >> +					     alignf, dev);
> >> =20
> >>  	return ret;
> >>  }
> >> @@ -251,10 +255,23 @@ static int _pci_assign_resource(struct pci_d=
ev *dev, int resno,
> >>  				resource_size_t size, resource_size_t min_align)
> >>  {
> >>  	struct pci_bus *bus;
> >> +	struct pci_host_bridge *phb;
> >> +	resource_size_t (*alignf)(void *,
> >> +				  const struct resource *,
> >> +				  resource_size_t,
> >> +				  resource_size_t);
> >>  	int ret;
> >> =20
> >>  	bus =3D dev->bus;
> >> -	while ((ret =3D __pci_assign_resource(bus, dev, resno, size, min=
_align))) {
> >> +	phb =3D pci_find_host_bridge(bus);
> >> +
> >> +	if (phb->align_resource)
> >> +		alignf =3D phb->align_resource;
> >> +	else
> >> +		alignf =3D pcibios_align_resource;
> >> +
> >> +	while ((ret =3D __pci_assign_resource(bus, dev, resno, size,
> >> +					    min_align, alignf))) {
> >>  		if (!bus->parent || !bus->self->transparent)
> >>  			break;
> >>  		bus =3D bus->parent;
> >> diff --git a/include/linux/pci.h b/include/linux/pci.h
> >> index 353db8d..39e48fc 100644
> >> --- a/include/linux/pci.h
> >> +++ b/include/linux/pci.h
> >> @@ -404,6 +404,9 @@ struct pci_host_bridge {
> >>  	struct device dev;
> >>  	struct pci_bus *bus;		/* root bus */
> >>  	struct list_head windows;	/* resource_entry */
> >> +	resource_size_t (*align_resource)(void *data,
> >> +			 const struct resource *res,
> >> +			 resource_size_t size, resource_size_t align);
> >>  	void (*release_fn)(struct pci_host_bridge *);
> >>  	void *release_data;
> >>  	unsigned int ignore_reset_delay:1;	/* for entire hierarchy */
> >> --=20
> >> 1.9.1
> >>
> >=20
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

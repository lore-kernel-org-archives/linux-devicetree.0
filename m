From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v3 1/5] ARM/PCI: remove align_resource callback in
 pcibios_align_resource
Date: Thu, 2 Jul 2015 18:50:56 +0100
Message-ID: <20150702175056.GX944@e106497-lin.cambridge.arm.com>
References: <1435743817-19083-1-git-send-email-wangzhou1@hisilicon.com>
 <1435743817-19083-2-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1435743817-19083-2-git-send-email-wangzhou1@hisilicon.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Zhou Wang <wangzhou1@hisilicon.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jg1.han@samsung.com>, Pratyush Anand <pratyush.anand@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "gabriele.paoloni@huawei.com" <gabriele.paoloni@huawei.com>, James Morse <James.Morse@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "yuanzhichang@hisilicon.com" <yuanzhichang@hisilicon.com>, "zhudacai@hisilicon.com" <zhudacai@hisilicon.com>, "zhangjukuo@huawei.com" <zhangjukuo@huawei.com>, "qiuzhenfa@hisilicon.com" <qiuzhenfa@hisilicon.com>, "liguozhu@hisilicon.com" <liguozhu@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 01, 2015 at 10:43:33AM +0100, Zhou Wang wrote:
> This patch had added by Arnd Bergmann during last reviewing of v1 pat=
chset[1].
>=20
> PCI core codes call pcibios_align_resource(). In ARM specific one, it=
 will
> dereference pci_sys_data and call sys->align_resource. If we try to u=
nify ARM
> and ARM64 PCIe API in pcie-designware. it will bring kernel crash whe=
n run into
> this dereferencing.
>=20
> However, in ARM there is only pci-mvebu which implements align_resour=
ce. So
> add align_resource call back in pci_host_bridge structure and overrid=
e
> pcibios_align_resource with it.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> Tested-by: Fabrice Gasnier <fabrice.gasnier@st.com>
>=20
> [1] http://www.spinics.net/lists/linux-pci/msg41671.html
> ---
>  arch/arm/kernel/bios32.c     |  6 ------
>  drivers/pci/host/pci-mvebu.c | 47 ++++++++++++++++++++++++++++------=
----------
>  drivers/pci/setup-res.c      | 27 ++++++++++++++++++++-----
>  include/linux/pci.h          |  3 +++
>  4 files changed, 55 insertions(+), 28 deletions(-)
>=20
> diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
> index fcbbbb1..b01189f 100644
> --- a/arch/arm/kernel/bios32.c
> +++ b/arch/arm/kernel/bios32.c
> @@ -468,7 +468,6 @@ static void pcibios_init_hw(struct device *parent=
, struct hw_pci *hw,
>  		sys->busnr   =3D busnr;
>  		sys->swizzle =3D hw->swizzle;
>  		sys->map_irq =3D hw->map_irq;
> -		sys->align_resource =3D hw->align_resource;
>  		INIT_LIST_HEAD(&sys->resources);
> =20
>  		if (hw->private_data)
> @@ -588,8 +587,6 @@ char * __init pcibios_setup(char *str)
>  resource_size_t pcibios_align_resource(void *data, const struct reso=
urce *res,
>  				resource_size_t size, resource_size_t align)
>  {
> -	struct pci_dev *dev =3D data;
> -	struct pci_sys_data *sys =3D dev->sysdata;
>  	resource_size_t start =3D res->start;
> =20
>  	if (res->flags & IORESOURCE_IO && start & 0x300)
> @@ -597,9 +594,6 @@ resource_size_t pcibios_align_resource(void *data=
, const struct resource *res,
> =20
>  	start =3D (start + align - 1) & ~(align - 1);
> =20
> -	if (sys->align_resource)
> -		return sys->align_resource(dev, res, start, size, align);
> -
>  	return start;
>  }
> =20
> diff --git a/drivers/pci/host/pci-mvebu.c b/drivers/pci/host/pci-mveb=
u.c
> index 1ab8635..155d05f 100644
> --- a/drivers/pci/host/pci-mvebu.c
> +++ b/drivers/pci/host/pci-mvebu.c
> @@ -22,6 +22,8 @@
>  #include <linux/of_pci.h>
>  #include <linux/of_platform.h>
> =20
> +#include "../pci.h" /* HACK to see pci_find_host_bridge */
> +
>  /*
>   * PCIe unit register offsets.
>   */
> @@ -751,27 +753,20 @@ static int mvebu_pcie_setup(int nr, struct pci_=
sys_data *sys)
>  	return 1;
>  }
> =20
> -static struct pci_bus *mvebu_pcie_scan_bus(int nr, struct pci_sys_da=
ta *sys)
> +static resource_size_t mvebu_pcie_align_resource(void *data,
> +						 const struct resource *res,
> +						 resource_size_t size,
> +						 resource_size_t align)
>  {
> -	struct mvebu_pcie *pcie =3D sys_to_pcie(sys);
> -	struct pci_bus *bus;
> +	struct pci_dev *dev =3D data;
> =20
> -	bus =3D pci_create_root_bus(&pcie->pdev->dev, sys->busnr,
> -				  &mvebu_pcie_ops, sys, &sys->resources);
> -	if (!bus)
> -		return NULL;
> +	resource_size_t start =3D res->start;
> =20
> -	pci_scan_child_bus(bus);
> +	if (res->flags & IORESOURCE_IO && start & 0x300)
> +		start =3D (start + 0x3ff) & ~0x3ff;
> =20
> -	return bus;
> -}
> +	start =3D (start + align - 1) & ~(align - 1);

Honestly, I don't see here anything that is mvebu specific. Could you m=
ove
this function in the generic pci/host area and have a flag in the pci_h=
ost_bridge
structure whether the function should be called or not? I know that in =
a way
that looks very close to the existing implementation which uses pcibios=
_align_resource,
but the problem with pcibios_ version is that it is arch specific and n=
ot driver
specific the way we want.

Having this version as a generic implementation would also remove at le=
ast 2 more
arch version, possibly more after testing by the arch maintainers.

Best regards,
Liviu

> =20
> -static resource_size_t mvebu_pcie_align_resource(struct pci_dev *dev=
,
> -						 const struct resource *res,
> -						 resource_size_t start,
> -						 resource_size_t size,
> -						 resource_size_t align)
> -{
>  	if (dev->bus->number !=3D 0)
>  		return start;
> =20
> @@ -796,6 +791,25 @@ static resource_size_t mvebu_pcie_align_resource=
(struct pci_dev *dev,
>  		return start;
>  }
> =20
> +static struct pci_bus *mvebu_pcie_scan_bus(int nr, struct pci_sys_da=
ta *sys)
> +{
> +	struct mvebu_pcie *pcie =3D sys_to_pcie(sys);
> +	struct pci_host_bridge *phb;
> +	struct pci_bus *bus;
> +
> +	bus =3D pci_create_root_bus(&pcie->pdev->dev, sys->busnr,
> +				  &mvebu_pcie_ops, sys, &sys->resources);
> +	if (!bus)
> +		return NULL;
> +
> +	phb =3D pci_find_host_bridge(bus);
> +	phb->align_resource =3D mvebu_pcie_align_resource;
> +
> +	pci_scan_child_bus(bus);
> +
> +	return bus;
> +}
> +
>  static void mvebu_pcie_enable(struct mvebu_pcie *pcie)
>  {
>  	struct hw_pci hw;
> @@ -812,7 +826,6 @@ static void mvebu_pcie_enable(struct mvebu_pcie *=
pcie)
>  	hw.scan           =3D mvebu_pcie_scan_bus;
>  	hw.map_irq        =3D of_irq_parse_and_map_pci;
>  	hw.ops            =3D &mvebu_pcie_ops;
> -	hw.align_resource =3D mvebu_pcie_align_resource;
> =20
>  	pci_common_init(&hw);
>  }
> diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> index 232f925..73abca7 100644
> --- a/drivers/pci/setup-res.c
> +++ b/drivers/pci/setup-res.c
> @@ -200,7 +200,11 @@ static int pci_revert_fw_address(struct resource=
 *res, struct pci_dev *dev,
>  }
> =20
>  static int __pci_assign_resource(struct pci_bus *bus, struct pci_dev=
 *dev,
> -		int resno, resource_size_t size, resource_size_t align)
> +		int resno, resource_size_t size, resource_size_t align,
> +		resource_size_t (*alignf)(void *,
> +					  const struct resource *,
> +					  resource_size_t,
> +					  resource_size_t))
>  {
>  	struct resource *res =3D dev->resource + resno;
>  	resource_size_t min;
> @@ -217,7 +221,7 @@ static int __pci_assign_resource(struct pci_bus *=
bus, struct pci_dev *dev,
>  	 */
>  	ret =3D pci_bus_alloc_resource(bus, res, size, align, min,
>  				     IORESOURCE_PREFETCH | IORESOURCE_MEM_64,
> -				     pcibios_align_resource, dev);
> +				     alignf, dev);
>  	if (ret =3D=3D 0)
>  		return 0;
> =20
> @@ -229,7 +233,7 @@ static int __pci_assign_resource(struct pci_bus *=
bus, struct pci_dev *dev,
>  	     (IORESOURCE_PREFETCH | IORESOURCE_MEM_64)) {
>  		ret =3D pci_bus_alloc_resource(bus, res, size, align, min,
>  					     IORESOURCE_PREFETCH,
> -					     pcibios_align_resource, dev);
> +					     alignf, dev);
>  		if (ret =3D=3D 0)
>  			return 0;
>  	}
> @@ -242,7 +246,7 @@ static int __pci_assign_resource(struct pci_bus *=
bus, struct pci_dev *dev,
>  	 */
>  	if (res->flags & (IORESOURCE_PREFETCH | IORESOURCE_MEM_64))
>  		ret =3D pci_bus_alloc_resource(bus, res, size, align, min, 0,
> -					     pcibios_align_resource, dev);
> +					     alignf, dev);
> =20
>  	return ret;
>  }
> @@ -251,10 +255,23 @@ static int _pci_assign_resource(struct pci_dev =
*dev, int resno,
>  				resource_size_t size, resource_size_t min_align)
>  {
>  	struct pci_bus *bus;
> +	struct pci_host_bridge *phb;
> +	resource_size_t (*alignf)(void *,
> +				  const struct resource *,
> +				  resource_size_t,
> +				  resource_size_t);
>  	int ret;
> =20
>  	bus =3D dev->bus;
> -	while ((ret =3D __pci_assign_resource(bus, dev, resno, size, min_al=
ign))) {
> +	phb =3D pci_find_host_bridge(bus);
> +
> +	if (phb->align_resource)
> +		alignf =3D phb->align_resource;
> +	else
> +		alignf =3D pcibios_align_resource;
> +
> +	while ((ret =3D __pci_assign_resource(bus, dev, resno, size,
> +					    min_align, alignf))) {
>  		if (!bus->parent || !bus->self->transparent)
>  			break;
>  		bus =3D bus->parent;
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 353db8d..39e48fc 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -404,6 +404,9 @@ struct pci_host_bridge {
>  	struct device dev;
>  	struct pci_bus *bus;		/* root bus */
>  	struct list_head windows;	/* resource_entry */
> +	resource_size_t (*align_resource)(void *data,
> +			 const struct resource *res,
> +			 resource_size_t size, resource_size_t align);
>  	void (*release_fn)(struct pci_host_bridge *);
>  	void *release_data;
>  	unsigned int ignore_reset_delay:1;	/* for entire hierarchy */
> --=20
> 1.9.1
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

From: Zhou Wang <wangzhou1@hisilicon.com>
Subject: Re: [PATCH v2 1/4] ARM/PCI: remove align_resource callback in pcibios_align_resource
Date: Fri, 5 Jun 2015 11:53:38 +0800
Message-ID: <55711D42.1040507@hisilicon.com>
References: <1433320542-49576-1-git-send-email-wangzhou1@hisilicon.com> <1433320542-49576-2-git-send-email-wangzhou1@hisilicon.com> <55705036.7030004@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <55705036.7030004@arm.com>
Sender: linux-pci-owner@vger.kernel.org
To: James Morse <james.morse@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jg1.han@samsung.com>, Pratyush Anand <pratyush.anand@gmail.com>, Arnd Bergmann <arnd@arndb.de>, "fabrice.gasnier@st.com" <fabrice.gasnier@st.com>, Liviu Dudau <Liviu.Dudau@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "gabriele.paoloni@huawei.com" <gabriele.paoloni@huawei.com>, "yuanzhichang@hisilicon.com" <yuanzhichang@hisilicon.com>, "zhudacai@hisilicon.com" <zhudacai@hisilicon.com>, "zhangjukuo@huawei.com" <zhangjukuo@huawei.com>, "qiuzhenfa@hisilicon.com" <qiuzhenfa@hisilicon.com>, "liguozhu@hisilicon.com" <liguozhu@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On 2015/6/4 21:18, James Morse wrote:
> On 03/06/15 09:35, Zhou Wang wrote:
>> diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
>> index fcbbbb1..47588dc 100644
>> --- a/arch/arm/kernel/bios32.c
>> +++ b/arch/arm/kernel/bios32.c
>> @@ -468,7 +468,6 @@ static void pcibios_init_hw(struct device *paren=
t, struct hw_pci *hw,
>>  		sys->busnr   =3D busnr;
>>  		sys->swizzle =3D hw->swizzle;
>>  		sys->map_irq =3D hw->map_irq;
>> -		sys->align_resource =3D hw->align_resource;
>>  		INIT_LIST_HEAD(&sys->resources);
>> =20
>>  		if (hw->private_data)
>> @@ -597,9 +596,6 @@ resource_size_t pcibios_align_resource(void *dat=
a, const struct resource *res,
>> =20
>>  	start =3D (start + align - 1) & ~(align - 1);
>> =20
>> -	if (sys->align_resource)
>> -		return sys->align_resource(dev, res, start, size, align);
>> -
>>  	return start;
>>  }
>=20
> This leaves both 'sys' and 'dev' in this function as unused variables=
=2E
> Please remove them too.
>=20

Right, will do in next version.

>> diff --git a/drivers/pci/host/pci-mvebu.c b/drivers/pci/host/pci-mve=
bu.c
>> index 1ab8635..155d05f 100644
>> --- a/drivers/pci/host/pci-mvebu.c
>> +++ b/drivers/pci/host/pci-mvebu.c
>> @@ -22,6 +22,8 @@
>>  #include <linux/of_pci.h>
>>  #include <linux/of_platform.h>
>> =20
>> +#include "../pci.h" /* HACK to see pci_find_host_bridge */
>> +
>=20
> Wouldn't it be better to promote pci_find_host_bridge to be declared =
in
> include/linux/pci.h instead?
>=20
>=20
> Thanks,
>=20
> James
>

The files which use pci_find_host_bridge are all under drivers/pci, so =
maybe putting
in drivers/pci/pci.h is better ?

Many thanks for reviewing=EF=BC=8C
Zhou

>>  /*
>>   * PCIe unit register offsets.
>>   */
>> @@ -751,27 +753,20 @@ static int mvebu_pcie_setup(int nr, struct pci=
_sys_data *sys)
>>  	return 1;
>>  }
>> =20
>> -static struct pci_bus *mvebu_pcie_scan_bus(int nr, struct pci_sys_d=
ata *sys)
>> +static resource_size_t mvebu_pcie_align_resource(void *data,
>> +						 const struct resource *res,
>> +						 resource_size_t size,
>> +						 resource_size_t align)
>>  {
>> -	struct mvebu_pcie *pcie =3D sys_to_pcie(sys);
>> -	struct pci_bus *bus;
>> +	struct pci_dev *dev =3D data;
>> =20
>> -	bus =3D pci_create_root_bus(&pcie->pdev->dev, sys->busnr,
>> -				  &mvebu_pcie_ops, sys, &sys->resources);
>> -	if (!bus)
>> -		return NULL;
>> +	resource_size_t start =3D res->start;
>> =20
>> -	pci_scan_child_bus(bus);
>> +	if (res->flags & IORESOURCE_IO && start & 0x300)
>> +		start =3D (start + 0x3ff) & ~0x3ff;
>> =20
>> -	return bus;
>> -}
>> +	start =3D (start + align - 1) & ~(align - 1);
>> =20
>> -static resource_size_t mvebu_pcie_align_resource(struct pci_dev *de=
v,
>> -						 const struct resource *res,
>> -						 resource_size_t start,
>> -						 resource_size_t size,
>> -						 resource_size_t align)
>> -{
>>  	if (dev->bus->number !=3D 0)
>>  		return start;
>> =20
>> @@ -796,6 +791,25 @@ static resource_size_t mvebu_pcie_align_resourc=
e(struct pci_dev *dev,
>>  		return start;
>>  }
>> =20
>> +static struct pci_bus *mvebu_pcie_scan_bus(int nr, struct pci_sys_d=
ata *sys)
>> +{
>> +	struct mvebu_pcie *pcie =3D sys_to_pcie(sys);
>> +	struct pci_host_bridge *phb;
>> +	struct pci_bus *bus;
>> +
>> +	bus =3D pci_create_root_bus(&pcie->pdev->dev, sys->busnr,
>> +				  &mvebu_pcie_ops, sys, &sys->resources);
>> +	if (!bus)
>> +		return NULL;
>> +
>> +	phb =3D pci_find_host_bridge(bus);
>> +	phb->align_resource =3D mvebu_pcie_align_resource;
>> +
>> +	pci_scan_child_bus(bus);
>> +
>> +	return bus;
>> +}
>> +
>>  static void mvebu_pcie_enable(struct mvebu_pcie *pcie)
>>  {
>>  	struct hw_pci hw;
>> @@ -812,7 +826,6 @@ static void mvebu_pcie_enable(struct mvebu_pcie =
*pcie)
>>  	hw.scan           =3D mvebu_pcie_scan_bus;
>>  	hw.map_irq        =3D of_irq_parse_and_map_pci;
>>  	hw.ops            =3D &mvebu_pcie_ops;
>> -	hw.align_resource =3D mvebu_pcie_align_resource;
>> =20
>>  	pci_common_init(&hw);
>>  }
>=20
>=20
> .
>=20

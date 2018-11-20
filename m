From: "M.h. Lian" <minghuan.lian@nxp.com>
Subject: RE: [PATCHv2 17/25] PCI: mobiveil: fix the checking of valid device
Date: Tue, 20 Nov 2018 11:26:13 +0000
Message-ID: <HE1PR0401MB22354A5A97A9E871B99FD42AE8D90@HE1PR0401MB2235.eurprd04.prod.outlook.com>
References: <20181120092615.11680-1-Zhiqiang.Hou@nxp.com>
 <20181120092615.11680-18-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120092615.11680-18-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>

> -----Original Message-----
> From: Z.q. Hou
> Sent: Tuesday, November 20, 2018 5:27 PM
> To: linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> l.subrahmanya@mobiveil.co.in; shawnguo@kernel.org; Leo Li
> <leoyang.li@nxp.com>; lorenzo.pieralisi@arm.com;
> catalin.marinas@arm.com; will.deacon@arm.com
> Cc: Mingkai Hu <mingkai.hu@nxp.com>; M.h. Lian
> <minghuan.lian@nxp.com>; Xiaowei Bao <xiaowei.bao@nxp.com>; Z.q. Hou
> <zhiqiang.hou@nxp.com>
> Subject: [PATCHv2 17/25] PCI: mobiveil: fix the checking of valid device
>=20
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>=20
> Avoid to issue CFG transactions to link partner when the PCIe link is not=
 up.
> And allow CFG transactions to all functions of Endpoint implemented
> multiple functions.
>=20
> Fixes: 9af6bcb11e12 ("PCI: mobiveil: Add Mobiveil PCIe Host Bridge IP dri=
ver")
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V2:
>  - New patch
>=20
>  drivers/pci/controller/mobiveil/pcie-mobiveil-host.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> index dc5324d94466..1ae82e790562 100644
> --- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> +++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> @@ -29,6 +29,10 @@ static bool mobiveil_pcie_valid_device(struct pci_bus
> *bus, unsigned int devfn)  {
>  	struct mobiveil_pcie *pcie =3D bus->sysdata;
>=20
> +	/* If there is no link, then there is no device */
> +	if (bus->number > pcie->rp.root_bus_nr
> && !mobiveil_pcie_link_up(pcie))
> +		return false;
> +
>  	/* Only one device down on each root port */
>  	if ((bus->number =3D=3D pcie->rp.root_bus_nr) && (devfn > 0))
>  		return false;
> @@ -37,7 +41,7 @@ static bool mobiveil_pcie_valid_device(struct pci_bus
> *bus, unsigned int devfn)
>  	 * Do not read more than one device on the bus directly
>  	 * attached to RC
>  	 */
> -	if ((bus->primary =3D=3D pcie->rp.root_bus_nr) && (devfn > 0))
> +	if ((bus->primary =3D=3D pcie->rp.root_bus_nr) && (PCI_SLOT(devfn) > 0)=
)
>  		return false;
>=20
>  	return true;
> --
> 2.17.1

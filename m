From: "M.h. Lian" <minghuan.lian@nxp.com>
Subject: RE: [PATCHv2 12/25] PCI: mobiveil: move out the link up waiting from
 mobiveil_host_init
Date: Tue, 20 Nov 2018 11:01:49 +0000
Message-ID: <HE1PR0401MB2235E159D0F9F922F36B1517E8D90@HE1PR0401MB2235.eurprd04.prod.outlook.com>
References: <20181120092615.11680-1-Zhiqiang.Hou@nxp.com>
 <20181120092615.11680-13-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120092615.11680-13-Zhiqiang.Hou@nxp.com>
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
> Subject: [PATCHv2 12/25] PCI: mobiveil: move out the link up waiting from
> mobiveil_host_init
>=20
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>=20
> Host initial sequence does not depend on PCIe link up, so move it to the
> place just before the enumeration.
>=20
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V2:
>  - no change
>=20
>  drivers/pci/controller/pcie-mobiveil.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-mobiveil.c
> b/drivers/pci/controller/pcie-mobiveil.c
> index 8eee1ab7ee24..c2848c22b466 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -582,15 +582,8 @@ static void mobiveil_pcie_enable_msi(struct
> mobiveil_pcie *pcie)  static int mobiveil_host_init(struct mobiveil_pcie =
*pcie)
> {
>  	u32 value, pab_ctrl, type;
> -	int err;
>  	struct resource_entry *win;
>=20
> -	err =3D mobiveil_bringup_link(pcie);
> -	if (err) {
> -		dev_info(&pcie->pdev->dev, "link bring-up failed\n");
> -		return err;
> -	}
> -
>  	/*
>  	 * program Bus Master Enable Bit in Command Register in PAB Config
>  	 * Space
> @@ -662,7 +655,7 @@ static int mobiveil_host_init(struct mobiveil_pcie
> *pcie)
>  	/* setup MSI hardware registers */
>  	mobiveil_pcie_enable_msi(pcie);
>=20
> -	return err;
> +	return 0;
>  }
>=20
>  static void mobiveil_mask_intx_irq(struct irq_data *data) @@ -922,6
> +915,12 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>  	bridge->map_irq =3D of_irq_parse_and_map_pci;
>  	bridge->swizzle_irq =3D pci_common_swizzle;
>=20
> +	ret =3D mobiveil_bringup_link(pcie);
> +	if (ret) {
> +		dev_info(dev, "link bring-up failed\n");
> +		goto error;
> +	}
> +
>  	/* setup the kernel resources for the newly added PCIe root bus */
>  	ret =3D pci_scan_root_bus_bridge(bridge);
>  	if (ret)
> --
> 2.17.1

From: "M.h. Lian" <minghuan.lian@nxp.com>
Subject: RE: [PATCHv2 14/25] PCI: mobiveil: initialize
 Primary/Secondary/Subordinate bus number
Date: Tue, 20 Nov 2018 11:24:53 +0000
Message-ID: <HE1PR0401MB22353443B478CFD95466B664E8D90@HE1PR0401MB2235.eurprd04.prod.outlook.com>
References: <20181120092615.11680-1-Zhiqiang.Hou@nxp.com>
 <20181120092615.11680-15-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120092615.11680-15-Zhiqiang.Hou@nxp.com>
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
> Subject: [PATCHv2 14/25] PCI: mobiveil: initialize
> Primary/Secondary/Subordinate bus number
>=20
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>=20
> The reset value is all zero, so set a workable value for Primary, Seconda=
ry
> and Subordinate bus numbers.
>=20
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V2:
>  - no change
>=20
>  drivers/pci/controller/pcie-mobiveil.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/pci/controller/pcie-mobiveil.c
> b/drivers/pci/controller/pcie-mobiveil.c
> index db7ecb021c63..9210165fe8c0 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -582,6 +582,12 @@ static int mobiveil_host_init(struct mobiveil_pcie
> *pcie)
>  	u32 value, pab_ctrl, type;
>  	struct resource_entry *win;
>=20
> +	/* setup bus numbers */
> +	value =3D csr_readl(pcie, PCI_PRIMARY_BUS);
> +	value &=3D 0xff000000;
> +	value |=3D 0x00ff0100;
> +	csr_writel(pcie, value, PCI_PRIMARY_BUS);
> +
>  	/*
>  	 * program Bus Master Enable Bit in Command Register in PAB Config
>  	 * Space
> --
> 2.17.1

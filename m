From: "M.h. Lian" <minghuan.lian@nxp.com>
Subject: RE: [PATCHv2 20/25] PCI: mobiveil: add Byte and Half-Word width
 register accessors
Date: Tue, 20 Nov 2018 11:27:24 +0000
Message-ID: <HE1PR0401MB22354FEF2BDCCF9725FD81C5E8D90@HE1PR0401MB2235.eurprd04.prod.outlook.com>
References: <20181120092615.11680-1-Zhiqiang.Hou@nxp.com>
 <20181120092615.11680-21-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120092615.11680-21-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>

> -----Original Message-----
> From: Z.q. Hou
> Sent: Tuesday, November 20, 2018 5:28 PM
> To: linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> l.subrahmanya@mobiveil.co.in; shawnguo@kernel.org; Leo Li
> <leoyang.li@nxp.com>; lorenzo.pieralisi@arm.com;
> catalin.marinas@arm.com; will.deacon@arm.com
> Cc: Mingkai Hu <mingkai.hu@nxp.com>; M.h. Lian
> <minghuan.lian@nxp.com>; Xiaowei Bao <xiaowei.bao@nxp.com>; Z.q. Hou
> <zhiqiang.hou@nxp.com>
> Subject: [PATCHv2 20/25] PCI: mobiveil: add Byte and Half-Word width
> register accessors
>=20
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>=20
> As there are some Byte and Half-Work width registers in PCIe configuratio=
n
> space, add Byte and Half-Word width register accessors.
>=20
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V2:
>  - no change
>=20
>  .../pci/controller/mobiveil/pcie-mobiveil.h   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> index 81685840b378..933c2f34bc52 100644
> --- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> +++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> @@ -181,9 +181,29 @@ static inline u32 csr_readl(struct mobiveil_pcie *pc=
ie,
> u32 off)
>  	return csr_read(pcie, off, 0x4);
>  }
>=20
> +static inline u32 csr_readw(struct mobiveil_pcie *pcie, u32 off) {
> +	return csr_read(pcie, off, 0x2);
> +}
> +
> +static inline u32 csr_readb(struct mobiveil_pcie *pcie, u32 off) {
> +	return csr_read(pcie, off, 0x1);
> +}
> +
>  static inline void csr_writel(struct mobiveil_pcie *pcie, u32 val, u32 o=
ff)  {
>  	csr_write(pcie, val, off, 0x4);
>  }
>=20
> +static inline void csr_writew(struct mobiveil_pcie *pcie, u32 val, u32
> +off) {
> +	csr_write(pcie, val, off, 0x2);
> +}
> +
> +static inline void csr_writeb(struct mobiveil_pcie *pcie, u32 val, u32
> +off) {
> +	csr_write(pcie, val, off, 0x1);
> +}
> +
>  #endif /* _PCIE_MOBIVEIL_H */
> --
> 2.17.1

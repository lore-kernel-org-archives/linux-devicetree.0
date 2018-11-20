From: "M.h. Lian" <minghuan.lian@nxp.com>
Subject: RE: [PATCHv2 15/25] dt-bindings: pci: mobiveil: change gpio_slave and
 apb_csr to optional
Date: Tue, 20 Nov 2018 11:25:07 +0000
Message-ID: <HE1PR0401MB2235255D95CFABE423EC0665E8D90@HE1PR0401MB2235.eurprd04.prod.outlook.com>
References: <20181120092615.11680-1-Zhiqiang.Hou@nxp.com>
 <20181120092615.11680-16-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120092615.11680-16-Zhiqiang.Hou@nxp.com>
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
> Subject: [PATCHv2 15/25] dt-bindings: pci: mobiveil: change gpio_slave an=
d
> apb_csr to optional
>=20
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>=20
> Change the "gpio_slave" and "apb_csr" to optional, the "gpio_slave"
> is not used in current code, and "apb_csr" is not used by some platforms.
>=20
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Acked-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> V2:
>  - no change
>=20
>  Documentation/devicetree/bindings/pci/mobiveil-pcie.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
> b/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
> index a618d4787dd7..64156993e052 100644
> --- a/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/mobiveil-pcie.txt
> @@ -10,8 +10,10 @@ Required properties:
>  	interrupt source. The value must be 1.
>  - compatible: Should contain "mbvl,gpex40-pcie"
>  - reg: Should contain PCIe registers location and length
> +	Mandatory:
>  	"config_axi_slave": PCIe controller registers
>  	"csr_axi_slave"	  : Bridge config registers
> +	Optional:
>  	"gpio_slave"	  : GPIO registers to control slot power
>  	"apb_csr"	  : MSI registers
>=20
> --
> 2.17.1

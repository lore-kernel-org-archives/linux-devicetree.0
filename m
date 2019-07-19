From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: RE: [PATCH v2 7/8] PCI: dw: Add validation that PCIe core is set to
 correct mode
Date: Fri, 19 Jul 2019 09:15:16 +0000
Message-ID: <DM6PR12MB40105D55ECC90DB9A1DF783DDACB0@DM6PR12MB4010.namprd12.prod.outlook.com>
References: <20190718094531.21423-1-jonnyc@amazon.com>
 <20190718094718.25083-3-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718094718.25083-3-jonnyc@amazon.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "alisaidi@amazon.com" <alisaidi@amazon.com>, "ronenk@amazon.com" <ronenk@amazon.com>, "barakw@amazon.com" <barakw@amazon.com>, "talel@amazon.com" <talel@amazon.com>, "hanochu@amazon.com" <hanochu@amazon.com>, "hhhawa@amazon.com" <hhhawa@amazon.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 18, 2019 at 10:47:17, Jonathan Chocron <jonnyc@amazon.com>=20
wrote:

> Some PCIe controllers can be set to either Host or EP according to some
> early boot FW. To make sure there is no discrepancy (e.g. FW configured
> the port to EP mode while the DT specifies it as a host bridge or vice
> versa), a check has been added for each mode.
>=20
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c   | 8 ++++++++
>  drivers/pci/controller/dwc/pcie-designware-host.c | 8 ++++++++
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pc=
i/controller/dwc/pcie-designware-ep.c
> index 2bf5a35c0570..00e59a134b93 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -531,6 +531,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	int ret;
>  	u32 reg;
>  	void *addr;
> +	u8 hdr_type;
>  	unsigned int nbars;
>  	unsigned int offset;
>  	struct pci_epc *epc;
> @@ -543,6 +544,13 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  		return -EINVAL;
>  	}
> =20
> +	hdr_type =3D dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE);
> +	if (hdr_type !=3D PCI_HEADER_TYPE_NORMAL) {
> +		dev_err(pci->dev, "PCIe controller is not set to EP mode (hdr_type:0x%=
x)!\n",
> +			hdr_type);
> +		return -EIO;
> +	}
> +
>  	ret =3D of_property_read_u32(np, "num-ib-windows", &ep->num_ib_windows)=
;
>  	if (ret < 0) {
>  		dev_err(dev, "Unable to read *num-ib-windows* property\n");
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/=
pci/controller/dwc/pcie-designware-host.c
> index f93252d0da5b..d2ca748e4c85 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -323,6 +323,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
>  	struct pci_bus *child;
>  	struct pci_host_bridge *bridge;
>  	struct resource *cfg_res;
> +	u8 hdr_type;
>  	int ret;
> =20
>  	raw_spin_lock_init(&pci->pp.lock);
> @@ -396,6 +397,13 @@ int dw_pcie_host_init(struct pcie_port *pp)
>  		}
>  	}
> =20
> +	hdr_type =3D dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE);
> +	if (hdr_type !=3D PCI_HEADER_TYPE_BRIDGE) {
> +		dev_err(pci->dev, "PCIe controller is not set to bridge type (hdr_type=
: 0x%x)!\n",
> +			hdr_type);
> +		return -EIO;
> +	}
> +
>  	pp->mem_base =3D pp->mem->start;
> =20
>  	if (!pp->va_cfg0_base) {
> --=20
> 2.17.1

It doesn't harm.
Thanks.

Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

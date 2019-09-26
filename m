From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: RE: [PATCH v4 01/11] PCI: designware-ep: Add multiple PFs support for
 DWC
Date: Thu, 26 Sep 2019 13:27:48 +0000
Message-ID: <DM6PR12MB40104161C121BB562C43C99CDA860@DM6PR12MB4010.namprd12.prod.outlook.com>
References: <20190924021849.3185-1-xiaowei.bao@nxp.com>
 <20190924021849.3185-2-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190924021849.3185-2-xiaowei.bao@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "kishon@ti.com" <kishon@ti.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "minghuan.Lian@nxp.com" <minghuan.Lian@nxp.com>, "mingkai.hu@nxp.com" <mingkai.hu@nxp.com>, "roy.zang@nxp.com" <roy.zang@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>, "andrew.murray@arm.com" <andrew.murray@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <device>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 24, 2019 at 3:18:39, Xiaowei Bao <xiaowei.bao@nxp.com> wrote:

> Add multiple PFs support for DWC, due to different PF have different
> config space, we use func_conf_select callback function to access
> the different PF's config space, the different chip company need to
> implement this callback function when use the DWC IP core and intend
> to support multiple PFs feature.
>=20
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - Remove duplicate redundant code.
>  - Reimplement the PF config space access way.
> v3:
>  - Integrate duplicate code for func_select.
>  - Move PCIE_ATU_FUNC_NUM(pf) (pf << 20) to ((pf) << 20).
>  - Add the comments for func_conf_select function.
> v4:
>  - Correct the commit message.
>=20
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 123 ++++++++++++++++--=
------
>  drivers/pci/controller/dwc/pcie-designware.c    |  59 ++++++++----
>  drivers/pci/controller/dwc/pcie-designware.h    |  18 +++-
>  3 files changed, 142 insertions(+), 58 deletions(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pc=
i/controller/dwc/pcie-designware-ep.c
> index 65f4792..eb851c2 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -19,12 +19,26 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  	pci_epc_linkup(epc);
>  }
> =20
> -static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno b=
ar,
> -				   int flags)
> +static unsigned int dw_pcie_ep_func_select(struct dw_pcie_ep *ep, u8 fun=
c_no)
> +{
> +	unsigned int func_offset =3D 0;
> +
> +	if (ep->ops->func_conf_select)
> +		func_offset =3D ep->ops->func_conf_select(ep, func_no);
> +
> +	return func_offset;
> +}
> +
> +static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
> +				   enum pci_barno bar, int flags)
>  {
>  	u32 reg;
> +	unsigned int func_offset =3D 0;
> +	struct dw_pcie_ep *ep =3D &pci->ep;
> +
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> =20
> -	reg =3D PCI_BASE_ADDRESS_0 + (4 * bar);
> +	reg =3D func_offset + PCI_BASE_ADDRESS_0 + (4 * bar);
>  	dw_pcie_dbi_ro_wr_en(pci);
>  	dw_pcie_writel_dbi2(pci, reg, 0x0);
>  	dw_pcie_writel_dbi(pci, reg, 0x0);
> @@ -37,7 +51,12 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci=
, enum pci_barno bar,
> =20
>  void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  {
> -	__dw_pcie_ep_reset_bar(pci, bar, 0);
> +	u8 func_no, funcs;
> +
> +	funcs =3D pci->ep.epc->max_functions;
> +
> +	for (func_no =3D 0; func_no < funcs; func_no++)
> +		__dw_pcie_ep_reset_bar(pci, func_no, bar, 0);
>  }
> =20
>  static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
> @@ -45,28 +64,31 @@ static int dw_pcie_ep_write_header(struct pci_epc *ep=
c, u8 func_no,
>  {
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> +	unsigned int func_offset =3D 0;
> +
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> =20
>  	dw_pcie_dbi_ro_wr_en(pci);
> -	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, hdr->vendorid);
> -	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, hdr->deviceid);
> -	dw_pcie_writeb_dbi(pci, PCI_REVISION_ID, hdr->revid);
> -	dw_pcie_writeb_dbi(pci, PCI_CLASS_PROG, hdr->progif_code);
> -	dw_pcie_writew_dbi(pci, PCI_CLASS_DEVICE,
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_VENDOR_ID, hdr->vendorid);
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_DEVICE_ID, hdr->deviceid);
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_REVISION_ID, hdr->revid);
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_CLASS_PROG, hdr->progif_code)=
;
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_CLASS_DEVICE,
>  			   hdr->subclass_code | hdr->baseclass_code << 8);
> -	dw_pcie_writeb_dbi(pci, PCI_CACHE_LINE_SIZE,
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_CACHE_LINE_SIZE,
>  			   hdr->cache_line_size);
> -	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_VENDOR_ID,
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_VENDOR_ID,
>  			   hdr->subsys_vendor_id);
> -	dw_pcie_writew_dbi(pci, PCI_SUBSYSTEM_ID, hdr->subsys_id);
> -	dw_pcie_writeb_dbi(pci, PCI_INTERRUPT_PIN,
> +	dw_pcie_writew_dbi(pci, func_offset + PCI_SUBSYSTEM_ID, hdr->subsys_id)=
;
> +	dw_pcie_writeb_dbi(pci, func_offset + PCI_INTERRUPT_PIN,
>  			   hdr->interrupt_pin);
>  	dw_pcie_dbi_ro_wr_dis(pci);
> =20
>  	return 0;
>  }
> =20
> -static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, enum pci_barno =
bar,
> -				  dma_addr_t cpu_addr,
> +static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no,
> +				  enum pci_barno bar, dma_addr_t cpu_addr,
>  				  enum dw_pcie_as_type as_type)
>  {
>  	int ret;
> @@ -79,7 +101,7 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *e=
p, enum pci_barno bar,
>  		return -EINVAL;
>  	}
> =20
> -	ret =3D dw_pcie_prog_inbound_atu(pci, free_win, bar, cpu_addr,
> +	ret =3D dw_pcie_prog_inbound_atu(pci, func_no, free_win, bar, cpu_addr,
>  				       as_type);
>  	if (ret < 0) {
>  		dev_err(pci->dev, "Failed to program IB window\n");
> @@ -92,7 +114,8 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *e=
p, enum pci_barno bar,
>  	return 0;
>  }
> =20
> -static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, phys_addr_t ph=
ys_addr,
> +static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, u8 func_no,
> +				   phys_addr_t phys_addr,
>  				   u64 pci_addr, size_t size)
>  {
>  	u32 free_win;
> @@ -104,8 +127,8 @@ static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep =
*ep, phys_addr_t phys_addr,
>  		return -EINVAL;
>  	}
> =20
> -	dw_pcie_prog_outbound_atu(pci, free_win, PCIE_ATU_TYPE_MEM,
> -				  phys_addr, pci_addr, size);
> +	dw_pcie_prog_ep_outbound_atu(pci, func_no, free_win, PCIE_ATU_TYPE_MEM,
> +				     phys_addr, pci_addr, size);
> =20
>  	set_bit(free_win, ep->ob_window_map);
>  	ep->outbound_addr[free_win] =3D phys_addr;
> @@ -121,7 +144,7 @@ static void dw_pcie_ep_clear_bar(struct pci_epc *epc,=
 u8 func_no,
>  	enum pci_barno bar =3D epf_bar->barno;
>  	u32 atu_index =3D ep->bar_to_atu[bar];
> =20
> -	__dw_pcie_ep_reset_bar(pci, bar, epf_bar->flags);
> +	__dw_pcie_ep_reset_bar(pci, func_no, bar, epf_bar->flags);
> =20
>  	dw_pcie_disable_atu(pci, atu_index, DW_PCIE_REGION_INBOUND);
>  	clear_bit(atu_index, ep->ib_window_map);
> @@ -137,14 +160,20 @@ static int dw_pcie_ep_set_bar(struct pci_epc *epc, =
u8 func_no,
>  	size_t size =3D epf_bar->size;
>  	int flags =3D epf_bar->flags;
>  	enum dw_pcie_as_type as_type;
> -	u32 reg =3D PCI_BASE_ADDRESS_0 + (4 * bar);
> +	u32 reg;
> +	unsigned int func_offset =3D 0;
> +
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D PCI_BASE_ADDRESS_0 + (4 * bar) + func_offset;
> =20
>  	if (!(flags & PCI_BASE_ADDRESS_SPACE))
>  		as_type =3D DW_PCIE_AS_MEM;
>  	else
>  		as_type =3D DW_PCIE_AS_IO;
> =20
> -	ret =3D dw_pcie_ep_inbound_atu(ep, bar, epf_bar->phys_addr, as_type);
> +	ret =3D dw_pcie_ep_inbound_atu(ep, func_no, bar,
> +				     epf_bar->phys_addr, as_type);
>  	if (ret)
>  		return ret;
> =20
> @@ -202,7 +231,7 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u=
8 func_no,
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> =20
> -	ret =3D dw_pcie_ep_outbound_atu(ep, addr, pci_addr, size);
> +	ret =3D dw_pcie_ep_outbound_atu(ep, func_no, addr, pci_addr, size);
>  	if (ret) {
>  		dev_err(pci->dev, "Failed to enable address\n");
>  		return ret;
> @@ -216,11 +245,14 @@ static int dw_pcie_ep_get_msi(struct pci_epc *epc, =
u8 func_no)
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset =3D 0;
> =20
>  	if (!ep->msi_cap)
>  		return -EINVAL;
> =20
> -	reg =3D ep->msi_cap + PCI_MSI_FLAGS;
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D ep->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	val =3D dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSI_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -235,11 +267,14 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc, =
u8 func_no, u8 interrupts)
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset =3D 0;
> =20
>  	if (!ep->msi_cap)
>  		return -EINVAL;
> =20
> -	reg =3D ep->msi_cap + PCI_MSI_FLAGS;
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D ep->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	val =3D dw_pcie_readw_dbi(pci, reg);
>  	val &=3D ~PCI_MSI_FLAGS_QMASK;
>  	val |=3D (interrupts << 1) & PCI_MSI_FLAGS_QMASK;
> @@ -255,11 +290,14 @@ static int dw_pcie_ep_get_msix(struct pci_epc *epc,=
 u8 func_no)
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset =3D 0;
> =20
>  	if (!ep->msix_cap)
>  		return -EINVAL;
> =20
> -	reg =3D ep->msix_cap + PCI_MSIX_FLAGS;
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
>  	val =3D dw_pcie_readw_dbi(pci, reg);
>  	if (!(val & PCI_MSIX_FLAGS_ENABLE))
>  		return -EINVAL;
> @@ -274,11 +312,14 @@ static int dw_pcie_ep_set_msix(struct pci_epc *epc,=
 u8 func_no, u16 interrupts)
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	u32 val, reg;
> +	unsigned int func_offset =3D 0;
> =20
>  	if (!ep->msix_cap)
>  		return -EINVAL;
> =20
> -	reg =3D ep->msix_cap + PCI_MSIX_FLAGS;
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D ep->msix_cap + func_offset + PCI_MSIX_FLAGS;
>  	val =3D dw_pcie_readw_dbi(pci, reg);
>  	val &=3D ~PCI_MSIX_FLAGS_QSIZE;
>  	val |=3D interrupts;
> @@ -365,6 +406,7 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u=
8 func_no,
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	struct pci_epc *epc =3D ep->epc;
>  	unsigned int aligned_offset;
> +	unsigned int func_offset =3D 0;
>  	u16 msg_ctrl, msg_data;
>  	u32 msg_addr_lower, msg_addr_upper, reg;
>  	u64 msg_addr;
> @@ -374,20 +416,22 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep,=
 u8 func_no,
>  	if (!ep->msi_cap)
>  		return -EINVAL;
> =20
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
>  	/* Raise MSI per the PCI Local Bus Specification Revision 3.0, 6.8.1. *=
/
> -	reg =3D ep->msi_cap + PCI_MSI_FLAGS;
> +	reg =3D ep->msi_cap + func_offset + PCI_MSI_FLAGS;
>  	msg_ctrl =3D dw_pcie_readw_dbi(pci, reg);
>  	has_upper =3D !!(msg_ctrl & PCI_MSI_FLAGS_64BIT);
> -	reg =3D ep->msi_cap + PCI_MSI_ADDRESS_LO;
> +	reg =3D ep->msi_cap + func_offset + PCI_MSI_ADDRESS_LO;
>  	msg_addr_lower =3D dw_pcie_readl_dbi(pci, reg);
>  	if (has_upper) {
> -		reg =3D ep->msi_cap + PCI_MSI_ADDRESS_HI;
> +		reg =3D ep->msi_cap + func_offset + PCI_MSI_ADDRESS_HI;
>  		msg_addr_upper =3D dw_pcie_readl_dbi(pci, reg);
> -		reg =3D ep->msi_cap + PCI_MSI_DATA_64;
> +		reg =3D ep->msi_cap + func_offset + PCI_MSI_DATA_64;
>  		msg_data =3D dw_pcie_readw_dbi(pci, reg);
>  	} else {
>  		msg_addr_upper =3D 0;
> -		reg =3D ep->msi_cap + PCI_MSI_DATA_32;
> +		reg =3D ep->msi_cap + func_offset + PCI_MSI_DATA_32;
>  		msg_data =3D dw_pcie_readw_dbi(pci, reg);
>  	}
>  	aligned_offset =3D msg_addr_lower & (epc->mem->page_size - 1);
> @@ -406,11 +450,12 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep,=
 u8 func_no,
>  }
> =20
>  int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> -			     u16 interrupt_num)
> +			      u16 interrupt_num)
>  {
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	struct pci_epc *epc =3D ep->epc;
>  	u16 tbl_offset, bir;
> +	unsigned int func_offset =3D 0;
>  	u32 bar_addr_upper, bar_addr_lower;
>  	u32 msg_addr_upper, msg_addr_lower;
>  	u32 reg, msg_data, vec_ctrl;
> @@ -418,12 +463,14 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep=
, u8 func_no,
>  	void __iomem *msix_tbl;
>  	int ret;
> =20
> -	reg =3D ep->msix_cap + PCI_MSIX_TABLE;
> +	func_offset =3D dw_pcie_ep_func_select(ep, func_no);
> +
> +	reg =3D ep->msix_cap + func_offset + PCI_MSIX_TABLE;
>  	tbl_offset =3D dw_pcie_readl_dbi(pci, reg);
>  	bir =3D (tbl_offset & PCI_MSIX_TABLE_BIR);
>  	tbl_offset &=3D PCI_MSIX_TABLE_OFFSET;
> =20
> -	reg =3D PCI_BASE_ADDRESS_0 + (4 * bir);
> +	reg =3D PCI_BASE_ADDRESS_0 + func_offset + (4 * bir);
>  	bar_addr_upper =3D 0;
>  	bar_addr_lower =3D dw_pcie_readl_dbi(pci, reg);
>  	reg_u64 =3D (bar_addr_lower & PCI_BASE_ADDRESS_MEM_TYPE_MASK);
> @@ -559,13 +606,13 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	ep->epc =3D epc;
>  	epc_set_drvdata(epc, ep);
> =20
> -	if (ep->ops->ep_init)
> -		ep->ops->ep_init(ep);
> -
>  	ret =3D of_property_read_u8(np, "max-functions", &epc->max_functions);
>  	if (ret < 0)
>  		epc->max_functions =3D 1;
> =20
> +	if (ep->ops->ep_init)
> +		ep->ops->ep_init(ep);
> +
>  	ret =3D __pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
>  				 ep->page_size);
>  	if (ret < 0) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/c=
ontroller/dwc/pcie-designware.c
> index 143cb6c..ede2e75 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -238,9 +238,10 @@ static void dw_pcie_writel_ob_unroll(struct dw_pcie =
*pci, u32 index, u32 reg,
>  	dw_pcie_writel_atu(pci, offset + reg, val);
>  }
> =20
> -static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, int in=
dex,
> -					     int type, u64 cpu_addr,
> -					     u64 pci_addr, u32 size)
> +static void dw_pcie_prog_outbound_atu_unroll(struct dw_pcie *pci, u8 fun=
c_no,
> +					     int index, int type,
> +					     u64 cpu_addr, u64 pci_addr,
> +					     u32 size)
>  {
>  	u32 retries, val;
> =20
> @@ -255,7 +256,7 @@ static void dw_pcie_prog_outbound_atu_unroll(struct d=
w_pcie *pci, int index,
>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_UPPER_TARGET,
>  				 upper_32_bits(pci_addr));
>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1,
> -				 type);
> +				 type | PCIE_ATU_FUNC_NUM(func_no));
>  	dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
>  				 PCIE_ATU_ENABLE);
> =20
> @@ -274,8 +275,9 @@ static void dw_pcie_prog_outbound_atu_unroll(struct d=
w_pcie *pci, int index,
>  	dev_err(pci->dev, "Outbound iATU is not being enabled\n");
>  }
> =20
> -void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
> -			       u64 cpu_addr, u64 pci_addr, u32 size)
> +static void __dw_pcie_prog_outbound_atu(struct dw_pcie *pci, u8 func_no,
> +					int index, int type, u64 cpu_addr,
> +					u64 pci_addr, u32 size)
>  {
>  	u32 retries, val;
> =20
> @@ -283,8 +285,8 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, i=
nt index, int type,
>  		cpu_addr =3D pci->ops->cpu_addr_fixup(pci, cpu_addr);
> =20
>  	if (pci->iatu_unroll_enabled) {
> -		dw_pcie_prog_outbound_atu_unroll(pci, index, type, cpu_addr,
> -						 pci_addr, size);
> +		dw_pcie_prog_outbound_atu_unroll(pci, func_no, index, type,
> +						 cpu_addr, pci_addr, size);
>  		return;
>  	}
> =20
> @@ -300,7 +302,8 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, i=
nt index, int type,
>  			   lower_32_bits(pci_addr));
>  	dw_pcie_writel_dbi(pci, PCIE_ATU_UPPER_TARGET,
>  			   upper_32_bits(pci_addr));
> -	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type);
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type |
> +			   PCIE_ATU_FUNC_NUM(func_no));
>  	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE);
> =20
>  	/*
> @@ -317,6 +320,21 @@ void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, =
int index, int type,
>  	dev_err(pci->dev, "Outbound iATU is not being enabled\n");
>  }
> =20
> +void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
> +			       u64 cpu_addr, u64 pci_addr, u32 size)
> +{
> +	__dw_pcie_prog_outbound_atu(pci, 0, index, type,
> +				    cpu_addr, pci_addr, size);
> +}
> +
> +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int i=
ndex,
> +				  int type, u64 cpu_addr, u64 pci_addr,
> +				  u32 size)
> +{
> +	__dw_pcie_prog_outbound_atu(pci, func_no, index, type,
> +				    cpu_addr, pci_addr, size);
> +}
> +
>  static u32 dw_pcie_readl_ib_unroll(struct dw_pcie *pci, u32 index, u32 r=
eg)
>  {
>  	u32 offset =3D PCIE_GET_ATU_INB_UNR_REG_OFFSET(index);
> @@ -332,8 +350,8 @@ static void dw_pcie_writel_ib_unroll(struct dw_pcie *=
pci, u32 index, u32 reg,
>  	dw_pcie_writel_atu(pci, offset + reg, val);
>  }
> =20
> -static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, int inde=
x,
> -					   int bar, u64 cpu_addr,
> +static int dw_pcie_prog_inbound_atu_unroll(struct dw_pcie *pci, u8 func_=
no,
> +					   int index, int bar, u64 cpu_addr,
>  					   enum dw_pcie_as_type as_type)
>  {
>  	int type;
> @@ -355,8 +373,10 @@ static int dw_pcie_prog_inbound_atu_unroll(struct dw=
_pcie *pci, int index,
>  		return -EINVAL;
>  	}
> =20
> -	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, type);
> +	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL1, type |
> +				 PCIE_ATU_FUNC_NUM(func_no));
>  	dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
> +				 PCIE_ATU_FUNC_NUM_MATCH_EN |
>  				 PCIE_ATU_ENABLE |
>  				 PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
> =20
> @@ -377,14 +397,15 @@ static int dw_pcie_prog_inbound_atu_unroll(struct d=
w_pcie *pci, int index,
>  	return -EBUSY;
>  }
> =20
> -int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
> -			     u64 cpu_addr, enum dw_pcie_as_type as_type)
> +int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> +			     int bar, u64 cpu_addr,
> +			     enum dw_pcie_as_type as_type)
>  {
>  	int type;
>  	u32 retries, val;
> =20
>  	if (pci->iatu_unroll_enabled)
> -		return dw_pcie_prog_inbound_atu_unroll(pci, index, bar,
> +		return dw_pcie_prog_inbound_atu_unroll(pci, func_no, index, bar,
>  						       cpu_addr, as_type);
> =20
>  	dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT, PCIE_ATU_REGION_INBOUND |
> @@ -403,9 +424,11 @@ int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, in=
t index, int bar,
>  		return -EINVAL;
>  	}
> =20
> -	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type);
> -	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE
> -			   | PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR1, type |
> +			   PCIE_ATU_FUNC_NUM(func_no));
> +	dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, PCIE_ATU_ENABLE |
> +			   PCIE_ATU_FUNC_NUM_MATCH_EN |
> +			   PCIE_ATU_BAR_MODE_ENABLE | (bar << 8));
> =20
>  	/*
>  	 * Make sure ATU enable takes effect before any subsequent config
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/c=
ontroller/dwc/pcie-designware.h
> index 5a18e94..6aca0bb 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -71,9 +71,11 @@
>  #define PCIE_ATU_TYPE_IO		0x2
>  #define PCIE_ATU_TYPE_CFG0		0x4
>  #define PCIE_ATU_TYPE_CFG1		0x5
> +#define PCIE_ATU_FUNC_NUM(pf)           ((pf) << 20)
>  #define PCIE_ATU_CR2			0x908
>  #define PCIE_ATU_ENABLE			BIT(31)
>  #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
> +#define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
>  #define PCIE_ATU_LOWER_BASE		0x90C
>  #define PCIE_ATU_UPPER_BASE		0x910
>  #define PCIE_ATU_LIMIT			0x914
> @@ -206,6 +208,14 @@ struct dw_pcie_ep_ops {
>  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
>  			     enum pci_epc_irq_type type, u16 interrupt_num);
>  	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> +	/*
> +	 * Provide a method to implement the different func config space
> +	 * access for different platform, if different func have different
> +	 * offset, return the offset of func. if use write a register way
> +	 * return a 0, and implement code in callback function of platform
> +	 * driver.
> +	 */
> +	unsigned int (*func_conf_select)(struct dw_pcie_ep *ep, u8 func_no);
>  };
> =20
>  struct dw_pcie_ep {
> @@ -277,8 +287,12 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci);
>  void dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index,
>  			       int type, u64 cpu_addr, u64 pci_addr,
>  			       u32 size);
> -int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int bar,
> -			     u64 cpu_addr, enum dw_pcie_as_type as_type);
> +void dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int i=
ndex,
> +				  int type, u64 cpu_addr, u64 pci_addr,
> +				  u32 size);
> +int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
> +			     int bar, u64 cpu_addr,
> +			     enum dw_pcie_as_type as_type);
>  void dw_pcie_disable_atu(struct dw_pcie *pci, int index,
>  			 enum dw_pcie_region_type type);
>  void dw_pcie_setup(struct dw_pcie *pci);
> --=20
> 2.9.5


Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

From: "M.h. Lian" <minghuan.lian@nxp.com>
Subject: RE: [PATCHv2 01/25] PCI: mobiveil: uniform the register accessors
Date: Tue, 20 Nov 2018 10:17:00 +0000
Message-ID: <HE1PR0401MB223598EE9DB8F00248464BEFE8D90@HE1PR0401MB2235.eurprd04.prod.outlook.com>
References: <20181120092615.11680-1-Zhiqiang.Hou@nxp.com>
 <20181120092615.11680-2-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120092615.11680-2-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>

> -----Original Message-----
> From: Z.q. Hou
> Sent: Tuesday, November 20, 2018 5:26 PM
> To: linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> bhelgaas@google.com; robh+dt@kernel.org; mark.rutland@arm.com;
> l.subrahmanya@mobiveil.co.in; shawnguo@kernel.org; Leo Li
> <leoyang.li@nxp.com>; lorenzo.pieralisi@arm.com;
> catalin.marinas@arm.com; will.deacon@arm.com
> Cc: Mingkai Hu <mingkai.hu@nxp.com>; M.h. Lian
> <minghuan.lian@nxp.com>; Xiaowei Bao <xiaowei.bao@nxp.com>; Z.q. Hou
> <zhiqiang.hou@nxp.com>
> Subject: [PATCHv2 01/25] PCI: mobiveil: uniform the register accessors
>=20
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>=20
> It's confused that R/W some registers by csr_readl()/csr_writel(), while
> others by read_paged_register()/write_paged_register().
> Actually the low 3KB of 4KB PCIe configure space can be accessed directly=
 and
> high 1KB is paging area. So this patch uniformed the register accessors t=
o
> csr_readl() and csr_writel() by comparing the register offset with page a=
ccess
> boundary 3KB in the accessor internal.
>=20
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V2:
>  - no change
>=20
>  drivers/pci/controller/pcie-mobiveil.c | 179 +++++++++++++++++--------
>  1 file changed, 124 insertions(+), 55 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-mobiveil.c
> b/drivers/pci/controller/pcie-mobiveil.c
> index 77052a0712d0..d55c7e780c6e 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -47,7 +47,6 @@
>  #define  PAGE_SEL_SHIFT	13
>  #define  PAGE_SEL_MASK		0x3f
>  #define  PAGE_LO_MASK		0x3ff
> -#define  PAGE_SEL_EN		0xc00
>  #define  PAGE_SEL_OFFSET_SHIFT	10
>=20
>  #define PAB_AXI_PIO_CTRL	0x0840
> @@ -117,6 +116,12 @@
>  #define LINK_WAIT_MIN	90000
>  #define LINK_WAIT_MAX	100000
>=20
> +#define PAGED_ADDR_BNDRY			0xc00
> +#define OFFSET_TO_PAGE_ADDR(off)		\
> +	((off & PAGE_LO_MASK) | PAGED_ADDR_BNDRY)
> +#define OFFSET_TO_PAGE_IDX(off)			\
> +	((off >> PAGE_SEL_OFFSET_SHIFT) & PAGE_SEL_MASK)
> +
>  struct mobiveil_msi {			/* MSI information */
>  	struct mutex lock;		/* protect bitmap variable */
>  	struct irq_domain *msi_domain;
> @@ -145,15 +150,119 @@ struct mobiveil_pcie {
>  	struct mobiveil_msi msi;
>  };
>=20
> -static inline void csr_writel(struct mobiveil_pcie *pcie, const u32 valu=
e,
> -		const u32 reg)
> +/*
> + * mobiveil_pcie_sel_page - routine to access paged register
> + *
> + * Registers whose address greater than PAGED_ADDR_BNDRY (0xc00) are
> +paged,
> + * for this scheme to work extracted higher 6 bits of the offset will
> +be
> + * written to pg_sel field of PAB_CTRL register and rest of the lower
> +10
> + * bits enabled with PAGED_ADDR_BNDRY are used as offset of the register=
.
> + */
> +static void mobiveil_pcie_sel_page(struct mobiveil_pcie *pcie, u8
> +pg_idx)
>  {
> -	writel_relaxed(value, pcie->csr_axi_slave_base + reg);
> +	u32 val;
> +
> +	val =3D readl(pcie->csr_axi_slave_base + PAB_CTRL);
> +	val &=3D ~(PAGE_SEL_MASK << PAGE_SEL_SHIFT);
> +	val |=3D (pg_idx & PAGE_SEL_MASK) << PAGE_SEL_SHIFT;
> +
> +	writel(val, pcie->csr_axi_slave_base + PAB_CTRL);
>  }
>=20
> -static inline u32 csr_readl(struct mobiveil_pcie *pcie, const u32 reg)
> +static void *mobiveil_pcie_comp_addr(struct mobiveil_pcie *pcie, u32
> +off)
>  {
> -	return readl_relaxed(pcie->csr_axi_slave_base + reg);
> +	if (off < PAGED_ADDR_BNDRY) {
> +		/* For directly accessed registers, clear the pg_sel field */
> +		mobiveil_pcie_sel_page(pcie, 0);
> +		return pcie->csr_axi_slave_base + off;
> +	}
> +
> +	mobiveil_pcie_sel_page(pcie, OFFSET_TO_PAGE_IDX(off));
> +	return pcie->csr_axi_slave_base + OFFSET_TO_PAGE_ADDR(off); }
> +
> +static int mobiveil_pcie_read(void __iomem *addr, int size, u32 *val) {
> +	if ((uintptr_t)addr & (size - 1)) {
> +		*val =3D 0;
> +		return PCIBIOS_BAD_REGISTER_NUMBER;
> +	}
> +
> +	switch (size) {
> +	case 4:
> +		*val =3D readl(addr);
> +		break;
> +	case 2:
> +		*val =3D readw(addr);
> +		break;
> +	case 1:
> +		*val =3D readb(addr);
> +		break;
> +	default:
> +		*val =3D 0;
> +		return PCIBIOS_BAD_REGISTER_NUMBER;
> +	}
> +
> +	return PCIBIOS_SUCCESSFUL;
> +}
> +
> +static int mobiveil_pcie_write(void __iomem *addr, int size, u32 val) {
> +	if ((uintptr_t)addr & (size - 1))
> +		return PCIBIOS_BAD_REGISTER_NUMBER;
> +
> +	switch (size) {
> +	case 4:
> +		writel(val, addr);
> +		break;
> +	case 2:
> +		writew(val, addr);
> +		break;
> +	case 1:
> +		writeb(val, addr);
> +		break;
> +	default:
> +		return PCIBIOS_BAD_REGISTER_NUMBER;
> +	}
> +
> +	return PCIBIOS_SUCCESSFUL;
> +}
> +
> +static u32 csr_read(struct mobiveil_pcie *pcie, u32 off, size_t size) {
> +	void *addr;
> +	u32 val;
> +	int ret;
> +
> +	addr =3D mobiveil_pcie_comp_addr(pcie, off);
> +
> +	ret =3D mobiveil_pcie_read(addr, size, &val);
> +	if (ret)
> +		dev_err(&pcie->pdev->dev, "read CSR address failed\n");
> +
> +	return val;
> +}
> +
> +static void csr_write(struct mobiveil_pcie *pcie, u32 val, u32 off,
> +size_t size) {
> +	void *addr;
> +	int ret;
> +
> +	addr =3D mobiveil_pcie_comp_addr(pcie, off);
> +
> +	ret =3D mobiveil_pcie_write(addr, size, val);
> +	if (ret)
> +		dev_err(&pcie->pdev->dev, "write CSR address failed\n"); }
> +
> +static u32 csr_readl(struct mobiveil_pcie *pcie, u32 off) {
> +	return csr_read(pcie, off, 0x4);
> +}
> +
> +static void csr_writel(struct mobiveil_pcie *pcie, u32 val, u32 off) {
> +	csr_write(pcie, val, off, 0x4);
>  }
>=20
>  static bool mobiveil_pcie_link_up(struct mobiveil_pcie *pcie) @@ -342,45
> +451,6 @@ static int mobiveil_pcie_parse_dt(struct mobiveil_pcie *pcie)
>  	return 0;
>  }
>=20
> -/*
> - * select_paged_register - routine to access paged register of root comp=
lex
> - *
> - * registers of RC are paged, for this scheme to work
> - * extracted higher 6 bits of the offset will be written to pg_sel
> - * field of PAB_CTRL register and rest of the lower 10 bits enabled with
> - * PAGE_SEL_EN are used as offset of the register.
> - */
> -static void select_paged_register(struct mobiveil_pcie *pcie, u32 offset=
) -{
> -	int pab_ctrl_dw, pg_sel;
> -
> -	/* clear pg_sel field */
> -	pab_ctrl_dw =3D csr_readl(pcie, PAB_CTRL);
> -	pab_ctrl_dw =3D (pab_ctrl_dw & ~(PAGE_SEL_MASK <<
> PAGE_SEL_SHIFT));
> -
> -	/* set pg_sel field */
> -	pg_sel =3D (offset >> PAGE_SEL_OFFSET_SHIFT) & PAGE_SEL_MASK;
> -	pab_ctrl_dw |=3D ((pg_sel << PAGE_SEL_SHIFT));
> -	csr_writel(pcie, pab_ctrl_dw, PAB_CTRL);
> -}
> -
> -static void write_paged_register(struct mobiveil_pcie *pcie,
> -		u32 val, u32 offset)
> -{
> -	u32 off =3D (offset & PAGE_LO_MASK) | PAGE_SEL_EN;
> -
> -	select_paged_register(pcie, offset);
> -	csr_writel(pcie, val, off);
> -}
> -
> -static u32 read_paged_register(struct mobiveil_pcie *pcie, u32 offset) -=
{
> -	u32 off =3D (offset & PAGE_LO_MASK) | PAGE_SEL_EN;
> -
> -	select_paged_register(pcie, offset);
> -	return csr_readl(pcie, off);
> -}
> -
>  static void program_ib_windows(struct mobiveil_pcie *pcie, int win_num,
>  		int pci_addr, u32 type, u64 size)
>  {
> @@ -397,19 +467,19 @@ static void program_ib_windows(struct
> mobiveil_pcie *pcie, int win_num,
>  	pio_ctrl_val =3D csr_readl(pcie, PAB_PEX_PIO_CTRL);
>  	csr_writel(pcie,
>  		pio_ctrl_val | (1 << PIO_ENABLE_SHIFT), PAB_PEX_PIO_CTRL);
> -	amap_ctrl_dw =3D read_paged_register(pcie,
> PAB_PEX_AMAP_CTRL(win_num));
> +	amap_ctrl_dw =3D csr_readl(pcie, PAB_PEX_AMAP_CTRL(win_num));
>  	amap_ctrl_dw =3D (amap_ctrl_dw | (type << AMAP_CTRL_TYPE_SHIFT));
>  	amap_ctrl_dw =3D (amap_ctrl_dw | (1 << AMAP_CTRL_EN_SHIFT));
>=20
> -	write_paged_register(pcie, amap_ctrl_dw | lower_32_bits(size64),
> -				PAB_PEX_AMAP_CTRL(win_num));
> +	csr_writel(pcie, amap_ctrl_dw | lower_32_bits(size64),
> +		   PAB_PEX_AMAP_CTRL(win_num));
>=20
> -	write_paged_register(pcie, upper_32_bits(size64),
> -				PAB_EXT_PEX_AMAP_SIZEN(win_num));
> +	csr_writel(pcie, upper_32_bits(size64),
> +		   PAB_EXT_PEX_AMAP_SIZEN(win_num));
>=20
> -	write_paged_register(pcie, pci_addr,
> PAB_PEX_AMAP_AXI_WIN(win_num));
> -	write_paged_register(pcie, pci_addr,
> PAB_PEX_AMAP_PEX_WIN_L(win_num));
> -	write_paged_register(pcie, 0,
> PAB_PEX_AMAP_PEX_WIN_H(win_num));
> +	csr_writel(pcie, pci_addr, PAB_PEX_AMAP_AXI_WIN(win_num));
> +	csr_writel(pcie, pci_addr, PAB_PEX_AMAP_PEX_WIN_L(win_num));
> +	csr_writel(pcie, 0, PAB_PEX_AMAP_PEX_WIN_H(win_num));
>  }
>=20
>  /*
> @@ -437,8 +507,7 @@ static void program_ob_windows(struct
> mobiveil_pcie *pcie, int win_num,
>  	csr_writel(pcie, 1 << WIN_ENABLE_SHIFT | type << WIN_TYPE_SHIFT
> |
>  			lower_32_bits(size64),
> PAB_AXI_AMAP_CTRL(win_num));
>=20
> -	write_paged_register(pcie, upper_32_bits(size64),
> -				PAB_EXT_AXI_AMAP_SIZE(win_num));
> +	csr_writel(pcie, upper_32_bits(size64),
> +PAB_EXT_AXI_AMAP_SIZE(win_num));
>=20
>  	/*
>  	 * program AXI window base with appropriate value in
> --
> 2.17.1

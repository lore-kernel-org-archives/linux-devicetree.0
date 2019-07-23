From: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Subject: RE: [PATCH v3 6/8] PCI: al: Add support for DW based driver type
Date: Tue, 23 Jul 2019 09:40:18 +0000
Message-ID: <DM6PR12MB401059F49388C33E9335E55BDAC70@DM6PR12MB4010.namprd12.prod.outlook.com>
References: <20190723092529.11310-1-jonnyc@amazon.com>
 <20190723092711.11786-2-jonnyc@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190723092711.11786-2-jonnyc@amazon.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Chocron <jonnyc@amazon.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <Gustavo.Pimentel@synopsys.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "alisaidi@amazon.com" <alisaidi@amazon.com>, "ronenk@amazon.com" <ronenk@amazon.com>, "barakw@amazon.com" <barakw@amazon.com>, "talel@amazon.com" <talel@amazon.com>, "hanochu@amazon.com" <hanochu@amazon.com>, "hhhawa@amazon.com" <hhhawa@amazon.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2019 at 10:27:9, Jonathan Chocron <jonnyc@amazon.com>=20
wrote:

> This driver is DT based and utilizes the DesignWare APIs.
> It allows using a smaller ECAM range for a larger bus range -
> usually an entire bus uses 1MB of address space, but the driver
> can use it for a larger number of buses.
>=20
> All link initializations are handled by the boot FW.
>=20
> Signed-off-by: Jonathan Chocron <jonnyc@amazon.com>
> ---
>  drivers/pci/controller/dwc/Kconfig   |  12 +
>  drivers/pci/controller/dwc/pcie-al.c | 367 +++++++++++++++++++++++++++
>  2 files changed, 379 insertions(+)
>=20
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/=
dwc/Kconfig
> index 6ea778ae4877..3c6094cbcc3b 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -230,4 +230,16 @@ config PCIE_UNIPHIER
>  	  Say Y here if you want PCIe controller support on UniPhier SoCs.
>  	  This driver supports LD20 and PXs3 SoCs.
> =20
> +config PCIE_AL
> +	bool "Amazon Annapurna Labs PCIe controller"
> +	depends on OF && (ARM64 || COMPILE_TEST)
> +	depends on PCI_MSI_IRQ_DOMAIN
> +	select PCIE_DW_HOST
> +	help
> +	  Say Y here to enable support of the Amazon's Annapurna Labs PCIe
> +	  controller IP on Amazon SoCs. The PCIe controller uses the DesignWare
> +	  core plus Annapurna Labs proprietary hardware wrappers. This is
> +	  required only for DT-based platforms. ACPI platforms with the
> +	  Annapurna Labs PCIe controller don't need to enable this.
> +
>  endmenu
> diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controlle=
r/dwc/pcie-al.c
> index 3ab58f0584a8..3ffdd3c97617 100644
> --- a/drivers/pci/controller/dwc/pcie-al.c
> +++ b/drivers/pci/controller/dwc/pcie-al.c
> @@ -91,3 +91,370 @@ struct pci_ecam_ops al_pcie_ops =3D {
>  };
> =20
>  #endif /* defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS) */
> +
> +#ifdef CONFIG_PCIE_AL
> +
> +#include <linux/of_pci.h>
> +#include "pcie-designware.h"
> +
> +#define AL_PCIE_REV_ID_2	2
> +#define AL_PCIE_REV_ID_3	3
> +#define AL_PCIE_REV_ID_4	4
> +
> +#define AXI_BASE_OFFSET		0x0
> +
> +#define DEVICE_ID_OFFSET	0x16c
> +
> +#define DEVICE_REV_ID			0x0
> +#define DEVICE_REV_ID_DEV_ID_MASK	GENMASK(31, 16)
> +
> +#define DEVICE_REV_ID_DEV_ID_X4		0
> +#define DEVICE_REV_ID_DEV_ID_X8		2
> +#define DEVICE_REV_ID_DEV_ID_X16	4
> +
> +#define OB_CTRL_REV1_2_OFFSET	0x0040
> +#define OB_CTRL_REV3_5_OFFSET	0x0030
> +
> +#define CFG_TARGET_BUS			0x0
> +#define CFG_TARGET_BUS_MASK_MASK	GENMASK(7, 0)
> +#define CFG_TARGET_BUS_BUSNUM_MASK	GENMASK(15, 8)
> +
> +#define CFG_CONTROL			0x4
> +#define CFG_CONTROL_SUBBUS_MASK		GENMASK(15, 8)
> +#define CFG_CONTROL_SEC_BUS_MASK	GENMASK(23, 16)
> +
> +struct al_pcie_reg_offsets {
> +	unsigned int ob_ctrl;
> +};
> +
> +struct al_pcie_target_bus_cfg {
> +	u8 reg_val;
> +	u8 reg_mask;
> +	u8 ecam_mask;
> +};
> +
> +struct al_pcie {
> +	struct dw_pcie *pci;
> +	void __iomem *controller_base; /* base of PCIe unit (not DW core) */
> +	struct device *dev;
> +	resource_size_t ecam_size;
> +	unsigned int controller_rev_id;
> +	struct al_pcie_reg_offsets reg_offsets;
> +	struct al_pcie_target_bus_cfg target_bus_cfg;
> +};
> +
> +#define PCIE_ECAM_DEVFN(x)		(((x) & 0xff) << 12)
> +
> +#define to_al_pcie(x)		dev_get_drvdata((x)->dev)
> +
> +static inline u32 al_pcie_controller_readl(struct al_pcie *pcie, u32 off=
set)
> +{
> +	return readl(pcie->controller_base + offset);
> +}
> +
> +static inline void al_pcie_controller_writel(struct al_pcie *pcie, u32 o=
ffset,
> +					     u32 val)
> +{
> +	writel(val, pcie->controller_base + offset);
> +}
> +
> +static int al_pcie_rev_id_get(struct al_pcie *pcie, unsigned int *rev_id=
)
> +{
> +	u32 dev_rev_id_val;
> +	u32 dev_id_val;
> +
> +	dev_rev_id_val =3D al_pcie_controller_readl(pcie, AXI_BASE_OFFSET +
> +						  DEVICE_ID_OFFSET +
> +						  DEVICE_REV_ID);
> +	dev_id_val =3D FIELD_GET(DEVICE_REV_ID_DEV_ID_MASK, dev_rev_id_val);
> +
> +	switch (dev_id_val) {
> +	case DEVICE_REV_ID_DEV_ID_X4:
> +		*rev_id =3D AL_PCIE_REV_ID_2;
> +		break;
> +	case DEVICE_REV_ID_DEV_ID_X8:
> +		*rev_id =3D AL_PCIE_REV_ID_3;
> +		break;
> +	case DEVICE_REV_ID_DEV_ID_X16:
> +		*rev_id =3D AL_PCIE_REV_ID_4;
> +		break;
> +	default:
> +		dev_err(pcie->dev, "Unsupported dev_id_val (0x%x)\n",
> +			dev_id_val);
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(pcie->dev, "dev_id_val: 0x%x\n", dev_id_val);
> +
> +	return 0;
> +}
> +
> +static int al_pcie_reg_offsets_set(struct al_pcie *pcie)
> +{
> +	switch (pcie->controller_rev_id) {
> +	case AL_PCIE_REV_ID_2:
> +		pcie->reg_offsets.ob_ctrl =3D OB_CTRL_REV1_2_OFFSET;
> +		break;
> +	case AL_PCIE_REV_ID_3:
> +	case AL_PCIE_REV_ID_4:
> +		pcie->reg_offsets.ob_ctrl =3D OB_CTRL_REV3_5_OFFSET;
> +		break;
> +	default:
> +		dev_err(pcie->dev, "Unsupported controller rev_id: 0x%x\n",
> +			pcie->controller_rev_id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static inline void al_pcie_target_bus_set(struct al_pcie *pcie,
> +					  u8 target_bus,
> +					  u8 mask_target_bus)
> +{
> +	u32 reg;
> +
> +	reg =3D FIELD_PREP(CFG_TARGET_BUS_MASK_MASK, mask_target_bus) |
> +	      FIELD_PREP(CFG_TARGET_BUS_BUSNUM_MASK, target_bus);
> +
> +	al_pcie_controller_writel(pcie, AXI_BASE_OFFSET +
> +				  pcie->reg_offsets.ob_ctrl + CFG_TARGET_BUS,
> +				  reg);
> +}
> +
> +static void __iomem *al_pcie_conf_addr_map(struct al_pcie *pcie,
> +					   unsigned int busnr,
> +					   unsigned int devfn)
> +{
> +	struct al_pcie_target_bus_cfg *target_bus_cfg =3D &pcie->target_bus_cfg=
;
> +	unsigned int busnr_ecam =3D busnr & target_bus_cfg->ecam_mask;
> +	unsigned int busnr_reg =3D busnr & target_bus_cfg->reg_mask;
> +	struct pcie_port *pp =3D &pcie->pci->pp;
> +	void __iomem *pci_base_addr;
> +
> +	pci_base_addr =3D (void __iomem *)((uintptr_t)pp->va_cfg0_base +
> +					 (busnr_ecam << 20) +
> +					 PCIE_ECAM_DEVFN(devfn));
> +
> +	if (busnr_reg !=3D target_bus_cfg->reg_val) {
> +		dev_dbg(pcie->pci->dev, "Changing target bus busnum val from 0x%x to 0=
x%x\n",
> +			target_bus_cfg->reg_val, busnr_reg);
> +		target_bus_cfg->reg_val =3D busnr_reg;
> +		al_pcie_target_bus_set(pcie,
> +				       target_bus_cfg->reg_val,
> +				       target_bus_cfg->reg_mask);
> +	}
> +
> +	return pci_base_addr;
> +}
> +
> +static int al_pcie_rd_other_conf(struct pcie_port *pp, struct pci_bus *b=
us,
> +				 unsigned int devfn, int where, int size,
> +				 u32 *val)
> +{
> +	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
> +	struct al_pcie *pcie =3D to_al_pcie(pci);
> +	unsigned int busnr =3D bus->number;
> +	void __iomem *pci_addr;
> +	int rc;
> +
> +	pci_addr =3D al_pcie_conf_addr_map(pcie, busnr, devfn);
> +
> +	rc =3D dw_pcie_read(pci_addr + where, size, val);
> +
> +	dev_dbg(pci->dev, "%d-byte config read from %04x:%02x:%02x.%d offset 0x=
%x (pci_addr: 0x%px) - val:0x%x\n",
> +		size, pci_domain_nr(bus), bus->number,
> +		PCI_SLOT(devfn), PCI_FUNC(devfn), where,
> +		(pci_addr + where), *val);
> +
> +	return rc;
> +}
> +
> +static int al_pcie_wr_other_conf(struct pcie_port *pp, struct pci_bus *b=
us,
> +				 unsigned int devfn, int where, int size,
> +				 u32 val)
> +{
> +	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
> +	struct al_pcie *pcie =3D to_al_pcie(pci);
> +	unsigned int busnr =3D bus->number;
> +	void __iomem *pci_addr;
> +	int rc;
> +
> +	pci_addr =3D al_pcie_conf_addr_map(pcie, busnr, devfn);
> +
> +	rc =3D dw_pcie_write(pci_addr + where, size, val);
> +
> +	dev_err(pci->dev, "%d-byte config write to %04x:%02x:%02x.%d offset 0x%=
x (pci_addr: 0x%px) - val:0x%x\n",
> +		size, pci_domain_nr(bus), bus->number,
> +		PCI_SLOT(devfn), PCI_FUNC(devfn), where,
> +		(pci_addr + where), val);
> +
> +	return rc;
> +}
> +
> +static void al_pcie_config_prepare(struct al_pcie *pcie)
> +{
> +	struct al_pcie_target_bus_cfg *target_bus_cfg;
> +	struct pcie_port *pp =3D &pcie->pci->pp;
> +	unsigned int ecam_bus_mask;
> +	u32 cfg_control_offset;
> +	u8 subordinate_bus;
> +	u8 secondary_bus;
> +	u32 cfg_control;
> +	u32 reg;
> +
> +	target_bus_cfg =3D &pcie->target_bus_cfg;
> +
> +	ecam_bus_mask =3D (pcie->ecam_size >> 20) - 1;
> +	if (ecam_bus_mask > 255) {
> +		dev_warn(pcie->dev, "ECAM window size is larger than 256MB. Cutting of=
f at 256\n");
> +		ecam_bus_mask =3D 255;
> +	}
> +
> +	/* This portion is taken from the transaction address */
> +	target_bus_cfg->ecam_mask =3D ecam_bus_mask;
> +	/* This portion is taken from the cfg_target_bus reg */
> +	target_bus_cfg->reg_mask =3D ~target_bus_cfg->ecam_mask;
> +	target_bus_cfg->reg_val =3D pp->busn->start & target_bus_cfg->reg_mask;
> +
> +	al_pcie_target_bus_set(pcie, target_bus_cfg->reg_val,
> +			       target_bus_cfg->reg_mask);
> +
> +	secondary_bus =3D pp->busn->start + 1;
> +	subordinate_bus =3D pp->busn->end;
> +
> +	/* Set the valid values of secondary and subordinate buses */
> +	cfg_control_offset =3D AXI_BASE_OFFSET + pcie->reg_offsets.ob_ctrl +
> +			     CFG_CONTROL;
> +
> +	cfg_control =3D al_pcie_controller_readl(pcie, cfg_control_offset);
> +
> +	reg =3D cfg_control &
> +	      ~(CFG_CONTROL_SEC_BUS_MASK | CFG_CONTROL_SUBBUS_MASK);
> +
> +	reg |=3D FIELD_PREP(CFG_CONTROL_SUBBUS_MASK, subordinate_bus) |
> +	       FIELD_PREP(CFG_CONTROL_SEC_BUS_MASK, secondary_bus);
> +
> +	al_pcie_controller_writel(pcie, cfg_control_offset, reg);
> +}
> +
> +static int al_pcie_host_init(struct pcie_port *pp)
> +{
> +	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
> +	struct al_pcie *pcie =3D to_al_pcie(pci);
> +	int link_up;
> +	int rc;
> +
> +	rc =3D al_pcie_rev_id_get(pcie, &pcie->controller_rev_id);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D al_pcie_reg_offsets_set(pcie);
> +	if (rc)
> +		return rc;
> +
> +	al_pcie_config_prepare(pcie);
> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_host_ops al_pcie_host_ops =3D {
> +	.rd_other_conf =3D al_pcie_rd_other_conf,
> +	.wr_other_conf =3D al_pcie_wr_other_conf,
> +	.host_init =3D al_pcie_host_init,
> +};
> +
> +static int al_add_pcie_port(struct pcie_port *pp,
> +			    struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	pp->ops =3D &al_pcie_host_ops;
> +
> +	ret =3D dw_pcie_host_init(pp);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize host\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dw_pcie_ops dw_pcie_ops =3D {
> +};
> +
> +static int al_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct resource *controller_res;
> +	struct resource *ecam_res;
> +	struct resource *dbi_res;
> +	struct al_pcie *al_pcie;
> +	struct dw_pcie *pci;
> +	int ret;
> +
> +	al_pcie =3D devm_kzalloc(dev, sizeof(*al_pcie), GFP_KERNEL);
> +	if (!al_pcie)
> +		return -ENOMEM;
> +
> +	pci =3D devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
> +	if (!pci)
> +		return -ENOMEM;
> +
> +	pci->dev =3D dev;
> +	pci->ops =3D &dw_pcie_ops;
> +
> +	al_pcie->pci =3D pci;
> +	al_pcie->dev =3D dev;
> +
> +	dbi_res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "dbi");
> +	pci->dbi_base =3D devm_pci_remap_cfg_resource(dev, dbi_res);
> +	if (IS_ERR(pci->dbi_base)) {
> +		dev_err(dev, "couldn't remap dbi base %pR\n", dbi_res);
> +		return PTR_ERR(pci->dbi_base);
> +	}
> +
> +	ecam_res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "config=
");
> +	if (!ecam_res) {
> +		dev_err(dev, "couldn't find 'config' reg in DT\n");
> +		return -ENOENT;
> +	}
> +	al_pcie->ecam_size =3D resource_size(ecam_res);
> +
> +	controller_res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +						      "controller");
> +	al_pcie->controller_base =3D devm_ioremap_resource(dev, controller_res)=
;
> +	if (IS_ERR(al_pcie->controller_base)) {
> +		dev_err(dev, "couldn't remap controller base %pR\n",
> +			controller_res);
> +		return PTR_ERR(al_pcie->controller_base);
> +	}
> +
> +	dev_dbg(dev, "From DT: dbi_base: %pR, controller_base: %pR\n",
> +		dbi_res, controller_res);
> +
> +	platform_set_drvdata(pdev, al_pcie);
> +
> +	ret =3D al_add_pcie_port(&pci->pp, pdev);
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id al_pcie_of_match[] =3D {
> +	{ .compatible =3D "amazon,al-pcie",
> +	},
> +	{},
> +};
> +
> +static struct platform_driver al_pcie_driver =3D {
> +	.driver =3D {
> +		.name	=3D "al-pcie",
> +		.of_match_table =3D al_pcie_of_match,
> +		.suppress_bind_attrs =3D true,
> +	},
> +	.probe =3D al_pcie_probe,
> +};
> +builtin_platform_driver(al_pcie_driver);
> +
> +#endif /* CONFIG_PCIE_AL*/
> --=20
> 2.17.1


Reviewed-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>

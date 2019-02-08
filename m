From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Subject: Re: [PATCHv3 24/27] PCI: mobiveil: ls_pcie_g4: add Workaround for A-011577
Date: Fri, 8 Feb 2019 18:22:24 +0530
Message-ID: <CAFZiPx0Qv6LN6mi4Z9fta2X=Rh85uk7bYGPHmncy=XYgBQOnAw@mail.gmail.com>
References: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com> <20190129080926.36773-25-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129080926.36773-25-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

ZQ,

On Tue, Jan 29, 2019 at 1:41 PM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:
>
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
> PCIe configuration access to non-existent function triggered
> SERROR interrupt exception.
>
> Workaround:
> Disable error reporting on AXI bus during the Vendor ID read
> transactions in enumeration.
>
> This ERRATA is only for LX2160A Rev1.0, and it will be fixed
> in Rev2.0.
>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
> V3:
>  - Integrated without change from http://patchwork.ozlabs.org/patch/1006790/
>
>  .../controller/mobiveil/pci-layerscape-gen4.c | 37 +++++++++++++++++++
>  .../controller/mobiveil/pcie-mobiveil-host.c  | 17 ++++++++-
>  .../pci/controller/mobiveil/pcie-mobiveil.h   |  3 ++
>  3 files changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/mobiveil/pci-layerscape-gen4.c b/drivers/pci/controller/mobiveil/pci-layerscape-gen4.c
> index 174cbcac4059..d2c5dbbd5e3c 100644
> --- a/drivers/pci/controller/mobiveil/pci-layerscape-gen4.c
> +++ b/drivers/pci/controller/mobiveil/pci-layerscape-gen4.c
> @@ -22,8 +22,13 @@
>
>  #include "pcie-mobiveil.h"
>
> +#define REV_1_0                                (0x10)
> +
>  /* LUT and PF control registers */
>  #define PCIE_LUT_OFF                   (0x80000)
> +#define PCIE_LUT_GCR                   (0x28)
> +#define PCIE_LUT_GCR_RRE               (0)
> +
>  #define PCIE_PF_OFF                    (0xc0000)
>  #define PCIE_PF_INT_STAT               (0x18)
>  #define PF_INT_STAT_PABRST             (31)
> @@ -41,6 +46,7 @@ struct ls_pcie_g4 {
>         struct mobiveil_pcie *pci;
>         struct delayed_work dwork;
>         int irq;
> +       u8 rev;
>  };
>
>  static inline u32 ls_pcie_g4_lut_readl(struct ls_pcie_g4 *pcie, u32 off)
> @@ -76,6 +82,15 @@ static bool ls_pcie_g4_is_bridge(struct ls_pcie_g4 *pcie)
>         return header_type == PCI_HEADER_TYPE_BRIDGE;
>  }
>
> +static int ls_pcie_g4_host_init(struct mobiveil_pcie *pci)
> +{
> +       struct ls_pcie_g4 *pcie = to_ls_pcie_g4(pci);
> +
> +       pcie->rev = csr_readb(pci, PCI_REVISION_ID);
> +
> +       return 0;
> +}
> +
>  static int ls_pcie_g4_link_up(struct mobiveil_pcie *pci)
>  {
>         struct ls_pcie_g4 *pcie = to_ls_pcie_g4(pci);
> @@ -188,12 +203,34 @@ static void ls_pcie_g4_reset(struct work_struct *work)
>         ls_pcie_g4_reinit_hw(pcie);
>  }
>
> +static int ls_pcie_g4_read_other_conf(struct pci_bus *bus, unsigned int devfn,
> +                                  int where, int size, u32 *val)
> +{
> +       struct mobiveil_pcie *pci = bus->sysdata;
> +       struct ls_pcie_g4 *pcie = to_ls_pcie_g4(pci);
> +       int ret;
> +
> +       if (pcie->rev == REV_1_0 && where == PCI_VENDOR_ID)
> +               ls_pcie_g4_lut_writel(pcie, PCIE_LUT_GCR,
> +                                     0 << PCIE_LUT_GCR_RRE);
> +
> +       ret = pci_generic_config_read(bus, devfn, where, size, val);
> +
> +       if (pcie->rev == REV_1_0 && where == PCI_VENDOR_ID)
> +               ls_pcie_g4_lut_writel(pcie, PCIE_LUT_GCR,
> +                                     1 << PCIE_LUT_GCR_RRE);
> +
> +       return ret;
> +}
> +
>  static struct mobiveil_rp_ops ls_pcie_g4_rp_ops = {
>         .interrupt_init = ls_pcie_g4_interrupt_init,
> +       .read_other_conf = ls_pcie_g4_read_other_conf,
>  };
>
>  static const struct mobiveil_pab_ops ls_pcie_g4_pab_ops = {
>         .link_up = ls_pcie_g4_link_up,
> +       .host_init = ls_pcie_g4_host_init,
>  };
>
>  static int __init ls_pcie_g4_probe(struct platform_device *pdev)
> diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> index e8d0c4989013..5f51bc2dd6d7 100644
> --- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> +++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
> @@ -79,9 +79,20 @@ static void __iomem *mobiveil_pcie_map_bus(struct pci_bus *bus,
>         return pcie->rp.config_axi_slave_base + where;
>  }
>
> +static int mobiveil_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
> +                                    int where, int size, u32 *val)
> +{
> +       struct mobiveil_pcie *pcie = bus->sysdata;
> +       struct root_port *rp = &pcie->rp;
> +
> +       if (bus->number > rp->root_bus_nr && rp->ops->read_other_conf)
> +               return rp->ops->read_other_conf(bus, devfn, where, size, val);
> +
> +       return pci_generic_config_read(bus, devfn, where, size, val);
> +}
>  static struct pci_ops mobiveil_pcie_ops = {
>         .map_bus = mobiveil_pcie_map_bus,
> -       .read = pci_generic_config_read,
> +       .read = mobiveil_pcie_config_read,
>         .write = pci_generic_config_write,
>  };
>
> @@ -309,6 +320,10 @@ int mobiveil_host_init(struct mobiveil_pcie *pcie, bool reinit)
>         value |= (PCI_CLASS_BRIDGE_PCI << 16);
>         csr_writel(pcie, value, PAB_INTP_AXI_PIO_CLASS);
>
> +       /* Platform specific host init */
> +       if (pcie->ops->host_init)
> +               return pcie->ops->host_init(pcie);
> +
>         return 0;
>  }
>
> diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> index 0ccd6cee5f8f..ab43de5e4b2b 100644
> --- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> +++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
> @@ -145,6 +145,8 @@ struct mobiveil_msi {                       /* MSI information */
>
>  struct mobiveil_rp_ops {
>         int (*interrupt_init)(struct mobiveil_pcie *pcie);
> +       int (*read_other_conf)(struct pci_bus *bus, unsigned int devfn,
> +                              int where, int size, u32 *val);
>  };
>
>  struct root_port {
> @@ -160,6 +162,7 @@ struct root_port {
>
>  struct mobiveil_pab_ops {
>         int (*link_up)(struct mobiveil_pcie *pcie);
> +       int (*host_init)(struct mobiveil_pcie *pcie);
>  };
>
>  struct mobiveil_pcie {
> --
> 2.17.1
>
can we have an english brief than having a internal cryptic
number:A-011577, on the patch title?

From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Subject: Re: [PATCHv3 11/27] PCI: mobiveil: only fix up the Class Code field
Date: Tue, 5 Feb 2019 11:41:46 +0530
Message-ID: <CAFZiPx0ea9Dnef_H+R0WcS-7V1WDCQTCU1dzta5+LsJjo+M_BQ@mail.gmail.com>
References: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com> <20190129080926.36773-12-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129080926.36773-12-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>

On Tue, Jan 29, 2019 at 1:39 PM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:
>
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
> Fix up the Class Code to PCI bridge, do not change the Revision ID.
> And move the fixup to mobiveil_host_init function.
>
> Fixes: 9af6bcb11e12 ("PCI: mobiveil: Add Mobiveil PCIe Host Bridge
> IP driver")
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> ---
> V3:
>  - No change
>
>  drivers/pci/controller/pcie-mobiveil.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
> index 78e575e71f4d..8eee1ab7ee24 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -653,6 +653,12 @@ static int mobiveil_host_init(struct mobiveil_pcie *pcie)
>                                    type, resource_size(win->res));
>         }
>
> +       /* fixup for PCIe class register */
> +       value = csr_readl(pcie, PAB_INTP_AXI_PIO_CLASS);
> +       value &= 0xff;
> +       value |= (PCI_CLASS_BRIDGE_PCI << 16);
> +       csr_writel(pcie, value, PAB_INTP_AXI_PIO_CLASS);
> +
>         /* setup MSI hardware registers */
>         mobiveil_pcie_enable_msi(pcie);
>
> @@ -896,9 +902,6 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>                 goto error;
>         }
>
> -       /* fixup for PCIe class register */
> -       csr_writel(pcie, 0x060402ab, PAB_INTP_AXI_PIO_CLASS);
> -
>         /* initialize the IRQ domains */
>         ret = mobiveil_pcie_init_irq_domain(pcie);
>         if (ret) {
> --
> 2.17.1
>

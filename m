From: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
Subject: Re: [PATCHv3 12/27] PCI: mobiveil: move out the link up waiting from mobiveil_host_init
Date: Tue, 5 Feb 2019 11:42:13 +0530
Message-ID: <CAFZiPx3wPsO3CkLZD9SxUTkqVZR1fW4qqAtsNxcYHMNVsD82gw@mail.gmail.com>
References: <20190129080926.36773-1-Zhiqiang.Hou@nxp.com> <20190129080926.36773-13-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129080926.36773-13-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>

On Tue, Jan 29, 2019 at 1:39 PM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:
>
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>
> Host initial sequence does not depend on PCIe link up, so move it
> to the place just before the enumeration.
>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> ---
> V3:
>  - No change
>
>  drivers/pci/controller/pcie-mobiveil.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
> index 8eee1ab7ee24..c2848c22b466 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -582,15 +582,8 @@ static void mobiveil_pcie_enable_msi(struct mobiveil_pcie *pcie)
>  static int mobiveil_host_init(struct mobiveil_pcie *pcie)
>  {
>         u32 value, pab_ctrl, type;
> -       int err;
>         struct resource_entry *win;
>
> -       err = mobiveil_bringup_link(pcie);
> -       if (err) {
> -               dev_info(&pcie->pdev->dev, "link bring-up failed\n");
> -               return err;
> -       }
> -
>         /*
>          * program Bus Master Enable Bit in Command Register in PAB Config
>          * Space
> @@ -662,7 +655,7 @@ static int mobiveil_host_init(struct mobiveil_pcie *pcie)
>         /* setup MSI hardware registers */
>         mobiveil_pcie_enable_msi(pcie);
>
> -       return err;
> +       return 0;
>  }
>
>  static void mobiveil_mask_intx_irq(struct irq_data *data)
> @@ -922,6 +915,12 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>         bridge->map_irq = of_irq_parse_and_map_pci;
>         bridge->swizzle_irq = pci_common_swizzle;
>
> +       ret = mobiveil_bringup_link(pcie);
> +       if (ret) {
> +               dev_info(dev, "link bring-up failed\n");
> +               goto error;
> +       }
> +
>         /* setup the kernel resources for the newly added PCIe root bus */
>         ret = pci_scan_root_bus_bridge(bridge);
>         if (ret)
> --
> 2.17.1
>

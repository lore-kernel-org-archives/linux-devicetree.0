From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv5 1/6] PCI: mobiveil: Refactor Mobiveil PCIe Host Bridge
 IP driver
Date: Fri, 12 Apr 2019 16:39:16 +0200
Message-ID: <CAK8P3a38F=y92ECU-iB-D=OqmuY5ANAwDw2NDPOTFmhUZQTovA@mail.gmail.com>
References: <20190412095332.41370-1-Zhiqiang.Hou@nxp.com> <20190412095332.41370-2-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412095332.41370-2-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>, Mingkai
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 11:53 AM Z.q. Hou <zhiqiang.hou@nxp.com> wrote:

> +int mobiveil_pcie_host_probe(struct mobiveil_pcie *pcie)
>  {
> -       struct mobiveil_pcie *pcie;
>         struct pci_bus *bus;
>         struct pci_bus *child;
>         struct pci_host_bridge *bridge;
> -       struct device *dev = &pdev->dev;
> +       struct device *dev = &pcie->pdev->dev;
>         resource_size_t iobase;
>         int ret;
>
> -       /* allocate the PCIe port */
> -       bridge = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
> -       if (!bridge)
> -               return -ENOMEM;
> -
> -       pcie = pci_host_bridge_priv(bridge);
> -
> -       pcie->pdev = pdev;
> +       INIT_LIST_HEAD(&pcie->resources);
>
>         ret = mobiveil_pcie_parse_dt(pcie);
>         if (ret) {
> @@ -928,7 +560,10 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       INIT_LIST_HEAD(&pcie->resources);
> +       /* allocate the PCIe port */
> +       bridge = devm_pci_alloc_host_bridge(dev, 0);
> +       if (!bridge)
> +               return -ENOMEM;
>

> +static int mobiveil_pcie_probe(struct platform_device *pdev)
> +{
> +       struct mobiveil_pcie *pcie;
> +       struct device *dev = &pdev->dev;
> +
> +       pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> +       if (!pcie)
> +               return -ENOMEM;
> +
> +       pcie->pdev = pdev;
> +
> +       return mobiveil_pcie_host_probe(pcie);
> +}

I think you need to pull the allocation of the host structure out into the
main driver here, to keep both allocations together, otherwise the
release function will free the mobiveil_pcie structure before freeing
the pci_host_bridge if that is still in use.

> +
> +struct mobiveil_pcie {
> +       struct platform_device *pdev;
> +       struct list_head resources;

These two should not be needed here, as they are already part
of the pci_host_bridge structure.

     Arnd

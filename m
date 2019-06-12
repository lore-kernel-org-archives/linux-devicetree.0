From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv5 17/20] PCI: mobiveil: Complete initialization of host
 even if no PCIe link
Date: Wed, 12 Jun 2019 15:34:40 +0100
Message-ID: <20190612143440.GC15747@redmoon>
References: <20190412083635.33626-1-Zhiqiang.Hou@nxp.com>
 <20190412083635.33626-18-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190412083635.33626-18-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "l.subrahmanya@mobiveil.co.in" <l.subrahmanya@mobiveil.co.in>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 08:36:54AM +0000, Z.q. Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Sometimes there is not a PCIe Endpoint stalled in the slot,
> so do not exit when the PCIe link is not up. And degrade the
> print level of link up info.

So what's the point of probing if the link does not initialize ?

Lorenzo

> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Reviewed-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> Reviewed-by: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>
> ---
> V5:
>  - Corrected and retouched the subject and changelog.
> 
>  drivers/pci/controller/pcie-mobiveil.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
> index 1ee3ea2570c0..8dc87c7a600e 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -560,7 +560,7 @@ static int mobiveil_bringup_link(struct mobiveil_pcie *pcie)
>  		usleep_range(LINK_WAIT_MIN, LINK_WAIT_MAX);
>  	}
>  
> -	dev_err(&pcie->pdev->dev, "link never came up\n");
> +	dev_info(&pcie->pdev->dev, "link never came up\n");
>  
>  	return -ETIMEDOUT;
>  }
> @@ -926,10 +926,8 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>  	bridge->swizzle_irq = pci_common_swizzle;
>  
>  	ret = mobiveil_bringup_link(pcie);
> -	if (ret) {
> +	if (ret)
>  		dev_info(dev, "link bring-up failed\n");
> -		goto error;
> -	}
>  
>  	/* setup the kernel resources for the newly added PCIe root bus */
>  	ret = pci_scan_root_bus_bridge(bridge);
> -- 
> 2.17.1
> 

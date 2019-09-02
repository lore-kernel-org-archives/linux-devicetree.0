From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v3 08/11] PCI: layerscape: Modify the MSIX to the
 doorbell mode
Date: Mon, 2 Sep 2019 13:01:47 +0100
Message-ID: <20190902120147.GH9720@e119886-lin.cambridge.arm.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-9-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190902031716.43195-9-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.com, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, arnd@arndb.de, gregkh@linuxfoundation.org, zhiqiang.hou@nxp.com
List-Id: devicetree@vger.kernel.org

On Mon, Sep 02, 2019 at 11:17:13AM +0800, Xiaowei Bao wrote:
> dw_pcie_ep_raise_msix_irq was never called in the exisitng driver
> before, because the ls1046a platform don't support the MSIX feature
> and msix_capable was always set to false.
> Now that add the ls1088a platform with MSIX support, but the existing
> dw_pcie_ep_raise_msix_irq doesn't work, so use the doorbell method to
> support the MSIX feature.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

> ---
> v2: 
>  - No change
> v3:
>  - Modify the commit message make it clearly.
> 
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 1e07287..5f0cb99 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -79,7 +79,8 @@ static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	case PCI_EPC_IRQ_MSI:
>  		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
>  	case PCI_EPC_IRQ_MSIX:
> -		return dw_pcie_ep_raise_msix_irq(ep, func_no, interrupt_num);
> +		return dw_pcie_ep_raise_msix_irq_doorbell(ep, func_no,
> +							  interrupt_num);
>  	default:
>  		dev_err(pci->dev, "UNKNOWN IRQ type\n");
>  		return -EINVAL;
> -- 
> 2.9.5
> 

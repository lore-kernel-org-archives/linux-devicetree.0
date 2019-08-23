From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v2 05/10] PCI: layerscape: Fix some format issue of the
 code
Date: Fri, 23 Aug 2019 14:45:27 +0100
Message-ID: <20190823134527.GG14582@e119886-lin.cambridge.arm.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-5-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190822112242.16309-5-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, kishon@ti.com, lorenzo.pieralisi@arm.co, arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 22, 2019 at 07:22:37PM +0800, Xiaowei Bao wrote:
> Fix some format issue of the code in EP driver.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>

Reviewed-by: Andrew Murray <andrew.murray@arm.com>


> ---
> v2:
>  - No change.
> 
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index be61d96..4e92a95 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -62,7 +62,7 @@ static void ls_pcie_ep_init(struct dw_pcie_ep *ep)
>  }
>  
>  static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> -				  enum pci_epc_irq_type type, u16 interrupt_num)
> +				enum pci_epc_irq_type type, u16 interrupt_num)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  
> @@ -86,7 +86,7 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
>  };
>  
>  static int __init ls_add_pcie_ep(struct ls_pcie_ep *pcie,
> -					struct platform_device *pdev)
> +				 struct platform_device *pdev)
>  {
>  	struct dw_pcie *pci = pcie->pci;
>  	struct device *dev = pci->dev;
> -- 
> 2.9.5
> 

From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCHv3 1/2] PCI: layerscape: Add the bar_fixed_64bit property
 in EP driver.
Date: Mon, 12 Aug 2019 11:12:13 +0100
Message-ID: <20190812101213.GB20861@e121166-lin.cambridge.arm.com>
References: <20190628013826.4705-1-xiaowei.bao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190628013826.4705-1-xiaowei.bao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Xiaowei Bao <xiaowei.bao@nxp.com>, kishon@ti.com
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, leoyang.li@nxp.com, arnd@arndb.de, gregkh@linuxfoundation.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, kstewart@linuxfoundation.org, pombredanne@nexb.com, shawn.lin@rock-chips.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

First off:

Trim the CC list, you CC'ed maintainers (and mailing lists) for no
reasons whatsover.

Then, read this:

https://lore.kernel.org/linux-pci/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com/

and make your patches compliant please.

On Fri, Jun 28, 2019 at 09:38:25AM +0800, Xiaowei Bao wrote:
> The PCIe controller of layerscape just have 4 BARs, BAR0 and BAR1
> is 32bit, BAR3 and BAR4 is 64bit, this is determined by hardware,
> so set the bar_fixed_64bit with 0x14.
> 
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> ---
> v2:
>  - Replace value 0x14 with a macro.
> v3:
>  - No change.
> 
>  drivers/pci/controller/dwc/pci-layerscape-ep.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index be61d96..227c33b 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -44,6 +44,7 @@ static int ls_pcie_establish_link(struct dw_pcie *pci)
>  	.linkup_notifier = false,
>  	.msi_capable = true,
>  	.msix_capable = false,
> +	.bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4),

I would appreciate Kishon's ACK on this.

Lorenzo

>  };
>  
>  static const struct pci_epc_features*
> -- 
> 1.7.1
> 

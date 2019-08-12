From: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH 2/4] PCI: dwc: Return directly when num-lanes is not found
Date: Mon, 12 Aug 2019 09:34:13 +0100
Message-ID: <20190812083412.GT56241@e119886-lin.cambridge.arm.com>
References: <20190812042435.25102-1-Zhiqiang.Hou@nxp.com>
 <20190812042435.25102-3-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812042435.25102-3-Zhiqiang.Hou@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "M.h. Lian" <minghuan.lian@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 04:22:22AM +0000, Z.q. Hou wrote:
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> The num-lanes is optional, so probably it isn't added
> on some platforms. The subsequent programming is base
> on the num-lanes, hence return when it is not found.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 7d25102c304c..0a89bfd1636e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -423,8 +423,10 @@ void dw_pcie_setup(struct dw_pcie *pci)
>  
>  
>  	ret = of_property_read_u32(np, "num-lanes", &lanes);
> -	if (ret)
> -		lanes = 0;
> +	if (ret) {
> +		dev_dbg(pci->dev, "property num-lanes isn't found\n");
> +		return;
> +	}

The existing code would assign a value of 0 to lanes when num-lanes isn't
specified, however this value isn't supported by the following switch
statement - thus we'd also print an error and return.

Therefore the only and subtle effect effect of this patch is to change
a dev_err to a dev_dbg when num-lanes isn't specified and avoid a read of
PCIE_PORT_LINK_CONTROL.

Given that num-lanes is described as optional this makes perfect sense.
Though the commit message/hunk does give the apperance that this provides
a more functional change.

Anyway:

Reviewed-by: Andrew Murray <andrew.murray@arm.com>


>  
>  	/* Set the number of lanes */
>  	val = dw_pcie_readl_dbi(pci, PCIE_PORT_LINK_CONTROL);
> -- 
> 2.17.1
> 

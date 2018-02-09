From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] PCI: rockchip: Add rockchip,rk3399-pcie-host
 compatible
Date: Fri, 9 Feb 2018 17:38:57 -0600
Message-ID: <20180209233857.osoyfvst3waa54b3@rob-hp-laptop>
References: <1517971650-61555-1-git-send-email-shawn.lin@rock-chips.com>
 <1517971650-61555-5-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1517971650-61555-5-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 07, 2018 at 10:47:28AM +0800, Shawn Lin wrote:
> To avoid confusion when folks use this controller as endponint

s/endponint/endpoint/

> mode, we add rockchip,rk3399-pcie-host to clearly state that
> it's driver for host here. And rename/update the document to
> reflect this fact.
> 
> Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
> 
>  .../bindings/pci/{rockchip-pcie.txt => rockchip-pcie-host.txt}         | 3 ++-
>  drivers/pci/rockchip/pcie-rockchip-host.c                              | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/pci/{rockchip-pcie.txt => rockchip-pcie-host.txt} (98%)
> 
> diff --git a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt b/Documentation/devicetree/bindings/pci/rockchip-pcie-host.txt
> similarity index 98%
> rename from Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> rename to Documentation/devicetree/bindings/pci/rockchip-pcie-host.txt
> index af34c65..f2f3091 100644
> --- a/Documentation/devicetree/bindings/pci/rockchip-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/rockchip-pcie-host.txt
> @@ -5,7 +5,8 @@ Required properties:
>  - #size-cells: Size representation for root ports, set to <2>
>  - #interrupt-cells: specifies the number of cells needed to encode an
>  		interrupt source. The value must be 1.
> -- compatible: Should contain "rockchip,rk3399-pcie"
> +- compatible: Should contain "rockchip,rk3399-pcie" or
> +	"rockchip,rk3399-pcie-host"

I don't think this is necessary. Endpoint is generally the exception and 
having "endpoint" or "ep" in the endpoint compatible should be enough.

>  - reg: Two register ranges as listed in the reg-names property
>  - reg-names: Must include the following names
>  	- "axi-base"
> diff --git a/drivers/pci/rockchip/pcie-rockchip-host.c b/drivers/pci/rockchip/pcie-rockchip-host.c
> index f5b0492..efb740d 100644
> --- a/drivers/pci/rockchip/pcie-rockchip-host.c
> +++ b/drivers/pci/rockchip/pcie-rockchip-host.c
> @@ -1120,6 +1120,7 @@ static int rockchip_pcie_remove(struct platform_device *pdev)
>  
>  static const struct of_device_id rockchip_pcie_of_match[] = {
>  	{ .compatible = "rockchip,rk3399-pcie", },
> +	{ .compatible = "rockchip,rk3399-pcie-host", },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, rockchip_pcie_of_match);
> -- 
> 1.9.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

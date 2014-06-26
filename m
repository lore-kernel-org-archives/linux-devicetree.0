From: Mohit KUMAR DCG <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org>
Subject: RE: [PATCH 1/3] PCI: designware: Configuration space should be
 specified in 'reg'
Date: Thu, 26 Jun 2014 13:55:34 +0800
Message-ID: <2CC2A0A4A178534D93D5159BF3BCB6619C5F94EFC8@EAPEX1MAIL1.st.com>
References: <1403719007-9352-1-git-send-email-kishon@ti.com>
 <1403719007-9352-2-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403719007-9352-2-git-send-email-kishon-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Kishon,

> -----Original Message-----
> From: Kishon Vijay Abraham I [mailto:kishon-l0cyMroinI0@public.gmane.org]
> Sent: Wednesday, June 25, 2014 11:27 PM
> To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org; Mohit
> KUMAR DCG; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: kishon-l0cyMroinI0@public.gmane.org; grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; Jason Gunthorpe; Marek Vasut;
> Arnd Bergmann
> Subject: [PATCH 1/3] PCI: designware: Configuration space should be
> specified in 'reg'
> 
> The configuration address space has so far been specified in *ranges*,
> however it should be specified in *reg* making it a platform MEM resource.
> Hence used 'platform_get_resource_*' API to get configuration address
> space in the designware driver.
> 
> Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
> Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
> Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
> ---
>  .../devicetree/bindings/pci/designware-pcie.txt    |    4 ++++
>  drivers/pci/host/pcie-designware.c                 |   17 +++++++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt
> b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> index d0d15ee..ed0d9b9 100644
> --- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> @@ -2,6 +2,10 @@
> 
>  Required properties:
>  - compatible: should contain "snps,dw-pcie" to identify the core.
> +- reg: Should contain the configuration address space.
> +- reg-names: Must be "config" for the PCIe configuration space.
> +    (The old way of getting the configuration address space from "ranges"
> +    is deprecated and should be avoided.)
>  - #address-cells: set to <3>
>  - #size-cells: set to <2>
>  - device_type: set to "pci"
> diff --git a/drivers/pci/host/pcie-designware.c b/drivers/pci/host/pcie-
> designware.c
> index 1eaf4df..0b7b455 100644
> --- a/drivers/pci/host/pcie-designware.c
> +++ b/drivers/pci/host/pcie-designware.c
> @@ -20,6 +20,7 @@
>  #include <linux/of_pci.h>
>  #include <linux/pci.h>
>  #include <linux/pci_regs.h>
> +#include <linux/platform_device.h>
>  #include <linux/types.h>
> 
>  #include "pcie-designware.h"
> @@ -396,11 +397,23 @@ static const struct irq_domain_ops
> msi_domain_ops = {  int __init dw_pcie_host_init(struct pcie_port *pp)  {
>  	struct device_node *np = pp->dev->of_node;
> +	struct platform_device *pdev = to_platform_device(pp->dev);
>  	struct of_pci_range range;
>  	struct of_pci_range_parser parser;
> +	struct resource *cfg_res;
>  	u32 val;
>  	int i;
> 
> +	cfg_res = platform_get_resource_byname(pdev,
> IORESOURCE_MEM, "config");
> +	if (cfg_res) {
> +		pp->config.cfg0_size = resource_size(cfg_res)/2;
> +		pp->config.cfg1_size = resource_size(cfg_res)/2;
> +		pp->cfg0_base = cfg_res->start;
> +		pp->cfg1_base = cfg_res->start + pp->config.cfg0_size;
> +	} else {
> +		dev_err(pp->dev, "missing *config* reg space\n");

- so this message will remind other platform to comply and specify configuration space
 in *reg* property. 

> +	}
> +
>  	if (of_pci_range_parser_init(&parser, np)) {
>  		dev_err(pp->dev, "missing ranges property\n");
>  		return -EINVAL;
> @@ -433,6 +446,8 @@ int __init dw_pcie_host_init(struct pcie_port *pp)
>  			of_pci_range_to_resource(&range, np, &pp->cfg);
>  			pp->config.cfg0_size = resource_size(&pp->cfg)/2;
>  			pp->config.cfg1_size = resource_size(&pp->cfg)/2;
> +			pp->cfg0_base = pp->cfg.start;
> +			pp->cfg1_base = pp->cfg.start + pp-
> >config.cfg0_size;
>  		}
>  	}
> 
> @@ -445,8 +460,6 @@ int __init dw_pcie_host_init(struct pcie_port *pp)
>  		}
>  	}
> 
> -	pp->cfg0_base = pp->cfg.start;
> -	pp->cfg1_base = pp->cfg.start + pp->config.cfg0_size;
>  	pp->mem_base = pp->mem.start;
> 
>  	pp->va_cfg0_base = devm_ioremap(pp->dev, pp->cfg0_base,

Reviewed and Acked-by: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>

Regards
Mohit

> --
> 1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

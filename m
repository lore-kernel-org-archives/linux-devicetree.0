From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH v3 2/3] pci: iproc: Add Broadcom iProc PCIe support
Date: Fri, 06 Mar 2015 12:00:40 +0100
Message-ID: <1425639640.24292.271.camel@x220>
References: <1425603699-13416-1-git-send-email-rjui@broadcom.com>
	 <1425603699-13416-3-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425603699-13416-3-git-send-email-rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2015-03-05 at 17:01 -0800, Ray Jui wrote:
> --- a/drivers/pci/host/Kconfig
> +++ b/drivers/pci/host/Kconfig
> @@ -106,4 +106,21 @@ config PCI_VERSATILE
>  	bool "ARM Versatile PB PCI controller"
>  	depends on ARCH_VERSATILE
>  
> +config PCIE_IPROC
> +	bool "Broadcom iProc PCIe controller"

bool symbol.

> +	help
> +	  This enables the iProc PCIe core controller support for Broadcom's
> +	  iProc family of SoCs. An appropriate bus interface driver also needs
> +	  to be enabled
> +
> +config PCIE_IPROC_PLTFM
> +	bool "Broadcom iProc PCIe platform bus driver"

Another bool symbol.

> +	depends on ARCH_BCM_IPROC || COMPILE_TEST
> +	depends on OF
> +	select PCIE_IPROC
> +	default ARCH_BCM_IPROC
> +	help
> +	  Say Y here if you want to use the Broadcom iProc PCIe controller
> +	  through the generic platform bus interface
> +
>  endmenu

> --- a/drivers/pci/host/Makefile
> +++ b/drivers/pci/host/Makefile

> +obj-$(CONFIG_PCIE_IPROC) += pcie-iproc.o
> +obj-$(CONFIG_PCIE_IPROC_PLTFM) += pcie-iproc-pltfm.o

Both objectfiles will never be part of a module.

> --- /dev/null
> +++ b/drivers/pci/host/pcie-iproc-pltfm.c

> +#include <linux/module.h>

Is this needed?

> +MODULE_DEVICE_TABLE(of, iproc_pcie_of_match_table);

This macro will be preprocessed away, won't it?

> +static struct platform_driver iproc_pcie_pltfm_driver = {
> +	.driver = {
> +		.name = "iproc-pcie",
> +		.of_match_table = of_match_ptr(iproc_pcie_of_match_table),
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = iproc_pcie_pltfm_probe,
> +};
> +module_platform_driver(iproc_pcie_pltfm_driver);

Perhaps it's clearer to have make this a call to
platform_driver_register(), put that in a wrapper function, and invoke
that wrapper function through device_initcall() or similar. I haven't
actually tested that, so the details could be off.

> +MODULE_AUTHOR("Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>");
> +MODULE_DESCRIPTION("Broadcom iPROC PCIe platform driver");
> +MODULE_LICENSE("GPL v2");

And these three macros will, effectively, be preprocessed away.

> --- /dev/null
> +++ b/drivers/pci/host/pcie-iproc.c

> +#include <linux/module.h>

See above.

> +MODULE_AUTHOR("Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>");
> +MODULE_DESCRIPTION("Broadcom iPROC PCIe common driver");
> +MODULE_LICENSE("GPL v2");

Ditto.


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

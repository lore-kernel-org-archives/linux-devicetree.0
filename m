From: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] pci:host: Add Altera PCIe host controller driver
Date: Thu, 30 Jul 2015 01:43:13 +0800
Message-ID: <CAFiDJ5_yXoXJ+UUROX1aiNeTyxt6wDZ+h8DW=c4EdUiS5OkkJg@mail.gmail.com>
References: <1438080345-7233-1-git-send-email-lftan@altera.com>
	<1438080345-7233-4-git-send-email-lftan@altera.com>
	<1438158927.5106.20.camel@tiscali.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438158927.5106.20.camel-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 29, 2015 at 4:35 PM, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org> wrote:
> On di, 2015-07-28 at 18:45 +0800, Ley Foon Tan wrote:
>> --- a/drivers/pci/host/Kconfig
>> +++ b/drivers/pci/host/Kconfig
>
>> +config PCIE_ALTERA
>> +     bool "Altera PCIe controller"
>> +     depends on ARCH_SOCFPGA
>> +     depends on OF
>> +     select PCI_MSI_IRQ_DOMAIN if PCI_MSI
>> +     help
>> +       Say Y here if you want to enable PCIe controller support for Altera
>> +       SoCFPGA family of SoCs.
>
>> --- a/drivers/pci/host/Makefile
>> +++ b/drivers/pci/host/Makefile
>
>> +obj-$(CONFIG_PCIE_ALTERA) += pcie-altera.o
>
>> --- /dev/null
>> +++ b/drivers/pci/host/pcie-altera.c
>
>> +#include <linux/module.h>
>
>> +static const struct of_device_id altera_pcie_of_match[] = {
>> +     { .compatible = "altr,pcie-root-port-1.0", },
>> +     {},
>> +};
>> +MODULE_DEVICE_TABLE(of, altera_pcie_of_match);
>
>
>> +static struct platform_driver altera_pcie_driver = {
>> +     [...]
>> +             .owner  = THIS_MODULE,
>> +     ]...]
>> +};
>> +
>> +module_platform_driver(altera_pcie_driver);
>> +
>> +MODULE_AUTHOR("Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>");
>> +MODULE_DESCRIPTION("Altera PCIe host controller driver");
>> +MODULE_LICENSE("GPL v2");
>
> PCIE_ALTERA is a bool symbol. So pcie-altera.o is built-in only. Yet
> pcie-altera.c uses a number of module-specific constructs. Should
> PCIE_ALTERA perhaps be tristate?
Yes, PCIE_ALTERA can be changed to tristate after we remove call to
pci_common_init_dev to now.
pci_common_init_dev is not a exported symbol.


> Likewise for PCIE_ALTERA_MSI in 4/6.
PCIE_ALTERA_MSI can only be built-in only. It depends on quite a
number of non-exported symbols.
Eg: pci_msi_mask_irq, pci_msi_create_irq_domain, irq_domain_set_info and etc..

Thanks.

Regards
Ley Foon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

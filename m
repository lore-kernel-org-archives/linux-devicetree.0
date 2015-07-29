From: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/6] pci: altera: Add Altera PCIe MSI driver
Date: Wed, 29 Jul 2015 16:53:57 +0800
Message-ID: <CAFiDJ5-UebtEmj6vQ1Xn-eORDyJWtDVwOWz57XZtpq4GaYjDoQ@mail.gmail.com>
References: <1438080345-7233-1-git-send-email-lftan@altera.com>
	<1438080345-7233-5-git-send-email-lftan@altera.com>
	<CADhT+wf2oYVZHn1XAODYJUsxwu03TAzN6ZEQCkSBjU5ruKWCDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CADhT+wf2oYVZHn1XAODYJUsxwu03TAzN6ZEQCkSBjU5ruKWCDQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 29, 2015 at 1:00 AM, Dinh Nguyen <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jul 28, 2015 at 5:45 AM, Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org> wrote:
>> This patch adds Altera PCIe MSI driver. This soft IP supports configurable
>> number of vectors, which is a dts parameter.
>>
>> Signed-off-by: Ley Foon Tan <lftan-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/pci/host/Kconfig           |   7 +
>>  drivers/pci/host/Makefile          |   1 +
>>  drivers/pci/host/pcie-altera-msi.c | 318 +++++++++++++++++++++++++++++++++++++
>>  3 files changed, 326 insertions(+)
>>  create mode 100644 drivers/pci/host/pcie-altera-msi.c
>>
>> diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
>> index af19039..a8b87fd 100644
>> --- a/drivers/pci/host/Kconfig
>> +++ b/drivers/pci/host/Kconfig
>> @@ -154,4 +154,11 @@ config PCIE_ALTERA
>>           Say Y here if you want to enable PCIe controller support for Altera
>>           SoCFPGA family of SoCs.
>>
>> +config PCIE_ALTERA_MSI
>> +       bool "Altera PCIe MSI feature"
>> +       depends on PCI_MSI && PCIE_ALTERA
>> +       help
>> +         Say Y here if you want PCIe MSI support for the Altera SocFPGA SoC.
>> +         This MSI driver supports Altera MSI to GIC controller IP.
>> +
>
> Couldn't this driver get combined with the pcie-altera driver?
Prefer to separate them, since they are 2 separate IPs.
Theoretically, this MSI driver can work with other PCIe host as well.

Thanks.

Regard
Ley Foon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

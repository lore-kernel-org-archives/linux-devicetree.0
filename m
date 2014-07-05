From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 7/9] pci: of: Parse and map the IRQ when adding the PCI device.
Date: Sat, 5 Jul 2014 14:04:41 -0500
Message-ID: <CAL_JsqKWm54MjXC60EWVcxOurza=f2V9fwe2vVROa_Mv-6QnHw@mail.gmail.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-8-git-send-email-Liviu.Dudau@arm.com> <20140702111748.GJ18731@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140702111748.GJ18731-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Device Tree ML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Suravee Suthikulanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 2, 2014 at 6:17 AM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> On Tue, Jul 01, 2014 at 07:43:32PM +0100, Liviu Dudau wrote:
>> Enhance the default implementation of pcibios_add_device() to
>> parse and map the IRQ of the device if a DT binding is available.
>>
>> Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
>> ---
>>  drivers/pci/pci.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index 63a54a3..8e65dc3 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -17,6 +17,7 @@
>>  #include <linux/spinlock.h>
>>  #include <linux/string.h>
>>  #include <linux/log2.h>
>> +#include <linux/of_pci.h>
>>  #include <linux/pci-aspm.h>
>>  #include <linux/pm_wakeup.h>
>>  #include <linux/interrupt.h>
>> @@ -1453,6 +1454,9 @@ EXPORT_SYMBOL(pcim_pin_device);
>>   */
>>  int __weak pcibios_add_device(struct pci_dev *dev)
>>  {
>> +#ifdef CONFIG_OF
>> +     dev->irq = of_irq_parse_and_map_pci(dev, 0, 0);
>> +#endif
>
> You could avoid the #ifdef by only assigning dev->irq if
> of_irq_parse_and_map_pci returned something > 0.

Perhaps it could just be unconditional always. Presumably, dev->irq is
not already set to something valid and setting it to <= 0 should not
have any consequences.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

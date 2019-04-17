From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v6 10/12] soc: ti: Add MSI domain bus support for
 Interrupt Aggregator
Date: Wed, 17 Apr 2019 18:06:25 +0100
Message-ID: <086f1f60-b928-0055-9b69-1badc3f0d8e6@arm.com>
References: <20190410041358.16809-1-lokeshvutla@ti.com>
 <20190410041358.16809-11-lokeshvutla@ti.com>
 <8691f4f1-741c-c15d-62d6-3c2f7157cb51@arm.com>
 <a660c601-33f2-243d-7d83-7622e2c0f1b9@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a660c601-33f2-243d-7d83-7622e2c0f1b9@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>, Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, jason@lakedaemon.net
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org, Device Tree Mailing List <devicetree@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

On 17/04/2019 17:59, Lokesh Vutla wrote:
> 
> 
> On 17/04/19 10:04 PM, Marc Zyngier wrote:
>> On 10/04/2019 05:13, Lokesh Vutla wrote:
>>> With the system coprocessor managing the range allocation of the
>>> inputs to Interrupt Aggregator, it is difficult to represent
>>> the device IRQs from DT.
>>>
>>> The suggestion is to use MSI in such cases where devices wants
>>> to allocate and group interrupts dynamically.
>>>
>>> Create a MSI domain bus layer that allocates and frees MSIs for
>>> a device.
>>>
>>> APIs that are implemented:
>>> - ti_sci_inta_msi_create_irq_domain() that creates a MSI domain
>>> - ti_sci_inta_msi_domain_alloc_irqs() that creates MSIs for the
>>>   specified device and resource.
>>> - ti_sci_inta_msi_domain_free_irqs() frees the irqs attached to the device.
>>> - ti_sci_inta_msi_get_virq() for getting the virq attached to a specific event.
>>>
>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>> ---
>>> Changes since v5:
>>> - Updated the input parametes to all apis
>>> - Updated the default chip ops.
>>> - Prefixed all the apis with ti_sci_inta_
>>>
>>> Marc,
>>> 	Right now ti_sci_resource is being passed for irq allocatons.
>>> I couldn't get to use resources attached to platform_device. Because
>>> platform_device resources are allocated in of_device_alloc() and number
>>> of resources are fixed in it. In order to update the resources, driver
>>> has to do a krealloc(pdev->resources) and update the num of resources.
>>> Is it allowed to update the pdev->resources during probe time? If yes,
>>> Ill be happy to update the patch to use platform_dev resources.
>>
>> My suggestion was for you to define your own bus, device type and co
>> (much like the fsl-mc stuff), and not reuse platform devices at all.
>>
>>>
>>>
>>>  MAINTAINERS                            |   2 +
>>>  drivers/soc/ti/Kconfig                 |   6 +
>>>  drivers/soc/ti/Makefile                |   1 +
>>>  drivers/soc/ti/ti_sci_inta_msi.c       | 167 +++++++++++++++++++++++++
>>>  include/linux/irqdomain.h              |   1 +
>>>  include/linux/msi.h                    |   6 +
>>>  include/linux/soc/ti/ti_sci_inta_msi.h |  23 ++++
>>>  7 files changed, 206 insertions(+)
>>>  create mode 100644 drivers/soc/ti/ti_sci_inta_msi.c
>>>  create mode 100644 include/linux/soc/ti/ti_sci_inta_msi.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index ba88b3033fe4..dd31d7cb2fc6 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -15353,6 +15353,8 @@ F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
>>>  F:	Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
>>>  F:	drivers/irqchip/irq-ti-sci-intr.c
>>>  F:	drivers/irqchip/irq-ti-sci-inta.c
>>> +F:	include/linux/soc/ti/ti_sci_inta_msi.h
>>> +F:	drivers/soc/ti/ti_sci_inta_msi.c
>>>  
>>>  Texas Instruments ASoC drivers
>>>  M:	Peter Ujfalusi <peter.ujfalusi@ti.com>
>>> diff --git a/drivers/soc/ti/Kconfig b/drivers/soc/ti/Kconfig
>>> index be4570baad96..82f110fe4953 100644
>>> --- a/drivers/soc/ti/Kconfig
>>> +++ b/drivers/soc/ti/Kconfig
>>> @@ -73,4 +73,10 @@ config TI_SCI_PM_DOMAINS
>>>  	  called ti_sci_pm_domains. Note this is needed early in boot before
>>>  	  rootfs may be available.
>>>  
>>> +config TI_SCI_INTA_MSI_DOMAIN
>>> +	bool
>>> +	select GENERIC_MSI_IRQ_DOMAIN
>>> +	help
>>> +	  Driver to enable Interrupt Aggregator specific MSI Domain.
>>> +
>>>  endif # SOC_TI
>>> diff --git a/drivers/soc/ti/Makefile b/drivers/soc/ti/Makefile
>>> index a22edc0b258a..b3868d392d4f 100644
>>> --- a/drivers/soc/ti/Makefile
>>> +++ b/drivers/soc/ti/Makefile
>>> @@ -8,3 +8,4 @@ obj-$(CONFIG_KEYSTONE_NAVIGATOR_DMA)	+= knav_dma.o
>>>  obj-$(CONFIG_AMX3_PM)			+= pm33xx.o
>>>  obj-$(CONFIG_WKUP_M3_IPC)		+= wkup_m3_ipc.o
>>>  obj-$(CONFIG_TI_SCI_PM_DOMAINS)		+= ti_sci_pm_domains.o
>>> +obj-$(CONFIG_TI_SCI_INTA_MSI_DOMAIN)	+= ti_sci_inta_msi.o
>>> diff --git a/drivers/soc/ti/ti_sci_inta_msi.c b/drivers/soc/ti/ti_sci_inta_msi.c
>>> new file mode 100644
>>> index 000000000000..247a5e5f216b
>>> --- /dev/null
>>> +++ b/drivers/soc/ti/ti_sci_inta_msi.c
>>> @@ -0,0 +1,167 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Texas Instruments' K3 Interrupt Aggregator MSI bus
>>> + *
>>> + * Copyright (C) 2018-2019 Texas Instruments Incorporated - http://www.ti.com/
>>> + *	Lokesh Vutla <lokeshvutla@ti.com>
>>> + */
>>> +
>>> +#include <linux/of_device.h>
>>> +#include <linux/of_address.h>
>>> +#include <linux/of_irq.h>
>>> +#include <linux/irq.h>
>>> +#include <linux/irqdomain.h>
>>> +#include <linux/msi.h>
>>
>> Alphabetical ordering, please.
> 
> Sure.
> 
>>
>>> +#include <linux/soc/ti/ti_sci_inta_msi.h>
>>> +#include <linux/soc/ti/ti_sci_protocol.h>
>>> +
>>> +static void ti_sci_inta_msi_write_msg(struct irq_data *data,
>>> +				      struct msi_msg *msg)
>>> +{
>>> +	/* Nothing to do */
>>> +}
>>> +
>>> +static void ti_sci_inta_msi_compose_msi_msg(struct irq_data *data,
>>> +					    struct msi_msg *msg)
>>> +{
>>> +	/* Nothing to do */
>>> +}
>>> +
>>> +static int ti_sci_inta_msi_request_resources(struct irq_data *data)
>>> +{
>>> +	data = data->parent_data;
>>> +
>>> +	return data->chip->irq_request_resources(data);
>>> +}
>>> +
>>> +static void ti_sci_inta_msi_release_resources(struct irq_data *data)
>>> +{
>>> +	data = data->parent_data;
>>> +	data->chip->irq_release_resources(data);
>>> +}
>>
>> The two functions above are an implementation of
>> irq_chip_{request,release}_resource_parent(). Please make them generic
>> functions, use them and fix drivers/gpio/gpio-thunderx.c to use them too.
> 
> okay, will create  irq_chip_{request,release}_resource_parent() apis and use them.
> 
>>
>>> +
>>> +static void ti_sci_inta_msi_update_chip_ops(struct msi_domain_info *info)
>>> +{
>>> +	struct irq_chip *chip = info->chip;
>>> +
>>> +	WARN_ON(!chip);
>>
>> Just doing that isn't going to help, as you'll crash on the following
>> line...
> 
> Checkpatch is scribbling about it. Will use BUG_ON() in next version.

Screw checkpatch, but don't use BUG_ON() either. Instead, do

	if (!WARN_ON(!chip))
		return;

> 
>>
>>> +	if (!chip->irq_mask)
>>> +		chip->irq_mask = irq_chip_mask_parent;
>>> +	if (!chip->irq_unmask)
>>> +		chip->irq_unmask = irq_chip_unmask_parent;
>>> +	if (!chip->irq_ack)
>>> +		chip->irq_ack = irq_chip_ack_parent;
>>> +	if (!chip->irq_set_type)
>>> +		chip->irq_set_type = irq_chip_set_type_parent;
>>> +	if (!chip->irq_write_msi_msg)
>>> +		chip->irq_write_msi_msg = ti_sci_inta_msi_write_msg;
>>> +	if (!chip->irq_compose_msi_msg)
>>> +		chip->irq_compose_msi_msg = ti_sci_inta_msi_compose_msi_msg;
>>> +	if (!chip->irq_request_resources)
>>> +		chip->irq_request_resources = ti_sci_inta_msi_request_resources;
>>> +	if (!chip->irq_release_resources)
>>> +		chip->irq_release_resources = ti_sci_inta_msi_release_resources;
>>
>> Is there any case where a client driver wouldn't use the default all the
>> time?
> 
> I don't think so.
> 
>>
>>> +}
>>> +
>>> +struct irq_domain
>>> +*ti_sci_inta_msi_create_irq_domain(struct fwnode_handle *fwnode,
>>> +				   struct msi_domain_info *info,
>>> +				   struct irq_domain *parent)
>>> +{
>>> +	struct irq_domain *domain;
>>> +
>>> +	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
>>> +		ti_sci_inta_msi_update_chip_ops(info);
>>
>> If the answer above is "no", then you can happily ignore this flag and
>> always populate the callbacks.
> 
> Okay, will ignore the flag and populate apis.
> 
>>
>>> +
>>> +	domain = msi_create_irq_domain(fwnode, info, parent);
>>> +	if (domain)
>>> +		irq_domain_update_bus_token(domain, DOMAIN_BUS_TI_SCI_INTA_MSI);
>>> +
>>> +	return domain;
>>> +}
>>> +EXPORT_SYMBOL_GPL(ti_sci_inta_msi_create_irq_domain);
>>> +
>>> +static void ti_sci_inta_msi_free_descs(struct device *dev)
>>> +{
>>> +	struct msi_desc *desc, *tmp;
>>> +
>>> +	list_for_each_entry_safe(desc, tmp, dev_to_msi_list(dev), list) {
>>> +		list_del(&desc->list);
>>> +		free_msi_entry(desc);
>>> +	}
>>> +}
>>> +
>>> +static int ti_sci_inta_msi_alloc_descs(struct device *dev, u32 dev_id,
>>> +				       struct ti_sci_resource *res)
>>> +{
>>> +	struct msi_desc *msi_desc;
>>> +	int set, i, count = 0;
>>> +
>>> +	for (set = 0; set < res->sets; set++) {
>>> +		for (i = 0; i < res->desc[set].num; i++) {
>>> +			msi_desc = alloc_msi_entry(dev, 1, NULL);
>>> +			if (!msi_desc) {
>>> +				ti_sci_inta_msi_free_descs(dev);
>>> +				return -ENOMEM;
>>> +			}
>>> +
>>> +			msi_desc->inta.index = res->desc[set].start + i;
>>> +			msi_desc->inta.dev_id = dev_id;
>>
>> I'm highly suspiscious of this. See further down.
> 
> I need to pass dev_id and dev_index to my irqchip driver so that hwirq gets created.
> 
>>
>>> +			INIT_LIST_HEAD(&msi_desc->list);
>>> +			list_add_tail(&msi_desc->list, dev_to_msi_list(dev));
>>> +			count++;
>>> +		}
>>> +	}
>>> +
>>> +	return count;
>>> +}
>>> +
>>> +int ti_sci_inta_msi_domain_alloc_irqs(struct platform_device *pdev,
>>> +				      struct ti_sci_resource *res)
>>> +{
>>> +	struct irq_domain *msi_domain;
>>> +	int ret, nvec;
>>> +
>>> +	msi_domain = dev_get_msi_domain(&pdev->dev);
>>> +	if (!msi_domain)
>>> +		return -EINVAL;
>>> +
>>> +	if (pdev->id < 0)
>>> +		return -ENODEV;
>>> +
>>> +	nvec = ti_sci_inta_msi_alloc_descs(&pdev->dev, pdev->id, res);
>>> +	if (nvec <= 0)
>>> +		return nvec;
>>> +
>>> +	ret = msi_domain_alloc_irqs(msi_domain, &pdev->dev, nvec);
>>> +	if (ret) {
>>> +		dev_err(&pdev->dev, "Failed to allocate IRQs %d\n", ret);
>>> +		goto cleanup;
>>> +	}
>>> +
>>> +	return 0;
>>> +
>>> +cleanup:
>>> +	ti_sci_inta_msi_free_descs(&pdev->dev);
>>> +	return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(ti_sci_inta_msi_domain_alloc_irqs);
>>> +
>>> +void ti_sci_inta_msi_domain_free_irqs(struct device *dev)
>>> +{
>>> +	msi_domain_free_irqs(dev->msi_domain, dev);
>>> +	ti_sci_inta_msi_free_descs(dev);
>>> +}
>>> +EXPORT_SYMBOL_GPL(ti_sci_inta_msi_domain_free_irqs);
>>> +
>>> +unsigned int ti_sci_inta_msi_get_virq(struct platform_device *pdev, u32 index)
>>> +{
>>> +	struct msi_desc *desc;
>>> +
>>> +	for_each_msi_entry(desc, &pdev->dev)
>>> +		if (desc->inta.index == index && desc->inta.dev_id == pdev->id)
>>
>> What is this "index"? Why isn't the right entry the index-th element in
>> the msi_desc list?  Worse, the dev_id check. The whole point of having a
>> per-device MSI list is that it is, well, per device.
> 
> Might be wrong choice of word here. As you know, dev_index need not be
> contiguous. ti_sci_resource will have the range of dev_index allocated to the
> linux host. using this dev_index irqs gets configured. Even the client drivers
> only track this dev_index. Isn't it correct to use this dev_index to translate
> to virq?

OK. But what about the dev_id check? Surely all the MSIs allocated to a
single device have the same devid, right? and that id is equal to pdev->id?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...

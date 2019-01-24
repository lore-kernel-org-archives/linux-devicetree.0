From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH v4 08/13] genirq/msi: Add support for allocating
 single MSI for a device
Date: Thu, 24 Jan 2019 15:49:31 +0530
Message-ID: <faad8e90-2f97-1dbb-fb98-e0f1462e29c5@ti.com>
References: <20181227060829.5080-1-lokeshvutla@ti.com>
 <20181227061313.5451-1-lokeshvutla@ti.com>
 <20181227061313.5451-8-lokeshvutla@ti.com>
 <5be38277-3348-a6d9-4b67-3ead308c009a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5be38277-3348-a6d9-4b67-3ead308c009a@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <Marc.Zyngier@arm.com>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "jason@lakedaemon.net" <jason@lakedaemon.net>
Cc: Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

Hi Marc,
	Sorry for the delayed response. Just back from vacation.

On 17/01/19 12:00 AM, Marc Zyngier wrote:
> On 27/12/2018 06:13, Lokesh Vutla wrote:
>> Previously all msi for a device are allocated in one go
>> by calling msi_domain_alloc_irq() from a bus layer. This might
>> not be the case when a device is trying to allocate interrupts
>> dynamically based on a request to it.
>>
>> So introduce msi_domain_alloc/free_irq() apis to allocate a single
>> msi. prepare and activate operations to be handled by bus layer
>> calling msi_domain_alloc/free_irq() apis.
>>
>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>> ---
>>  include/linux/msi.h |  3 +++
>>  kernel/irq/msi.c    | 62 +++++++++++++++++++++++++++++----------------
>>  2 files changed, 43 insertions(+), 22 deletions(-)
>>
>> diff --git a/include/linux/msi.h b/include/linux/msi.h
>> index 784fb52b9900..474490826f8c 100644
>> --- a/include/linux/msi.h
>> +++ b/include/linux/msi.h
>> @@ -301,8 +301,11 @@ int msi_domain_set_affinity(struct irq_data *data, const struct cpumask *mask,
>>  struct irq_domain *msi_create_irq_domain(struct fwnode_handle *fwnode,
>>   struct msi_domain_info *info,
>>   struct irq_domain *parent);
>> +int msi_domain_alloc_irq(struct irq_domain *domain, struct device *dev,
>> + struct msi_desc *desc,  msi_alloc_info_t *arg);
>>  int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
>>    int nvec);
>> +void msi_domain_free_irq(struct msi_desc *desc);
>>  void msi_domain_free_irqs(struct irq_domain *domain, struct device *dev);
>>  struct msi_domain_info *msi_get_domain_info(struct irq_domain *domain);
>>
>> diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
>> index ad26fbcfbfc8..eb7459324113 100644
>> --- a/kernel/irq/msi.c
>> +++ b/kernel/irq/msi.c
>> @@ -387,6 +387,35 @@ static bool msi_check_reservation_mode(struct irq_domain *domain,
>>  return desc->msi_attrib.is_msix || desc->msi_attrib.maskbit;
>>  }
>>
>> +int msi_domain_alloc_irq(struct irq_domain *domain, struct device *dev,
>> + struct msi_desc *desc,  msi_alloc_info_t *arg)
>> +{
>> +struct msi_domain_info *info = domain->host_data;
>> +struct msi_domain_ops *ops = info->ops;
>> +int i, ret, virq;
>> +
>> +ops->set_desc(arg, desc);
>> +
>> +virq = __irq_domain_alloc_irqs(domain, -1, desc->nvec_used,
>> +       dev_to_node(dev), arg, false,
>> +       desc->affinity);
>> +if (virq < 0) {
>> +ret = -ENOSPC;
>> +if (ops->handle_error)
>> +ret = ops->handle_error(domain, desc, ret);
>> +if (ops->msi_finish)
>> +ops->msi_finish(arg, ret);
>> +return ret;
>> +}
>> +
>> +for (i = 0; i < desc->nvec_used; i++) {
>> +irq_set_msi_desc_off(virq, i, desc);
>> +irq_debugfs_copy_devname(virq + i, dev);
>> +}
>> +
>> +return 0;
>> +}
>> +
>>  /**
>>   * msi_domain_alloc_irqs - Allocate interrupts from a MSI interrupt domain
>>   * @domain:The domain to allocate from
>> @@ -404,7 +433,7 @@ int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
>>  struct irq_data *irq_data;
>>  struct msi_desc *desc;
>>  msi_alloc_info_t arg;
>> -int i, ret, virq;
>> +int ret, virq;
>>  bool can_reserve;
>>
>>  ret = msi_domain_prepare_irqs(domain, dev, nvec, &arg);
>> @@ -412,24 +441,9 @@ int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
>>  return ret;
>>
>>  for_each_msi_entry(desc, dev) {
>> -ops->set_desc(&arg, desc);
>> -
>> -virq = __irq_domain_alloc_irqs(domain, -1, desc->nvec_used,
>> -       dev_to_node(dev), &arg, false,
>> -       desc->affinity);
>> -if (virq < 0) {
>> -ret = -ENOSPC;
>> -if (ops->handle_error)
>> -ret = ops->handle_error(domain, desc, ret);
>> -if (ops->msi_finish)
>> -ops->msi_finish(&arg, ret);
>> +ret = msi_domain_alloc_irq(domain, dev, desc, &arg);
>> +if (ret)
>>  return ret;
>> -}
>> -
>> -for (i = 0; i < desc->nvec_used; i++) {
>> -irq_set_msi_desc_off(virq, i, desc);
>> -irq_debugfs_copy_devname(virq + i, dev);
>> -}
>>  }
>>
>>  if (ops->msi_finish)
>> @@ -487,6 +501,12 @@ int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
>>  return ret;
>>  }
>>
>> +void msi_domain_free_irq(struct msi_desc *desc)
>> +{
>> +irq_domain_free_irqs(desc->irq, desc->nvec_used);
>> +desc->irq = 0;
>> +}
>> +
>>  /**
>>   * msi_domain_free_irqs - Free interrupts from a MSI interrupt @domain associated tp @dev
>>   * @domain:The domain to managing the interrupts
>> @@ -503,10 +523,8 @@ void msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
>>   * enough that there is no IRQ associated to this
>>   * entry. If that's the case, don't do anything.
>>   */
>> -if (desc->irq) {
>> -irq_domain_free_irqs(desc->irq, desc->nvec_used);
>> -desc->irq = 0;
>> -}
>> +if (desc->irq)
>> +msi_domain_free_irq(desc);
>>  }
>>  }
>>
>>
> 
> I can see some interesting issues with this API.
> 
> At the moment, MSIs are allocated upfront, and that's usually done
> before the driver can do anything else. With what you're suggesting
> here, MSIs can now be allocated at any time, which sounds great. But how
> does it work when MSIs get added/freed in parallel? I can't see any
> locking here...
> 
> It is also pretty nasty that the user of this API has to know about the
> MSI descriptor. Really, nobody should have to deal with this outside of
> the MSI layer.
> 
> The real question is why you need to need to allocate MSIs on demand for
> a given device. Usually, you allocate them because this is a per-CPU
> resource, or something similar. What makes it so variable that you need
> to resort to fine grained MSI allocation?

I added this after the discussion we had in the previous version[1] of this
series. Let me provide the details again:

As you must be aware INTR is interrupt re-director and INTA is the interrupt
multiplexer is the SoC. Here we are trying to address the interrupt connection
route as below:
Device(Global event) --> INTA --> INTR --> GIC

For the above case you suggested to have the following sw IRQ domain hierarchy:
INTA multi MSI --> INTA  -->  INTR  --> GIC

The problem here with the INTA MSI is that all the interrupts for a device
should be pre-allocated during the device probe time. But this is not what we
wanted especially for the DMA case.

An example DMA ring connection would look like below[2]:

                      +---------------------+
                       |         IA                |
+--------+        |            +------+   |        +--------+         +------+
| ring 1 +----->evtA+->VintX+-------->+   IR   +-- --->  GIC +-->
+--------+       |             +------+   |        +--------+         +------+
Linux IRQ Y
   evtA            |                             |
                       |                             |
                      +----------------------+

So when a DMA client driver requests a dma channel during probe, the DMA driver
gets a free ring in its allocated range. Then DMA driver requests MSI layer for
an IRQ. This is why I had to introduce on demand allocation of MSIs for a device.

The reason why we avoided DMA driver to allocate interrupts during its probe as
it is not aware of the exact no of channels that are going to be used. Also max
allocation of interrupts will overrun the gic IRQs available to this INTA and
the IPs that are connected to INTR directly will not get any interrupts.

I hope this is clear.

[1] https://lkml.org/lkml/2018/11/5/894
[2] https://pastebin.ubuntu.com/p/RTrgzfCMby/

Thanks and regards,
Lokesh

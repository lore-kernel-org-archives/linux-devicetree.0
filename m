From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH] of/irq: stub out public API
Date: Thu, 01 Nov 2012 10:50:55 -0600
Message-ID: <5092A86F.3010603@codeaurora.org>
References: <1351717765-29395-1-git-send-email-jhugo@codeaurora.org> <5091B63E.7090208@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <5091B63E.7090208@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 10/31/2012 5:37 PM, Rob Herring wrote:
> On 10/31/2012 04:09 PM, Jeffrey Hugo wrote:
>> Restructure of_irq.h so that the public API is defined as function stubs
>> when CONFIG_OF_IRQ is not defined.  This allows client drivers to
>> sucessfully compile in configurations where CONFIG_OF_IRQ is defined and
>> in configurations where it is not defined.
>>
> Do you have an example of where you need this? For many of these drivers
> should not be calling them directly as they are intended for core code.
>
> Rob
I'm sorry, I did not realize this was a private API not intended for 
outside drivers.  I've found an alternate API that I can use to 
accomplish the same tasks.  Please disregard this change, and thank you 
for your time.
>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   include/linux/of_irq.h |   71 +++++++++++++++++++++++++++++++++++------------
>>   1 files changed, 53 insertions(+), 18 deletions(-)
>>
>> diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
>> index 1717cd9..1b5771a 100644
>> --- a/include/linux/of_irq.h
>> +++ b/include/linux/of_irq.h
>> @@ -1,8 +1,6 @@
>>   #ifndef __OF_IRQ_H
>>   #define __OF_IRQ_H
>>   
>> -#if defined(CONFIG_OF)
>> -struct of_irq;
>>   #include <linux/types.h>
>>   #include <linux/errno.h>
>>   #include <linux/irq.h>
>> @@ -10,14 +8,6 @@ struct of_irq;
>>   #include <linux/ioport.h>
>>   #include <linux/of.h>
>>   
>> -/*
>> - * irq_of_parse_and_map() is used by all OF enabled platforms; but SPARC
>> - * implements it differently.  However, the prototype is the same for all,
>> - * so declare it here regardless of the CONFIG_OF_IRQ setting.
>> - */
>> -extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
>> -
>> -#if defined(CONFIG_OF_IRQ)
>>   /**
>>    * of_irq - container for device_node/irq_specifier pair for an irq controller
>>    * @controller: pointer to interrupt controller device tree node
>> @@ -57,7 +47,23 @@ static inline int of_irq_map_oldworld(struct device_node *device, int index,
>>   }
>>   #endif /* CONFIG_PPC32 && CONFIG_PPC_PMAC */
>>   
>> +#if defined(CONFIG_OF)
>> +/*
>> + * irq_of_parse_and_map() is used by all OF enabled platforms; but SPARC
>> + * implements it differently.  However, the prototype is the same for all,
>> + * so declare it here regardless of the CONFIG_OF_IRQ setting.
>> + */
>> +extern unsigned int irq_of_parse_and_map(struct device_node *node, int index);
>> +#else /* !CONFIG_OF */
>> +static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
>> +						int index)
>> +{
>> +	return 0;
>> +}
>> +#endif /* !CONFIG_OF */
>> +
>>   
>> +#if defined(CONFIG_OF_IRQ)
>>   extern int of_irq_map_raw(struct device_node *parent, const u32 *intspec,
>>   			  u32 ointsize, const u32 *addr,
>>   			  struct of_irq *out_irq);
>> @@ -74,15 +80,44 @@ extern int of_irq_to_resource_table(struct device_node *dev,
>>   extern struct device_node *of_irq_find_parent(struct device_node *child);
>>   
>>   extern void of_irq_init(const struct of_device_id *matches);
>> -
>> -#endif /* CONFIG_OF_IRQ */
>> -
>> -#else /* !CONFIG_OF */
>> -static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
>> -						int index)
>> +#else /* !CONFIG_OF_IRQ */
>> +static inline int of_irq_map_raw(struct device_node *parent, const u32 *intspec,
>> +			  u32 ointsize, const u32 *addr,
>> +			  struct of_irq *out_irq)
>>   {
>>   	return 0;
>>   }
>> -#endif /* !CONFIG_OF */
>> -
>> +static inline int of_irq_map_one(struct device_node *device, int index,
>> +			  struct of_irq *out_irq)
>> +{
>> +	return 0;
>> +}
>> +static inline unsigned int irq_create_of_mapping(struct device_node *controller,
>> +					  const u32 *intspec,
>> +					  unsigned int intsize)
>> +{
>> +	return 0;
>> +}
>> +static inline int of_irq_to_resource(struct device_node *dev, int index,
>> +			      struct resource *r)
>> +{
>> +	return 0;
>> +}
>> +static inline int of_irq_count(struct device_node *dev)
>> +{
>> +	return 0;
>> +}
>> +static inline int of_irq_to_resource_table(struct device_node *dev,
>> +		struct resource *res, int nr_irqs)
>> +{
>> +	return 0;
>> +}
>> +static inline struct device_node *of_irq_find_parent(struct device_node *child)
>> +{
>> +	return NULL;
>> +}
>> +static inline void of_irq_init(const struct of_device_id *matches)
>> +{
>> +}
>> +#endif /* CONFIG_OF_IRQ */
>>   #endif /* __OF_IRQ_H */
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Jeffrey Hugo
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation.

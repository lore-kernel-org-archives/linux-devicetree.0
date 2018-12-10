From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 2/4] irqchip/gic: common: add support to device tree
 based quirks
Date: Mon, 10 Dec 2018 13:19:52 +0000
Message-ID: <50b81a24-ecf1-b36f-86e5-1ec4a476cbfd@linaro.org>
References: <20181210102309.8207-1-srinivas.kandagatla@linaro.org>
 <20181210102309.8207-3-srinivas.kandagatla@linaro.org>
 <da39d3af-b8e4-1b5e-cdf4-54dd9e955a0b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <da39d3af-b8e4-1b5e-cdf4-54dd9e955a0b@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: sudeep.holla@arm.com, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, sboyd@kernel.org, bjorn.andersson@linaro.org, nicolas.dechesne@linaro.org, ctatlor97@gmail.com, vkoul@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 10/12/18 10:55, Marc Zyngier wrote:
>>   
>> +void gic_enable_of_quirks(const struct device_node *np,
>> +			  const struct gic_quirk *quirks, void *data)
>> +{
>> +	for (; quirks->desc; quirks++) {
> So you expect quirks->desc to be NULL at some point, just like for any
> other quirk table we have.
> 
>> +		if (!of_device_is_compatible(np, quirks->compatible))
>> +			continue;
>> +		if (quirks->init(data))
>> +			pr_info("GIC: enabling workaround for %s\n",
>> +				quirks->desc);
>> +	}
>> +}
>> +
>>   void gic_enable_quirks(u32 iidr, const struct gic_quirk *quirks,
>>   		void *data)
>>   {
>> diff --git a/drivers/irqchip/irq-gic-common.h b/drivers/irqchip/irq-gic-common.h
>> index 3919cd7c5285..97e58fb6c232 100644
>> --- a/drivers/irqchip/irq-gic-common.h
>> +++ b/drivers/irqchip/irq-gic-common.h
>> @@ -23,6 +23,7 @@
>>   
>>   struct gic_quirk {
>>   	const char *desc;
>> +	const char *compatible;
>>   	bool (*init)(void *data);
>>   	u32 iidr;
>>   	u32 mask;
>> @@ -35,6 +36,8 @@ void gic_dist_config(void __iomem *base, int gic_irqs,
>>   void gic_cpu_config(void __iomem *base, void (*sync_access)(void));
>>   void gic_enable_quirks(u32 iidr, const struct gic_quirk *quirks,
>>   		void *data);
>> +void gic_enable_of_quirks(const struct device_node *np,
>> +			  const struct gic_quirk *quirks, void *data);
>>   
>>   void gic_set_kvm_info(const struct gic_kvm_info *info);
>>   
>> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
>> index 29e9d47be97d..c95796fa4de6 100644
>> --- a/drivers/irqchip/irq-gic-v3.c
>> +++ b/drivers/irqchip/irq-gic-v3.c
>> @@ -1271,6 +1271,9 @@ static void __init gic_of_setup_kvm_info(struct device_node *node)
>>   	gic_set_kvm_info(&gic_v3_kvm_info);
>>   }
>>   
>> +static const struct gic_quirk gic_quirks[] = {
>> +};
> ... and yet here you provide an empty table. That's not going to work
> very well. You definitely need to have an empty entry at the end of the
> array, always.
> 
> I guess you want to test your code on a non affected platform, and I'm
> pretty sure you'll see it exploding.

Yes, Should have carefully looked at this!!
We need an empty entry at the end!
I will fix it and send a new version!

Thanks,
srini
> 

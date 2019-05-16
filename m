Return-Path: <SRS0=blGF=TQ=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH V3 27/29] PCI: OF: Add of_pci_get_reset_gpio() to parse
 reset-gpios from DT
References: <20190513180744.16493-1-mmaddireddy@nvidia.com>
 <20190513180744.16493-28-mmaddireddy@nvidia.com>
 <20190514183105.GA32636@bogus>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <2f0aedd3-92b6-f0bb-abab-3ed5fc6fda80@nvidia.com>
Date: Thu, 16 May 2019 11:20:57 +0530
MIME-Version: 1.0
In-Reply-To: <20190514183105.GA32636@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: thierry.reding@gmail.com, bhelgaas@google.com, mark.rutland@arm.com, jonathanh@nvidia.com, lorenzo.pieralisi@arm.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 15-May-19 12:01 AM, Rob Herring wrote:
> On Mon, May 13, 2019 at 11:37:42PM +0530, Manikanta Maddireddy wrote:
>> This new helper function could be used by host drivers to get the reset
>> GPIO descriptor. If the property isn't assigned, it will return NULL to
>> the caller.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>> ---
>> V3: New patch to add helper function to parse "reset-gpios"
>>
>>  drivers/pci/of.c       | 18 ++++++++++++++++++
>>  include/linux/of_pci.h | 10 ++++++++++
>>  2 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index 9454c90980c9..2a0282115ff0 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
>> @@ -6,6 +6,7 @@
>>   */
>>  #define pr_fmt(fmt)	"PCI: OF: " fmt
>>  
>> +#include <linux/gpio/consumer.h>
>>  #include <linux/irqdomain.h>
>>  #include <linux/kernel.h>
>>  #include <linux/pci.h>
>> @@ -224,6 +225,23 @@ int of_pci_get_max_link_speed(struct device_node *node)
>>  }
>>  EXPORT_SYMBOL_GPL(of_pci_get_max_link_speed);
>>  
>> +/**
>> + * of_pci_get_reset_gpio() - Get PCI reset gpio descriptor.
>> + *
>> + * @node: device node
>> + *
>> + * Returns PCI reset gpio descriptor from DT, or an ERR_PTR() if the
>> + * required property is invalid.
>> + */
>> +struct gpio_desc *of_pci_get_reset_gpio(struct device *dev,
>> +					struct device_node *node,
>> +					int dflags, char *label)
>> +{
>> +	return devm_gpiod_get_from_of_node(dev, node, "reset-gpios", 0, dflags,
>> +					   label);
>> +}
> There's nothing PCI specific about this and 'reset-gpios' is pretty 
> widely used. Either we should have this somewhere common or perhaps not 
> worth a wrapper to save 1 parameter.
>
> Also, I believe you can pass just 'reset' so the deprecated form 
> 'reset-gpio' can also be supported. 
>
> Rob

I also think that it doesn't need a wrapper to save one parameter.
I will drop this patch and use devm_gpiod_get_from_of_node() directly
in pci-tegra driver.

Manikanta

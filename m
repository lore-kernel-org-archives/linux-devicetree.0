Return-Path: <SRS0=3MAV=UN=nvidia.com=mmaddireddy@kernel.org>
Subject: Re: [PATCH V4 27/28] PCI: tegra: Add support for GPIO based PERST#
References: <20190516055307.25737-28-mmaddireddy@nvidia.com>
 <20190604132233.GT16519@ulmo>
 <20190613152404.GB30445@e121166-lin.cambridge.arm.com>
 <cb2dd446-1275-7179-33ac-e5c237d81da6@nvidia.com>
 <20190614143222.GB23116@e121166-lin.cambridge.arm.com>
 <1508173d-0ecc-f498-6ab2-78a718086b35@nvidia.com>
 <20190614145023.GA24588@e121166-lin.cambridge.arm.com>
 <20190614152304.GK15526@ulmo>
 <20190614155934.GA28253@e121166-lin.cambridge.arm.com>
 <51e4ae62-f842-1d2f-fbca-0b2063dd53a6@nvidia.com>
 <20190614165353.GB30511@e121166-lin.cambridge.arm.com>
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Message-ID: <1c662f82-8329-5e1b-58bf-b2fe1643adb0@nvidia.com>
Date: Fri, 14 Jun 2019 22:53:13 +0530
MIME-Version: 1.0
In-Reply-To: <20190614165353.GB30511@e121166-lin.cambridge.arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, vidyas@nvidia.com, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 14-Jun-19 10:23 PM, Lorenzo Pieralisi wrote:
> On Fri, Jun 14, 2019 at 10:00:49PM +0530, Manikanta Maddireddy wrote:
>
> [...]
>
>> GPIO based PERST# is per-platform requirement.
>> If DT prop is not present, then devm_gpiod_get_from_of_node() returns
>> NULL gpio_desc.
>>
>> struct gpio_desc *gpiod_get_from_of_node(struct device_node *node,
>>                                          const char *propname, int index,
>>                                          enum gpiod_flags dflags,
>>                                          const char *label)
>> {
>>         struct gpio_desc *desc;
>>         unsigned long lflags = 0;
>>         enum of_gpio_flags flags;
>>         bool active_low = false;
>>         bool single_ended = false;
>>         bool open_drain = false;
>>         bool transitory = false;
>>         int ret;
>>
>>         desc = of_get_named_gpiod_flags(node, propname,
>>                                         index, &flags);
>>
>>         if (!desc || IS_ERR(desc)) {
>> */* If it is not there, just return NULL */****if (PTR_ERR(desc) == -ENOENT)****return NULL;*
>>                 return desc;
>>         }
>> 	...
>>
>> }
> Ok. My point then is that you have no way to enforce this requirement on
> platforms that actually need it, I do not even know if there is a
> way you can do it (I was thinking along the lines of using a
> compatible string to detect whether the GPIO #PERST reset is mandatory)
> but maybe this is not even a SOC property.
>
> Maybe what I am asking is overkill, I just wanted to understand.
>
> I was just asking a question to understand how you handle the case
> where a GPIO pin definition is missing in DT for a platform that
> actually needs it, the driver will probe but nothing will work.
>
> It would be good to describe this and capture it in the commit log.
>
> Thanks,
> Lorenzo

I can't think of a easy way to enforce this requirement. As you said
compatible string is per SOC, so we can't use it for a platform.
This issue is present on only one platform, so it is hard to miss the
DT property. That is the reason for publishing this patch with out this
enforcement in driver.

I thought for changing PERST# to GPIO for all platform, but testing is
a tedious job. Also I don't have Tegra20 and Tegra30 platforms.

Do you want me to drop the patch or update the limitation in the commit
log?

Manikanta

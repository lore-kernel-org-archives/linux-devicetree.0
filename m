From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] of: to support binding numa node to root
 subnode(non-bus)
Date: Tue, 25 Aug 2015 10:24:56 +0800
Message-ID: <55DBD1F8.1010206@huawei.com>
References: <1440419410-10520-1-git-send-email-thunder.leizhen@huawei.com>
 <CAL_Jsq+Ab-=Dwi4LFR8NjB8mL1DJTY_a1a4Zm88wjcWHM4eS0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+Ab-=Dwi4LFR8NjB8mL1DJTY_a1a4Zm88wjcWHM4eS0g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel <linux-kernel@vger.kernel.org>, Zefan Li <lizefan@huawei.com>, Xinwei Hu <huxinwei@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Hanjun Guo <guohanjun@huawei.com>
List-Id: devicetree@vger.kernel.org



On 2015/8/24 21:25, Rob Herring wrote:
> +benh
> 
> On Mon, Aug 24, 2015 at 7:30 AM, Zhen Lei <thunder.leizhen@huawei.com> wrote:
>> If use of_platform_populate to scan dt-nodes and add devices, the
>> subnode of root(such as /smmu), when being scanned and invoke
> 
> You should have a bus as the sub-node of root rather than devices
> directly off of root. You still have a problem though...

But actually the parent of bus is also &platform_bus if we didn't have special initialization.
For example:
The function of_platform_device_create_pdata invoke of_device_alloc first, then invoke of_device_add.
But in of_device_alloc, we can find that:
	dev->dev.parent = parent ? : &platform_bus;

> 
>> of_device_add, the ofdev->dev.parent is always equal &platform_bus. So
>> that, function set_dev_node will not be called. And in device_add,
>> dev_to_node(parent) always return NUMA_NO_NODE.
>>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/base/core.c | 2 +-
>>  drivers/of/device.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>> index dafae6d..5df4f46b 100644
>> --- a/drivers/base/core.c
>> +++ b/drivers/base/core.c
>> @@ -1017,7 +1017,7 @@ int device_add(struct device *dev)
>>                 dev->kobj.parent = kobj;
>>
>>         /* use parent numa_node */
>> -       if (parent)
>> +       if (parent && (parent != &platform_bus))
> 
> This is only fixing one specific case, but I think things are broken
> for any case where the NUMA associativity if not set at the top level
> bus node. I think this should be something like:
> 
> if (parent && (dev_to_node(dev) != NO_NUMA_NODE))

It seems a mistake, we should use equal sign.
if (parent && (dev_to_node(dev) == NUMA_NO_NODE))

> 
> Then the OF code can set the node however it wants.

OK. I will send patch v2 base upon your advice. Thank you.

> 
>>                 set_dev_node(dev, dev_to_node(parent));
>>
>>         /* first, register with generic layer. */
>> diff --git a/drivers/of/device.c b/drivers/of/device.c
>> index 8b91ea2..96ebece 100644
>> --- a/drivers/of/device.c
>> +++ b/drivers/of/device.c
>> @@ -63,7 +63,7 @@ int of_device_add(struct platform_device *ofdev)
>>         /* device_add will assume that this device is on the same node as
>>          * the parent. If there is no parent defined, set the node
>>          * explicitly */
>> -       if (!ofdev->dev.parent)
>> +       if (!ofdev->dev.parent || (ofdev->dev.parent == &platform_bus))
> 
> And then remove the if here.
> 

OK. I also think remove this statement will be better. Althouth set_dev_node maybe called two times,
but it only spends very little time, and this almost happened at initialization phase.

>>                 set_dev_node(&ofdev->dev, of_node_to_nid(ofdev->dev.of_node));
>>
>>         return device_add(&ofdev->dev);
>> --
>> 2.5.0
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> .
> 

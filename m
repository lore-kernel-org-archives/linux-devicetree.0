From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] of: to support binding numa node to root subnode(non-bus)
Date: Tue, 25 Aug 2015 11:05:48 -0500
Message-ID: <CAL_JsqL-FQqzFYBGmUn13-Tt0sTL_Mohyn752hADBkF2WfukBw@mail.gmail.com>
References: <1440419410-10520-1-git-send-email-thunder.leizhen@huawei.com>
 <CAL_Jsq+Ab-=Dwi4LFR8NjB8mL1DJTY_a1a4Zm88wjcWHM4eS0g@mail.gmail.com> <55DBD1F8.1010206@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55DBD1F8.1010206-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Leizhen (ThunderTown)" <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 24, 2015 at 9:24 PM, Leizhen (ThunderTown)
<thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>
>
> On 2015/8/24 21:25, Rob Herring wrote:
>> +benh
>>
>> On Mon, Aug 24, 2015 at 7:30 AM, Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>>> If use of_platform_populate to scan dt-nodes and add devices, the
>>> subnode of root(such as /smmu), when being scanned and invoke
>>
>> You should have a bus as the sub-node of root rather than devices
>> directly off of root. You still have a problem though...
>
> But actually the parent of bus is also &platform_bus if we didn't have special initialization.
> For example:
> The function of_platform_device_create_pdata invoke of_device_alloc first, then invoke of_device_add.
> But in of_device_alloc, we can find that:
>         dev->dev.parent = parent ? : &platform_bus;

This syntax is confusing, but in GCC this is the same as:

dev->dev.parent = parent ? parent : &platform_bus;

And parent is set for everything except nodes off of root.
/sys/devices/platform/* will show the hierarchy.

>>> of_device_add, the ofdev->dev.parent is always equal &platform_bus. So
>>> that, function set_dev_node will not be called. And in device_add,
>>> dev_to_node(parent) always return NUMA_NO_NODE.
>>>
>>> Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  drivers/base/core.c | 2 +-
>>>  drivers/of/device.c | 2 +-
>>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>>> index dafae6d..5df4f46b 100644
>>> --- a/drivers/base/core.c
>>> +++ b/drivers/base/core.c
>>> @@ -1017,7 +1017,7 @@ int device_add(struct device *dev)
>>>                 dev->kobj.parent = kobj;
>>>
>>>         /* use parent numa_node */
>>> -       if (parent)
>>> +       if (parent && (parent != &platform_bus))
>>
>> This is only fixing one specific case, but I think things are broken
>> for any case where the NUMA associativity if not set at the top level
>> bus node. I think this should be something like:
>>
>> if (parent && (dev_to_node(dev) != NO_NUMA_NODE))
>
> It seems a mistake, we should use equal sign.
> if (parent && (dev_to_node(dev) == NUMA_NO_NODE))

Ah, yes.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH 2/2] of/pci: Fix memory leak in of_pci_get_host_bridge_resources
Date: Thu, 23 Mar 2017 16:22:19 +0800
Message-ID: <58D385BB.8010502@rock-chips.com>
References: <1490149546-4062-1-git-send-email-jeffy.chen@rock-chips.com> <1490149546-4062-2-git-send-email-jeffy.chen@rock-chips.com> <CAL_JsqL7eqJCKhsGuCtqoCXW=KpXrjka+4ZX4VCYDyFFY5RYFg@mail.gmail.com> <CAL_JsqLiZB2cQ1h+hFdRm4HXvi9WRL6HsUDvW8SxqjwVndbTxg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLiZB2cQ1h+hFdRm4HXvi9WRL6HsUDvW8SxqjwVndbTxg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, toshi.kani-ZPxbGqLxI0U@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 03/22/2017 10:55 PM, Rob Herring wrote:
> On Wed, Mar 22, 2017 at 9:39 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Tue, Mar 21, 2017 at 9:25 PM, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>>> Currently we only free the allocated resource struct when error.
>>> This would cause memory leak after pci_free_resource_list.
>>>
>>> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> ---
>>>
>>>   drivers/of/of_pci.c | 48 +++++++++++++++---------------------------------
>>>   1 file changed, 15 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
>>> index 0ee42c3..269393bc 100644
>>> --- a/drivers/of/of_pci.c
>>> +++ b/drivers/of/of_pci.c
>>> @@ -189,9 +189,7 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
>>>                          unsigned char busno, unsigned char bus_max,
>>>                          struct list_head *resources, resource_size_t *io_base)
>>>   {
>>> -       struct resource_entry *window;
>>> -       struct resource *res;
>>> -       struct resource *bus_range;
>>> +       struct resource res;
>>>          struct of_pci_range range;
>>>          struct of_pci_range_parser parser;
>>>          char range_type[4];
>>> @@ -200,24 +198,19 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
>>>          if (io_base)
>>>                  *io_base = (resource_size_t)OF_BAD_ADDR;
>>>
>>> -       bus_range = kzalloc(sizeof(*bus_range), GFP_KERNEL);
>>> -       if (!bus_range)
>>> -               return -ENOMEM;
>>> -
>>>          pr_info("host bridge %s ranges:\n", dev->full_name);
>>>
>>> -       err = of_pci_parse_bus_range(dev, bus_range);
>>> +       err = of_pci_parse_bus_range(dev, &res);
>>>          if (err) {
>>> -               bus_range->start = busno;
>>> -               bus_range->end = bus_max;
>>> -               bus_range->flags = IORESOURCE_BUS;
>>> -               pr_info("  No bus range found for %s, using %pR\n",
>>> -                       dev->full_name, bus_range);
>>> +               res.start = busno;
>>> +               res.end = bus_max;
>>> +               res.flags = IORESOURCE_BUS;
>>> +               pr_info("  No bus range found for %s\n", dev->full_name);
>>>          } else {
>>> -               if (bus_range->end > bus_range->start + bus_max)
>>> -                       bus_range->end = bus_range->start + bus_max;
>>> +               if (res.end > res.start + bus_max)
>>> +                       res.end = res.start + bus_max;
>>>          }
>>> -       pci_add_resource(resources, bus_range);
>>> +       pci_add_resource(resources, &res);
>>
>> You are passing a stack variable to pci_add_resource and it doesn't
>> make a copy of it. I assume the resource needs to live after you exit
>> this function.
>
> Ah, found your 1st patch changing the behavior. I'm surprised that
> change works without affecting anyone else.
sorry, i should add a cover-letter first. and you're right, that would 
affect others(for example the ioport_resource/iomem_resource).
>
>> If we have a leak, can't you just add a free in the correct spot? That
>> would be a lot easier to review.
it seems hard to tell which resources in the list need to be freed after 
all...
>>
>> Rob
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

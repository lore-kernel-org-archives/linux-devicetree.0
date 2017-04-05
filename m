From: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of/pci: Fix memory leak in of_pci_get_host_bridge_resources
Date: Wed, 05 Apr 2017 10:22:07 +0800
Message-ID: <58E454CF.7050501@rock-chips.com>
References: <1490256755-889-1-git-send-email-jeffy.chen@rock-chips.com> <1490256755-889-3-git-send-email-jeffy.chen@rock-chips.com> <CAL_Jsq+xxG6w6J+Zz-kcJ+rA9jJomyHFiazHzcPHuQizn-4-wg@mail.gmail.com> <CAE_wzQ9ZVDiDGP4k_2i2KL4JxtRn_S7gjFXUTYZncMLx2m77gQ@mail.gmail.com> <CAErSpo6CZ1hoHyzEnWBi7VDr51bLurF4-4t=-v4jH27kOpzYrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAErSpo6CZ1hoHyzEnWBi7VDr51bLurF4-4t=-v4jH27kOpzYrg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, toshi.kani-ZPxbGqLxI0U@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On 04/05/2017 03:18 AM, Bjorn Helgaas wrote:
> On Thu, Mar 23, 2017 at 5:58 PM, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> On Thu, Mar 23, 2017 at 3:07 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> On Thu, Mar 23, 2017 at 3:12 AM, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>>>> Currently we only free the allocated resource struct when error.
>>>> This would cause memory leak after pci_free_resource_list.
>>>>
>>>> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> Don't change the resource_list_create_entry's behavior.
>>>>
>>>>   drivers/of/of_pci.c | 57 +++++++++++++++++++++++------------------------------
>>>>   1 file changed, 25 insertions(+), 32 deletions(-)
>>>>
>>>> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
>>>> index 0ee42c3..a0ec246 100644
>>>> --- a/drivers/of/of_pci.c
>>>> +++ b/drivers/of/of_pci.c
>>>> @@ -190,8 +190,7 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
>>>>                          struct list_head *resources, resource_size_t *io_base)
>>>>   {
>>>>          struct resource_entry *window;
>>>> -       struct resource *res;
>>>> -       struct resource *bus_range;
>>>> +       struct resource res;
>>>>          struct of_pci_range range;
>>>>          struct of_pci_range_parser parser;
>>>>          char range_type[4];
>>>> @@ -200,24 +199,24 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
>>>>          if (io_base)
>>>>                  *io_base = (resource_size_t)OF_BAD_ADDR;
>>>>
>>>> -       bus_range = kzalloc(sizeof(*bus_range), GFP_KERNEL);
>>>> -       if (!bus_range)
>>>> -               return -ENOMEM;
>>>> -
>>>>          pr_info("host bridge %s ranges:\n", dev->full_name);
>>>>
>>>> -       err = of_pci_parse_bus_range(dev, bus_range);
>>>> +       err = of_pci_parse_bus_range(dev, &res);
>>>>          if (err) {
>>>> -               bus_range->start = busno;
>>>> -               bus_range->end = bus_max;
>>>> -               bus_range->flags = IORESOURCE_BUS;
>>>> -               pr_info("  No bus range found for %s, using %pR\n",
>>>> -                       dev->full_name, bus_range);
>>>> +               res.start = busno;
>>>> +               res.end = bus_max;
>>>> +               res.flags = IORESOURCE_BUS;
>>>> +               pr_info("  No bus range found for %s\n", dev->full_name);
>>>>          } else {
>>>> -               if (bus_range->end > bus_range->start + bus_max)
>>>> -                       bus_range->end = bus_range->start + bus_max;
>>>> +               if (res.end > res.start + bus_max)
>>>> +                       res.end = res.start + bus_max;
>>>> +       }
>>>> +       window = pci_add_resource(resources, NULL);
>>>> +       if (!window) {
>>>> +               err = -ENOMEM;
>>>> +               goto parse_failed;
>>>>          }
>>>> -       pci_add_resource(resources, bus_range);
>>>> +       *window->res = res;
>>>
>>> Well, now this seems racy. You add a blank resource to the list first
>>> and then fill it in.
>>>
>>
>> Huh? There is absolutely no guarantees for concurrent access here.
>> pcI_add_resource_offset() first adds a resource and then modifies
>> offset. Here we add an empty resource and then fill it in.
>
> I don't really like this pattern either.  Even if there's no actual
> racy behavior, it takes more analysis than necessary to figure that
> out.
>
> pci_add_resource_offset() allocates a resource list entry, sets the
> offset, then adds it to the list.  It doesn't update a resource entry
> that might be visible to anybody else.  Here we do update a resource
> that is already visible to others because it's already on the list.
i was following ./drivers/pnp/resource.c, but i'm agree this is not a 
good way.

i'll upload a new version to fix this in another way. more ideas:
1/ pass a struct device to of_pci_get_host_bridge_resources and use 
devm_kzalloc
2/ add a new type of flags(or reuse IORESOURCE_AUTO) to tell 
pci_free_resource_list to kfree them)
3/ add new helpers of of_pci_add_resource[_offset] to alloc empty res, 
fill it, add to list.
>
> Bjorn
>
> BTW, please CC linux-pci on the entire series so it's easier to
> review.  I don't know where you envision having this applied, but I
> only apply things to the PCI tree after they appear on linux-pci.
>
oh, sorry, didn't notice that, will do in next version.
>
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of/pci: Fix memory leak in of_pci_get_host_bridge_resources
Date: Fri, 24 Mar 2017 09:39:32 +0800
Message-ID: <58D478D4.5090403@rock-chips.com>
References: <1490256755-889-1-git-send-email-jeffy.chen@rock-chips.com> <1490256755-889-3-git-send-email-jeffy.chen@rock-chips.com> <CAL_Jsq+xxG6w6J+Zz-kcJ+rA9jJomyHFiazHzcPHuQizn-4-wg@mail.gmail.com> <CAE_wzQ9ZVDiDGP4k_2i2KL4JxtRn_S7gjFXUTYZncMLx2m77gQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAE_wzQ9ZVDiDGP4k_2i2KL4JxtRn_S7gjFXUTYZncMLx2m77gQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, toshi.kani-ZPxbGqLxI0U@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob & Dmitry,

On 03/24/2017 06:58 AM, Dmitry Torokhov wrote:
> On Thu, Mar 23, 2017 at 3:07 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Thu, Mar 23, 2017 at 3:12 AM, Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>>> Currently we only free the allocated resource struct when error.
>>> This would cause memory leak after pci_free_resource_list.
>>>
>>> Signed-off-by: Jeffy Chen <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>>> ---
>>>
>>> Changes in v2:
>>> Don't change the resource_list_create_entry's behavior.
>>>
>>>   drivers/of/of_pci.c | 57 +++++++++++++++++++++++------------------------------
>>>   1 file changed, 25 insertions(+), 32 deletions(-)
>>>
>>> diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
>>> index 0ee42c3..a0ec246 100644
>>> --- a/drivers/of/of_pci.c
>>> +++ b/drivers/of/of_pci.c
>>> @@ -190,8 +190,7 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
>>>                          struct list_head *resources, resource_size_t *io_base)
>>>   {
>>>          struct resource_entry *window;
>>> -       struct resource *res;
>>> -       struct resource *bus_range;
>>> +       struct resource res;
>>>          struct of_pci_range range;
>>>          struct of_pci_range_parser parser;
>>>          char range_type[4];
>>> @@ -200,24 +199,24 @@ int of_pci_get_host_bridge_resources(struct device_node *dev,
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
>>> +       }
>>> +       window = pci_add_resource(resources, NULL);
>>> +       if (!window) {
>>> +               err = -ENOMEM;
>>> +               goto parse_failed;
>>>          }
>>> -       pci_add_resource(resources, bus_range);
>>> +       *window->res = res;
>>
>> Well, now this seems racy. You add a blank resource to the list first
>> and then fill it in.
>>
>
> Huh? There is absolutely no guarantees for concurrent access here.
> pcI_add_resource_offset() first adds a resource and then modifies
> offset. Here we add an empty resource and then fill it in.
currently, we are using of_pci_get_host_bridge_resources in this pattern:

create resource list:
         LIST_HEAD(res);
...
add resources into the list:
         err = of_pci_get_host_bridge_resources(dev->of_node, 0, 0xff,
                                                &res, &io_base);
...
walk over the list:
         /* Get the I/O and memory ranges from DT */
         resource_list_for_each_entry(win, &res) {

so only of_pci_get_host_bridge_resources is accessing this list at that 
time.

and an empty resource is harmless i think(with zero size and flags) ;)

maybe i should add some comments in the patch

>
> Thanks.
>


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

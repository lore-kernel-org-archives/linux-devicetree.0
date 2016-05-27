From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] of/numa: fix a memory@ dt node can only contains one
 memory block
Date: Thu, 26 May 2016 23:20:55 -0500
Message-ID: <CAL_JsqJXu36qYMOZeWDnMQ8BnOxMrixv5N70hvTjDixhMCQKRw@mail.gmail.com>
References: <1464230639-9852-1-git-send-email-thunder.leizhen@huawei.com>
 <1464230639-9852-2-git-send-email-thunder.leizhen@huawei.com>
 <20160526131345.GA12024@rob-hp-laptop> <5747C0BF.505@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5747C0BF.505-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Leizhen (ThunderTown)" <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ganapatrao Kulkarni <gkulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Robert Richter <rrichter-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 26, 2016 at 10:36 PM, Leizhen (ThunderTown)
<thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>
>
> On 2016/5/26 21:13, Rob Herring wrote:
>> On Thu, May 26, 2016 at 10:43:58AM +0800, Zhen Lei wrote:
>>> For a normal memory@ devicetree node, its reg property can contains more
>>> memory blocks.
>>>
>>> Because we don't known how many memory blocks maybe contained, so we try
>>> from index=0, increase 1 until error returned(the end).
>>>
>>> Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  drivers/of/of_numa.c | 30 ++++++++++++++++++++----------
>>>  1 file changed, 20 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
>>> index 21d831f..2c5f249 100644
>>> --- a/drivers/of/of_numa.c
>>> +++ b/drivers/of/of_numa.c
>>> @@ -63,7 +63,7 @@ static int __init of_numa_parse_memory_nodes(void)
>>>      struct device_node *np = NULL;
>>>      struct resource rsrc;
>>>      u32 nid;
>>> -    int r = 0;
>>> +    int i, r = 0;
>>>
>>>      for (;;) {
>>>              np = of_find_node_by_type(np, "memory");
>>> @@ -82,17 +82,27 @@ static int __init of_numa_parse_memory_nodes(void)
>>>                      /* some other error */
>>>                      break;
>>>
>>> -            r = of_address_to_resource(np, 0, &rsrc);
>>> -            if (r) {
>>> -                    pr_err("NUMA: bad reg property in memory node\n");
>>> -                    break;
>>> +            for (i = 0; ; i++) {
>>> +                    r = of_address_to_resource(np, i, &rsrc);
>>> +                    if (r) {
>>> +                            /* reached the end of of_address */
>>> +                            if (i > 0) {
>>> +                                    r = 0;
>>> +                                    break;
>>> +                            }
>>> +
>>> +                            pr_err("NUMA: bad reg property in memory node\n");
>>> +                            goto finished;
>>> +                    }
>>> +
>>> +                    r = numa_add_memblk(nid, rsrc.start,
>>> +                                        rsrc.end - rsrc.start + 1);
>>> +                    if (r)
>>> +                            goto finished;
>>>              }
>>> -
>>> -            r = numa_add_memblk(nid, rsrc.start,
>>> -                                rsrc.end - rsrc.start + 1);
>>> -            if (r)
>>> -                    break;
>>>      }
>>> +
>>> +finished:
>>>      of_node_put(np);
>>
>> This function can be simplified down to:
>>
>>       for_each_node_by_type(np, "memory") {
> OK, That's good.
>
>>               r = of_property_read_u32(np, "numa-node-id", &nid);
>>               if (r == -EINVAL)
>>                       /*
>>                        * property doesn't exist if -EINVAL, continue
>>                        * looking for more memory nodes with
>>                        * "numa-node-id" property
>>                        */
>>                       continue;
> Hi, everybody:
>     If some "memory" node contains "numa-node-id", but some others missed. Can we simply ignored it?
> I think we should break out too, and faking to only have node0.

Continuing to work is probably better than not.

>
>>               else if (r)
>>                       /* some other error */
>>                       break;
>>
>>               r = of_address_to_resource(np, 0, &rsrc);
>>               for (i = 0; !r; i++, r = of_address_to_resource(np, i,
>
> But r(non-zero) is just break this loop, the original is break the outer for (;;) loop

It is not really the kernel's job to validate the DT. If there's
random things in it then kernel's behavior is undefined.

>
> How about as below?
>
>         for_each_node_by_type(np, "memory") {
>                 ... ...
>
>                 for (i = 0; !of_address_to_resource(np, i, &rsrc); i++) {
>                         r = numa_add_memblk(nid, rsrc.start,
>                                             rsrc.end - rsrc.start + 1);
>                         if (r)
>                                 goto finished;
>                 }
>
>                 if (!i)
>                         pr_err("NUMA: bad reg property in memory node\n");
>         }
>
> finished:

Please try to avoid the goto. You can check r in the outer loop too.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

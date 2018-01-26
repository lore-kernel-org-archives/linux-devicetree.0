From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: use hash based search in of_find_node_by_phandle
Date: Fri, 26 Jan 2018 13:34:50 -0800
Message-ID: <42ea456e-6728-cdf6-4cfe-f3de352216f4@gmail.com>
References: <1516875247-19599-1-git-send-email-cpandya@codeaurora.org>
 <5a7793df-725e-608d-778b-cb81fde0cc64@gmail.com>
 <13846fcb-3aa2-a4fb-1bd8-e624855f105d@codeaurora.org>
 <2ac0d70d-074d-5eff-77e9-29d1a246a3ef@gmail.com>
 <c1c21be3-c279-653c-2529-a9cc325865cc@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c1c21be3-c279-653c-2529-a9cc325865cc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/26/18 13:29, Frank Rowand wrote:
> On 01/26/18 13:27, Frank Rowand wrote:
>> On 01/26/18 00:22, Chintan Pandya wrote:
>>>
>>>
>>> On 1/26/2018 1:24 AM, Frank Rowand wrote:
>>>> On 01/25/18 02:14, Chintan Pandya wrote:
>>>>> of_find_node_by_phandle() takes a lot of time finding
>>>>> right node when your intended device is too right-side
>>>>> in the fdt. Reason is, we search each device serially
>>>>> from the fdt, starting from left-most to right-most.
>>>> Please give me a pointer to the code that is doing
>>>> this search.
>>>>
>>>> -Frank
>>> You can refer include/linux/of.h
>>>
>>> #define for_each_of_allnodes_from(from, dn) \
>>>         for (dn = __of_find_all_nodes(from); dn; dn = __of_find_all_nodes(dn))
>>> #define for_each_of_allnodes(dn) for_each_of_allnodes_from(NULL, dn)
>>>
>>> where __of_find_all_nodes() does
>>>
>>> struct device_node *__of_find_all_nodes(struct device_node *prev)
>>> {
>>>         struct device_node *np;
>>>         if (!prev) {
>>>                 np = of_root;
>>>         } else if (prev->child) {
>>>                 np = prev->child;
>>>         } else {
>>>                 /* Walk back up looking for a sibling, or the end of the structure */
>>>                 np = prev;
>>>                 while (np->parent && !np->sibling)
>>>                         np = np->parent;
>>>                 np = np->sibling; /* Might be null at the end of the tree */
>>>         }
>>>         return np;
>>> }
>>>
>>
>> Let me restate my question.
>>
>> Can you point me to the driver code that is invoking
>> the search?
>>
>> -Frank
>>
> 
> And also the .dts devicetree source file that you are seeing
> large overhead with.
> 

Sorry about dribbling out questions instead of all at once....

What is the hardware you are testing this on?
Processor?
Cache size?
Memory size?
Processor frequency?
Any other attribute of the system that will help me understand
the boot performance you are seeing?

Thanks,

Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

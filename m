From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3] of: cache phandle nodes to reduce cost of
 of_find_node_by_phandle()
Date: Fri, 16 Feb 2018 14:20:22 -0800
Message-ID: <46d5fc76-33e3-d54a-26b8-e9bb8332924d@gmail.com>
References: <1518655979-10910-1-git-send-email-frowand.list@gmail.com>
 <207e055e-1074-9010-e719-2a4c13ede9f9@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <207e055e-1074-9010-e719-2a4c13ede9f9-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/16/18 01:04, Chintan Pandya wrote:
> 
> 
> On 2/15/2018 6:22 AM, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> Create a cache of the nodes that contain a phandle property.  Use this
>> cache to find the node for a given phandle value instead of scanning
>> the devicetree to find the node.  If the phandle value is not found
>> in the cache, of_find_node_by_phandle() will fall back to the tree
>> scan algorithm.
>>

< snip >

>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index ad28de96e13f..ab545dfa9173 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -91,10 +91,69 @@ int __weak of_node_to_nid(struct device_node *np)
>>   }
>>   #endif
>>   +static struct device_node **phandle_cache;
>> +static u32 phandle_cache_mask;
>> +
>> +/*
>> + * Assumptions behind phandle_cache implementation:
>> + *   - phandle property values are in a contiguous range of 1..n
>> + *
>> + * If the assumptions do not hold, then
>> + *   - the phandle lookup overhead reduction provided by the cache
>> + *     will likely be less
>> + */
>> +static void of_populate_phandle_cache(void)
>> +{
>> +    unsigned long flags;
>> +    u32 cache_entries;
>> +    struct device_node *np;
>> +    u32 phandles = 0;
>> +
>> +    raw_spin_lock_irqsave(&devtree_lock, flags);
>> +
>> +    kfree(phandle_cache);
> 
> I couldn't understood this. Everything else looks good to me.

I will be adding a call to of_populate_phandle_cache() from the
devicetree overlay code.  I put the kfree here so that the previous
cache memory is freed when a new cache is created.

Adding the call from the overlay code is not done in this
series because I have a patch series modifying overlays and
I do not want to create a conflict or ordering between that
series and that patch.  The lack of the call from overlay
code means that overlay code will gain some of the overhead
reduction from this patch, but possibly not the entire reduction.


> 
>> +    phandle_cache = NULL;
>> +
>> +    for_each_of_allnodes(np)

< snip >
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

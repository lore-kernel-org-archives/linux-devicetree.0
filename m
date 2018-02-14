From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] of: cache phandle nodes to reduce cost of
 of_find_node_by_phandle()
Date: Tue, 13 Feb 2018 17:00:44 -0800
Message-ID: <75515998-10e0-5025-7828-649112231067@gmail.com>
References: <1518416868-8804-1-git-send-email-frowand.list@gmail.com>
 <6e967dd4-0fae-a912-88cd-b60f40ec0727@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6e967dd4-0fae-a912-88cd-b60f40ec0727-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 02/11/18 22:56, Frank Rowand wrote:
> Hi Rob,
> 
> On 02/11/18 22:27, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>>
>> Create a cache of the nodes that contain a phandle property.  Use this
>> cache to find the node for a given phandle value instead of scanning
>> the devicetree to find the node.  If the phandle value is not found
>> in the cache, of_find_node_by_phandle() will fall back to the tree
>> scan algorithm.
>>
>> The cache is initialized in of_core_init().
>>
>> The cache is freed via a late_initcall_sync() if modules are not
>> enabled.
>>
>> Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
>> ---
>>
>> Changes since v1:
>>   - change short description from
>>     of: cache phandle nodes to reduce cost of of_find_node_by_phandle()
>>   - rebase on v4.16-rc1
>>   - reorder new functions in base.c to avoid forward declaration
>>   - add locking around kfree(phandle_cache) for memory ordering
>>   - add explicit check for non-null of phandle_cache in
>>     of_find_node_by_phandle().  There is already a check for !handle,
>>     which prevents accessing a null phandle_cache, but that dependency
>>     is not obvious, so this check makes it more apparent.
>>   - do not free phandle_cache if modules are enabled, so that
>>     cached phandles will be available when modules are loaded
> 
> < snip >
> 
> 
> 
> In a previous thread, you said:
> 
>> We should be able to do this earlier. We already walk the tree twice
>> in unflattening. We can get the max phandle (or number of phandles
>> IMO) on the first pass, allocate with the early allocator and then
>> populate the cache in the 2nd pass. AIUI, you can alloc with memblock
>> and then free with kfree as the memblock allocations get transferred
>> to the slab.
> 
> And I replied:
> 
>    Thanks for pointing out that kfree() can be used for memory alloced
>    with memblock.  I'll change to populate the cache earlier.
> 
> 
> I started to make this change when I moved forward to v4.16-rc1.  There
> are two obvious ways to do this.

< snip >

And I did not finish the explanation, sorry.  I meant to finish with saying
that given the drawbacks that I ended up not making the change for v2.

While modifying the patch to respond to the v2 comments, I decided to go
ahead and try using memblock to alloc memory earlier.  The result I got
was that when I tried to kfree() the memory at late_initcall_sync I got
a panic.  The alloc function I used is memblock_virt_alloc().  You mention
"slab" specifically.  Maybe the problem is that my system is using "slub"
instead.  Dunno...

-Frank
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

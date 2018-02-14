From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] of: cache phandle nodes to reduce cost of of_find_node_by_phandle()
Date: Wed, 14 Feb 2018 09:50:24 -0600
Message-ID: <CAL_JsqJQk8uiNKavOyB1AnawESxW17t4MTK7iM5X7t=BPNq0Rg@mail.gmail.com>
References: <1518416868-8804-1-git-send-email-frowand.list@gmail.com>
 <6e967dd4-0fae-a912-88cd-b60f40ec0727@gmail.com> <75515998-10e0-5025-7828-649112231067@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <75515998-10e0-5025-7828-649112231067@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Chintan Pandya <cpandya@codeaurora.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 13, 2018 at 7:00 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> Hi Rob,
>
> On 02/11/18 22:56, Frank Rowand wrote:
>> Hi Rob,
>>
>> On 02/11/18 22:27, frowand.list@gmail.com wrote:
>>> From: Frank Rowand <frank.rowand@sony.com>
>>>
>>> Create a cache of the nodes that contain a phandle property.  Use this
>>> cache to find the node for a given phandle value instead of scanning
>>> the devicetree to find the node.  If the phandle value is not found
>>> in the cache, of_find_node_by_phandle() will fall back to the tree
>>> scan algorithm.
>>>
>>> The cache is initialized in of_core_init().
>>>
>>> The cache is freed via a late_initcall_sync() if modules are not
>>> enabled.
>>>
>>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>>> ---
>>>
>>> Changes since v1:
>>>   - change short description from
>>>     of: cache phandle nodes to reduce cost of of_find_node_by_phandle()
>>>   - rebase on v4.16-rc1
>>>   - reorder new functions in base.c to avoid forward declaration
>>>   - add locking around kfree(phandle_cache) for memory ordering
>>>   - add explicit check for non-null of phandle_cache in
>>>     of_find_node_by_phandle().  There is already a check for !handle,
>>>     which prevents accessing a null phandle_cache, but that dependency
>>>     is not obvious, so this check makes it more apparent.
>>>   - do not free phandle_cache if modules are enabled, so that
>>>     cached phandles will be available when modules are loaded
>>
>> < snip >
>>
>>
>>
>> In a previous thread, you said:
>>
>>> We should be able to do this earlier. We already walk the tree twice
>>> in unflattening. We can get the max phandle (or number of phandles
>>> IMO) on the first pass, allocate with the early allocator and then
>>> populate the cache in the 2nd pass. AIUI, you can alloc with memblock
>>> and then free with kfree as the memblock allocations get transferred
>>> to the slab.
>>
>> And I replied:
>>
>>    Thanks for pointing out that kfree() can be used for memory alloced
>>    with memblock.  I'll change to populate the cache earlier.
>>
>>
>> I started to make this change when I moved forward to v4.16-rc1.  There
>> are two obvious ways to do this.
>
> < snip >
>
> And I did not finish the explanation, sorry.  I meant to finish with saying
> that given the drawbacks that I ended up not making the change for v2.
>
> While modifying the patch to respond to the v2 comments, I decided to go
> ahead and try using memblock to alloc memory earlier.  The result I got
> was that when I tried to kfree() the memory at late_initcall_sync I got
> a panic.  The alloc function I used is memblock_virt_alloc().  You mention
> "slab" specifically.  Maybe the problem is that my system is using "slub"
> instead.  Dunno...

Maybe memblock_free() still works? Or there's something else that
needs to be done to transfer them. In any case, I guess doing it later
is fine.

And by slab, I mean the allocator, not the implementation (which can
be slab, slub, or slob).

Rob

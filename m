From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: cache phandle nodes to decrease cost of
 of_find_node_by_phandle()
Date: Thu, 1 Feb 2018 00:59:02 -0800
Message-ID: <38cdcae5-ec0f-d1be-b024-1990d4387731@gmail.com>
References: <1517429142-25727-1-git-send-email-frowand.list@gmail.com>
 <5b84a166-c71b-3a41-9e7f-a7624a8441f6@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5b84a166-c71b-3a41-9e7f-a7624a8441f6@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chintan Pandya <cpandya@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/31/18 22:45, Chintan Pandya wrote:
> 
> 
> On 2/1/2018 1:35 AM, frowand.list@gmail.com wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
> 
>> +
>> +static void of_populate_phandle_cache(void)
>> +{
>> +    unsigned long flags;
>> +    phandle max_phandle;
>> +    u32 nodes = 0;
>> +    struct device_node *np;
>> +
>> +    if (phandle_cache)
>> +        return;
>> +
>> +    max_phandle = live_tree_max_phandle();
>> +
>> +    raw_spin_lock_irqsave(&devtree_lock, flags);
>> +
>> +    for_each_of_allnodes(np)
>> +        nodes++;
>> +
>> +    /* sanity cap for malformed tree */
>> +    if (max_phandle > nodes)
>> +        max_phandle = nodes;
> Shouldn't we speak up about this in kernel log ? May be WARN_ON() ?

Probably not.  If we care enough about a hand coded phandle property
value we should add a check to checkpatch and/or dtc instead of adding
the warning here.


>> +
>> +    phandle_cache = kzalloc((max_phandle + 1) * sizeof(*phandle_cache),
>> +                GFP_KERNEL);
> kzalloc (might_sleep) in critical context will break.

Yes, thanks.

I also need to ensure memory ordering in of_free_phandle_cache()
to ensure that max_phandle_cache is zero before the cache memory
is freed.


> Anyways, will fix this locally and share test results.

Thanks, I look forward to the results.


> Thanks,
> Chintan
> 

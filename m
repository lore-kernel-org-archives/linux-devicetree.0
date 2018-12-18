From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 2/2] of: __of_detach_node() - remove node from phandle
 cache
Date: Tue, 18 Dec 2018 10:57:38 -0800
Message-ID: <b81f9268-a36c-963d-5b1e-d81b38b05143@gmail.com>
References: <1545033396-24485-1-git-send-email-frowand.list@gmail.com>
 <1545033396-24485-3-git-send-email-frowand.list@gmail.com>
 <871s6gv30z.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <871s6gv30z.fsf@concordia.ellerman.id.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, robh+dt@kernel.org, Michael Bringmann <mwb@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, Thomas Falcon <tlfalcon@linux.vnet.ibm.com>, Juliet Kim <minkim@us.ibm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/17/18 2:52 AM, Michael Ellerman wrote:
> Hi Frank,
> 
> frowand.list@gmail.com writes:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Non-overlay dynamic devicetree node removal may leave the node in
>> the phandle cache.  Subsequent calls to of_find_node_by_phandle()
>> will incorrectly find the stale entry.  Remove the node from the
>> cache.
>>
>> Add paranoia checks in of_find_node_by_phandle() as a second level
>> of defense (do not return cached node if detached, do not add node
>> to cache if detached).
>>
>> Reported-by: Michael Bringmann <mwb@linux.vnet.ibm.com>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
> 
> Similarly here can we add:
> 
> Fixes: 0b3ce78e90fc ("of: cache phandle nodes to reduce cost of of_find_node_by_phandle()")

Yes, thanks.


> Cc: stable@vger.kernel.org # v4.17+

Nope, 0b3ce78e90fc does not belong in stable (it is a feature, not a bug
fix).  So the bug will not be in stable.

I've debated with myself over this, because there is a possibility that
0b3ce78e90fc could somehow be put into a stable despite not being a
bug fix.  We can always explicitly request this patch series be added
to stable in that case.


> Thanks for doing this series.
> 
> Some minor comments below.
> 
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 6c33d63361b8..ad71864cecf5 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
>> @@ -162,6 +162,27 @@ int of_free_phandle_cache(void)
>>  late_initcall_sync(of_free_phandle_cache);
>>  #endif
>>  
>> +/*
>> + * Caller must hold devtree_lock.
>> + */
>> +void __of_free_phandle_cache_entry(phandle handle)
>> +{
>> +	phandle masked_handle;
>> +
>> +	if (!handle)
>> +		return;
> 
> We could fold the phandle_cache check into that if and return early for
> both cases couldn't we?

We could, but that would make the reason for checking phandle_cache
less obvious.  I would rather leave that check
> 
>> +	masked_handle = handle & phandle_cache_mask;
>> +
>> +	if (phandle_cache) {
> 
> Meaning this wouldn't be necessary.
> 
>> +		if (phandle_cache[masked_handle] &&
>> +		    handle == phandle_cache[masked_handle]->phandle) {
>> +			of_node_put(phandle_cache[masked_handle]);
>> +			phandle_cache[masked_handle] = NULL;
>> +		}
> 
> A temporary would help the readability here I think, eg:
> 
> 	struct device_node *np;
>         np = phandle_cache[masked_handle];
> 
> 	if (np && handle == np->phandle) {
> 		of_node_put(np);
> 		phandle_cache[masked_handle] = NULL;
> 	}

Yes, much cleaner.


>> @@ -1209,11 +1230,18 @@ struct device_node *of_find_node_by_phandle(phandle handle)
>>  		if (phandle_cache[masked_handle] &&
>>  		    handle == phandle_cache[masked_handle]->phandle)
>>  			np = phandle_cache[masked_handle];
>> +		if (np && of_node_check_flag(np, OF_DETACHED)) {
>> +			WARN_ON(1);
>> +			of_node_put(np);
>
> Do we really want to do the put here?
> 
> We're here because something has gone wrong, possibly even memory
> corruption such that np is not even pointing at a device node anymore.
> So it seems like it would be safer to just leave the ref count alone,
> possibly leak a small amount of memory, and NULL out the reference.

I like the concept of the code being a little bit paranoid.

But the bug that this check is likely to cache is the bug that led
to this series -- removing a devicetree node, but failing to remove
it from the cache as part of the removal.  So I think I'll leave
it as is.

> 
> 
> cheers
> 

Thanks for the thoughts and suggestions!

-Frank

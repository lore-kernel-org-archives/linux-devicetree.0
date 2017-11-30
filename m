From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH] of: overlay: fix memory leak of ovcs on error exit path
Date: Thu, 30 Nov 2017 10:01:50 -0500
Message-ID: <788fe2e4-03b2-6f9d-f5dd-5bdf0c48892f@gmail.com>
References: <20171129191750.25254-1-colin.king@canonical.com>
 <dcb4e2a4-707b-0ccc-e12b-c6fa4ef251b7@gmail.com>
 <806a0467-87c8-4100-c7f2-54cfa8732465@canonical.com>
 <75d7d1c8-8a19-1a4c-0796-7cf69fdebe6d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <75d7d1c8-8a19-1a4c-0796-7cf69fdebe6d@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Ian King <colin.king@canonical.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/30/17 08:37, Frank Rowand wrote:
> Hi Colin, Rob,
> 
> On 11/30/17 07:18, Colin Ian King wrote:
>> On 30/11/17 12:14, Frank Rowand wrote:
>>> On 11/29/17 14:17, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> Currently if the call to of_resolve_phandles fails then then ovcs
>>>> is not kfree'd on the error exit path.  Rather than try and make
>>>> the clean up exit path more convoluted, fix this by just kfree'ing
>>>> ovcs at the point of error detection and exit via the same exit
>>>> path.
>>>>
>>>> Detected by CoverityScan, CID#1462296 ("Resource Leak")
>>>>
>>>> Fixes: f948d6d8b792 ("of: overlay: avoid race condition between applying multiple overlays")
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> ---
>>>>  drivers/of/overlay.c | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>>>> index 53bc9e3f0b98..6c8efe7d8cbb 100644
>>>> --- a/drivers/of/overlay.c
>>>> +++ b/drivers/of/overlay.c
>>>> @@ -708,8 +708,10 @@ int of_overlay_apply(struct device_node *tree, int *ovcs_id)
>>>>  	of_overlay_mutex_lock();
>>>>  
>>>>  	ret = of_resolve_phandles(tree);
>>>> -	if (ret)
>>>> +	if (ret) {
>>>> +		kfree(ovcs);
>>>>  		goto err_overlay_unlock;
>>>> +	}
>>>>  
>>>>  	mutex_lock(&of_mutex);
>>>>  
>>>>
>>>
>>> False coverity warning.  ovcs is freed in free_overlay_changeset().
>>>
>>
>> The error exit path is via err_overlay_unlock:
>>
>> err_overlay_unlock:
>>         of_overlay_mutex_unlock();
>>
>> out:
>>         pr_debug("%s() err=%d\n", __func__, ret);
>>
>>         return ret;
>>
>> ..so there is no call to free_overlay_changeset there.
>>
>> Colin
>>
> 
> OK, I was looking at 4.15-rc1.  You must be looking at a later version where
> "[PATCH 1/2] of: overlay: Fix cleanup order in of_overlay_apply()" has been
> applied.  Thanks for providing the extra details about the exit path so I
> could see that.
> 
> Rob, I think that the fix for cleanup order was not the best way to fix that
> problem.  A better method would have been to move "mutex_lock(&of_mutex);"
> up 5 lines, to just before calling of_reserve_phandles().

It is getting late (midnight my time), so I really should revisit this all
tomorrow.  My last comment ("move ... up 5 lines") is probably wrong. 

I'll look at this after some sleep.


> The problem
> found by coverity was caused by the "Fix cleanup order" patch.
> 
> I can create that alternate fix if you would like, but I am traveling
> right now and don't want to submit a patch without boot testing, so
> there will be a slight delay.
> 
> -Frank

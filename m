From: "Leizhen (ThunderTown)" <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 05/14] arm64/numa: avoid inconsistent information to be
 printed
Date: Wed, 31 Aug 2016 10:29:16 +0800
Message-ID: <57C640FC.7060703@huawei.com>
References: <1472024693-12912-1-git-send-email-thunder.leizhen@huawei.com>
 <1472024693-12912-6-git-send-email-thunder.leizhen@huawei.com>
 <20160826124746.GB30302@arm.com> <57C15560.6020702@huawei.com>
 <20160830175115.GL24906@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160830175115.GL24906-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 2016/8/31 1:51, Will Deacon wrote:
> On Sat, Aug 27, 2016 at 04:54:56PM +0800, Leizhen (ThunderTown) wrote:
>>
>>
>> On 2016/8/26 20:47, Will Deacon wrote:
>>> On Wed, Aug 24, 2016 at 03:44:44PM +0800, Zhen Lei wrote:
>>>> numa_init(of_numa_init) may returned error because of numa configuration
>>>> error. So "No NUMA configuration found" is inaccurate. In fact, specific
>>>> configuration error information should be immediately printed by the
>>>> testing branch.
>>>>
>>>> Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>  arch/arm64/mm/numa.c | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
>>>> index 5bb15ea..d97c6e2 100644
>>>> --- a/arch/arm64/mm/numa.c
>>>> +++ b/arch/arm64/mm/numa.c
>>>> @@ -335,8 +335,10 @@ static int __init numa_init(int (*init_func)(void))
>>>>  	if (ret < 0)
>>>>  		return ret;
>>>>
>>>> -	if (nodes_empty(numa_nodes_parsed))
>>>> +	if (nodes_empty(numa_nodes_parsed)) {
>>>> +		pr_info("No NUMA configuration found\n");
>>>>  		return -EINVAL;
>>>
>>> Hmm, but dummy_numa_init calls node_set(nid, numa_nodes_parsed) for a
>>> completely artificial setup, created by adding all memblocks to node 0,
>>> so this new message will be suppressed even though things really did go
>>> wrong.
>> It will be printed by the former: numa_init(of_numa_init)
> 
> Does that print an error for every possible failure case? What about the
> acpi path?
I think acpi path should print error by itself. The reason maybe:
1. In numa_init and its sub function, all error paths printed error immediately, except arm64_acpi_numa_init.
2. Suppose numa_init returns error, we do not print the returned error code, so the user don't known what problem cause acpi numa failed.


> 
>>> In that case, don't we want to print *something* (like we do today in
>>> dummy_numa_init) but maybe not "No NUMA configuration found"? What
>>> exactly do you find inaccurate about the current message?
>> For example:
>> [    0.000000] NUMA: No distance-matrix property in distance-map
>> [    0.000000] No NUMA configuration found
>>
>> So if of_numa_init or arm64_acpi_numa_init returned error, because of
>> some numa configuration error had been found, it's no good to print "No
>> NUMA ...".
> 
> Sure, I'm all for changing the message. I just think removing it is
> probably unhelpful. Something like:
> 
> "NUMA: Failed to initialise from firmware"
I think adding this into arm64_acpi_numa_init will be better, maybe we should print 'ret' further:

int __init arm64_acpi_numa_init(void)
{
	int ret;

	ret = acpi_numa_init();
	if (ret) {
+		pr_info("Failed to initialise from firmware\n");
		return ret;
	}

> 
> might do the trick?
> 
> Will
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

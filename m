From: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH] of, numa: Validate some distance map rules
Date: Wed, 7 Nov 2018 16:24:45 +0000
Message-ID: <5b81e832-4ad0-13f2-1857-0764d175c61b@huawei.com>
References: <1541507973-149965-1-git-send-email-john.garry@huawei.com>
 <20181107154430.GA9996@brain-police> <20181107155552.GB18618@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107155552.GB18618@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Will Deacon <will.deacon@arm.com>
Cc: frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com, anshuman.khandual@arm.com, peterz@infradead.org
List-Id: devicetree@vger.kernel.org

On 07/11/2018 15:55, Rob Herring wrote:
> On Wed, Nov 07, 2018 at 03:44:31PM +0000, Will Deacon wrote:
>> Hi John,
>>
>> On Tue, Nov 06, 2018 at 08:39:33PM +0800, John Garry wrote:
>>> Currently the NUMA distance map parsing does not validate the distance
>>> table for the distance-matrix rules 1-2 in [1].
>>>
>>> However the arch NUMA code may enforce some of these rules, but not all.
>>> Such is the case for the arm64 port, which does not enforce the rule that
>>> the distance between separates nodes cannot equal LOCAL_DISTANCE.
>>>
>>> The patch adds the following rules validation:
>>> - distance of node to self equals LOCAL_DISTANCE
>>> - distance of separate nodes > LOCAL_DISTANCE
>>>
>>> A note on dealing with symmetrical distances between nodes:
>>>
>>> Validating symmetrical distances between nodes is difficult. If it were
>>> mandated in the bindings that every distance must be recorded in the
>>> table, validating symmetrical distances would be straightforward. However,
>>> it isn't.
>>>
>>> In addition to this, it is also possible to record [b, a] distance only
>>> (and not [a, b]). So, when processing the table for [b, a], we cannot
>>> assert that current distance of [a, b] != [b, a] as invalid, as [a, b]
>>> distance may not be present in the table and current distance would be
>>> default at REMOTE_DISTANCE.
>>>
>>> As such, we maintain the policy that we overwrite distance [a, b] = [b, a]
>>> for b > a. This policy is different to kernel ACPI SLIT validation, which
>>> allows non-symmetrical distances (ACPI spec SLIT rules allow it). However,
>>> the debug message is dropped as it may be misleading (for a distance which
>>> is later overwritten).
>>>
>>> Some final notes on semantics:
>>>
>>> - It is implied that it is the responsibility of the arch NUMA code to
>>>   reset the NUMA distance map for an error in distance map parsing.
>>>
>>> - It is the responsibility of the FW NUMA topology parsing (whether OF or
>>>   ACPI) to enforce NUMA distance rules, and not arch NUMA code.
>>>
>>> [1] Documents/devicetree/bindings/numa.txt
>>>
>>> Signed-off-by: John Garry <john.garry@huawei.com>
>>
>> Is it worth mentioning that the lack of this check was leading to a kernel
>> crash with a malformed DT entry?

Yeah, I was thinking in hindsight that I should have mentioned the 
yet-unresolved crash we avoid.

>
> So should be marked for stable too?

Probably. So this patch is masking a crash I have observed, which may be 
good enough reason on its own.

In addition, I would still say that failing to validate the distance map 
falls into the "oh, that's not good" category of stable rules.

>
>>
>>> diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
>>> index 35c64a4295e0..fe6b13608e51 100644
>>> --- a/drivers/of/of_numa.c
>>> +++ b/drivers/of/of_numa.c
>>> @@ -104,9 +104,14 @@ static int __init of_numa_parse_distance_map_v1(struct device_node *map)
>>>  		distance = of_read_number(matrix, 1);
>>>  		matrix++;
>>>
>>> +		if ((nodea == nodeb && distance != LOCAL_DISTANCE) ||
>>> +		    (nodea != nodeb && distance <= LOCAL_DISTANCE)) {
>>> +			pr_err("Invalid distance[node%d -> node%d] = %d\n",
>>> +			       nodea, nodeb, distance);
>>> +			return -EINVAL;
>>> +		}
>>> +
>>>  		numa_set_distance(nodea, nodeb, distance);
>>> -		pr_debug("distance[node%d -> node%d] = %d\n",
>>> -			 nodea, nodeb, distance);
>>
>> Looks good to me, although I'm not sure which tree this should go through.
>>
>> Acked-by: Will Deacon <will.deacon@arm.com>
>

Thanks Will.

> I'll take it. Please resend with the comment Will asked for.
>

OK, I'll repost an updated version.

> Rob
>

Cheers,
john

> .
>

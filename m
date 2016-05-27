From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 2/3] of/numa: fix a memory@ dt node can only contains one
 memory block
Date: Fri, 27 May 2016 11:36:31 +0800
Message-ID: <5747C0BF.505@huawei.com>
References: <1464230639-9852-1-git-send-email-thunder.leizhen@huawei.com>
 <1464230639-9852-2-git-send-email-thunder.leizhen@huawei.com>
 <20160526131345.GA12024@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160526131345.GA12024@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>, David Daney <david.daney@cavium.com>, Catalin Marinas <catalin.marinas@arm.com>, Xinwei Hu <huxinwei@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Will Deacon <will.deacon@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, Zefan Li <lizefan@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Grant Likely <grant.likely@linaro.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



On 2016/5/26 21:13, Rob Herring wrote:
> On Thu, May 26, 2016 at 10:43:58AM +0800, Zhen Lei wrote:
>> For a normal memory@ devicetree node, its reg property can contains more
>> memory blocks.
>>
>> Because we don't known how many memory blocks maybe contained, so we try
>> from index=0, increase 1 until error returned(the end).
>>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/of/of_numa.c | 30 ++++++++++++++++++++----------
>>  1 file changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
>> index 21d831f..2c5f249 100644
>> --- a/drivers/of/of_numa.c
>> +++ b/drivers/of/of_numa.c
>> @@ -63,7 +63,7 @@ static int __init of_numa_parse_memory_nodes(void)
>>  	struct device_node *np = NULL;
>>  	struct resource rsrc;
>>  	u32 nid;
>> -	int r = 0;
>> +	int i, r = 0;
>>
>>  	for (;;) {
>>  		np = of_find_node_by_type(np, "memory");
>> @@ -82,17 +82,27 @@ static int __init of_numa_parse_memory_nodes(void)
>>  			/* some other error */
>>  			break;
>>
>> -		r = of_address_to_resource(np, 0, &rsrc);
>> -		if (r) {
>> -			pr_err("NUMA: bad reg property in memory node\n");
>> -			break;
>> +		for (i = 0; ; i++) {
>> +			r = of_address_to_resource(np, i, &rsrc);
>> +			if (r) {
>> +				/* reached the end of of_address */
>> +				if (i > 0) {
>> +					r = 0;
>> +					break;
>> +				}
>> +
>> +				pr_err("NUMA: bad reg property in memory node\n");
>> +				goto finished;
>> +			}
>> +
>> +			r = numa_add_memblk(nid, rsrc.start,
>> +					    rsrc.end - rsrc.start + 1);
>> +			if (r)
>> +				goto finished;
>>  		}
>> -
>> -		r = numa_add_memblk(nid, rsrc.start,
>> -				    rsrc.end - rsrc.start + 1);
>> -		if (r)
>> -			break;
>>  	}
>> +
>> +finished:
>>  	of_node_put(np);
> 
> This function can be simplified down to:
> 
> 	for_each_node_by_type(np, "memory") {
OK, That's good.

> 		r = of_property_read_u32(np, "numa-node-id", &nid);
> 		if (r == -EINVAL)
> 			/*
> 			 * property doesn't exist if -EINVAL, continue
> 			 * looking for more memory nodes with
> 			 * "numa-node-id" property
> 			 */
> 			continue;
Hi, everybody:
    If some "memory" node contains "numa-node-id", but some others missed. Can we simply ignored it?
I think we should break out too, and faking to only have node0.

> 		else if (r)
> 			/* some other error */
> 			break;
> 
> 		r = of_address_to_resource(np, 0, &rsrc);
> 		for (i = 0; !r; i++, r = of_address_to_resource(np, i, 

But r(non-zero) is just break this loop, the original is break the outer for (;;) loop

How about as below?

	for_each_node_by_type(np, "memory") {
		... ...

		for (i = 0; !of_address_to_resource(np, i, &rsrc); i++) {
                        r = numa_add_memblk(nid, rsrc.start,
                                            rsrc.end - rsrc.start + 1);
                        if (r)
                                goto finished;
                }

		if (!i)
			pr_err("NUMA: bad reg property in memory node\n");
	}

finished:
	

> &rsrc)) {
> 			r = numa_add_memblk(nid, rsrc.start,
> 				    rsrc.end - rsrc.start + 1);
> 		}
> 	}
> 	of_node_put(np);
> 
> 	return r;
> 
> 
> Perhaps with a "if (!i && r) pr_err()" for an error message at the end.
> 
> Rob
> 
> .
> 

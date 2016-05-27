From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH 2/3] of/numa: fix a memory@ dt node can only contains
 one memory block
Date: Fri, 27 May 2016 09:07:02 -0700
Message-ID: <574870A6.40003@caviumnetworks.com>
References: <1464230639-9852-1-git-send-email-thunder.leizhen@huawei.com>
 <1464230639-9852-2-git-send-email-thunder.leizhen@huawei.com>
 <20160526131345.GA12024@rob-hp-laptop> <5747C0BF.505@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5747C0BF.505@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Cc: David Daney <david.daney@cavium.com>, Catalin Marinas <catalin.marinas@arm.com>, Xinwei Hu <huxinwei@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Will Deacon <will.deacon@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, devicetree <devicetree@vger.kernel.org>, Zefan Li <lizefan@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>, Grant Likely <grant.likely@linaro.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 05/26/2016 08:36 PM, Leizhen (ThunderTown) wrote:
[...]		continue;
> Hi, everybody:
>      If some "memory" node contains "numa-node-id", but some others missed. Can we simply ignored it?
> I think we should break out too, and faking to only have node0.


I think if some "memory" nodes contain "numa-node-id" and others do not, 
then you have a defective device tree.  In this case I think we must 
continue with the existing behavior, and indicate failure.  This will 
cause the architecture specific NUMA code to disable NUMA and force 
everything onto a singl pseudo-NUMA-node.

I doubt there is anything to be gained by guessing which NUMA node 
orphaned "memory" nodes belong to.

>
>> 		else if (r)
>> 			/* some other error */
>> 			break;
>>
>> 		r = of_address_to_resource(np, 0, &rsrc);
>> 		for (i = 0; !r; i++, r = of_address_to_resource(np, i,
>
> But r(non-zero) is just break this loop, the original is break the outer for (;;) loop
>
> How about as below?
>
> 	for_each_node_by_type(np, "memory") {
> 		... ...
>
> 		for (i = 0; !of_address_to_resource(np, i, &rsrc); i++) {
>                          r = numa_add_memblk(nid, rsrc.start,
>                                              rsrc.end - rsrc.start + 1);
>                          if (r)
>                                  goto finished;
>                  }
>
> 		if (!i)
> 			pr_err("NUMA: bad reg property in memory node\n");
> 	}
>
> finished:
> 	
>
>> &rsrc)) {
>> 			r = numa_add_memblk(nid, rsrc.start,
>> 				    rsrc.end - rsrc.start + 1);
>> 		}
>> 	}
>> 	of_node_put(np);
>>
>> 	return r;
>>
>>
>> Perhaps with a "if (!i && r) pr_err()" for an error message at the end.
>>
>> Rob
>>
>> .
>>
>

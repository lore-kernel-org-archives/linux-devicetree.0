From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: new cpu iteration code...
Date: Sun, 22 Sep 2013 16:29:15 -0400 (EDT)
Message-ID: <20130922.162915.1269060096375052591.davem@davemloft.net>
References: <20130919.133805.1227344435777214810.davem@davemloft.net>
	<523C7B54.3070706@arm.com>
	<523F4F6F.8030209@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <523F4F6F.8030209-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Sudeep.KarkadaNagesha-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sun, 22 Sep 2013 15:13:35 -0500

> On 09/20/2013 11:44 AM, Sudeep KarkadaNagesha wrote:
>> On 19/09/13 18:38, David Miller wrote:
>>> From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> Date: Thu, 19 Sep 2013 08:26:04 -0500
>>>
>>>> The simple solution here is to just remove the warning. It doesn't
>>>> appear to me that sparc ever sets the cpu device of_node pointer.
>>>
>>> Why wouldn't I want sparc to have this functionality now that the
>>> code is generically available.
>>>
>> Makes sense, but as you mentioned before we need to match other property
>> names namely "upa-portid", "portid" or "cpuid" for cpu physical id right
>> ? Are all these 32-bit values ?
>> 
>>>> Are there any cases on where sparc does have a /cpus node? If so we'd
>>>> need to make of_get_cpu_node a weak function or depend on a kconfig option.
>>>
>>> I already gave a solution to this problem, make the loop iterator be:
>>>
>>> 	for_each_node_by_type(dp, "cpu")
>>>
>> 
>> Does it make sense use this only when /cpus is not found ?
>> IMHO as the number of node in DT increases(which is the case on ARM
>> platforms) parsing entire tree may be expensive(which can be avoided in
>> case /cpus is found)
> 
> Can't you simply do something like this for the search:
> 
> 	cpus = of_find_node_by_path("/cpus");
> 	if (!cpus && IS_ENABLED(CONFIG_SPARC))
> 		cpus = of_find_node_by_path("/");
> 	if (!cpus) {
> 		pr_warn("Missing cpus node, bailing out\n");
> 		return NULL;
> 	}
> 
> 	for_each_child_of_node(cpus, cpun) {

This doesn't work either Rob.  Some UltraSPARC-IV systems put the cpu
nodes under directories representing the cores.

For the third time, the only thing which will work unilaterally is
the type base iterator I proposed above.

Why is there so much resistence to something which has an extremely
high likelyhood of working everywhere and not requiring any ifdef
crapola?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

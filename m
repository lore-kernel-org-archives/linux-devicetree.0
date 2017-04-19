From: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node
 lifecyle
Date: Wed, 19 Apr 2017 11:33:47 -0700
Message-ID: <d291d007-d7c2-4642-ef04-b926c56b9003@linux.vnet.ibm.com>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com>
 <58F6AA35.2040902@gmail.com> <87efwp6v4e.fsf@concordia.ellerman.id.au>
 <58F6CBF9.7060000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58F6CBF9.7060000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/18/2017 07:31 PM, Frank Rowand wrote:
> On 04/18/17 18:31, Michael Ellerman wrote:
>> Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>>
>>> On 04/17/17 17:32, Tyrel Datwyler wrote:
>>>> This patch introduces event tracepoints for tracking a device_nodes
>>>> reference cycle as well as reconfig notifications generated in response
>>>> to node/property manipulations.
>>>>
>>>> With the recent upstreaming of the refcount API several device_node
>>>> underflows and leaks have come to my attention in the pseries (DLPAR) dynamic
>>>> logical partitioning code (ie. POWER speak for hotplugging virtual and physcial
>>>> resources at runtime such as cpus or IOAs). These tracepoints provide a
>>>> easy and quick mechanism for validating the reference counting of
>>>> device_nodes during their lifetime.
>>>>
>>>> Further, when pseries lpars are migrated to a different machine we
>>>> perform a live update of our device tree to bring it into alignment with the
>>>> configuration of the new machine. The of_reconfig_notify trace point
>>>> provides a mechanism that can be turned for debuging the device tree
>>>> modifications with out having to build a custom kernel to get at the
>>>> DEBUG code introduced by commit 00aa3720.
>>>
>>> I do not like changing individual (or small groups of) printk() style
>>> debugging information to tracepoint style.
>>
>> I'm not quite sure which printks() you're referring to.
>>
>> The only printks that are removed in this series are under #ifdef DEBUG,
>> and so are essentially not there unless you build a custom kernel.
> 
> Yes, I am talking about pr_debug(), pr_info(), pr_err(), etc.
> 
> 
>>
>> They also only cover the reconfig case, which is actually less
>> interesting than the much more common and bug-prone get/put logic.
> 
> When I was looking at the get/put issue I used pr_debug().
> 
> 
>>> As far as I know, there is no easy way to combine trace data and printk()
>>> style data to create a single chronology of events.  If some of the
>>> information needed to debug an issue is trace data and some is printk()
>>> style data then it becomes more difficult to understand the overall
>>> situation.
>>
>> If you enable CONFIG_PRINTK_TIME then you should be able to just sort
>> the trace and the printk output by the timestamp. If you're really
>> trying to correlate the two then you should probably just be using
>> trace_printk().
> 
> Except the existing debug code that uses pr_debug() does not use
> trace_printk().
> 
> And "just sort" does not apply to multi-line output like:
> 
> cpuhp/23-147   [023] ....   128.324827:
> 	of_node_put: refcount=5, dn->full_name=/cpus/PowerPC,POWER8@10
> cpuhp/23-147   [023] ....   128.324829:
> 	of_node_put: refcount=4, dn->full_name=/cpus/PowerPC,POWER8@10
> cpuhp/23-147   [023] ....   128.324829:
> 	of_node_put: refcount=3, dn->full_name=/cpus/PowerPC,POWER8@10
> cpuhp/23-147   [023] ....   128.324831:
> 	of_node_put: refcount=2, dn->full_name=/cpus/PowerPC,POWER8@10
>    drmgr-7284  [009] ....   128.439000:
> 	of_node_put: refcount=1, dn->full_name=/cpus/PowerPC,POWER8@10
>    drmgr-7284  [009] ....   128.439002:
> 	of_reconfig_notify: action=DETACH_NODE, dn->full_name=/cpus/PowerPC,POWER8@10,
> 			    prop->name=null, old_prop->name=null
>    drmgr-7284  [009] ....   128.439015:
> 	of_node_put: refcount=0, dn->full_name=/cpus/PowerPC,POWER8@10
>    drmgr-7284  [009] ....   128.439016:
> 	of_node_release: dn->full_name=/cpus/PowerPC,POWER8@10, dn->_flags=4
> 
> I was kinda hoping that maybe someone had already created a tool to deal
> with this issue.  But not too optimistic.

This output was actually broken into multiple lines for the commit
message. Each trace point is actually a single line in the trace buffer.
This output was pulled from the trace buffer with the following:

cat /sys/kernel/debug/trace/tracing | grep "POWER8@10"

-Tyrel

> 
> 
>> But IMO this level of detail, tracing every get/put, does not belong in
>> printk. Trace points are absolutely the right solution for this type of
>> debugging.
>>
>> cheers
>> .
>>
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

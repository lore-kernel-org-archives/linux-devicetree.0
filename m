From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of: introduce event tracepoints for dynamic device_node
 lifecyle
Date: Tue, 18 Apr 2017 18:42:32 -0700
Message-ID: <58F6C088.8020304@gmail.com>
References: <1492475525-10827-1-git-send-email-tyreld@linux.vnet.ibm.com>
 <58F6AA35.2040902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58F6AA35.2040902-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nfont-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/18/17 17:07, Frank Rowand wrote:
> On 04/17/17 17:32, Tyrel Datwyler wrote:
>> This patch introduces event tracepoints for tracking a device_nodes
>> reference cycle as well as reconfig notifications generated in response
>> to node/property manipulations.
>>
>> With the recent upstreaming of the refcount API several device_node
>> underflows and leaks have come to my attention in the pseries (DLPAR) dynamic
>> logical partitioning code (ie. POWER speak for hotplugging virtual and physcial
>> resources at runtime such as cpus or IOAs). These tracepoints provide a
>> easy and quick mechanism for validating the reference counting of
>> device_nodes during their lifetime.
>>
>> Further, when pseries lpars are migrated to a different machine we
>> perform a live update of our device tree to bring it into alignment with the
>> configuration of the new machine. The of_reconfig_notify trace point
>> provides a mechanism that can be turned for debuging the device tree
>> modifications with out having to build a custom kernel to get at the
>> DEBUG code introduced by commit 00aa3720.
> 
> I do not like changing individual (or small groups of) printk() style
> debugging information to tracepoint style.
> 
> As far as I know, there is no easy way to combine trace data and printk()
> style data to create a single chronology of events.  If some of the
> information needed to debug an issue is trace data and some is printk()
> style data then it becomes more difficult to understand the overall
> situation.

And of course the other issue with using tracepoints is the extra space
required to hold the tracepoint info.  With the pr_debug() approach, the
space usage can be easily removed for a production kernel via a config
option.

Tracepoints are wonderful technology, but not always the proper tool to
use for debug info.

> If Rob wants to convert printk() style data to trace data (and I can't
> convince him otherwise) then I will have further comments on this specific
> patch.
> 
> -Frank
> 
>>
>> The following trace events are provided: of_node_get, of_node_put,
>> of_node_release, and of_reconfig_notify. These trace points require a kernel
>> built with ftrace support to be enabled. In a typical environment where
>> debugfs is mounted at /sys/kernel/debug the entire set of tracepoints
>> can be set with the following:
>>
>>   echo "of:*" > /sys/kernel/debug/tracing/set_event
>>
>> or
>>
>>   echo 1 > /sys/kernel/debug/tracing/of/enable
>>
>> The following shows the trace point data from a DLPAR remove of a cpu
>> from a pseries lpar:
>>
>> cat /sys/kernel/debug/tracing/trace | grep "POWER8@10"
>>
>> cpuhp/23-147   [023] ....   128.324827:
>> 	of_node_put: refcount=5, dn->full_name=/cpus/PowerPC,POWER8@10
>> cpuhp/23-147   [023] ....   128.324829:
>> 	of_node_put: refcount=4, dn->full_name=/cpus/PowerPC,POWER8@10
>> cpuhp/23-147   [023] ....   128.324829:
>> 	of_node_put: refcount=3, dn->full_name=/cpus/PowerPC,POWER8@10
>> cpuhp/23-147   [023] ....   128.324831:
>> 	of_node_put: refcount=2, dn->full_name=/cpus/PowerPC,POWER8@10
>>    drmgr-7284  [009] ....   128.439000:
>> 	of_node_put: refcount=1, dn->full_name=/cpus/PowerPC,POWER8@10
>>    drmgr-7284  [009] ....   128.439002:
>> 	of_reconfig_notify: action=DETACH_NODE, dn->full_name=/cpus/PowerPC,POWER8@10,
>> 			    prop->name=null, old_prop->name=null
>>    drmgr-7284  [009] ....   128.439015:
>> 	of_node_put: refcount=0, dn->full_name=/cpus/PowerPC,POWER8@10
>>    drmgr-7284  [009] ....   128.439016:
>> 	of_node_release: dn->full_name=/cpus/PowerPC,POWER8@10, dn->_flags=4
>>
>> Signed-off-by: Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
>> ---
>>  drivers/of/dynamic.c      | 30 ++++++---------
>>  include/trace/events/of.h | 93 +++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 105 insertions(+), 18 deletions(-)
>>  create mode 100644 include/trace/events/of.h
>>
> 
> < snip >
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

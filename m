From: Hanjun Guo <hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH v2 2/4] Documentation: arm64/arm: dt bindings for
 numa.
Date: Tue, 25 Nov 2014 17:42:44 +0800
Message-ID: <54744F14.60004@linaro.org>
References: <1416605010-10442-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com> <1416605010-10442-3-git-send-email-ganapatrao.kulkarni@caviumnetworks.com> <5473FDA8.6080201@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5473FDA8.6080201-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shannon Zhao <zhaoshenglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, roy.franz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, msalter-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, steve.capper-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jchandra-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014-11-25 11:55, Shannon Zhao wrote:
> Hi,
> 
> On 2014/11/22 5:23, Ganapatrao Kulkarni wrote:
[...]
>> +==============================================================================
>> +4 - Example dts
>> +==============================================================================
>> +
>> +Example 1: 2 Node system each having 8 CPUs and a Memory.
>> +
>> +	numa-map {
>> +		#address-cells = <2>;
>> +		#size-cells = <1>;
>> +		#node-count = <2>;
>> +		mem-map =  <0x0 0x00000000 0>,
>> +		           <0x100 0x00000000 1>;
>> +
>> +		cpu-map = <0 7 0>,
>> +			  <8 15 1>;
> 
> The cpu range is continuous here. But if there is a situation like below:
> 
> 0 2 4 6 belong to node 0
> 1 3 5 7 belong to node 1
> 
> This case is very common on X86. I don't know the real situation of arm as
> I don't have a hardware with 2 nodes.
> 
> How can we generate a DTS about this situation? like below? Can be parsed?
> 
> 		cpu-map = <0 2 4 6 0>,
> 			  <1 3 5 7 1>;

I think the binding proposed here can not cover your needs, and I think this
binding is not suitable, there are some reasons.

 - CPU logical ID is allocated by OS, and it depends on the order of CPU node
   in the device tree, so it may be in a clean order like this patch proposed,
   or it will like the order Shannon pointed out.

 - Since CPU logical ID is allocated by OS, DTS file will not know these
   numbers.

So the problem behind this is the mappings between CPUs and NUMA nodes,
there is already mapping for CPU hardware ID (MPIDR) and CPU logical ID,
and MPIDR will be not changed, why not using MPIDR for the mapping of
NUMA node and CPU? then the mappings will be:

CPU logical ID <------> CPU MPIDR <-----> NUMA node ID <-----> proximity domain
(allocated by OS)      (constant)       (allocated by OS)

Thanks
Hanjun
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

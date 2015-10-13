From: chenfeng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH 1/3] docs: dts: Add documentation for hi6220 SoC ION node
Date: Tue, 13 Oct 2015 14:26:16 +0800
Message-ID: <561CA408.5060202@hisilicon.com>
References: <1444632386-106627-1-git-send-email-puck.chen@hisilicon.com>
 <20151012093119.GA20649@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151012093119.GA20649@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, tranmanphong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mitchelh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, tapaswenipathak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, yudongbin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, saberlily.xia-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, z.liuxinliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.chen-H32Fclmsjq1BDgjK7y7TUQ@public.gmane.org, weidong2-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, qijiwen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, peter.panshilin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laura-0PSzFVTn/CLa5EbDDlwbIw@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2015/10/12 17:31, Mark Rutland wrote:
> On Mon, Oct 12, 2015 at 02:46:24PM +0800, Chen Feng wrote:
>> Documentation for hi6220 SoC ION node
>>
>> Signed-off-by: Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> Signed-off-by: Yu Dongbin <yudongbin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> ---
>>  .../devicetree/bindings/staging/ion/hi6220-ion.txt | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/staging/ion/hi6220-ion.txt
> 
> 
> We should not be adding platform-specific bindings and/or drivers for
> this.
> 
> There's already a proposal for a generic binding [1]. Please work with
> that rather than working on your own.
> 
> Mark.
> 
> [1] https://lkml.org/lkml/2015/10/6/854

Mark, I checked the patch in https://lkml.org/lkml/2015/10/6/854.

It's a generic binding document for devicetree of ion.

Should I just drop this document patch?

Is the patch 2,3 for hisilicon ion ok for upstream?

Please give me more help. Thanks very much.

>  
>> diff --git a/Documentation/devicetree/bindings/staging/ion/hi6220-ion.txt b/Documentation/devicetree/bindings/staging/ion/hi6220-ion.txt
>> new file mode 100644
>> index 0000000..c59e27c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/staging/ion/hi6220-ion.txt
>> @@ -0,0 +1,31 @@
>> +Hi6220 SoC ION
>> +===================================================================
>> +Required properties:
>> +- compatible : "hisilicon,hi6220-ion"
>> +- list of the ION heaps
>> +	- heap name : maybe heap_sys_user@0
>> +	- heap id   : id should be unique in the system.
>> +	- heap base : base ddr address of the heap,0 means that
>> +	it is dynamic.
>> +	- heap size : memory size and 0 means it is dynamic.
>> +	- heap type : the heap type of the heap, please also
>> +	see the define in ion.h(drivers/staging/android/uapi/ion.h)
>> +-------------------------------------------------------------------
>> +Example:
>> +	hi6220-ion {
>> +		compatible = "hisilicon,hi6220-ion";
>> +		heap_sys_user@0 {
>> +			heap-name = "sys_user";
>> +			heap-id   = <0x0>;
>> +			heap-base = <0x0>;
>> +			heap-size = <0x0>;
>> +			heap-type = "ion_system";
>> +		};
>> +		heap_sys_contig@0 {
>> +			heap-name = "sys_contig";
>> +			heap-id   = <0x1>;
>> +			heap-base = <0x0>;
>> +			heap-size = <0x0>;
>> +			heap-type = "ion_system_contig";
>> +		};
>> +	};
>> -- 
>> 1.9.1
>>
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

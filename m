From: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 11/26] dt-bindings: Document mti,mips-cpc binding
Date: Fri, 2 Sep 2016 14:59:20 +0100
Message-ID: <f827cd3c-9547-ae44-51bf-ea574a7fa136@imgtec.com>
References: <20160826153725.11629-1-paul.burton@imgtec.com>
 <20160826153725.11629-12-paul.burton@imgtec.com>
 <20160902123419.GA31627@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160902123419.GA31627@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/09/16 13:34, Rob Herring wrote:
> On Fri, Aug 26, 2016 at 04:37:10PM +0100, Paul Burton wrote:
>> Document a binding for the MIPS Cluster Power Controller (CPC) which
>> simply allows the device tree to specify where the CPC registers should
>> be mapped.
>>
>> Signed-off-by: Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>> ---
>>
>>  Documentation/devicetree/bindings/misc/mti,mips-cpc.txt | 8 ++++++++
> 
> This is for power domains, right? Move to bindings/power.

Hi Rob,

Well, sort of. The CPC controls the power domains for CPU cores & the
MIPS Coherency Manager within a CPU cluster. That is, it's the block of
hardware that we send commands to power up or down CPUs to. It's not
something that makes use of the kernel's power domain infrastructure,
it's essentially only involved in SMP startup, hotplug or cpuidle low
power states.

This binding is purely about assigning some address space for the CPC
register interface, which can be mapped anywhere at runtime. Besides
knowing where to place the registers there's currently nothing else we'd
need to describe in DT.

If you still think bindings/power/ is the best place for it given that,
I'll move it.

> 
>>  1 file changed, 8 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/misc/mti,mips-cpc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/misc/mti,mips-cpc.txt b/Documentation/devicetree/bindings/misc/mti,mips-cpc.txt
>> new file mode 100644
>> index 0000000..92eb08f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/misc/mti,mips-cpc.txt
>> @@ -0,0 +1,8 @@
>> +Binding for MIPS Cluster Power Controller (CPC).
>> +
>> +This binding allows a system to specify where the CPC registers should be
>> +mapped using device tree.
>> +
>> +Required properties:
>> +compatible : Should be "mti,mips-cpc".
>> +regs: Should describe the address & size of the CPC register region.
> 
> Also needs #power-domain-cells property.

As above, this doesn't make use of power domain infrastructure or
anything like it so I don't think that's correct.

Thanks,
    Paul

> 
>> -- 
>> 2.9.3
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

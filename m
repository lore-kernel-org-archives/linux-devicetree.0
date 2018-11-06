From: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
Date: Mon, 5 Nov 2018 16:12:11 -0800
Message-ID: <8b502dca-bf5f-50b8-e1b2-997c6e2ca260@wdc.com>
References: <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
 <mhng-799bd6f4-e4af-481e-90d8-bdc0e30f2530@palmer-si-x1c4>
 <CAL_JsqJOxdE=gD4MyKuL5XZ57Z6UdM4_SU4qs26BNz6YcqM76A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJOxdE=gD4MyKuL5XZ57Z6UdM4_SU4qs26BNz6YcqM76A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@infradead.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alankao@andestech.com" <alankao@andestech.com>, Zong Li <zong@andestech.com>
List-Id: devicetree@vger.kernel.org

On 11/5/18 12:11 PM, Rob Herring wrote:
> On Mon, Nov 5, 2018 at 1:39 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Fri, 02 Nov 2018 06:09:39 PDT (-0700), robh+dt@kernel.org wrote:
>>> On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
>>>>
>>>> Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
>>>> But it doesn't need a separate thread node for defining SMT systems.
>>>> Multiple cpu phandle properties can be parsed to identify the sibling
>>>> hardware threads. Moreover, we do not have cluster concept in RISC-V.
>>>> So package is a better word choice than cluster for RISC-V.
>>>
>>> There was a proposal to add package info for ARM recently. Not sure
>>> what happened to that, but we don't need 2 different ways.
>>>
>>> There's never going to be clusters for RISC-V? What prevents that?
>>> Seems shortsighted to me.
>>>
>>>>
>>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>>> ---
>>>>   .../devicetree/bindings/riscv/topology.txt         | 154 +++++++++++++++++++++
>>>>   1 file changed, 154 insertions(+)
>>>>   create mode 100644 Documentation/devicetree/bindings/riscv/topology.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/riscv/topology.txt b/Documentation/devicetree/bindings/riscv/topology.txt
>>>> new file mode 100644
>>>> index 00000000..96039ed3
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/riscv/topology.txt
>>>> @@ -0,0 +1,154 @@
>>>> +===========================================
>>>> +RISC-V cpu topology binding description
>>>> +===========================================
>>>> +
>>>> +===========================================
>>>> +1 - Introduction
>>>> +===========================================
>>>> +
>>>> +In a RISC-V system, the hierarchy of CPUs can be defined through following nodes that
>>>> +are used to describe the layout of physical CPUs in the system:
>>>> +
>>>> +- packages
>>>> +- core
>>>> +
>>>> +The cpu nodes (bindings defined in [1]) represent the devices that
>>>> +correspond to physical CPUs and are to be mapped to the hierarchy levels.
>>>> +Simultaneous multi-threading (SMT) systems can also represent their topology
>>>> +by defining multiple cpu phandles inside core node. The details are explained
>>>> +in paragraph 3.
>>>
>>> I don't see a reason to do this differently than ARM. That said, I
>>> don't think the thread part is in use on ARM, so it could possibly be
>>> changed.
>>>
>>>> +
>>>> +The remainder of this document provides the topology bindings for ARM, based
>>>
>>> for ARM?
>>>
>>>> +on the Devicetree Specification, available from:
>>>> +
>>>> +https://www.devicetree.org/specifications/
>>>> +
>>>> +If not stated otherwise, whenever a reference to a cpu node phandle is made its
>>>> +value must point to a cpu node compliant with the cpu node bindings as
>>>> +documented in [1].
>>>> +A topology description containing phandles to cpu nodes that are not compliant
>>>> +with bindings standardized in [1] is therefore considered invalid.
>>>> +
>>>> +This cpu topology binding description is mostly based on the topology defined
>>>> +in ARM [2].
>>>> +===========================================
>>>> +2 - cpu-topology node
>>>
>>> cpu-map. Why change this?
>>>
>>> What I would like to see is the ARM topology binding reworked to be
>>> common or some good reasons why it doesn't work for RISC-V as-is.
>>
>> I think it would be great if CPU topologies were not a RISC-V specific thing.
>> We don't really do anything different than anyone else, so it'd be great if we
>> could all share the same spec and code.  Looking quickly at the ARM cpu-map
>> bindings, I don't see any reason why we can't just use the same thing on RISC-V
>> -- it's not quite how I'd do it, but I don't think the differences are worth
>> having another implementation.  Mechanically I'm not sure how to do this:
>> should there just be a "Documentation/devicetree/bindings/cpu-map.txt"?
> 
> Yes, but ".../bindings/cpu/cpu-topology.txt".
> 
> And if we need $arch extensions, they can be moved there. (Really, I'd
> like to get rid of /bindings/$arch/* except for maybe a few things.)
> 
>> If everyone is OK with that then I vote we just go ahead and genericise the ARM
>> "cpu-map" stuff for CPU topology.  Sharing the implementation looks fairly
>> straight-forward as well.
> 
+1 for a common code base. I am happy to take it up if nobody else has 
not already started working on it.

Is there a ARM hardware test farm that can be used to test such changes?

Regards,
Atish

From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 0/2] irqchip/gic*: Complain about the use of IRQ_TYPE_NONE
Date: Fri, 16 Mar 2018 16:46:20 +0000
Message-ID: <0c775a8f-07a8-3904-13cf-162a7f23ef49@arm.com>
References: <20180316145511.28362-1-marc.zyngier@arm.com>
 <5f274a06-3a9c-7d41-2e4d-9733e4ac6078@arm.com>
 <399d5e06-c530-6a29-8a4d-9e8ca62167c4@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <399d5e06-c530-6a29-8a4d-9e8ca62167c4@arm.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 16/03/18 16:39, Marc Zyngier wrote:
> On 16/03/18 16:19, Robin Murphy wrote:
>> On 16/03/18 14:55, Marc Zyngier wrote:
>>> Grepping through the dts files, the documentation, and reviewing
>>> patches, one can only notice the use of IRQ_TYPE_NONE in interrupt
>>> specifiers. At least for the GIC, this doesn't mean anything. The
>>> unsuspecting driver will end-up with whatever was there before, and
>>> there is a 50% probability that it is not what it wants.
>>>
>>> I'd love to fix it myself, but I also have a 50% probability of
>>> getting it wrong. In order to make the user aware they are walking on
>>> thin ice, let's add some warnings. Hopefully, they'll be annoying
>>> enough that people will fix their firmware. Croudsourcing debugging...
>>
>> I guess there's also the alternative nuclear option of breaking their
>> build ;)
>>
>> Robin.
>>
>> ----->8-----
>> diff --git a/include/dt-bindings/interrupt-controller/irq.h
>> b/include/dt-bindings/interrupt-controller/irq.h
>> index a8b310555f14..de79af80d01e 100644
>> --- a/include/dt-bindings/interrupt-controller/irq.h
>> +++ b/include/dt-bindings/interrupt-controller/irq.h
>> @@ -10,7 +10,7 @@
>>    #ifndef _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_H
>>    #define _DT_BINDINGS_INTERRUPT_CONTROLLER_IRQ_H
>>
>> -#define IRQ_TYPE_NONE		0
>> +#define IRQ_TYPE_NONE		"This is nonsense and needs fixing"
>>    #define IRQ_TYPE_EDGE_RISING	1
>>    #define IRQ_TYPE_EDGE_FALLING	2
>>    #define IRQ_TYPE_EDGE_BOTH	(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING)
>>
> 
> What really annoys me with this patch is that you haven't put a SoB on it...

On a more serious note, though, it dawns on me that this might be 
something DTC could realistically scream about for us, although I guess 
not all irqchip bindings include a type specifier so it would probably 
need to special-case known ones.

Robin.

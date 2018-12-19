From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v3 0/3] Make STM32 interrupt controller use hwspinlock
Date: Wed, 19 Dec 2018 16:00:23 +0100
Message-ID: <fc6eb663-8694-662d-c4c2-705c7bc57700@st.com>
References: <20181217142215.17493-1-benjamin.gaignard@st.com>
 <297d3207-7302-674e-5acd-30dc7b2df408@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <297d3207-7302-674e-5acd-30dc7b2df408@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>, Benjamin Gaignard <benjamin.gaignard@st.com>, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Marc,

On 12/18/18 4:39 PM, Marc Zyngier wrote:
> On 17/12/2018 14:22, Benjamin Gaignard wrote:
>> This series allow to protect STM32 interrupt controller configuration registers
>> with a hwspinlock to avoid conflicting accesses between processors.
>>
>> version 3:
>> - with bindings patch
>>
>> version 2:
>> - rework hwspinlock locking sequence in stm32 irqchip to take care of the
>>    cases where hwspinlock node is disabled or not yet probed
>>
>> Benjamin Gaignard (3):
>>    dt-bindings: interrupt-controller: stm32: Document hwlock properties
>>    irqchip: stm32: protect configuration registers with hwspinlock
>>    ARM: dts: stm32: Add hwlock for irqchip on stm32mp157
>>
>>   .../interrupt-controller/st,stm32-exti.txt         |   4 +
>>   arch/arm/boot/dts/stm32mp157c.dtsi                 |   1 +
>>   drivers/irqchip/irq-stm32-exti.c                   | 116 ++++++++++++++++++---
>>   3 files changed, 105 insertions(+), 16 deletions(-)
>>
> 
> I've taken the first two patches. Please route the DTS patch to the
> appropriate tree.
> 

I'll take DTS patch in stm32-next branch.

Regards
Alex

> Thanks,
> 
> 	M.
> 

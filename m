From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v3 0/3] Make STM32 interrupt controller use hwspinlock
Date: Tue, 18 Dec 2018 15:39:15 +0000
Message-ID: <297d3207-7302-674e-5acd-30dc7b2df408@arm.com>
References: <20181217142215.17493-1-benjamin.gaignard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217142215.17493-1-benjamin.gaignard@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@st.com>, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, alexandre.torgue@st.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

On 17/12/2018 14:22, Benjamin Gaignard wrote:
> This series allow to protect STM32 interrupt controller configuration registers
> with a hwspinlock to avoid conflicting accesses between processors. 
> 
> version 3:
> - with bindings patch
> 
> version 2:
> - rework hwspinlock locking sequence in stm32 irqchip to take care of the
>   cases where hwspinlock node is disabled or not yet probed
> 
> Benjamin Gaignard (3):
>   dt-bindings: interrupt-controller: stm32: Document hwlock properties
>   irqchip: stm32: protect configuration registers with hwspinlock
>   ARM: dts: stm32: Add hwlock for irqchip on stm32mp157
> 
>  .../interrupt-controller/st,stm32-exti.txt         |   4 +
>  arch/arm/boot/dts/stm32mp157c.dtsi                 |   1 +
>  drivers/irqchip/irq-stm32-exti.c                   | 116 ++++++++++++++++++---
>  3 files changed, 105 insertions(+), 16 deletions(-)
> 

I've taken the first two patches. Please route the DTS patch to the
appropriate tree.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...

From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 04/13] irqchip: Add driver for Loongson-3 I/O interrupt
 controller
Date: Wed, 28 Aug 2019 23:31:31 +0800
Message-ID: <619b1d35-7bc2-999f-5a51-fb2efdc63f60@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-5-jiaxun.yang@flygoat.com>
 <e6a5862f-0f6c-cab0-9f4a-51b7889d38e7@kernel.org>
 <82c4b9ed-7270-74ce-6e10-165182e540dd@flygoat.com>
 <20190828075940.549e1983@why>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828075940.549e1983@why>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>
Cc: linux-mips@vger.kernel.org, chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 2019/8/28 下午2:59, Marc Zyngier wrote:
> On Wed, 28 Aug 2019 08:27:05 +0800
> Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>> On 2019/8/28 上午12:45, Marc Zyngier wrote:
>>> On 27/08/2019 09:52, Jiaxun Yang wrote:
>>>> +	chained_irq_enter(chip, desc);
>>>> +
>>>> +	pending = readl(priv->intc_base + LS3_REG_INTC_EN_STATUS) &
>>>> +		readl(priv->intc_base + LS3_REG_INTC_STATUS);
>>> Reading the enabled status from the HW on each interrupt? I'm sure
>>> that's pretty cheap...
>> Seems expensive but to deal with a buggy hardware... That's worthy.
> How broken is it? You very much seem to rely on the HW being correct
> here, since you trust it exclusively. I'd expect the enable mask to be
> a SW construct if you didn't blindly trust it
Hi Marc

Thanks for your answering.

The vendor code did this and said there is a HW issue. I just don't have 
the guts to remove this check.
Seems like sometimes masked interrupt may get ISR set wrongly.
> And if this is truly the right way to do it, please document the
> various problems with the controller so that we don't break it at a
> later time.
Thanks, will do.
>
> Then how comes this comes from the irqchip's DT node? This should be
> part of the endpoint's interrupt specifier.

In theory it should be, However if we set different interrupt 
lines/cores on that controller, interrupts may get lost. It means we can 
only have single parent core/interrupt.

So I'd prefer just set them uniformly by controller's dt-binding to 
prevent confusing.

>> It's parent IRQ (mti,cpu-interrupt-controller) is a percpu IRQ.
> But then why is that interrupt described using the "core" property? It
> should be an interrupt specifier, just like any other interrupt.
The same.
>
>> In design, it allows us to decide affinity at runtime but actually hardware is seriously broken.
> I understand the HW is terrible. But the binding looks pretty bad too.
> This needs fixing.
>
> 	M.
--
Jiaxun Yang

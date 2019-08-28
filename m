From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 04/13] irqchip: Add driver for Loongson-3 I/O interrupt
 controller
Date: Wed, 28 Aug 2019 17:02:17 +0100
Message-ID: <45615c1a-7af8-3496-5369-4b2f174a76e7@kernel.org>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
 <20190827085302.5197-5-jiaxun.yang@flygoat.com>
 <e6a5862f-0f6c-cab0-9f4a-51b7889d38e7@kernel.org>
 <82c4b9ed-7270-74ce-6e10-165182e540dd@flygoat.com>
 <20190828075940.549e1983@why>
 <619b1d35-7bc2-999f-5a51-fb2efdc63f60@flygoat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <619b1d35-7bc2-999f-5a51-fb2efdc63f60@flygoat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de, jason@lakedaemon.net, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.co, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 28/08/2019 16:31, Jiaxun Yang wrote:
> 
> On 2019/8/28 下午2:59, Marc Zyngier wrote:
>> On Wed, 28 Aug 2019 08:27:05 +0800
>> Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>>
>>> On 2019/8/28 上午12:45, Marc Zyngier wrote:
>>>> On 27/08/2019 09:52, Jiaxun Yang wrote:
>>>>> +	chained_irq_enter(chip, desc);
>>>>> +
>>>>> +	pending = readl(priv->intc_base + LS3_REG_INTC_EN_STATUS) &
>>>>> +		readl(priv->intc_base + LS3_REG_INTC_STATUS);
>>>> Reading the enabled status from the HW on each interrupt? I'm sure
>>>> that's pretty cheap...
>>> Seems expensive but to deal with a buggy hardware... That's worthy.
>> How broken is it? You very much seem to rely on the HW being correct
>> here, since you trust it exclusively. I'd expect the enable mask to be
>> a SW construct if you didn't blindly trust it
> Hi Marc
> 
> Thanks for your answering.
> 
> The vendor code did this and said there is a HW issue. I just don't have 
> the guts to remove this check.
> Seems like sometimes masked interrupt may get ISR set wrongly.

And that would just as well avoided by a SW managed mask.

>> And if this is truly the right way to do it, please document the
>> various problems with the controller so that we don't break it at a
>> later time.
> Thanks, will do.
>>
>> Then how comes this comes from the irqchip's DT node? This should be
>> part of the endpoint's interrupt specifier.
> 
> In theory it should be, However if we set different interrupt 
> lines/cores on that controller, interrupts may get lost. It means we can 
> only have single parent core/interrupt.
> 
> So I'd prefer just set them uniformly by controller's dt-binding to 
> prevent confusing.

And I disagree. You can document the restriction, and even maybe enforce
it by validating the DT one way or another. But we're not putting what
ends up being a routing table in the irqchip binding.

	M.
-- 
Jazz is not dead, it just smells funny...

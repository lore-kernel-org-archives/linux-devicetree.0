From: Phil Elwell <phil@raspberrypi.org>
Subject: Re: [PATCH 0/2] Add bcm2835aux interrupt controller
Date: Thu, 8 Jun 2017 10:55:20 +0100
Message-ID: <846fcded-190e-e3f7-c0cd-b7c9281e41e0@raspberrypi.org>
References: <6dc301c8-e5a2-1334-c476-1ce7e303787f@raspberrypi.org>
 <b3d5b3c1-a9ab-99bf-a1b2-3a1e4579c0ff@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <b3d5b3c1-a9ab-99bf-a1b2-3a1e4579c0ff@gmail.com>
Content-Language: en-GB
Sender: linux-clk-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/06/2017 21:58, Florian Fainelli wrote:
> On 06/07/2017 04:11 AM, Phil Elwell wrote:
>> Devices in the AUX block share a common interrupt line, with a register
>> indicating which devices have active IRQs. Expose this as a nested
>> interrupt controller to avoid IRQ sharing problems (easily observed if
>> UART1 and SPI1/2 are enabled simultaneously).
>>
>> The interrupt functionality could arguably be forked off as a separate
>> irqchip driver, but the clock driver has already claimed the AUX_IRQ
>> register so some driver and DT surgery would still be required.
>> Eric Anholt thought that including it here is reasonable, but I'm
>> prepared to split it out if this is considered too hacky.
> 
> You probably remember your fix to the irqchip drive being flamed because
> the irqchip driver was re-purposed as an ARM SMP secondary core bringup
> method, maybe we can avoid doing the same mistake and having this a
> separate interrupt controller be under drivers/irqchip/*?
> 
> Even if the clock driver already claims the AUX_IRQ register space, we
> can still have an irqchip ioremap() the two register offsets that it
> cares about (AUXIRQ, AUXENB) and just manage that 8 bytes worth of
> register space. We just need to make sure that the clock driver really
> does not touch those (why would it) and that there won't be any
> conflicting request_mem_region() against the same register range.
> 
> Thanks!

The "clock" driver (it's really just a block enabler) and IRQ functionality
each use one of two adjacent word registers. Is it not simpler, clearer and
more accurate to represent those as separate nodes in the device tree,
rather than continuing to allow the clock node to claim the neighbouring
register and expecting the IRQ driver to use other mechanisms to locate
(phandle node reference? hard-coded base address?) and use the register that
rightfully belongs to it?

Phil

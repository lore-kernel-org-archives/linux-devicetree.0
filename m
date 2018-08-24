From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RESEND v1 2/5] drivers: pinctrl: msm: enable PDC
 interrupt only during suspend
Date: Fri, 24 Aug 2018 11:14:32 -0600
Message-ID: <20180824171432.GM5081@codeaurora.org>
References: <20180817191026.32245-1-ilina@codeaurora.org>
 <20180817191026.32245-3-ilina@codeaurora.org>
 <153509896098.28926.3622217918056498792@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153509896098.28926.3622217918056498792@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: bjorn.andersson@linaro.org, evgreen@chromium.org, linus.walleij@linaro.org, marc.zyngier@arm.com, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 24 2018 at 02:22 -0600, Stephen Boyd wrote:
>Quoting Lina Iyer (2018-08-17 12:10:23)
>> During suspend the system may power down some of the system rails. As a
>> result, the TLMM hw block may not be operational anymore and wakeup
>> capable GPIOs will not be detected. The PDC however will be operational
>> and the GPIOs that are routed to the PDC as IRQs can wake the system up.
>>
>> To avoid being interrupted twice (for TLMM and once for PDC IRQ) when a
>> GPIO trips, use TLMM for active and switch to PDC for suspend. When
>> entering suspend, disable the TLMM wakeup interrupt and instead enable
>> the PDC IRQ and revert upon resume.
>
>What about idle paths? Don't we want to disable the TLMM interrupt and
>enable the PDC interrupt when the whole cluster goes idle so we get
>wakeup interrupts?
We would need to do this from the idle paths. When we have that support
(a patch for cluster power down is in the works), we would need to hook
up to TLMM and do the same.
>It's really unfortunate that the hardware can't
>replay the interrupt from PDC to TLMM when it knows TLMM didn't get the
>interrupt (because the whole chip was off) or the GIC didn't get the
>summary irq (because the GIC was powered off). A little more hardware
>effort would make this completely transparent to software and make TLMM
>work across all low power modes.
>
I wouln't pretend to understand what it entails in the hardware. But, I
believe the complication stems from the fact that PDC is sensing the raw
GPIO just as TLMM when active and sensing itself. To know when to replay
only the interrupt lines for the TLMM (knowing the TLMM was powered off)
might be a lot of hardware.

>Because of this complicated dance, it may make sense to always get the
>interrupt at the PDC and then replay it into the TLMM chip "manually"
>with the irq_set_irqchip_state() APIs. This way the duplicate interrupt
>can't happen. The only way for the interrupt handler to run would be by
>PDC poking the TLMM hardware to inject the irq into the status register.
If the PDC interrupt was always enabled and the interrupt at TLMM was
always disabled, all we would need to set the action handler of the PDC
interrupt to that of the TLMM. I couldn't find a way to retrieve that
nicely.

>I think with the TLMM that's possible if we configure the pin to have
>the raw status bit disabled (so that edges on the physical line don't
>latch into the GPIO interrupt status register) and the normal status bit
>enabled (so that if the status register changes we'll interrupt the
>CPU). It needs some testing to make sure that actually works though. If
>it does work, then we have a way to inject interrupts on TLMM without
>worry that the TLMM hardware will also see the interrupt.

>
>Is there a good way to test an interrupt to see if it's edge or level
>type configured? And is it really a problem to make PDC the hierarchical
>parent of TLMM here so that PDC can intercept the type and wake state of
>the GPIO irq?
Alternately, could we just return the PDC interrupt in gpio_to_irq() and
let the driver manipulate only the PDC interrupt ? Ofcourse, drivers
that request the GPIO as interrupt in DT, would now have to request the
PDC interrupt directly. That could avoid the dance during every
idle/suspend. I am not sure how nice it is do this, would like to know
your thoughts.

>Plus there's the part where a GIC SPI interrupt runs for
>some GPIO irq, and that needs to be decoded to figure out which GPIO it
>is for and if it should be replayed or not. Maybe all types of GPIO irqs
>can be replayed and if it's a level type interrupt we waste some time
>handling the PDC interrupt just to do nothing besides forward what would
>presumably already work without PDC intervention.
>

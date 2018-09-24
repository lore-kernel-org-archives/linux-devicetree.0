From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v3 3/5] drivers: pinctrl: msm: enable PDC interrupt only
 during suspend
Date: Mon, 24 Sep 2018 09:35:41 -0600
Message-ID: <20180924153541.GJ17420@codeaurora.org>
References: <20180904211810.5506-1-ilina@codeaurora.org>
 <20180904211810.5506-4-ilina@codeaurora.org>
 <868t3twl64.wl-marc.zyngier@arm.com>
 <20180922170909.GI17420@codeaurora.org>
 <867ejcwnn7.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <867ejcwnn7.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Sun, Sep 23 2018 at 03:48 -0600, Marc Zyngier wrote:
>On Sat, 22 Sep 2018 18:09:09 +0100,
>Lina Iyer <ilina@codeaurora.org> wrote:
>>
>> On Sat, Sep 22 2018 at 10:29 -0600, Marc Zyngier wrote:
>> > Hi Lina,
>> >
>> > On Tue, 04 Sep 2018 22:18:08 +0100,
>> > Lina Iyer <ilina@codeaurora.org> wrote:

>> Also, I am exploring an option that was suggested by Stephen [1] to just
>> use the PDC interrupt as a parent of the GPIO IRQ and use a different
>> irqchip for the PDC interrupt. I ran into some issue with accessing
>> irqchip and irqdata of the PDC interrupt, since the irqchip was not in
>> hierarchy with the GPIO's irqchip. I haven't been able to find time to
>> resolve the issue that the set_parent_ functions, because of the
>> hierarchy.
>>
>> Essentially, we have two different mechanisms for GPIO IRQs based on
>> whether they can be woken up by the PDC interrupt.
>>
>> 	GPIO-IRQ --> PDC --> GIC
>>
>> 	GPIO-IRQ --> TLMM SUMMARY --> GIC
>>
>> Do you think the idea is feasible? It would avoid doing all this
>> enable/disable at every suspend and even during idle, when the TLMM
>> could be powered off.
>
>[me tries to page it all in again]
>
>You could have the PDC as part of the GPIO hierarchy:
>
>	GPIO -> PDC -> TLMM -> GIC
>
The PDC irqchip's parent is the GIC as set up in
drivers/irqchip/qcom-pdc.c. Wouldn't that conflict with the established
hierarchy?

>and always configure the PDC as a wake-up source. I just wonder if you
>can do that without setting up a parallel hierarchy between the PDC
>and the GIC. We already have similar things in the tree (see OMAP's
>wakeupgen), and it may be worth having a look.
Sure, will take a  look.

>The lack of interrupt
>replaying on the PDC is quite annoying (I have much stronger words in
>mind though), and I'm not sure we can easily fix that one without this
>parallel interrupt hack (you need something to inject edge interrupts
>in the TLMM).
>
The PDC replays the intterupt at the GIC, not the at the TLMM. So the
hierachy you recommended may not work as well here.
>>
>>
>> >> +			disable_irq(irqd->irq);
>> >> +			enable_irq(irq);
>> >> +		}
>> >> +	}
>> >
>> > Given that you're changing in_suspend and parsing the bitmap,
>> > shouldn't take the pdc spinlock?
>> >
>> Since we are the the only CPU running and suspend/resume (and even idle)
>> would be serialized I didn't see a reason for needing a lock.
>
>In that case, what is the purpose of 'in_suspend' if
>msm_gpio_irq_set_wake cannot happen during the suspend/resume phases?
>It all seems a bit inconsistent.
>
Well the disable_irq_wake that I call here, calls into the set_wake
callbacks. Hence the flag to indicate that we should ignore the PDC
interrupt configuration at that time. Let me see if I need to disable
the disable_irq_wake at all.

Thanks,
Lina

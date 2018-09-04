From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH RESEND v1 2/5] drivers: pinctrl: msm: enable PDC
 interrupt only during suspend
Date: Tue, 4 Sep 2018 15:09:34 -0600
Message-ID: <20180904210934.GA23990@codeaurora.org>
References: <20180817191026.32245-1-ilina@codeaurora.org>
 <20180817191026.32245-3-ilina@codeaurora.org>
 <153509896098.28926.3622217918056498792@swboyd.mtv.corp.google.com>
 <20180824171432.GM5081@codeaurora.org>
 <153540005334.129321.18196967002233663397@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153540005334.129321.18196967002233663397@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: bjorn.andersson@linaro.org, evgreen@chromium.org, linus.walleij@linaro.org, marc.zyngier@arm.com, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 27 2018 at 14:01 -0600, Stephen Boyd wrote:
>Quoting Lina Iyer (2018-08-24 10:14:32)
>> On Fri, Aug 24 2018 at 02:22 -0600, Stephen Boyd wrote:
>> >Quoting Lina Iyer (2018-08-17 12:10:23)
>> >> During suspend the system may power down some of the system rails. As a
>> >> result, the TLMM hw block may not be operational anymore and wakeup
>> >> capable GPIOs will not be detected. The PDC however will be operational
>> >> and the GPIOs that are routed to the PDC as IRQs can wake the system up.
>> >>
>> >> To avoid being interrupted twice (for TLMM and once for PDC IRQ) when a
>> >> GPIO trips, use TLMM for active and switch to PDC for suspend. When
>> >> entering suspend, disable the TLMM wakeup interrupt and instead enable
>> >> the PDC IRQ and revert upon resume.
>> >
>> >What about idle paths? Don't we want to disable the TLMM interrupt and
>> >enable the PDC interrupt when the whole cluster goes idle so we get
>> >wakeup interrupts?
>> We would need to do this from the idle paths. When we have that support
>> (a patch for cluster power down is in the works), we would need to hook
>> up to TLMM and do the same.
>
>Ok so then this approach doesn't really seem to work for the CPU idle
>paths.
>
>> >Because of this complicated dance, it may make sense to always get the
>> >interrupt at the PDC and then replay it into the TLMM chip "manually"
>> >with the irq_set_irqchip_state() APIs. This way the duplicate interrupt
>> >can't happen. The only way for the interrupt handler to run would be by
>> >PDC poking the TLMM hardware to inject the irq into the status register.
>> If the PDC interrupt was always enabled and the interrupt at TLMM was
>> always disabled, all we would need to set the action handler of the PDC
>> interrupt to that of the TLMM. I couldn't find a way to retrieve that
>> nicely.
>
>Can't we just configure a different chained IRQ handler with
>irq_set_chained_handler_and_data() for each of the GPIO IRQs that are
>handled by PDC to be the interrupts provide by the PDC irq controller
>that match the GPIOs? And then set their parent irq with
>irq_set_parent() for completeness? And also move those GPIOs from the
>existing msm_gpio irqchip to a different PDC gpio irqchip that does
>nothing besides push irqchip calls up to the PDC irqchip? Then we don't
>even have to think about resending anything and we can rely on PDC to do
>all the interrupt sensing all the time but still provide the irqs from
>the GPIO controller.
>
Seems like the irqchips need to be in hierarchy for this to work, which
is not the case with TLMM and the PDC, currently.

-- Lina

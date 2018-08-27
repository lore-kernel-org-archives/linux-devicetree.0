From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH RESEND v1 2/5] drivers: pinctrl: msm: enable PDC interrupt only
 during suspend
Date: Mon, 27 Aug 2018 13:00:53 -0700
Message-ID: <153540005334.129321.18196967002233663397@swboyd.mtv.corp.google.com>
References: <20180817191026.32245-1-ilina@codeaurora.org>
 <20180817191026.32245-3-ilina@codeaurora.org>
 <153509896098.28926.3622217918056498792@swboyd.mtv.corp.google.com>
 <20180824171432.GM5081@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824171432.GM5081@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: bjorn.andersson@linaro.org, evgreen@chromium.org, linus.walleij@linaro.org, marc.zyngier@arm.com, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

Quoting Lina Iyer (2018-08-24 10:14:32)
> On Fri, Aug 24 2018 at 02:22 -0600, Stephen Boyd wrote:
> >Quoting Lina Iyer (2018-08-17 12:10:23)
> >> During suspend the system may power down some of the system rails. As a
> >> result, the TLMM hw block may not be operational anymore and wakeup
> >> capable GPIOs will not be detected. The PDC however will be operational
> >> and the GPIOs that are routed to the PDC as IRQs can wake the system u=
p.
> >>
> >> To avoid being interrupted twice (for TLMM and once for PDC IRQ) when a
> >> GPIO trips, use TLMM for active and switch to PDC for suspend. When
> >> entering suspend, disable the TLMM wakeup interrupt and instead enable
> >> the PDC IRQ and revert upon resume.
> >
> >What about idle paths? Don't we want to disable the TLMM interrupt and
> >enable the PDC interrupt when the whole cluster goes idle so we get
> >wakeup interrupts?
> We would need to do this from the idle paths. When we have that support
> (a patch for cluster power down is in the works), we would need to hook
> up to TLMM and do the same.

Ok so then this approach doesn't really seem to work for the CPU idle
paths.

> >Because of this complicated dance, it may make sense to always get the
> >interrupt at the PDC and then replay it into the TLMM chip "manually"
> >with the irq_set_irqchip_state() APIs. This way the duplicate interrupt
> >can't happen. The only way for the interrupt handler to run would be by
> >PDC poking the TLMM hardware to inject the irq into the status register.
> If the PDC interrupt was always enabled and the interrupt at TLMM was
> always disabled, all we would need to set the action handler of the PDC
> interrupt to that of the TLMM. I couldn't find a way to retrieve that
> nicely.

Can't we just configure a different chained IRQ handler with
irq_set_chained_handler_and_data() for each of the GPIO IRQs that are
handled by PDC to be the interrupts provide by the PDC irq controller
that match the GPIOs? And then set their parent irq with
irq_set_parent() for completeness? And also move those GPIOs from the
existing msm_gpio irqchip to a different PDC gpio irqchip that does
nothing besides push irqchip calls up to the PDC irqchip? Then we don't
even have to think about resending anything and we can rely on PDC to do
all the interrupt sensing all the time but still provide the irqs from
the GPIO controller.

> =

> >I think with the TLMM that's possible if we configure the pin to have
> >the raw status bit disabled (so that edges on the physical line don't
> >latch into the GPIO interrupt status register) and the normal status bit
> >enabled (so that if the status register changes we'll interrupt the
> >CPU). It needs some testing to make sure that actually works though. If
> >it does work, then we have a way to inject interrupts on TLMM without
> >worry that the TLMM hardware will also see the interrupt.
> =

> >
> >Is there a good way to test an interrupt to see if it's edge or level
> >type configured? And is it really a problem to make PDC the hierarchical
> >parent of TLMM here so that PDC can intercept the type and wake state of
> >the GPIO irq?
> Alternately, could we just return the PDC interrupt in gpio_to_irq() and
> let the driver manipulate only the PDC interrupt ? Ofcourse, drivers
> that request the GPIO as interrupt in DT, would now have to request the
> PDC interrupt directly. That could avoid the dance during every
> idle/suspend. I am not sure how nice it is do this, would like to know
> your thoughts.
> =


I hope it doesn't come to that.

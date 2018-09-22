From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v3 3/5] drivers: pinctrl: msm: enable PDC interrupt only
 during suspend
Date: Sat, 22 Sep 2018 11:09:09 -0600
Message-ID: <20180922170909.GI17420@codeaurora.org>
References: <20180904211810.5506-1-ilina@codeaurora.org>
 <20180904211810.5506-4-ilina@codeaurora.org>
 <868t3twl64.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <868t3twl64.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 22 2018 at 10:29 -0600, Marc Zyngier wrote:
>Hi Lina,
>
>On Tue, 04 Sep 2018 22:18:08 +0100,
>Lina Iyer <ilina@codeaurora.org> wrote:
>>
>> During suspend the system may power down some of the system rails. As a
>> result, the TLMM hw block may not be operational anymore and wakeup
>> capable GPIOs will not be detected. The PDC however will be operational
>> and the GPIOs that are routed to the PDC as IRQs can wake the system up.
>>
>> To avoid being interrupted twice (for TLMM and once for PDC IRQ) when a
>> GPIO trips, use TLMM for active and switch to PDC for suspend. When
>> entering suspend, disable the TLMM wakeup interrupt and instead enable
>> the PDC IRQ and revert upon resume.
>>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> ---
>> Changes in v3:
>> 	- Enable PDC-IRQ swap only for edge interrupts
>> Changes in v2:
>> 	- Fix PDC IRQ max port, 126 is the max supported in h/w
>> 	- Use PDC hwirq in bitmap, linux numbers could be large
>> 	- Setup DISABLE_UNLAZY for both TLMM and PDC IRQs
>> ---
[...]

>> +int __maybe_unused msm_pinctrl_suspend_late(struct device *dev)
>> +{
>> +	struct msm_pinctrl *pctrl = dev_get_drvdata(dev);
>> +	struct irq_data *irqd;
>> +	unsigned int irq;
>> +	int i;
>> +
>> +	in_suspend = true;
>> +	for_each_set_bit(i, pctrl->pdc_hwirqs, MAX_PDC_HWIRQ) {
>> +		irq = irq_find_mapping(pctrl->pdc_irq_domain, i);
>> +		irqd = irq_get_handler_data(irq);
>> +		/*
>> +		 * We don't know if the TLMM will be functional
>> +		 * or not, during the suspend. If its functional,
>> +		 * we do not want duplicate interrupts from PDC.
>> +		 * Hence disable the GPIO IRQ and enable PDC IRQ
>> +		 * for edge interrupt only.
>> +		 */
>> +		if (irqd_is_wakeup_set(irqd) && !irqd_is_level_type(irqd)) {
>> +			disable_irq_wake(irqd->irq);
>
>There is something I don't quite get here. If the PDC is used to wake
>up the platform, why is the TLMM interrupt configured as a wakeup
>source the first place? Or is it just to keep things simple and not
>have to track it in the TLMM driver itself?
>
True, it need not be. I could just avoid setting the wakeup on the TLMM
and just use the PDC interrupt as wakeup.

Also, I am exploring an option that was suggested by Stephen [1] to just
use the PDC interrupt as a parent of the GPIO IRQ and use a different
irqchip for the PDC interrupt. I ran into some issue with accessing
irqchip and irqdata of the PDC interrupt, since the irqchip was not in
hierarchy with the GPIO's irqchip. I haven't been able to find time to
resolve the issue that the set_parent_ functions, because of the
hierarchy.

Essentially, we have two different mechanisms for GPIO IRQs based on
whether they can be woken up by the PDC interrupt.

	GPIO-IRQ --> PDC --> GIC

	GPIO-IRQ --> TLMM SUMMARY --> GIC

Do you think the idea is feasible? It would avoid doing all this
enable/disable at every suspend and even during idle, when the TLMM
could be powered off.


>> +			disable_irq(irqd->irq);
>> +			enable_irq(irq);
>> +		}
>> +	}
>
>Given that you're changing in_suspend and parsing the bitmap,
>shouldn't take the pdc spinlock?
>
Since we are the the only CPU running and suspend/resume (and even idle)
would be serialized I didn't see a reason for needing a lock.

>> +
>> +	return 0;
>> +}
>> +
>> +int __maybe_unused msm_pinctrl_resume_late(struct device *dev)
>> +{
>> +	struct msm_pinctrl *pctrl = dev_get_drvdata(dev);
>> +	struct irq_data *irqd, *pdc_irqd;
>> +	unsigned int irq;
>> +	int i;
>> +
>> +	for_each_set_bit(i, pctrl->pdc_hwirqs, MAX_PDC_HWIRQ) {
>> +		irq = irq_find_mapping(pctrl->pdc_irq_domain, i);
>> +		irqd = irq_get_handler_data(irq);
>> +		pdc_irqd = irq_get_irq_data(irq);
>> +		/*
>> +		 * The TLMM will be operational now, so disable
>> +		 * the PDC IRQ for edge interrupts only.
>> +		 */
>> +		if (irqd_is_wakeup_set(pdc_irqd) &&
>> +		    !irqd_is_level_type(pdc_irqd)) {
>> +			disable_irq_nosync(irq);
>> +			enable_irq_wake(irqd->irq);
>> +			enable_irq(irqd->irq);
>> +		}
>> +	}
>> +	in_suspend = false;
>
>Same remark about the lock.
>

Thanks,
Lina

[1]. https://lore.kernel.org/patchwork/patch/975423/

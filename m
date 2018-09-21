From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v3 1/5] drivers: pinctrl: qcom: add wakeup capability to
 GPIO
Date: Fri, 21 Sep 2018 10:08:46 -0600
Message-ID: <20180921160846.GG17420@codeaurora.org>
References: <20180904211810.5506-1-ilina@codeaurora.org>
 <20180904211810.5506-2-ilina@codeaurora.org>
 <86k1nfwyqn.wl-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <86k1nfwyqn.wl-marc.zyngier@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 21 2018 at 17:11 -0600, Marc Zyngier wrote:
>Hi Lina,
>
>On Tue, 04 Sep 2018 22:18:06 +0100,
>Lina Iyer <ilina@codeaurora.org> wrote:
[...]
>> +static irqreturn_t wake_irq_gpio_handler(int irq, void *data)
>> +{
>> +	struct irq_data *irqd = data;
>> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
>> +	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>> +	const struct msm_pingroup *g;
>> +	unsigned long flags;
>> +	u32 val;
>> +
>> +	if (!irqd_is_level_type(irqd)) {
>> +		g = &pctrl->soc->groups[irqd->hwirq];
>> +		raw_spin_lock_irqsave(&pctrl->lock, flags);
>> +		val = BIT(g->intr_status_bit);
>> +		writel(val, pctrl->regs + g->intr_status_reg);
>
>write_relaxed, please.
>
>> +		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>> +	}
>
>Overall, this requires some form of documentation (I'll have forgotten
>about the whole thing quickly enough).
>
Sure, I will address them both.
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int msm_gpio_pdc_pin_request(struct irq_data *d)
>> +{
>> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>> +	struct platform_device *pdev = to_platform_device(pctrl->dev);
>> +	const char *pin_name;
>> +	int irq;
>> +	int ret;
>> +
>> +	pin_name = kasprintf(GFP_KERNEL, "gpio%lu", d->hwirq);
>> +	if (!pin_name)
>> +		return -ENOMEM;
>> +
>> +	irq = platform_get_irq_byname(pdev, pin_name);
>> +	if (irq < 0) {
>> +		kfree(pin_name);
>> +		return 0;
>> +	}
>> +
>> +	ret = request_irq(irq, wake_irq_gpio_handler, irqd_get_trigger_type(d),
>> +			  pin_name, d);
>> +	if (ret) {
>> +		pr_warn("GPIO-%lu could not be set up as wakeup", d->hwirq);
>
>This message doesn't correspond to what you're doing here.
>
Well, I thought the message is most relevant because, we will not be
able to wake up from this GPIO IRQ. But, I will change it.

>> +		kfree(pin_name);
>> +		return ret;
>> +	}
>> +
>> +	irq_set_handler_data(d->irq, irq_get_irq_data(irq));
>> +	disable_irq(irq);
>
>Who enables this interrupt?
>
Suspend/resume code does the swap of enable/disable of PDC IRQ vs GPIO
IRQ in patch #4.

>There is a gap between request_irq and disable_irq, where you can take
>the interrupt, and not having set the handler data. Horrible things
>will happen in this situation.
>
>A slightly better way of doing that would be:
>
>	// Prevent the interrupt from being enabled on request
>	irq_set_status_flags(d->irq, IRQ_NOAUTOEN);
>	ret = request_irq(...);
>	irq_set_handler(...);
>
>and let the enable_irq() do its thing when it happens (where?).
>
Oh. This is better. Will amend.

Thanks for the review.

-- Lina

>> +
>> +	return 0;
>> +}
>> +
>> +static int msm_gpio_pdc_pin_release(struct irq_data *d)
>> +{
>> +	struct irq_data *pdc_irqd = irq_get_handler_data(d->irq);
>> +	const void *name;
>> +
>> +	if (pdc_irqd) {
>> +		irq_set_handler_data(d->irq, NULL);
>> +		name = free_irq(pdc_irqd->irq, d);
>> +		kfree(name);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int msm_gpio_irq_reqres(struct irq_data *d)
>> +{
>> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +
>> +	if (gpiochip_lock_as_irq(gc, irqd_to_hwirq(d))) {
>> +		dev_err(gc->parent, "unable to lock HW IRQ %lu for IRQ\n",
>> +			irqd_to_hwirq(d));
>> +		return -EINVAL;
>> +	}
>> +
>> +	return msm_gpio_pdc_pin_request(d);
>> +}
>> +
>> +static void msm_gpio_irq_relres(struct irq_data *d)
>> +{
>> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +
>> +	msm_gpio_pdc_pin_release(d);
>> +	gpiochip_unlock_as_irq(gc, irqd_to_hwirq(d));
>> +}
>> +
>>  static int msm_gpio_init(struct msm_pinctrl *pctrl)
>>  {
>>  	struct gpio_chip *chip;
>> @@ -887,6 +983,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
>>  	pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
>>  	pctrl->irq_chip.irq_set_type = msm_gpio_irq_set_type;
>>  	pctrl->irq_chip.irq_set_wake = msm_gpio_irq_set_wake;
>> +	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
>> +	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
>>
>>  	ret = gpiochip_add_data(&pctrl->chip, pctrl);
>>  	if (ret) {
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
>
>Thanks,
>
>	M.
>
>--
>Jazz is not dead, it just smell funny.

From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v2 1/5] drivers: pinctrl: qcom: add wakeup capability to
 GPIO
Date: Tue, 4 Sep 2018 11:51:02 -0600
Message-ID: <20180904175102.GB3622@codeaurora.org>
References: <20180824200157.9993-1-ilina@codeaurora.org>
 <20180824200157.9993-2-ilina@codeaurora.org>
 <20180827223502.GV160295@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180827223502.GV160295@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Kaehlcke <mka@chromium.org>
Cc: marc.zyngier@arm.com, bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 27 2018 at 16:35 -0600, Matthias Kaehlcke wrote:
>Hi Lina,
>
>On Fri, Aug 24, 2018 at 02:01:53PM -0600, Lina Iyer wrote:
>> QCOM SoC's that have Power Domain Controller (PDC) chip in the always-on
>> domain can wakeup the SoC, when interrupts and GPIOs are routed to the
>> its interrupt controller. Only select GPIOs that are deemed wakeup
>
>wording nit: "are routed to the|its interrupt controller"
>
Okay.

>> capable are routed to specific PDC pins. During low power state, the
>> pinmux interrupt controller may be non-functional but the PDC would be.
>> The PDC can detect the wakeup GPIO is triggered and bring the TLMM to an
>> operational state.
>>
>> Interrupts that are level triggered will be detected at the TLMM when
>> the controller becomes operational. Edge interrupts however need to be
>> replayed again.
>>
>> Request the corresponding PDC IRQ, when the GPIO is requested as an IRQ,
>> but keep it disabled. During suspend, we can enable the PDC IRQ instead
>> of the GPIO IRQ, which may or not be detected.
>>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> ---
>> Changes in v2:
>> 	- Remove IRQF_NO_SUSPEND and IRQF_ONE_SHOT from PDC IRQ
>> Changes in v1:
>> 	- Trigger GPIO in h/w from PDC IRQ handler
>> 	- Avoid big tables for GPIO-PDC map, pick from DT instead
>> 	- Use handler_data
>> ---
>>  drivers/pinctrl/qcom/pinctrl-msm.c | 96 ++++++++++++++++++++++++++++++
>>  1 file changed, 96 insertions(+)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>> index 0e22f52b2a19..b675ea56a4ff 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>> @@ -687,11 +687,15 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>  	const struct msm_pingroup *g;
>>  	unsigned long flags;
>>  	u32 val;
>> +	struct irq_data *pdc_irqd = irq_get_handler_data(d->irq);
>>
>>  	g = &pctrl->soc->groups[d->hwirq];
>>
>>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>>
>> +	if (pdc_irqd)
>> +		irq_set_irq_type(pdc_irqd->irq, type);
>> +
>>  	/*
>>  	 * For hw without possibility of detecting both edges
>>  	 */
>> @@ -779,9 +783,13 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
>>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>  	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>>  	unsigned long flags;
>> +	struct irq_data *pdc_irqd = irq_get_handler_data(d->irq);
>>
>>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>>
>> +	if (pdc_irqd)
>> +		irq_set_irq_wake(pdc_irqd->irq, on);
>> +
>>  	irq_set_irq_wake(pctrl->irq, on);
>>
>>  	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>> @@ -863,6 +871,92 @@ static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
>>  	return device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0) > 0;
>>  }
>>
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
>> +		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>> +	}
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
>
>Do I understand correctly that this is the case where the pin isn't
>routed to the PDC?
>
Yes, correct.

>> +	}
>> +
>> +	ret = request_irq(irq, wake_irq_gpio_handler, irqd_get_trigger_type(d),
>> +			  pin_name, d);
>> +	if (ret) {
>> +		pr_warn("GPIO-%lu could not be set up as wakeup", d->hwirq);
>
>'\n' is missing
>
ok.
>> +		kfree(pin_name);
>> +		return ret;
>> +	}
>> +
>> +	irq_set_handler_data(d->irq, irq_get_irq_data(irq));
>> +	disable_irq(irq);
>> +
>> +	return 0;
>> +}
>> +
>> +static int msm_gpio_pdc_pin_release(struct irq_data *d)
>> +{
>> +	struct irq_data *pdc_irqd = irq_get_handler_data(d->irq);
>> +
>> +	if (pdc_irqd) {
>> +		irq_set_handler_data(d->irq, NULL);
>> +		free_irq(pdc_irqd->irq, d);
>
>You need to free 'pin_name' allocated in msm_gpio_pdc_pin_request().
>IIUC it should be available in irq_desc->action->name.
>
Yes, I didn't realize that free_irq returns the name when I posted this
series (noted in the cover letter). Will fix.

-- Lina

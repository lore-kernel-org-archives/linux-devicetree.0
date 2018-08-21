From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/5] drivers: pinctrl: qcom: add wakeup capability to
 GPIO
Date: Mon, 20 Aug 2018 23:08:44 -0700
Message-ID: <20180821060844.GB5603@tuxbook-pro>
References: <20180817163849.30750-1-ilina@codeaurora.org>
 <20180817163849.30750-2-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180817163849.30750-2-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: marc.zyngier@arm.com, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Fri 17 Aug 09:38 PDT 2018, Lina Iyer wrote:

Thanks Lina, I think this looks like a very reasonable approach!

> QCOM SoC's that have Power Domain Controller (PDC) chip in the always-on
> domain can wakeup the SoC, when interrupts and GPIOs are routed to the
> its interrupt controller. Only select GPIOs that are deemed wakeup
> capable are routed to specific PDC pins. During low power state, the
> pinmux interrupt controller may be non-functional but the PDC would be.
> The PDC can detect the wakeup GPIO is triggered and bring the TLMM to an
> operational state.
> 
> Interrupts that are level triggered will be detected at the TLMM when
> the controller becomes operational. Edge interrupts however need to be
> replayed again.
> 
> Request the corresponding PDC IRQ, when the GPIO is requested as an IRQ,
> but keep it disabled. During suspend, we can enable the PDC IRQ instead
> of the GPIO IRQ, which may or not be detected.
> 

Afaict we can model a driver for the MPM hardware - for previous
platforms - after your PDC driver and all of this logic will be reused.

As such I think it would be better to use the word "wake" instead of
"pdc" in the implementation. I don't see a problem with the commit
message being specific and talking about the PDC though, so keep that.

> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
> Changes in v1:
> 	- Trigger GPIO in h/w from PDC IRQ handler
> 	- Avoid big tables for GPIO-PDC map, pick from DT instead
> 	- Use handler_data
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 97 ++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 0e22f52b2a19..03ef1d29d078 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -687,11 +687,15 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  	const struct msm_pingroup *g;
>  	unsigned long flags;
>  	u32 val;
> +	struct irq_data *pdc_irqd = irq_get_handler_data(d->irq);
>  
>  	g = &pctrl->soc->groups[d->hwirq];
>  
>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>  
> +	if (pdc_irqd)
> +		irq_set_irq_type(pdc_irqd->irq, type);
> +
>  	/*
>  	 * For hw without possibility of detecting both edges
>  	 */
> @@ -779,9 +783,13 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
>  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>  	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
>  	unsigned long flags;
> +	struct irq_data *pdc_irqd = irq_get_handler_data(d->irq);
>  
>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>  
> +	if (pdc_irqd)
> +		irq_set_irq_wake(pdc_irqd->irq, on);
> +
>  	irq_set_irq_wake(pctrl->irq, on);

Given that the TLMM summary logic isn't powered during a collapse, is
there really a point in toggling the wake of the summary irq? (I wrote
this, not sure it is correct)

Also, we're not modifying any tlmm state here, so we shouldn't need that
spinlock.

>  
>  	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> @@ -863,6 +871,93 @@ static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
>  	return device_property_read_u16_array(pctrl->dev, "gpios", NULL, 0) > 0;
>  }
>  
> +static irqreturn_t wake_irq_gpio_handler(int irq, void *data)
> +{
> +	struct irq_data *irqd = data;
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
> +	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> +	const struct msm_pingroup *g;
> +	unsigned long flags;
> +	u32 val;
> +
> +	if (!irqd_is_level_type(irqd)) {

This deserves a comment in the code as well.

> +		g = &pctrl->soc->groups[irqd->hwirq];
> +		raw_spin_lock_irqsave(&pctrl->lock, flags);
> +		val = BIT(g->intr_status_bit);
> +		writel(val, pctrl->regs + g->intr_status_reg);
> +		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int msm_gpio_pdc_pin_request(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
> +	struct platform_device *pdev = to_platform_device(pctrl->dev);
> +	unsigned irq;
> +	unsigned long trigger;
> +	const char *pin_name;
> +	int ret;
> +
> +	pin_name = kasprintf(GFP_KERNEL, "gpio%lu", d->hwirq);

pin_name needs to be released in msm_gpio_pdc_pin_release() as well.

> +	if (!pin_name)
> +		return -ENOMEM;
> +
> +	irq = platform_get_irq_byname(pdev, pin_name);
> +	if (irq < 0) {
> +		kfree(pin_name);
> +		return 0;
> +	}
> +
> +	trigger = irqd_get_trigger_type(d) | IRQF_ONESHOT | IRQF_NO_SUSPEND;
> +	ret = request_irq(irq, wake_irq_gpio_handler, trigger, pin_name, d);
> +	if (ret) {
> +		pr_warn("GPIO-%lu could not be set up as wakeup", d->hwirq);
> +		kfree(pin_name);
> +		return ret;
> +	}
> +
> +	irq_set_handler_data(d->irq, irq_get_irq_data(irq));
> +	disable_irq(irq);
> +
> +	return 0;
> +}
> +
> +static int msm_gpio_pdc_pin_release(struct irq_data *d)
> +{
> +	struct irq_data *pdc_irqd = irq_get_handler_data(d->irq);
> +
> +	if (pdc_irqd) {
> +		irq_set_handler_data(d->irq, NULL);
> +		free_irq(pdc_irqd->irq, d);

free_irq() returns what was "pin_name" in msm_gpio_pdc_pin_request(), so
you should be able to free that.

> +	}
> +
> +	return 0;
> +}
> +

Regards,
Bjorn

From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v5 07/14] qcom: spmi-gpio: add support for hierarchical
 IRQ chip
Date: Fri, 18 Jan 2019 13:21:07 +0000
Message-ID: <94b2b50f-b0e7-3e5c-5ee5-c8df80d6f042@arm.com>
References: <20190117003234.22127-1-masneyb@onstation.org>
 <20190117003234.22127-8-masneyb@onstation.org>
 <e9234c48-9fce-1ec4-48f1-dff134559eed@arm.com>
 <20190118124221.GB32143@basecamp>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118124221.GB32143@basecamp>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 18/01/2019 12:42, Brian Masney wrote:
> Hi Marc,
> 
> On Thu, Jan 17, 2019 at 11:32:01AM +0000, Marc Zyngier wrote:
>>>  static int pmic_gpio_to_irq(struct gpio_chip *chip, unsigned pin)
>>>  {
>>>  	struct pmic_gpio_state *state = gpiochip_get_data(chip);
>>> -	struct pmic_gpio_pad *pad;
>>> +	struct irq_fwspec fwspec;
>>>  
>>> -	pad = state->ctrl->desc->pins[pin].drv_data;
>>> +	fwspec.fwnode = state->fwnode;
>>> +	fwspec.param_count = 2;
>>> +	fwspec.param[0] = pin + PMIC_GPIO_PHYSICAL_OFFSET;
>>> +	fwspec.param[1] = IRQ_TYPE_NONE;
>>
>> In my experience, IRQ_TYPE_NONE is rarely a good thing, unless you
>> expect the trigger information to be found by some other mean. I guess
>> that's one of the reasons why everything falls back to level in the SPMI
>> driver...
> 
> I'm not sure how to determine what trigger to put here. I thought that
> it would be up to the caller of request_any_context_irq() to explicitly
> set the expected trigger type when a GPIO is used, which will overwrite
> IRQ_TYPE_NONE with the proper trigger type.

The main issue is that IRQ_TYPE_NONE is a bit loosely defined, and
mostly means "keep whatever was there before", which is a bit like
rolling a dice each time you allocate an interrupt.

> 
> For example, I've tested the hierarchical IRQ domains with gpio-keys and
> when the gpio property is used, devm_request_any_context_irq() is called
> with the flags IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING. This calls
> __setup_irq(), which will call irq_set_type() and overwrite the trigger
> type.
> 
> irq_set_type() is only called when the IRQ is not shared, so I'm not
> sure if this would work as expected with a shared IRQ.

I'd suggest you force the type to a "safe" value such as rising edge,
and let the irq_set_type() call do the right thing, assuming you've
plugged the issue in the core SPMI driver.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...

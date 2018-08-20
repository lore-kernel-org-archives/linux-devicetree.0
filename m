From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH RESEND v1 2/5] drivers: pinctrl: msm: enable PDC interrupt
 only during suspend
Date: Mon, 20 Aug 2018 16:34:27 +0100
Message-ID: <047d37fb-1011-0650-6517-e6052ba47a18@arm.com>
References: <20180817191026.32245-1-ilina@codeaurora.org>
 <20180817191026.32245-3-ilina@codeaurora.org>
 <86a7pjq0l1.wl-marc.zyngier@arm.com> <20180820152629.GR5081@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180820152629.GR5081@codeaurora.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>
Cc: bjorn.andersson@linaro.org, sboyd@kernel.org, evgreen@chromium.org, linus.walleij@linaro.org, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, andy.gross@linaro.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On 20/08/18 16:26, Lina Iyer wrote:
> On Sat, Aug 18 2018 at 07:13 -0600, Marc Zyngier wrote:
>> Hi Lina,
>>
>> On Fri, 17 Aug 2018 20:10:23 +0100,
>> Lina Iyer <ilina@codeaurora.org> wrote:

[...]

>>> @@ -920,6 +928,8 @@ static int msm_gpio_pdc_pin_request(struct irq_data *d)
>>>  	}
>>>
>>>  	irq_set_handler_data(d->irq, irq_get_irq_data(irq));
>>> +	irq_set_handler_data(irq, d);
>>> +	irq_set_status_flags(irq, IRQ_DISABLE_UNLAZY);
>>
>> Could you explain what this is trying to do? I'm trying to understand
>> this code, but this function isn't in 4.18...
>>
> Oh, I have been able to test only on 4.14 so far. The flag does seem to
> exist at least, I didn't get a compiler error.
> 
> I read this in kernel/irq/chip.c -
> 
> If the interrupt chip does not implement the irq_disable callback,
> a driver can disable the lazy approach for a particular irq line by
> calling 'irq_set_status_flags(irq, IRQ_DISABLE_UNLAZY)'. This can
> be used for devices which cannot disable the interrupt at the
> device level under certain circumstances and have to use
> disable_irq[_nosync] instead.
> 
> And interpreted this as something that this would prevent 'relaxed'
> disable. I am enabling and disabling the IRQ in suspend path, that I
> thought this would help avoid issues caused by late disable. Am I
> mistaken?

Sorry, I wasn't clear enough. I'm talking about what you're trying to do
in this particular function (msm_gpio_pdc_pin_request), which doesn't
exist in 4.18. Short of having a bit of context, I can hardly review this.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...

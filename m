From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/9] drivers: irqchip: Add STM32 external interrupts support
Date: Fri, 8 Apr 2016 11:47:31 +0200
Message-ID: <CACRpkdZKaVRMH2ucMh_7WLzZ8WhTSrwDghB_YqsBdacm2cLcpg@mail.gmail.com>
References: <1459436979-17275-1-git-send-email-mcoquelin.stm32@gmail.com>
	<1459436979-17275-3-git-send-email-mcoquelin.stm32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1459436979-17275-3-git-send-email-mcoquelin.stm32@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Bruno Herrera <bruherrera@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 31, 2016 at 5:09 PM, Maxime Coquelin
<mcoquelin.stm32@gmail.com> wrote:

> +       gc = domain->gc->gc[0];
> +       gc->reg_base                         = base;
> +       gc->chip_types->type               = IRQ_TYPE_EDGE_BOTH;
> +       gc->chip_types->chip.name          = gc->chip_types[0].chip.name;
> +       gc->chip_types->chip.irq_ack       = irq_gc_ack_set_bit;
> +       gc->chip_types->chip.irq_mask      = irq_gc_mask_clr_bit;
> +       gc->chip_types->chip.irq_unmask    = irq_gc_mask_set_bit;
> +       gc->chip_types->chip.irq_set_type  = stm32_irq_set_type;
> +       gc->chip_types->chip.irq_set_wake  = stm32_irq_set_wake;
> +       gc->chip_types->regs.ack           = EXTI_PR;
> +       gc->chip_types->regs.mask          = EXTI_IMR;
> +       gc->chip_types->handler            = handle_edge_irq;

If this is used by a GPIO chip (as happens in another part of
the series), you need to set up the .irq_request_resources()
and .irq_release_resources() to call gpiochip_lock_as_irq()
and gpiochip_unlock_as_irq().

As with the other comment on the GPIO patch, the separation
of concerns between irqchip and gpiochip is a bit artificial
here and breaks down somewhat.

Yours,
Linus Walleij

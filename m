From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 2/9] drivers: irqchip: Add STM32 external interrupts
 support
Date: Tue, 13 Sep 2016 17:21:26 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1609131713490.6233@nanos>
References: <1473432124-6784-1-git-send-email-alexandre.torgue@st.com> <1473432124-6784-3-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1473432124-6784-3-git-send-email-alexandre.torgue@st.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre TORGUE <alexandre.torgue@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, bruherrera@gmail.com, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, 9 Sep 2016, Alexandre TORGUE wrote:
> +static void stm32_exti_free(struct irq_domain *d, unsigned int virq,
> +			    unsigned int nr_irqs)
> +{
> +	struct irq_data *data = irq_get_irq_data(virq);
> +
> +	irq_gc_mask_clr_bit(data->parent_data);

I have a hard time to understand this. The irq domain is not hierarchical.

> +	irq_domain_reset_irq_data(data);

> +	domain = irq_domain_add_linear(node, nr_exti,
> +				       &irq_exti_domain_ops, NULL);

It's a simple linear domain. So how can data->parent_data be a valid
irq_data pointer? Answer: It can't!

But it doesn't blow up in your face simply because the alloc/free callbacks
are never invoked for simple non hierarchical domains. So you should have
removed that stuff after copying some other irqchip driver.

Thanks,

	tglx

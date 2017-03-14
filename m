From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 5/6] gpio: Add gpio driver support for ThunderX and OCTEON-TX
Date: Tue, 14 Mar 2017 16:02:34 +0100
Message-ID: <CACRpkdY1yKCrjTshmGVcKO2gDjC6cNufG1+VC_31Of1iJxYyiA@mail.gmail.com>
References: <1488332932-2691-1-git-send-email-david.daney@cavium.com> <1488332932-2691-6-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1488332932-2691-6-git-send-email-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <david.daney@cavium.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 1, 2017 at 2:48 AM, David Daney <david.daney@cavium.com> wrote:

> Cavium ThunderX and OCTEON-TX are arm64 based SoCs.  Add driver for
> the on-chip GPIO pins.
>
> Signed-off-by: David Daney <david.daney@cavium.com>

I guess this can't be merged until the corresponding IRQ changes
are merged. It can be applied in the irqchip tree or next merge
window or they can give me an immutable branch to pull to
the GPIO subsystem or whatever works.

Some pretty minor things remain.

> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/spinlock.h>

I think you should explicitly include <linux/bitops.h>

Other than that it is all fine.

> +/*
> + * Interrupts are chained from underlying MSI-X vectors.  We have
> + * these irq_chip functions to be able to handle level triggering
> + * semantics and other acknowledgment tasks associated with the GPIO
> + * mechanism.
> + */
> +static struct irq_chip thunderx_gpio_irq_chip = {
> +       .name                   = "GPIO",
> +       .irq_enable             = thunderx_gpio_irq_enable,
> +       .irq_disable            = thunderx_gpio_irq_disable,
> +       .irq_ack                = thunderx_gpio_irq_ack,
> +       .irq_mask               = thunderx_gpio_irq_mask,
> +       .irq_mask_ack           = thunderx_gpio_irq_mask_ack,
> +       .irq_unmask             = thunderx_gpio_irq_unmask,
> +       .irq_eoi                = irq_chip_eoi_parent,
> +       .irq_set_affinity       = irq_chip_set_affinity_parent,
> +       .irq_set_type           = thunderx_gpio_irq_set_type,
> +
> +       .flags                  = IRQCHIP_SET_TYPE_MASKED
> +};

I think you should implement .irq_request_resources() and
.irq_release_resources() calling
gpiochip_lock_as_irq(chip, d->hwirq)
and gpiochip_unlock_as_irq(chip, d->hwirq) respectively,
much like gpiochip_irq_reqres() and gpiochip_irq_relres()
in the gpiolib.

This helps the kernel knowing that the lines are taken for
interrupts and must be inputs.

> +static int thunderx_gpio_irq_map(struct irq_domain *d, unsigned int irq,
> +                                irq_hw_number_t hwirq)
> +{
> +       irq_set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);

I would prefer that you just write the right state into the hardware
if that is what you want to do. Normally the consumer specifies
trigger type.

But I'm uncertain, maybe this is allright with the IRQ maintainers.

Apart from these nitpicks it is a beautiful driver.

Yours,
Linus Walleij

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: ocelot: add support for interrupt controller
Date: Mon, 6 Aug 2018 13:06:23 +0200
Message-ID: <CACRpkdbq2Q-J8scsuaUS0hP1x12xh0zd+RMrCp0TYB773bOAdg@mail.gmail.com>
References: <20180725122621.31713-1-quentin.schulz@bootlin.com> <20180725122621.31713-2-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725122621.31713-2-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: quentin.schulz@bootlin.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, paul.burton@mips.com, James Hogan <jhogan@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Quentin, sorry for delays!

On Wed, Jul 25, 2018 at 2:27 PM Quentin Schulz
<quentin.schulz@bootlin.com> wrote:

> This GPIO controller can serve as an interrupt controller as well on the
> GPIOs it handles.
>
> An interrupt is generated whenever a GPIO line changes and the
> interrupt for this GPIO line is enabled. This means that both the
> changes from low to high and high to low generate an interrupt.
>
> For some use cases, it makes sense to ignore the high to low change and
> not generate an interrupt. Such a use case is a line that is hold in a
> level high/low manner until the event holding the line gets acked.
> This can be achieved by making sure the interrupt on the GPIO controller
> side gets acked and masked only after the line gets hold in its default
> state, this is what's done with the fasteoi functions.
>
> Only IRQ_TYPE_EDGE_BOTH and IRQ_TYPE_LEVEL_HIGH are supported for now.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Patch applied, it's such a pretty and straight-forward patch.
Also IRQ is probably very nice to have, so let's get this in and
supported.

Please consider addressing the following in follow-up patch(es):

> +static int ocelot_irq_set_type(struct irq_data *data, unsigned int type);

Can't you just move the function above so you don't have to forward-declare
this?

> +static struct irq_chip ocelot_eoi_irqchip = {
> +       .name           = "gpio",
> +       .irq_mask       = ocelot_irq_mask,
> +       .irq_eoi        = ocelot_irq_ack,
> +       .irq_unmask     = ocelot_irq_unmask,
> +       .flags          = IRQCHIP_EOI_THREADED | IRQCHIP_EOI_IF_HANDLED,

As you see the latter part of the define is "IF_HANDLED".

> +       .irq_set_type   = ocelot_irq_set_type,
> +};
> +
> +static struct irq_chip ocelot_irqchip = {
> +       .name           = "gpio",
> +       .irq_mask       = ocelot_irq_mask,
> +       .irq_ack        = ocelot_irq_ack,
> +       .irq_unmask     = ocelot_irq_unmask,
> +       .irq_set_type   = ocelot_irq_set_type,
> +};

Is it really neccessary to have two irqchips?

Is this to separate ACK and EOI because the EOI version
doesn't survive an ACK?

Yours,
Linus Walleij

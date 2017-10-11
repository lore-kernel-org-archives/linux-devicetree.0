From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 2/2] gpio: uniphier: add UniPhier GPIO controller driver
Date: Wed, 11 Oct 2017 10:40:58 +0200
Message-ID: <CACRpkdYRwwAVY2JuwB8goOfOJG2w0agoMwA1dFDaKA1RN=q+fw@mail.gmail.com>
References: <1506480022-8995-1-git-send-email-yamada.masahiro@socionext.com> <1506480022-8995-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1506480022-8995-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 27, 2017 at 4:40 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This GPIO controller is used on UniPhier SoC family.
>
> It also serves as an interrupt controller, but interrupt signals are
> just delivered to the parent irqchip without any latching or OR'ing.
> This type of hardware can be well described with hierarchy IRQ domain.
>
> One unfortunate thing for this device is that the interrupt mapping to
> the interrupt parent is not contiguous.
>
> I asked how DT can describe interrupt mapping between two irqchips [1],
> but I could not find a good solution (at least in the framework level).
> In fact, irqchip drivers using hierarchy domain generally hard-code the
> DT binding of their parent.
>
> After tackling on several approaches such as hard-code of hwirqs,
> irq_domain_push_irq(), I ended up with a vendor specific property.
> If we come up with a good idea to support this in the framework, we
> can migrate over to it, but we can live with a driver-level solution
> for now.
>
> [1] https://lkml.org/lkml/2017/7/6/758
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Mostly happy with this.

> @@ -2036,6 +2036,7 @@ F:        arch/arm/mm/cache-uniphier.c
>  F:     arch/arm64/boot/dts/socionext/
>  F:     drivers/bus/uniphier-system-bus.c
>  F:     drivers/clk/uniphier/
> +F:     drivers/gpio/gpio-uniphier.c

Also add an entry for the device tree bindings please.

> +++ b/include/dt-bindings/gpio/uniphier-gpio.h
> @@ -0,0 +1,18 @@
> +/*
> + * Copyright (C) 2017 Socionext Inc.
> + *   Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> + */
> +
> +#ifndef _DT_BINDINGS_GPIO_UNIPHIER_H
> +#define _DT_BINDINGS_GPIO_UNIPHIER_H
> +
> +#define UNIPHIER_GPIO_LINES_PER_BANK   8
> +
> +#define UNIPHIER_GPIO_IRQ_OFFSET       ((UNIPHIER_GPIO_LINES_PER_BANK) * 15)
> +
> +#define UNIPHIER_GPIO_PORT(bank, line) \
> +                       ((UNIPHIER_GPIO_LINES_PER_BANK) * (bank) + (line))
> +
> +#define UNIPHIER_GPIO_IRQ(n)           ((UNIPHIER_GPIO_IRQ_OFFSET) + (n))
> +
> +#endif /* _DT_BINDINGS_GPIO_UNIPHIER_H */

I do not understand what some of these things are doing in the
device tree header file.

It just looks creepingly similar to some of the magic I've seen
in board files.

It makes much more sense that the device trees either:

- Use the interrupts as a flat array 0...N across all banks

- Model each bank as a separate GPIO chip

This is somewhere inbetween, you are modeling it as a single
gpiochip but still not, becuase the device tree author still need
to address banking, that is confusing.

Yours,
Linus Walleij

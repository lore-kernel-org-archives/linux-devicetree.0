From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v13 06/13] irqchip: Add irq-ingenic-tcu driver
Date: Tue, 25 Jun 2019 08:51:07 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1906250845540.32342@nanos.tec.linutronix.de>
References: <20190624225759.18299-1-paul@crapouillou.net> <20190624225759.18299-7-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624225759.18299-7-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Mathieu Malaterre <malat@debian.org>, od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

On Tue, 25 Jun 2019, Paul Cercueil wrote:

> --- /dev/null
> +++ b/drivers/irqchip/irq-ingenic-tcu.c
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * JZ47xx SoCs TCU IRQ driver
> + * Copyright (C) 2019 Paul Cercueil <paul@crapouillou.net>
> + */

Nothing to complain here. Just a few nit picks.

> +
> +struct ingenic_tcu {
> +	struct regmap *map;
> +	struct clk *clk;
> +
> +	struct irq_domain *domain;
> +	unsigned int nb_parent_irqs;
> +	u32 parent_irqs[3];
> +};

In case you respin this then please format it tabular:

struct ingenic_tcu {
	struct regmap		*map;
	struct clk		*clk;
	struct irq_domain	*domain;
	unsigned int		nb_parent_irqs;
	u32			parent_irqs[3];
};

It's simpler to parse that way, at least for me :)

Anyway:

      Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

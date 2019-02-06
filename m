From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/9] mfd: pm8xxx: convert to v2 irq interfaces to support
 hierarchical IRQ chips
Date: Wed, 6 Feb 2019 14:07:52 +0100
Message-ID: <CACRpkdZMe+JEQOa1yBfOoAErrC41Q9rggwxNb=_uwq1m2QKWyw@mail.gmail.com>
References: <20190125162302.14036-1-masneyb@onstation.org> <20190125162302.14036-4-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125162302.14036-4-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
List-Id: devicetree@vger.kernel.org

Hi Brian!

I found one more bug in this patch, still not the last bug but I'm still
digging around:

On Fri, Jan 25, 2019 at 5:23 PM Brian Masney <masneyb@onstation.org> wrote:

> +struct pm_irq_data {
> +       int num_irqs;
> +       struct irq_chip *irq_chip;
> +       void (*irq_handler)(struct irq_desc *desc);
> +};
> +
>  struct pm_irq_chip {
>         struct regmap           *regmap;
>         spinlock_t              pm_irq_lock;
>         struct irq_domain       *irqdomain;
> -       unsigned int            num_irqs;
>         unsigned int            num_blocks;
>         unsigned int            num_masters;
>         u8                      config[0];
> -};
> -
> -struct pm_irq_data {
> -       int num_irqs;
> -       const struct irq_domain_ops  *irq_domain_ops;
> -       void (*irq_handler)(struct irq_desc *desc);
> +       const struct pm_irq_data *pm_irq_data;
>  };

This doesn't work: the config[0] must be the tail element
of the struct since we allocate dynamically the trailing
config[] bytes.

As it looks now, the *pm_irq_data gets overwritten by
the configs and it crashes.

Yours,
Linus Walleij

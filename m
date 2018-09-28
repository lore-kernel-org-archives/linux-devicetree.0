From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: qcom: Introduce readl/writel accessors
Date: Fri, 28 Sep 2018 09:11:50 +0200
Message-ID: <CACRpkdaxXz8=An-tQwhjnn2e3QwMbs=b6mE8BfL0HA8aeBjxKQ@mail.gmail.com>
References: <20180924221748.21584-1-bjorn.andersson@linaro.org>
 <20180924221748.21584-2-bjorn.andersson@linaro.org> <CACRpkdaWboGvKVaSjv4C1CCz5DJXbB+ZWV6vGeyX93vb4zo1sw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaWboGvKVaSjv4C1CCz5DJXbB+ZWV6vGeyX93vb4zo1sw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 28, 2018 at 9:10 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> This clashes with Stephen Boyds fix:
> "pinctrl: msm: Really mask level interrupts to prevent latching"
>
> I've resolved it like this:

Also this:
static void msm_gpio_irq_unmask(struct irq_data *d)
{
    struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
    struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
    const struct msm_pingroup *g;
    unsigned long flags;
    u32 val;

    g = &pctrl->soc->groups[d->hwirq];

    raw_spin_lock_irqsave(&pctrl->lock, flags);

    val = msm_readl_intr_cfg(pctrl, g);
    val |= BIT(g->intr_raw_status_bit);
    val |= BIT(g->intr_enable_bit);
    msm_writel_intr_cfg(val, pctrl, g);

    set_bit(d->hwirq, pctrl->enabled_irqs);

    raw_spin_unlock_irqrestore(&pctrl->lock, flags);
}

Yours,
Linus Walleij

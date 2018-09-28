From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: qcom: Introduce readl/writel accessors
Date: Fri, 28 Sep 2018 09:10:35 +0200
Message-ID: <CACRpkdaWboGvKVaSjv4C1CCz5DJXbB+ZWV6vGeyX93vb4zo1sw@mail.gmail.com>
References: <20180924221748.21584-1-bjorn.andersson@linaro.org> <20180924221748.21584-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180924221748.21584-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 25, 2018 at 12:15 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> In preparation for the support for dispersed tiles move all readl and
> writel calls to helper functions. This will allow us to isolate the
> added complexity of another indirection.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

This clashes with Stephen Boyds fix:
"pinctrl: msm: Really mask level interrupts to prevent latching"

I've resolved it like this:

static void msm_gpio_irq_mask(struct irq_data *d)
{
    struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
    struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
    const struct msm_pingroup *g;
    unsigned long flags;
    u32 val;

    g = &pctrl->soc->groups[d->hwirq];

    raw_spin_lock_irqsave(&pctrl->lock, flags);

    val = msm_readl_intr_cfg(pctrl, g);
    /*
     * There are two bits that control interrupt forwarding to the CPU. The
     * RAW_STATUS_EN bit causes the level or edge sensed on the line to be
     * latched into the interrupt status register when the hardware detects
     * an irq that it's configured for (either edge for edge type or level
     * for level type irq). The 'non-raw' status enable bit causes the
     * hardware to assert the summary interrupt to the CPU if the latched
     * status bit is set. There's a bug though, the edge detection logic
     * seems to have a problem where toggling the RAW_STATUS_EN bit may
     * cause the status bit to latch spuriously when there isn't any edge
     * so we can't touch that bit for edge type irqs and we have to keep
     * the bit set anyway so that edges are latched while the line is masked.
     *
     * To make matters more complicated, leaving the RAW_STATUS_EN bit
     * enabled all the time causes level interrupts to re-latch into the
     * status register because the level is still present on the line after
     * we ack it. We clear the raw status enable bit during mask here and
     * set the bit on unmask so the interrupt can't latch into the hardware
     * while it's masked.
     */
    if (irqd_get_trigger_type(d) & IRQ_TYPE_LEVEL_MASK)
        val &= ~BIT(g->intr_raw_status_bit);

    val &= ~BIT(g->intr_enable_bit);
    msm_writel_intr_cfg(val, pctrl, g);

    clear_bit(d->hwirq, pctrl->enabled_irqs);

    raw_spin_unlock_irqrestore(&pctrl->lock, flags);
}


Please check.

Yours,
Linus Walleij

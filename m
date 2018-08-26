From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/5] drivers: pinctrl: qcom: add wakeup capability to GPIO
Date: Sun, 26 Aug 2018 16:33:15 +0200
Message-ID: <CACRpkdb+Opdn1eWZSRydS1Bafpqwcg83xEcT-YJC6D-kSSi1ew@mail.gmail.com>
References: <20180817163849.30750-1-ilina@codeaurora.org> <20180817163849.30750-2-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180817163849.30750-2-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ilina@codeaurora.org, Hans Verkuil <hverkuil@xs4all.nl>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, evgreen@chromium.org, rplsssn@codeaurora.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Rajendra Nayak <rnayak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 17, 2018 at 6:39 PM Lina Iyer <ilina@codeaurora.org> wrote:

> QCOM SoC's that have Power Domain Controller (PDC) chip in the always-on
> domain can wakeup the SoC, when interrupts and GPIOs are routed to the
> its interrupt controller. Only select GPIOs that are deemed wakeup
> capable are routed to specific PDC pins. During low power state, the
> pinmux interrupt controller may be non-functional but the PDC would be.
> The PDC can detect the wakeup GPIO is triggered and bring the TLMM to an
> operational state.
>
> Interrupts that are level triggered will be detected at the TLMM when
> the controller becomes operational. Edge interrupts however need to be
> replayed again.
>
> Request the corresponding PDC IRQ, when the GPIO is requested as an IRQ,
> but keep it disabled. During suspend, we can enable the PDC IRQ instead
> of the GPIO IRQ, which may or not be detected.
>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---
> Changes in v1:
>         - Trigger GPIO in h/w from PDC IRQ handler
>         - Avoid big tables for GPIO-PDC map, pick from DT instead
>         - Use handler_data

Just for the record this is an impressive and much needed patch
set, no other SoC developer has yet taken on the task of making this
work so I very much appreciate that Qualcomm show the way.

> +static int msm_gpio_pdc_pin_request(struct irq_data *d)
> +static int msm_gpio_pdc_pin_release(struct irq_data *d)
> +static int msm_gpio_irq_reqres(struct irq_data *d)
> +{
(...)
> +       if (gpiochip_lock_as_irq(gc, irqd_to_hwirq(d))) {
(...)
> +static void msm_gpio_irq_relres(struct irq_data *d)
> +{
> +       gpiochip_unlock_as_irq(gc, irqd_to_hwirq(d));
> +}

FYI Hans Verkuil is working on a patch set that moves the
lock/unlock as IRQ call to the irqchip request() and release()
functions so we can switch a GPIO irqchip line from IRQ
mode to say output at runtime without too much trouble.
(CEC needs this.)

I suspect that will make your work easier?

Hans can you include Lina in the loop for your patches
so she can take that into accoun because I think we might
need that as a base for this.

Yours,
Linus Walleij

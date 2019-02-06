From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/9] pinctrl: qcom: ssbi-gpio: hardcode IRQ counts
Date: Wed, 6 Feb 2019 10:38:08 +0100
Message-ID: <CACRpkdZQcJ9ZrUdMdgYFN2H1QkOsgdKfsz4PEnJFtYra0+RM1g@mail.gmail.com>
References: <20190125162302.14036-1-masneyb@onstation.org> <20190125162302.14036-2-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190125162302.14036-2-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Masney <masneyb@onstation.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawnguo@kernel.org>, Doug Anderson <dianders@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, linux-arm-msm@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
List-Id: devicetree@vger.kernel.org

Hi Brian!

On Fri, Jan 25, 2019 at 5:23 PM Brian Masney <masneyb@onstation.org> wrote:

> The probing of this driver calls platform_irq_count, which will
> setup all of the IRQs that are configured in device tree. In
> preparation for converting this driver to be a hierarchical IRQ
> chip, hardcode the IRQ count based on the hardware type so that all
> the IRQs are not configured immediately and are configured on an
> as-needed basis later in the boot process. This change will also
> allow for the removal of the interrupts property later in this
> patch series once the hierarchical IRQ chip support is in.
>
> This patch also removes the generic qcom,ssbi-gpio OF match since we
> don't know the number of pins. All of the existing upstream bindings
> already include the more-specific binding.
>
> This change was not tested on any actual hardware, however the same
> change was made to spmi-gpio and tested on a LG Nexus 5 (hammerhead)
> phone.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

I found a bug here:

> -       pctrl->dev = &pdev->dev;

Do not delete this line. Subsequent code makes heavy use
of pctrl->dev and crashes.

After fixing this I get other crashes :D but those are from
other patches so I try to locate those problems too.

Yours,
Linus Walleij

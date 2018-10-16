From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] irqchip: add driver for imx-irqsteer controller
Date: Tue, 16 Oct 2018 13:48:59 -0300
Message-ID: <CAOMZO5CS6e00V4aCeCwEBO6z8FXq2ZiCJK-FgWDDK5qu6cYOqw@mail.gmail.com>
References: <20181016164218.3736-1-l.stach@pengutronix.de> <20181016164218.3736-2-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016164218.3736-2-l.stach@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On Tue, Oct 16, 2018 at 1:43 PM Lucas Stach <l.stach@pengutronix.de> wrote:

> --- /dev/null
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

According to Documentation/process/license-rules.rst this should be:
// SPDX-License-Identifier: GPL-2.0+

> +       ret = clk_prepare_enable(data->ipg_clk);
> +       if (ret) {
> +               dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
> +               return ret;
> +       }
> +
> +       /* enable channel 1 by default */
> +       writel_relaxed(1, data->regs + CHANCTRL);
> +
> +       data->domain = irq_domain_add_linear(np, data->channum * 32,
> +                                            &imx_irqsteer_domain_ops, data);
> +       if (!data->domain) {
> +               dev_err(&data->pdev->dev, "failed to create IRQ domain\n");

You should call clk_disable_unprepare(irqsteer_data->ipg_clk); prior
to returning.

> +               return -ENOMEM;

From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 06/17] gpio: mvebu: add suspend/resume support
Date: Fri, 31 Oct 2014 08:00:10 +0100
Message-ID: <CACRpkda-8p=e_12vpUNt3_Y0EVPDArEKJUi63B8CGemNwVuQ0w@mail.gmail.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1414151970-6626-7-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1414151970-6626-7-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 24, 2014 at 1:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> This commit adds the implementation of ->suspend() and ->resume()
> platform_driver hooks in order to save and restore the state of the
> GPIO configuration. In order to achieve that, additional fields are
> added to the mvebu_gpio_chip structure.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org

(...)
> +       mvchip->out_reg = readl(mvebu_gpioreg_out(mvchip));
> +       mvchip->io_conf_reg = readl(mvebu_gpioreg_io_conf(mvchip));
> +       mvchip->blink_en_reg = readl(mvebu_gpioreg_blink(mvchip));
> +       mvchip->in_pol_reg = readl(mvebu_gpioreg_in_pol(mvchip));

OK...

> +       switch (mvchip->soc_variant) {
> +       case MVEBU_GPIO_SOC_VARIANT_ORION:
> +               mvchip->edge_mask_regs[0] =
> +                       readl(mvchip->membase + GPIO_EDGE_MASK_OFF);
> +               mvchip->level_mask_regs[0] =
> +                       readl(mvchip->membase + GPIO_LEVEL_MASK_OFF);
> +               break;

You are assigning index [0] twice, why? There must be some
reason, and it should be stated in a comment. If the first read
is necessary for hardware reasons, don't assign it but
discard the result.

(void) readl(...);

(This pattern repeats for each save call below.)

> +       switch (mvchip->soc_variant) {
> +       case MVEBU_GPIO_SOC_VARIANT_ORION:
> +               writel(mvchip->edge_mask_regs[0],
> +                      mvchip->membase + GPIO_EDGE_MASK_OFF);
> +               writel(mvchip->level_mask_regs[0],
> +                      mvchip->membase + GPIO_LEVEL_MASK_OFF);

And on the way up same thing. Now you write
each register twice. Why?

Yours,
Linus Walleij

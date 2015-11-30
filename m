From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 5/5] pinctrl/lantiq: Implement gpio_chip.to_irq
Date: Mon, 30 Nov 2015 13:21:33 +0100
Message-ID: <CACRpkdaeCR+h+3qLkJXuhwfSCffgbn-nzdKasVxQAKETbk6s5A@mail.gmail.com>
References: <1448532010-30930-1-git-send-email-mschiller@tdt.de>
	<1448532010-30930-5-git-send-email-mschiller@tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1448532010-30930-5-git-send-email-mschiller@tdt.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Martin Schiller <mschiller@tdt.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ralf Baechle <ralf@linux-mips.org>, John Crispin <blogic@openwrt.org>, Hauke Mehrtens <hauke@hauke-m.de>, Jonas Gorski <jogo@openwrt.org>, daniel.schwierzeck@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 26, 2015 at 11:00 AM, Martin Schiller <mschiller@tdt.de> wrote:

Please write a commit message.

> From: John Crispin <blogic@openwrt.org>
>
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Signed-off-by: Martin Schiller <mschiller@tdt.de>
> ---
> Changes in v3:
> - Moved this change into a separate patch

(...)
> +static int xway_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
> +{
> +       struct ltq_pinmux_info *info = dev_get_drvdata(chip->dev);
> +       int i;
> +
> +       for (i = 0; i < info->num_exin; i++)
> +               if (info->exin[i] == offset)
> +                       return ltq_eiu_get_irq(i);
> +
> +       return -1;
> +}
> +
(...)
> +       .to_irq = xway_gpio_to_irq,

Can you explain this a bit, and add a comment in the code as to
what is going on?

I take it that the Lantiq has a dedicated IRQ line for some of the
GPIO lines, referred to as external interrupts, and then you just
go in and grab that frm the external interrupt unit like this?

Looks OK, just send an updated patch with some more
explanations.

Yours,
Linus Walleij

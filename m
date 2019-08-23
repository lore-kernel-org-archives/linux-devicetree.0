From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 05/11] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
Date: Fri, 23 Aug 2019 10:57:03 +0200
Message-ID: <CACRpkdZa_sQgvWC3ic0NxrVi9gS1cNTsV-wa-SDpA0e5kutBRw@mail.gmail.com>
References: <1566206502-4347-1-git-send-email-mars.cheng@mediatek.com> <1566206502-4347-6-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566206502-4347-6-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mars Cheng <mars.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Stephen Boyd <sboyd@kernel.org>, Sean Wang <sean.wang@kernel.org>, CC Hwang <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, wsd_upstream@mediatek.com, mtk01761 <wendell.lin@mediatek.com>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2019 at 11:22 AM Mars Cheng <mars.cheng@mediatek.com> wrote:

> for virtual gpios, they should not do reg setting and
> should behave as expected for eint function.
>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>

This does not explain what a "virtual GPIO" is in this
context, so please elaborate. What is this? Why does
it exist? What is it used for?

GPIO is "general purpose input/output" and it is a
pretty rubbery category already as it is, so we need
to define our terms pretty strictly.

> +bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
> +{
> +       const struct mtk_pin_desc *desc;
> +       bool virt_gpio = false;
> +
> +       if (gpio_n >= hw->soc->npins)
> +               return virt_gpio;
> +
> +       desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
> +
> +       if (desc->funcs &&
> +           desc->funcs[desc->eint.eint_m].name == 0)

NULL check is done like this:

if (desc->funcs && !desc->funcs[desc->eint.eint_m].name)

> +               virt_gpio = true;

So why is this GPIO "virtual" because it does not have
a name in the funcs table?

> @@ -278,6 +295,9 @@ static int mtk_xt_set_gpio_as_eint(void *data, unsigned long eint_n)
>         if (err)
>                 return err;
>
> +       if (mtk_is_virt_gpio(hw, gpio_n))
> +               return 0;

So does this mean we always succeed in setting a GPIO as eint
if it is virtual? Why? Explanatory comment is needed.

> @@ -693,6 +693,9 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>         const struct mtk_pin_desc *desc;
>         int value, err;
>
> +       if (mtk_is_virt_gpio(hw, gpio))
> +               return 1;

Why are "virtual GPIOs" always inputs?

Yours,
Linus Walleij

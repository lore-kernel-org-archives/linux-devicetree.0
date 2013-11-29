From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7] gpio: Add MOXA ART GPIO driver
Date: Fri, 29 Nov 2013 21:29:37 +0100
Message-ID: <CACRpkdZbLJh-qDtEhA1Q4X9ABDtv5XTtd9-CkF2LTwzKnDbguA@mail.gmail.com>
References: <1385651945-22355-1-git-send-email-jonas.jensen@gmail.com>
	<1385723494-8033-1-git-send-email-jonas.jensen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1385723494-8033-1-git-send-email-jonas.jensen@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jonas Jensen <jonas.jensen@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 29, 2013 at 12:11 PM, Jonas Jensen <jonas.jensen@gmail.com> wrote:

> Add GPIO driver for MOXA ART SoCs.
>
> Signed-off-by: Jonas Jensen <jonas.jensen@gmail.com>

OK this v6 version is looking *really good* so I have
applied it, couldn't hesitate.

> +static struct gpio_chip moxart_template_chip = {
> +       .label                  = "moxart-gpio",
> +       .request                = moxart_gpio_request,
> +       .free                   = moxart_gpio_free,
> +       .direction_input        = moxart_gpio_direction_input,
> +       .direction_output       = moxart_gpio_direction_output,
> +       .set                    = moxart_gpio_set,
> +       .get                    = moxart_gpio_get,
> +       .base                   = 0,
> +       .ngpio                  = 32,
> +       .can_sleep              = 0,
> +};

No need to initialized unused fields to zero, that is by
default. But no big deal.

> +static const struct of_device_id moxart_gpio_match[] = {
> +       { .compatible = "moxa,moxart-gpio" },
> +       { }
> +};

This vendor prefix does not exist in
Documentation/devicetree/bindings/vendor-prefixes.txt
Please send a follow-up patch adding it and I can merge
that through the GPIO tree as well.

Yours,
Linus Walleij

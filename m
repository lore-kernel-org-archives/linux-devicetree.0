From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add optional reset gpio control
Date: Wed, 4 Jan 2017 01:37:23 +0200
Message-ID: <CAHp75VeCKPy4B51P_N9Bp03zPUbRodKzitc-n16ZRKJWcEF4fA@mail.gmail.com>
References: <1483391271-17304-1-git-send-email-steve_longerbeam@mentor.com> <1483391271-17304-2-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1483391271-17304-2-git-send-email-steve_longerbeam@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Steve Longerbeam <steve_longerbeam@mentor.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 2, 2017 at 11:07 PM, Steve Longerbeam <slongerbeam@gmail.com> wrote:
> Add optional reset-gpios pin control. If present, de-assert the
> specified reset gpio pin to bring the chip out of reset.

> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -22,6 +22,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/acpi.h>
>  #include <linux/regulator/consumer.h>

> +#include <linux/gpio/consumer.h>

Please, try to put it somehow alphabetically ordered (yes, I see it's
not in general, but try to squeeze it into longest part which is
ordered).

>
>  #define PCA953X_INPUT          0
>  #define PCA953X_OUTPUT         1
> @@ -754,8 +755,18 @@ static int pca953x_probe(struct i2c_client *client,
>                 invert = pdata->invert;
>                 chip->names = pdata->names;
>         } else {
> +               struct gpio_desc *reset_gpio;
> +
>                 chip->gpio_start = -1;
>                 irq_base = 0;
> +
> +               /* see if we need to de-assert a reset pin */

see -> See

> +               reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +                                                    GPIOD_OUT_LOW);

Shouldn't be _optional_exclusive?
See this recent discussion https://patchwork.ozlabs.org/patch/706002/

> +               if (IS_ERR(reset_gpio)) {
> +                       dev_err(&client->dev, "request for reset pin failed\n");
> +                       return PTR_ERR(reset_gpio);
> +               }
>         }

-- 
With Best Regards,
Andy Shevchenko

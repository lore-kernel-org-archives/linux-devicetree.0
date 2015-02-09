From: Tyler Hall <tylerwhall@gmail.com>
Subject: Re: gpio-pxa: getting GPIOs by devicetree phandle broken
Date: Mon, 9 Feb 2015 09:41:17 -0500
Message-ID: <CAOjnSCZgx5H75t8QrXj1WQ_SaU_4HDYeK+_XdBRmwUXzHW=iJw@mail.gmail.com>
References: <CAOjnSCajhwdRVZUO99KL-9PF6HitZen04MoLKoDUDr_5=iS7kw@mail.gmail.com>
 <CAAVeFu+yf6Wf6MspiDLiWwQkMwMvimNa0SpMK_yO_9X07UecEw@mail.gmail.com> <4B6D6D87A8FB62428BE0A3E38461A1AB18D6B200@irsmsx105.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <4B6D6D87A8FB62428BE0A3E38461A1AB18D6B200@irsmsx105.ger.corp.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Holmberg, Hans" <hans.holmberg@intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Daniel Mack <zonque@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Howard Cochran <cochran@lexmark.com>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: devicetree@vger.kernel.org

> The issue with multiple gpiochips per of-node could be worked around as followed I believe, comments?
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 08261f2..43984ab 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -47,11 +47,12 @@ static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
>         ret = gc->of_xlate(gc, &gg_data->gpiospec, gg_data->flags);
>         if (ret < 0) {
>                 /* We've found the gpio chip, but the translation failed.
> -                * Return true to stop looking and return the translation
> -                * error via out_gpio
> +                * Store translation error in out_gpio.
> +                * Return false to keep looking, as more than one GPIO chip
> +                * could be registered per of-node.
>                  */
>                 gg_data->out_gpio = ERR_PTR(ret);
> -               return true;
> +               return false;
>          }
>
>         gg_data->out_gpio = gpiochip_get_desc(gc, ret);

As long as we're ok with multiple gpiochips per of-node, this would
work for me. It'll change the preference of which chip returns the
error in the case of multiple chips, but that's already undefined
behavior.

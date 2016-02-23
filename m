From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/4] gpio: Add parsing of DT GPIO line-names
Date: Tue, 23 Feb 2016 14:36:42 +0100
Message-ID: <CACRpkdb3gEZt5-25mi5pPvDePzLzNHfFRpjKMOW_-WfcBBLtUQ@mail.gmail.com>
References: <1456214089-13954-1-git-send-email-mpa@pengutronix.de>
	<1456214089-13954-4-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456214089-13954-4-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 8:54 AM, Markus Pargmann <mpa@pengutronix.de> wrote:

> This patch reuses the DT bindings that are already in place for the
> gpio-hogging mechanism. These bindings define line-name properties for
> GPIOs inside the gpio-chip device node.
>
> of_parse_own_gpio() now sets the gpio descriptor name using the newly
> introduced gpiod_set_name(). It checks for name collisions within a GPIO
> chip to avoid GPIOs with the same name that are exported over the same
> GPIO character device.
>
> The GPIO flags that describe the GPIO state are not required anymore in
> general but are checked if the gpio-hog property was found.
>
> This can be used to use the line names from the schematic. Example of lsgpio on
> a modified i.MX6s Riotboard:
>
>         GPIO chip: gpiochip0, "209c000.gpio", 32 GPIO lines
>                 line 0: unnamed unlabeled
>                 line 1: unnamed unlabeled
>                 line 2: SD2_WP "wp" [kernel output open-drain]
>                 line 3: GPIO_3_CLK unlabeled
>                 line 4: SD2_CD "cd" [kernel output open-drain]
>                 ...
>
> The modified DT:
>          &gpio1 {
>                 sd2_wp {
>                         gpios = <2 0>;
>                         line-name = "SD2_WP";
>                 };
>
>                 gpio_3_clk {
>                         gpios = <3 0>;
>                         line-name = "GPIO_3_CLK";
>                 };
>
>                 sd2_cd {
>                         gpios = <4 0>;
>                         line-name = "SD2_CD";
>                 };
>         };
>
> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>

NICE! And this is what I want too.

We need to remove some rough edges:

> +static struct gpio_desc *gpiodev_find_gpiod_by_name(struct gpio_device *gdev,
> +                                                   const char *name)
> +{
> +       int i;
> +
> +       for (i = 0; i != gdev->ngpio; ++i) {
> +               struct gpio_desc *desc = &gdev->descs[i];
> +
> +               if (desc->name && !strcmp(desc->name, name))
> +                       return desc;
> +       }
> +
> +       return NULL;
> +}

We already have gpio_name_to_desc() which does something
similar but across all chips.

Can we break out one gpiodev_name_to_desc() like
yours, and refactor gpio_name_to_desc() to just call
that for each chip?

> +/**
> + * gpid_set_name() - sets the name of a gpio descriptor

Missing "o" in gpid_

> + * @desc: the gpio descriptor
> + * @name: the name pointer that is assigned. It is internally not copied.
> + *
> + * This function sets a new name for the GPIO. It checks for collisions with
> + * other GPIOs with the same name within the gpio chip. It returns 0 on success
> + * or -EEXIST if the name is already used within the GPIO chip.
> + */
> +int gpiod_set_name(struct gpio_desc *desc, const char *name)
> +{
> +       struct gpio_desc *coll = gpiodev_find_gpiod_by_name(desc->gdev, name);
> +
> +       if (coll)
> +               return -EEXIST;
> +
> +       desc->name = name;
> +
> +       return 0;
> +}

Otherwise I'm OK with this.

Yours,
Linus Walleij

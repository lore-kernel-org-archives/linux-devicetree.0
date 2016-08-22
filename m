From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 01/13] pinctrl: add bcm63xx base code
Date: Mon, 22 Aug 2016 14:46:00 +0200
Message-ID: <CACRpkdbAWJruB=4rv_SoPZ5D5XgWjebK_Qmv2GLgOOrSyqXcDA@mail.gmail.com>
References: <1471604025-21575-1-git-send-email-jonas.gorski@gmail.com> <1471604025-21575-2-git-send-email-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1471604025-21575-2-git-send-email-jonas.gorski@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2016 at 12:53 PM, Jonas Gorski <jonas.gorski@gmail.com> wrote:

> Setup directory and add a helper for bcm63xx pinctrl support.
>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

>  drivers/pinctrl/bcm63xx/Kconfig           |   3 +
>  drivers/pinctrl/bcm63xx/Makefile          |   1 +

Why not just put it in the existing pinctrl/bcm directory?

The drivers in there share nothing but being Broadcom
anyways. And when you're at it, do take a look at the
other Broadcom drivers to check if they would
happen to share something with your hardware, I find
it dazzling that hardware engineers repeatedly reinvents
pin controllers but what can I do.

> +config PINCTRL_BCM63XX
> +       bool
> +       select GPIO_GENERIC

depends on ARCH_****?

depends on OF_GPIO?

Will it really be used on non-DT systems?

> +#define BANK_SIZE      sizeof(u32)
> +#define PINS_PER_BANK  (BANK_SIZE * BITS_PER_BYTE)
> +
> +#ifdef CONFIG_OF
> +static int bcm63xx_gpio_of_xlate(struct gpio_chip *gc,
> +                                const struct of_phandle_args *gpiospec,
> +                                u32 *flags)
> +{
> +       struct gpio_chip *base = gpiochip_get_data(gc);
> +       int pin = gpiospec->args[0];
> +
> +       if (gc != &base[pin / PINS_PER_BANK])
> +               return -EINVAL;
> +
> +       pin = pin % PINS_PER_BANK;
> +
> +       if (pin >= gc->ngpio)
> +               return -EINVAL;
> +
> +       if (flags)
> +               *flags = gpiospec->args[1];
> +
> +       return pin;
> +}
> +#endif

- Do you really have to support the !OF_GPIO case? (depend in Kconfig,
  get rid of #ifdef)

- The only reason for not using of_gpio_simple_xlate() seems to be that
  you have several GPIO banks. So why not model every bank as a
  separate device? Or did you consider this already?

> +               gc[i].request = gpiochip_generic_request;
> +               gc[i].free = gpiochip_generic_free;
> +
> +#ifdef CONFIG_OF
> +               gc[i].of_gpio_n_cells = 2;
> +               gc[i].of_xlate = bcm63xx_gpio_of_xlate;
> +#endif
> +
> +               gc[i].label = label;
> +               gc[i].ngpio = pins;
> +
> +               devm_gpiochip_add_data(dev, &gc[i], gc);

Because this also gets pretty hairy... since you don't have one device
per gpiochip.

> +static void bcm63xx_setup_pinranges(struct gpio_chip *gc, const char *name,
> +                                   int ngpio)
> +{
> +       int i, chips = DIV_ROUND_UP(ngpio, PINS_PER_BANK);
> +
> +       for (i = 0; i < chips; i++) {
> +               int offset, pins;
> +
> +               offset = i * PINS_PER_BANK;
> +               pins = min_t(int, ngpio - offset, PINS_PER_BANK);
> +
> +               gpiochip_add_pin_range(&gc[i], name, 0, offset, pins);
> +       }
> +}

And this, same thing. Could be so much easier if it was just the same
driver instantiated twice for two banks.

> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dirout");
> +       dirout = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(dirout))
> +               return ERR_CAST(dirout);
> +
> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dat");
> +       data = devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(data))
> +               return ERR_CAST(data);
> +
> +       sz = resource_size(res);
> +
> +       ret = bcm63xx_setup_gpio(&pdev->dev, gc, dirout, data, sz, ngpio);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       pctldev = devm_pinctrl_register(&pdev->dev, desc, priv);
> +       if (IS_ERR(pctldev))
> +               return pctldev;
> +
> +       bcm63xx_setup_pinranges(gc, pinctrl_dev_get_devname(pctldev), ngpio);
> +
> +       dev_info(&pdev->dev, "registered at mmio %p\n", dirout);
> +
> +       return pctldev;

A current trend in simple MMIO devices is to simply add themselves as a
compatible string in drivers/gpio/gpio-mmio.c. Example:

https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-gpio.git/commit/drivers/gpio/gpio-mmio.c?h=devel&id=05cc995f4d44c2b14a1f15f3271cc9715cb81099

This could be a viable approach if you find a way to flag that such a GPIO
has a pin control backend.

Yours,
Linus Walleij

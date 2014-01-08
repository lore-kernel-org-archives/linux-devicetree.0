From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: Driver for SYSCON-based GPIOs
Date: Wed, 8 Jan 2014 11:04:51 +0100
Message-ID: <CACRpkdaUKWOE+ore26i073_kLQ5z=a+==ykm6iiAgbmJKShUjw@mail.gmail.com>
References: <1387307984-7693-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1387307984-7693-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 17, 2013 at 8:19 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> SYSCON driver was designed for using memory areas (registers)
> that are used in several subsystems. There are systems (CPUs)
> which use bits in one register for various purposes and thus
> should be handled by various kernel subsystems. This driver
> allows you to use the individual SYSCON bits as GPIOs.
> ARM CLPS711X SYSFLG1 input lines has been added as first user
> of this driver.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Hm, this is nice in some ways but I'm reluctant still.
I really need input from the device tree maintainers on the bindings.

Won't be for v3.14 in any case. Let's get some more input on this
thing.

> +++ b/drivers/gpio/gpio-syscon.c
(...)
> +#define GPIO_SYSCON_INPUT      (1 << 0)
> +#define GPIO_SYSCON_OUTPUT     (1 << 1)
> +
> +/* SYSCON driver is designed to use 32-bit wide registers */
> +#define SYSCON_REG_SIZE                (4)
> +#define SYSCON_REG_BITS                (SYSCON_REG_SIZE * 8)

This is nice.

Add kerneldoc to the following structs as this will be a very generic
driver.

> +struct syscon_gpio_data {
> +       unsigned int    flags;
> +       unsigned int    bit_offset;

Call it line_bit_offset

And I would add (per comment below) an optional dir_bit_offset
as well.

> +       unsigned int    bit_count;
> +};
> +
> +struct syscon_gpio_priv {
> +       struct gpio_chip                chip;
> +       struct regmap                   *syscon;
> +       const struct syscon_gpio_data   *data;
> +};

> +static int syscon_gpio_dir_in(struct gpio_chip *chip, unsigned offset)
> +{
> +       return 0;
> +}
> +
> +static int syscon_gpio_dir_out(struct gpio_chip *chip, unsigned offset, int val)
> +{
> +       syscon_gpio_set(chip, offset, val);
> +
> +       return 0;
> +}

Should this not be supported by such a generic driver?

Atleast add a big fat TODO comment stating that the next user need to
implement this.

Also struct syscon_gpio_data then should contain an dir_bit_offset
for the direction bits.

> +static const struct syscon_gpio_data clps711x_mctrl_gpio = {
> +       /* ARM CLPS711X SYSFLG1 Bits 8-10 */
> +       .flags          = GPIO_SYSCON_INPUT,
> +       .bit_offset     = 0x40 * 8 + 8,
> +       .bit_count      = 3,
> +};
> +
> +static const struct of_device_id syscon_gpio_ids[] = {
> +       {
> +               .compatible     = "clps711x,syscon-gpio-mctrl",
> +               .data           = &clps711x_mctrl_gpio,
> +       },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, syscon_gpio_ids);

Oh you're doing it like that :-)

That is actually helpful. Hm.

Yours,
Linus Walleij

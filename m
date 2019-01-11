Return-Path: <SRS0=Muqj=PT=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com> <20190103164102.31437-4-thomas.petazzoni@bootlin.com>
In-Reply-To: <20190103164102.31437-4-thomas.petazzoni@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jan 2019 11:05:03 +0100
Message-ID: <CACRpkdbypbX0-NsSG4DmFCv6hC2gYEQZSUyoKdJbgwiMDZ4yvg@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: add core support for pull-up/pull-down configuration
Content-Type: text/plain; charset="UTF-8"
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jan 3, 2019 at 5:41 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> This commit adds support for configuring the pull-up and pull-down
> resistors available in some GPIO controllers. While configuring
> pull-up/pull-down is already possible through the pinctrl subsystem,
> some GPIO controllers, especially simple ones such as GPIO expanders
> on I2C, don't have any pinmuxing capability and therefore do not use
> the pinctrl subsystem.
>
> This commit implements the GPIO_PULL_UP and GPIO_PULL_DOWN flags,
> which can be used from the Device Tree, to enable a pull-up or
> pull-down resistor on a given GPIO.
>
> The flag is simply propagated all the way to the core GPIO subsystem,
> where it is used to call the gpio_chip ->set_config callback with the
> appropriate existing PIN_CONFIG_BIAS_* values.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I'm overall happy with this approach.

> +/* Bit 4 express pull up */
> +#define GPIO_PULL_UP 16
> +
> +/* Bit 5 express pull down */
> +#define GPIO_PULL_DOWN 32

Please use
#define GPIO_PULL_UP BIT(5)
#define GPIO_PULL_DOWN BIT(6)

> @@ -12,6 +12,8 @@ enum gpio_lookup_flags {
>         GPIO_OPEN_SOURCE = (1 << 2),
>         GPIO_PERSISTENT = (0 << 3),
>         GPIO_TRANSITORY = (1 << 3),
> +       GPIO_PULL_UP = (1 << 4),
> +       GPIO_PULL_DOWN = (1 << 5),

You can keep this to follow the pattern set by the others.

> @@ -28,6 +28,8 @@ enum of_gpio_flags {
>         OF_GPIO_SINGLE_ENDED = 0x2,
>         OF_GPIO_OPEN_DRAIN = 0x4,
>         OF_GPIO_TRANSITORY = 0x8,
> +       OF_GPIO_PULL_UP = 0x10,
> +       OF_GPIO_PULL_DOWN = 0x20,

Same here: this is fine.

Yours,
Linus Walleij

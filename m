From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH anybus v2 1/5] misc: support the Arcx anybus bridge.
Date: Thu, 1 Nov 2018 00:15:25 +0100
Message-ID: <CACRpkdai-6iNbz4EGuHNHkQYyR+yhTEJdRXP4G6fUKpA+XApjQ@mail.gmail.com>
References: <20181031194425.32132-1-TheSven73@googlemail.com> <20181031194425.32132-2-TheSven73@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181031194425.32132-2-TheSven73@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Van Asbroeck <thesven73@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: svendev@arcx.com, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, michal.vokac@ysoft.com, Greg KH <gregkh@linuxfoundation.org>, john.garry@huawei.com, Geert Uytterhoeven <geert+renesas@glider.be>, Robin Murphy <robin.murphy@arm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>, Icenowy Zheng <icenowy@aosc.io>, Stuart Yoder <stuyoder@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Sven,

On Wed, Oct 31, 2018 at 8:44 PM <thesven73@gmail.com> wrote:

> From: Sven Van Asbroeck <svendev@arcx.com>
>
> Add a driver for the Arcx anybus bridge.
>
> This chip embeds up to two Anybus-S application connectors
> (slots), and connects to the SoC via a parallel memory bus.
> There is also a CAN power readout, unrelated to the Anybus.
>
> Signed-off-by: Sven Van Asbroeck <svendev@arcx.com>

This is fun :)

>  drivers/misc/Kconfig         |   9 ++
>  drivers/misc/Makefile        |   1 +
>  drivers/misc/anybus-bridge.c | 301 +++++++++++++++++++++++++++++++++++

I would put this also in drivers/bus, why not. Just two files
there. It's a bus bridge for sure, we keep them there.
drivers/reset if it is mostly about resetting stuff.

> +config ARCX_ANYBUS_BRIDGE
> +       tristate "Arcx Anybus-S Bridge"
> +       depends on OF

depends on GPIOLIB

> +       help
> +         Select this to get support for the Arcx Anybus bridge.
> +         It connects to the SoC via a parallel memory bus, and
> +         embeds up to two Anybus-S application connectors (slots).
> +         There is also a CAN power readout, unrelated to the Anybus.

(...)
> +#include <linux/gpio.h>
> +#include <linux/of_gpio.h>

Don't use these please. Juse use
#include <linux/gpio/consumer.h>

> +struct bridge_priv {
> +       struct device *class_dev;
> +       struct reset_controller_dev rcdev;
> +       bool common_reset;
> +       int reset_gpio;

struct gpio_desc *reset_gpiod;

> +       void __iomem *cpld_base;
> +       spinlock_t regs_lock;
> +       u8 control_reg;
> +       char version[3];
> +       u16 design_no;
(...)

> +static ssize_t version_show(struct device *dev,
> +               struct device_attribute *attr, char *buf)
> +{
> +       struct bridge_priv *cd = dev_get_drvdata(dev);
> +
> +       return sprintf(buf, "%s\n", cd->version);
> +}
> +static DEVICE_ATTR_RO(version);

Do you need this in userspace really?

> +static ssize_t design_number_show(struct device *dev,
> +               struct device_attribute *attr, char *buf)
> +{
> +       struct bridge_priv *cd = dev_get_drvdata(dev);
> +
> +       return sprintf(buf, "%d\n", cd->design_no);
> +}
> +static DEVICE_ATTR_RO(design_number);

And this?

> +static ssize_t can_power_show(struct device *dev,
> +               struct device_attribute *attr, char *buf)
> +{
> +       struct bridge_priv *cd = dev_get_drvdata(dev);
> +
> +       return sprintf(buf, "%d\n",
> +               !(readb(cd->cpld_base + CPLD_STATUS1) &
> +                                       CPLD_STATUS1_CAN_POWER));
> +}
> +static DEVICE_ATTR_RO(can_power);

This should certainly be reflected as a fixed-voltage regulator
and not a random integer in sysfs.

> +static int bridge_probe(struct platform_device *pdev)
> +{
> +       struct bridge_priv *cd;
> +       struct device *dev = &pdev->dev;
> +       struct device_node *np = dev->of_node;
> +       int err, id;
> +       struct resource *res;
> +       u8 status1, cap;
> +
> +       cd = devm_kzalloc(dev, sizeof(*cd), GFP_KERNEL);
> +       if (!cd)
> +               return -ENOMEM;
> +       dev_set_drvdata(dev, cd);
> +       spin_lock_init(&cd->regs_lock);

This:

> +       cd->reset_gpio = of_get_named_gpio(np, "reset-gpios", 0);
> +       if (!gpio_is_valid(cd->reset_gpio)) {
> +               dev_err(dev, "reset-gpios not found\n");
> +               return -EINVAL;
> +       }
> +       devm_gpio_request(dev, cd->reset_gpio, NULL);
> +       gpio_direction_output(cd->reset_gpio, 0);

Should be:

cd->reset_gpiod = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
if (IS_ERR(cd->reset_gpiod))
    return PTR_ERR(cd->reset_gpiod);

You can turn it to input as you do in the .remove() function to let
a pull-up resistor pull it high, but isn't it better to actively just drive
it high?

Yours,
Linus Walleij

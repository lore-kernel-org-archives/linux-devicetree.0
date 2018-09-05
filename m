From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH mfd+gpio 2/2] drivers: gpio: Add support for GPIOs over
 Moxtet bus
Date: Wed, 5 Sep 2018 12:07:56 +0200
Message-ID: <CACRpkdYm-qkBT-T0Zx8+eN70XcMuUkxX3oM1bs3NicvHc=_ZmQ@mail.gmail.com>
References: <20180830144151.13417-1-marek.behun@nic.cz> <20180830144151.13417-2-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830144151.13417-2-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: marek.behun@nic.cz, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Marek!

Your DT bindings patch should ideally be in a separate patch and
must be sent to devicetree@vger.kernel.org as well.

On Thu, Aug 30, 2018 at 4:44 PM Marek Beh=C3=BAn <marek.behun@nic.cz> wrote=
:

> + - moxtet,input-mask   : Bitmask. Those bits which correspond to input G=
PIOs
> +                         when read from Moxtet bus should be set here.
> +                         For example if bit 0 and bit 3 are input GPIO b=
its,
> +                         this should be set to 0x9.
> +                         Since there are only 4 input bits, 0xf is max v=
alue.
> + - moxtet,output-mask  : Bitmask. Those bits which correspond to output =
GPIOs
> +                         when written to Moxtet bus should be set here.
> +                         For example if bit 1 and bit 6 are output GPIO =
bits,
> +                         this should be set to 0x41.
> +                         Since there are at most 8 output bits, 0xff is =
max
> +                         value.

Please don't do it like this. Let the consumers decide if they want
to use a certain line as input or output.

Enumerate ALL GPIOs from 0 to N and let a consumer pick
GPIO x and then decide if it will be used as input or output.
Re-enumerating the GPIOs presented from the chip is complicating
things by shuffleing around the local offset (HW numbering)
space.

For GPIOs that are not usable at all, use the
gpio-reserved-ranges =3D <> property, see gpio.txt

If you want to indicate that some lines can just be used for
input and some can just be used for output and some cannot
be used at all, let the .set_direction_output() and
.set_direction_input() callbacks fail for these pins with
-EINVAL or so.

If these masks cannot be derived from the compatible
strings, then create generic bindings to mark lines
as input-only or output-only in gpio.txt and use the
same syntax as gpio-reserved-ranges, and handle it
in the gpiolib just as with gpio-reserved-ranges, not
in your local driver.

For example gpio-output-only-ranges and
gpio-input-only-ranges.

But first convince us that you really need that.

> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio.h>

This is a driver so only #include <linux/gpio/driver.h>
Skip the two above.

> +#include <linux/mfd/moxtet.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>

You don't need this either. Delete that include.

> +static int moxtet_gpio_dir_mask(struct gpio_chip *gc, unsigned int offse=
t,
> +                               int *dir, u8 *mask)
> +{
> +       struct moxtet_gpio_chip *chip =3D gpiochip_get_data(gc);
> +       int i;
> +
> +       *dir =3D 0;
> +       for (i =3D 0; i < 4; ++i) {
> +               *mask =3D 1 << i;

#include <linux/bitops.h>

*mask =3D BIT(i);

> +               if (*mask & chip->in_mask) {
> +                       if (offset =3D=3D 0)
> +                               return 0;
> +                       --offset;
> +               }
> +       }
> +
> +       *dir =3D 1;
> +       for (i =3D 0; i < 8; ++i) {
> +               *mask =3D 1 << i;
> +               if (*mask & chip->out_mask) {
> +                       if (offset =3D=3D 0)
> +                               return 0;
> +               }
> +       }
> +
> +       return -EINVAL;
> +}

This looks convoluted and I think will go away with my suggestion to
cut the masks.

Otherwise use primitives such as for_each_set_bit() etc.

> +static int moxtet_gpio_get_value(struct gpio_chip *gc, unsigned int offs=
et)
> +{
> +       struct moxtet_gpio_chip *chip =3D gpiochip_get_data(gc);
> +       int ret, dir;
> +       u8 mask;
> +
> +       if (moxtet_gpio_dir_mask(gc, offset, &dir, &mask) < 0)
> +               return -EINVAL;
> +
> +       if (dir)
> +               ret =3D moxtet_device_written(chip->dev);
> +       else
> +               ret =3D moxtet_device_read(chip->dev);
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       return (ret & mask) ? 1 : 0;
> +}
> +
> +static void moxtet_gpio_set_value(struct gpio_chip *gc, unsigned int off=
set,
> +                                 int val)
> +{
> +       struct moxtet_gpio_chip *chip =3D gpiochip_get_data(gc);
> +       int state, dir;
> +       u8 mask;
> +
> +       if (moxtet_gpio_dir_mask(gc, offset, &dir, &mask) < 0)
> +               return;

So skip this and trust the consumers to ask for the right GPIO and set
it up.

Yours,
Linus Walleij

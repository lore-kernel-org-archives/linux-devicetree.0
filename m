From: Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] iio: dac: Add support for the AD5592R/AD5593R
 ADCs/DACs
Date: Mon, 21 Mar 2016 15:07:23 +0100
Message-ID: <56F0001B.9010608@analog.com>
References: <1456407412-16218-1-git-send-email-michael.hennerich@analog.com>
 <56D1E1CB.6070704@kernel.org>
 <CACRpkdap_8YGCAvNeK7_0H2MDDnwQ9QDJH4O2SzEkDmczPGtLg@mail.gmail.com>
Reply-To: <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdap_8YGCAvNeK7_0H2MDDnwQ9QDJH4O2SzEkDmczPGtLg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pawe=c5=82_Moll?= <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/11/2016 05:28 PM, Linus Walleij wrote:
> On Sun, Feb 28, 2016 at 12:50 AM, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>
>>> +Analog Devices AD5592R/AD5593R DAC/ADC device driver
>>> +
>>> +Required properties for the AD5592R:
>>> +     - compatible: Must be "adi,ad5592r"
>>> +     - reg: SPI chip select number for the device
>>> +     - spi-max-frequency: Max SPI frequency to use (< 30000000)
>>> +     - spi-cpol: The AD5592R requires inverse clock polarity (CPOL) mode
>
> If this should be a gpiochip, this shall also be reflected in the
> device tree bindings and the example in the bindings by
> stating gpio-controller; and #gpio-cells, referring to
> the binding in gpio/gpio.txt so consumers can pick a GPIO
> from this device.

Hi Linus,

Thanks for the feedback.

- Will add this to the documentation.


>
> I haven't seen the original patch, please mail the next version
> to me so I can take a look.
>
>>> +config AD5592R_BASE
>>> +     tristate
>>> +
>>> +config AD5592R
>>> +     tristate "Analog Devices AD5592R ADC/DAC driver"
>>> +     depends on SPI_MASTER
>>> +     depends on OF
>>> +     select AD5592R_BASE
>>> +     help
>>> +       Say yes here to build support for Analog Devices AD5592R
>>> +       Digital to Analog / Analog to Digital Converter.
>>> +
>>> +       To compile this driver as a module, choose M here: the
>>> +       module will be called ad5592r.
>>> +
>>> +config AD5593R
>>> +     tristate "Analog Devices AD5593R ADC/DAC driver"
>>> +     depends on I2C
>>> +     depends on OF
>>> +     select AD5592R_BASE
>>> +     help
>>> +       Say yes here to build support for Analog Devices AD5593R
>>> +       Digital to Analog / Analog to Digital Converter.
>>> +
>>> +       To compile this driver as a module, choose M here: the
>>> +       module will be called ad5593r.
>>> +
>
> I guess something here should select GPIOLIB
> and depend of OF_GPIO


That reminds me - On my dev tree I removed to the depends on OF from 
kconfig. But I haven't rebased this commit into my for_upstream branch.

I tried to avoid any OF dependency in the driver by using the 
linux/property API.

I'll add select GPIOLIB - and gpio/Kconfig will select OF_GPIO if OF.


>
>>> +#ifdef CONFIG_GPIOLIB
>
> Naaaaah really? Just select GPIOLIB and get rid of ifdeffery.
> It's cool to have gpios available.

Convinced me.

>
>>> +static int ad5592r_gpio_request(struct gpio_chip *chip, unsigned offset)
>>> +{
>>> +     struct ad5592r_state *st = gpiochip_get_data(chip);
>>> +
>>> +     if (!(st->gpio_map & BIT(offset))) {
>>> +             dev_err(st->dev, "GPIO %d is reserved by alternate function\n",
>>> +                     offset);
>
> This gpio_map looks a bit like pin control.
>
> It might be overkill to use all of the pinctrl subsystem,
> we have circumvented it in other places.

I think it's overkill too.

>
>>> +             return -ENODEV;
>>> +     }
>>> +
>>> +     if (offset >= chip->ngpio)
>>> +             return -EINVAL;
>
> gpiolib already guards against this I think.

Then I drop it

>
>>> +static int ad5592r_gpio_init(struct ad5592r_state *st)
>>> +{
>>> +     st->gpiochip.label = dev_name(st->dev);
>>> +     st->gpiochip.base = -1;
>>> +     st->gpiochip.ngpio = 8;
>>> +     st->gpiochip.parent = st->dev;
>>> +     st->gpiochip.can_sleep = true;
>>> +     st->gpiochip.direction_input = ad5592r_gpio_direction_input;
>>> +     st->gpiochip.direction_output = ad5592r_gpio_direction_output;
>>> +     st->gpiochip.get = ad5592r_gpio_get;
>>> +     st->gpiochip.set = ad5592r_gpio_set;
>>> +     st->gpiochip.request = ad5592r_gpio_request;
>>> +     st->gpiochip.owner = THIS_MODULE;
>>> +
>>> +     mutex_init(&st->gpio_lock);
>>> +
>>> +     return gpiochip_add_data(&st->gpiochip, st);
>
> The gpiolib should be fine with the of_node from the parent so
> looks fine.
>
>>> +             mutex_lock(&iio_dev->mlock);
>>> +             st->ops->reg_write(st, AD5592R_REG_RESET, 0xdac);
>>> +             mutex_unlock(&iio_dev->mlock);
>
> What's that? (0xdac)? Clever magic?

Clever magic - to avoid accidental resets.

>
>>> +             case CH_MODE_DAC_AND_ADC:
>>> +                     dac |= BIT(i);
>>> +                     adc |= BIT(i);
>>> +                     break;
>>> +
>>> +             case CH_MODE_UNUSED_PULL_DOWN:
>>> +                     pulldown |= BIT(i);
>>> +                     break;
>>> +
>>> +             case CH_MODE_UNUSED_OUT_TRISTATE:
>>> +                     tristate |= BIT(i);
>>> +                     break;
>>> +
>>> +             case CH_MODE_UNUSED_OUT_LOW:
>>> +                     st->gpio_out |= BIT(i);
>>> +                     break;
>>> +
>>> +             case CH_MODE_UNUSED_OUT_HIGH:
>>> +                     st->gpio_out |= BIT(i);
>>> +                     st->gpio_val |= BIT(i);
>>> +                     break;
>>> +
>>> +             case CH_MODE_GPIO_OPEN_DRAIN:
>>> +                     open_drain |= BIT(i);
>
> Deja-vu with include/linux/pinctrl/pinconf-generic.h
>
> We call tristate "bias high impedance".
>
> Yours,
> Linus Walleij
>


-- 
Greetings,
Michael

--
Analog Devices GmbH      Wilhelm-Wagenfeld-Str. 6      80807 Muenchen
Sitz der Gesellschaft: Muenchen; Registergericht: Muenchen HRB 40368;
Geschaeftsfuehrer:Dr.Carsten Suckrow, Thomas Wessel, William A. Martin,
Margaret Seif

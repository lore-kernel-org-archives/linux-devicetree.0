From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] gpio - Add EXAR XRA1403 SPI GPIO expander driver
Date: Wed, 29 Mar 2017 04:07:14 +0200
Message-ID: <CACRpkdZB_cxqw0=M4YOhcwdZe7BxJtVKA290yGH-jxPU2MDgBg@mail.gmail.com>
References: <cover.1490595641.git.nandor.han@ge.com> <6bf04ba1761f0692cb461558f0c8836f0d1f7ad8.1490595641.git.nandor.han@ge.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6bf04ba1761f0692cb461558f0c8836f0d1f7ad8.1490595641.git.nandor.han-JJi787mZWgc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Semi Malinen <semi.malinen-JJi787mZWgc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 27, 2017 at 8:23 AM, Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org> wrote:

> This is a simple driver that provides a /sys/class/gpio
> interface for controlling and configuring the GPIO lines.

Use the gpio tools in tools/gpio, use the characcter device.
Do not use sysfs. Change this to reference the tools.

> It does not provide support for chip select or interrupts.
>
> Signed-off-by: Nandor Han <nandor.han-JJi787mZWgc@public.gmane.org>
> Signed-off-by: Semi Malinen <semi.malinen-JJi787mZWgc@public.gmane.org>
(...)
> +exar   Exar Corporation

Send this as a separate patch to the DT bindings maintainer
(Rob Herring.)

> +static int xra1403_get_byte(struct xra1403 *xra, unsigned int addr)
> +{
> +       return spi_w8r8(xra->spi, XRA_READ | (addr << 1));
> +}
> +
> +static int xra1403_get_bit(struct xra1403 *xra, unsigned int addr,
> +                          unsigned int bit)
> +{
> +       int ret;
> +
> +       ret = xra1403_get_byte(xra, addr + (bit > 7));
> +       if (ret < 0)
> +               return ret;
> +
> +       return !!(ret & BIT(bit % 8));
> +}

This looks like it can use regmap-spi right off, do you agree?

git grep devm_regmap_init_spi
should give you some examples of how to use it.

If it's not off-the shelf regmap drivers like
drivers/iio/pressure/mpl115_spi.c
give examples of how to make more elaborate custom
SPI transfers with regmap.

> +static int xra1403_set_bit(struct xra1403 *xra, unsigned int addr,
> +                          unsigned int bit, int value)
> +{
> +       int ret;
> +       u8 mask;
> +       u8 tx[2];
> +
> +       addr += bit > 7;
> +
> +       mutex_lock(&xra->lock);
> +
> +       ret = xra1403_get_byte(xra, addr);
> +       if (ret < 0)
> +               goto out_unlock;
> +
> +       mask = BIT(bit % 8);
> +       if (value)
> +               value = ret | mask;
> +       else
> +               value = ret & ~mask;
> +
> +       if (value != ret) {
> +               tx[0] = addr << 1;
> +               tx[1] = value;
> +               ret = spi_write(xra->spi, tx, sizeof(tx));
> +       } else {
> +               ret = 0;
> +       }
> +
> +out_unlock:
> +       mutex_unlock(&xra->lock);
> +
> +       return ret;
> +}

Classical mask-and-set implementation right?
With regmap this becomes simply regmap_update_bits(map, addr, mask, set)

> +static int xra1403_probe(struct spi_device *spi)
> +{
> +       struct xra1403 *xra;
> +       struct gpio_desc *reset_gpio;
> +
> +       xra = devm_kzalloc(&spi->dev, sizeof(*xra), GFP_KERNEL);
> +       if (!xra)
> +               return -ENOMEM;
> +
> +       /* bring the chip out of reset */
> +       reset_gpio = gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(reset_gpio))
> +               dev_warn(&spi->dev, "could not get reset-gpios\n");
> +       else if (reset_gpio)
> +               gpiod_put(reset_gpio);

I don't think you should put it, other than in the remove()
function and in that case you need to have it in the
state container.

> +       mutex_init(&xra->lock);
> +
> +       xra->chip.direction_input = xra1403_direction_input;
> +       xra->chip.direction_output = xra1403_direction_output;

Please implement .get_direction(). This is very nice to have.

> +static int xra1403_remove(struct spi_device *spi)
> +{
> +       struct xra1403 *xra = spi_get_drvdata(spi);
> +
> +       gpiochip_remove(&xra->chip);

Use devm_gpiochip_add_data() and this remove is not
needed at all.

> +static int __init xra1403_init(void)
> +{
> +       return spi_register_driver(&xra1403_driver);
> +}
> +
> +/*
> + * register after spi postcore initcall and before
> + * subsys initcalls that may rely on these GPIOs
> + */
> +subsys_initcall(xra1403_init);
> +
> +static void __exit xra1403_exit(void)
> +{
> +       spi_unregister_driver(&xra1403_driver);
> +}
> +module_exit(xra1403_exit);

This seems like tricksy. Just module_spi_driver()
should be fine don't you think?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

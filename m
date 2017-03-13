From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] iio: accel: adxl345: Setup DATA_READY trigger
Date: Mon, 13 Mar 2017 14:12:54 +0200
Message-ID: <CAHp75Vcz1RTdncG5L1S7q2LVHK6TEA813pjTpue4n3DDcCrMAg@mail.gmail.com>
References: <1489403497-27849-1-git-send-email-eraretuya@gmail.com> <1489403497-27849-4-git-send-email-eraretuya@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489403497-27849-4-git-send-email-eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 13, 2017 at 1:11 PM, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

Missed commit message is no-no!

> Signed-off-by: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> -int adxl345_core_probe(struct device *dev, struct regmap *regmap,
> -                      const char *name);
> +int adxl345_core_probe(struct device *dev, struct regmap *regmap, int irq,
> +                      const char *name, bool use_int2);

Hmm... And tomorrow you will add another flag and another.

No, consider to use something like

struct adxl345_chip {
 struct device *dev;
 struct regmap *regmap;
 const char *name;
}

Convert your probe to use it, and after extend for your needs.

>  #define ADXL345_DEVID                  0xE5
>
> +#define ADXL345_IRQ_NAME               "adxl345_event"


>  struct adxl345_data {
> +       struct iio_trigger *drdy_trig;
>         struct regmap *regmap;
> +       bool drdy_trig_on;
>         u8 data_range;

drdy -> data_ready

> +static irqreturn_t adxl345_irq(int irq, void *p)
> +{
> +       struct iio_dev *indio_dev = p;
> +       struct adxl345_data *data = iio_priv(indio_dev);
> +       int ret = IRQ_NONE;
> +       u32 int_stat;
> +

> +       ret = regmap_read(data->regmap, ADXL345_REG_INT_SOURCE, &int_stat);

> +       if (ret < 0)
> +               return ret;

It makes little sense AFAIU.

> +
> +       if (int_stat & ADXL345_INT_DATA_READY) {
> +               iio_trigger_poll(data->drdy_trig);
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       return ret;

Useless variable ret. You may return values directly.

> +}
> +
> +static int adxl345_drdy_trigger_set_state(struct iio_trigger *trig, bool state)
> +{
> +       struct iio_dev *indio_dev = iio_trigger_get_drvdata(trig);
> +       struct adxl345_data *data = iio_priv(indio_dev);
> +       struct device *dev;
> +       int ret;
> +

> +       dev = regmap_get_device(data->regmap);

This may be moved to definition block.

> +       ret = regmap_update_bits(data->regmap, ADXL345_REG_INT_ENABLE,

> +                                ADXL345_INT_DATA_READY, (state ?
> +                                ADXL345_INT_DATA_READY : 0));

No way:
 Don't split lines like this.
 Remove extra parens.

> +static const struct iio_trigger_ops adxl345_trigger_ops = {

> +       .owner = THIS_MODULE,

I dunno if we still need this.

>  static const struct iio_info adxl345_info = {

>         .driver_module  = THIS_MODULE,

Ditto.

>         .read_raw       = adxl345_read_raw,
>  };

> +       /*
> +        * Any bits set to 0 send their respective interrupts to the INT1 pin,
> +        * whereas bits set to 1 send their respective interrupts to the INT2
> +        * pin. Map all interrupts to the specified pin.
> +        */

> +       if (!use_int2)
> +               ret = regmap_write(data->regmap, ADXL345_REG_INT_MAP, 0x00);
> +       else
> +               ret = regmap_write(data->regmap, ADXL345_REG_INT_MAP, 0xFF);

I would create a temporary variable to hold the value and call
regmap_write() unconditionally.


> -       return iio_device_register(indio_dev);

You are not supposed to ping-pong changes in your series. Make clear
your goal either you do like above or like below. If you choose
latter, don't alter it in previous patch.

> +       if (irq > 0) {

> +               ret =
> +               devm_request_threaded_irq(dev, irq, NULL, adxl345_irq,

Don't split lines like this.

> +                                         IRQF_TRIGGER_HIGH | IRQF_ONESHOT,

Are you sure you have threaded IRQ handler?

> +       ret = iio_device_register(indio_dev);
> +       if (ret < 0) {
> +               dev_err(dev, "iio_device_register failed: %d\n", ret);
> +               goto err_trigger_unregister;
> +       }
> +
> +       return ret;

> +err_trigger_unregister:
> +       if (data->drdy_trig)
> +               iio_trigger_unregister(data->drdy_trig);
> +
> +       return ret;

So, doesn't devm_iio_*() provide a facility to avoid this?

> @@ -229,6 +334,8 @@ int adxl345_core_remove(struct device *dev)
>         struct adxl345_data *data = iio_priv(indio_dev);
>
>         iio_device_unregister(indio_dev);
> +       if (data->drdy_trig)
> +               iio_trigger_unregister(data->drdy_trig);

Ditto.

> --- a/drivers/iio/accel/adxl345_i2c.c
> +++ b/drivers/iio/accel/adxl345_i2c.c

> -       return adxl345_core_probe(&client->dev, regmap, id ? id->name : NULL);
> +       irq = of_irq_get_byname(client->dev.of_node, "INT2");
> +       if (irq == client->irq)
> +               use_int2 = true;

Can't you use platform_get_irq() instead?


> -       return adxl345_core_probe(&spi->dev, regmap, id->name);
> +       irq = of_irq_get_byname(spi->dev.of_node, "INT2");
> +       if (irq == spi->irq)
> +               use_int2 = true;

Ditto.

P.S. Are you doing this stuff on your own or you are working for some
company? If the latter applies, please, consider to do *internal*
review first.

-- 
With Best Regards,
Andy Shevchenko

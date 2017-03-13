From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] iio: accel: adxl345: Add support for triggered buffer
Date: Mon, 13 Mar 2017 14:16:45 +0200
Message-ID: <CAHp75VefS18nAH3HkQgNdmo5oUWoaQ7ctj=eXHx9XjwrJtZzuQ@mail.gmail.com>
References: <1489403497-27849-1-git-send-email-eraretuya@gmail.com> <1489403497-27849-5-git-send-email-eraretuya@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489403497-27849-5-git-send-email-eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 13, 2017 at 1:11 PM, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Provide an all-axes read for triggered buffering.

Better description is needed.

> -static int adxl345_get_triple(struct adxl345_data *data, void *buf)
> +static int adxl345_get_triple(struct adxl345_data *data)

Ping-ponging again. This should be essentially a change in the patch
where you introduce a helper.

> +err_buffer_cleanup:
> +       iio_triggered_buffer_cleanup(indio_dev);
>  err_trigger_unregister:
>         if (data->drdy_trig)
>                 iio_trigger_unregister(data->drdy_trig);

devm_iio_*() ?

> @@ -334,6 +435,7 @@ int adxl345_core_remove(struct device *dev)
>         struct adxl345_data *data = iio_priv(indio_dev);
>
>         iio_device_unregister(indio_dev);
> +       iio_triggered_buffer_cleanup(indio_dev);
>         if (data->drdy_trig)
>                 iio_trigger_unregister(data->drdy_trig);

Ditto.

> diff --git a/drivers/iio/accel/adxl345_i2c.c b/drivers/iio/accel/adxl345_i2c.c
> index 8c791b8..1e0f071 100644
> --- a/drivers/iio/accel/adxl345_i2c.c
> +++ b/drivers/iio/accel/adxl345_i2c.c
> @@ -30,6 +30,10 @@ static int adxl345_i2c_probe(struct i2c_client *client,
>         bool use_int2 = false;
>         int irq;
>
> +       if (!i2c_check_functionality(client->adapter,
> +                                    I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> +               return -EOPNOTSUPP;

And if driver works before, you make a regression here.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

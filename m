From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 4/4] iio: accel: adxl345: Add SPI support
Date: Fri, 3 Mar 2017 18:55:26 +0200
Message-ID: <CAHp75VcgLTgi51a_A3Jg+uDLeT1S9m8KnotdeZgsD9HHRQkR3Q@mail.gmail.com>
References: <cover.1488248485.git.eraretuya@gmail.com> <698e2cf848231eacde91dd72aa6f73059c9a7752.1488248485.git.eraretuya@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <698e2cf848231eacde91dd72aa6f73059c9a7752.1488248485.git.eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 28, 2017 at 4:37 AM, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add SPI driver that initializes SPI regmap for the adxl345 core driver.
> The driver supports the same functionality as I2C namely the x, y, z and
> scale readings.

Portion of minor comments.

> +config ADXL345_SPI
> +       tristate "Analog Devices ADXL345 3-Axis Digital Accelerometer SPI Driver"

> +       depends on !(INPUT_ADXL34X=y || INPUT_ADXL34X=m)

Same question. Would it be just

depends on INPUT_ADXL34X=n

?

> +        /* Setting bits 7 and 6 enables multiple-byte read */
> +       .read_flag_mask = BIT(7) | BIT(6),

GENMASK(7, 6) ?

> +static int adxl345_spi_probe(struct spi_device *spi)
> +{

> +       struct regmap *regmap;
> +       const struct spi_device_id *id = spi_get_device_id(spi);

Reverse order.

And usually we do assignments from function parameters first.

> +               dev_err(&spi->dev, "Error initializing spi regmap: %d\n",
> +                       (int)PTR_ERR(regmap));

Ugly casting!

-- 
With Best Regards,
Andy Shevchenko

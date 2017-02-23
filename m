From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/4] iio: accel: adxl345: Add SPI support
Date: Thu, 23 Feb 2017 18:43:53 +0200
Message-ID: <CAHp75VdmB1YqY4YyntbvHUaK_9yjY8wFeX6i9hmMDaScajKNOw@mail.gmail.com>
References: <cover.1487757223.git.eraretuya@gmail.com> <515297e48abd139993cab56dbf980711400d6534.1487757223.git.eraretuya@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <515297e48abd139993cab56dbf980711400d6534.1487757223.git.eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 12:23 PM, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Add SPI driver that initializes SPI regmap for the adxl345 core driver.
> The driver supports the same functionality as I2C namely the x, y, z and
> scale readings.

> --- a/drivers/iio/accel/Kconfig
> +++ b/drivers/iio/accel/Kconfig
> @@ -8,20 +8,26 @@ menu "Accelerometers"
>  config ADXL345
>         tristate "Analog Devices ADXL345 3-Axis Digital Accelerometer Driver"
>         depends on !(INPUT_ADXL34X=y || INPUT_ADXL34X=m)
> +       depends on (I2C || SPI)
>         select REGMAP
>         select ADXL345_I2C if I2C
> +       select ADXL345_SPI if SPI
>         help
>           Say Y here if you want to build support for the Analog Devices
>           ADXL345 3-axis digital accelerometer.
>
>           To compile this driver as a module, choose M here: the core
>           module will be called adxl345_core and you will also get
> -         adxl345_i2c for I2C.
> +         adxl345_i2c for I2C and/or adxl345_spi for SPI.
>
>  config ADXL345_I2C
>         tristate
>         select REGMAP_I2C
>
> +config ADXL345_SPI
> +       tristate
> +       select REGMAP_SPI

Hmm...
I saw another pattern

Library / core part is non-visible to user, while
SPI and I2C parts are selectable by user.

Why do you use inverted pattern? What did I miss?

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

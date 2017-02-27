From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/4] iio: accel: adxl345: Split driver into core and
 I2C then add SPI support
Date: Tue, 28 Feb 2017 00:41:50 +0200
Message-ID: <CAHp75Vcm+Li8U-3J9_k2P5sbUxkq35Hcwa4ho9Ohe-Cryi6Keg@mail.gmail.com>
References: <cover.1488115521.git.eraretuya@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1488115521.git.eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>, Daniel Baluta <daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Schofield <amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Feb 26, 2017 at 3:45 PM, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patchset modifies the adxl345 to use regmap. In doing so, we can
> easily introduce SPI support and let regmap handle the rest.
>
> Recap of basic features: read_raw for x, y and z axes, scale. After
> applying this series, driver now supports the SPI protocol and enumeration
> of device via device tree.

I did couple of rounds of review and found no major issues with the
series (though, I would amend some style there and minor things). So,
for moving forward FWIW:

Reviewed-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

>
> Changes from v3:
> [PATCH 1/4] Documentation: dt-bindings: Document ADXL345 accelerometer binding
> * None
> [PATCH 2/4] iio: accel: adxl345: Use I2C regmap instead of direct I2C access
> * Keep intact I2C client structure which was deleted from v3
> * Make use of regmap_get_device to retrieve struct device, use these for
>   debugging prints instead of &client->dev.
> [PATCH 3/4] iio: accel: adxl345: Split driver into core and I2C
>  and
> [PATCH 4/4] iio: accel: adxl345: Add SPI support
> * Revert to explicit and separate I2C and SPI configuration
> * Add OF match table, make it enumerable in ACPI environment (Andy's suggestion)
>
> Changes from v2:
> * Drop PATCH 4 iio: accel: adxl345: Add ACPI support
> * Add OF match table on both I2C and SPI files and document them
>
> Changes from v1:
> [PATCH 1/4]
> * Move other deletions from patch 2 in here -- make it clear what got deleted
>   and/or modified that is hard to see previously
> * Introduce the driver header file "adxl345.h" here instead of doing it in the
>   next patch
> * Completely omit traces of i2c_client and let this file (adxl345.c) mirror the
>   core file on the next patch.
> * Improve debugging print about invalid device ID in probe.
> [PATCH 2/4]
> * Update Kconfig to Jonathan's preferred style
> * Improve similarity index from 78% to 100% (rename detection)
> [PATCH 4/4]
> * Correct acpi_device_id: ADX0345 -> ADS0345
>
> Eva Rachel Retuya (4):
>   Documentation: dt-bindings: Document ADXL345 accelerometer binding
>   iio: accel: adxl345: Use I2C regmap instead of direct I2C access
>   iio: accel: adxl345: Split driver into core and I2C
>   iio: accel: adxl345: Add SPI support
>
>  .../devicetree/bindings/iio/accel/adxl345.txt      | 38 +++++++++
>  drivers/iio/accel/Kconfig                          | 26 ++++++-
>  drivers/iio/accel/Makefile                         |  4 +-
>  drivers/iio/accel/adxl345.h                        | 18 +++++
>  drivers/iio/accel/{adxl345.c => adxl345_core.c}    | 89 +++++++++-------------
>  drivers/iio/accel/adxl345_i2c.c                    | 78 +++++++++++++++++++
>  drivers/iio/accel/adxl345_spi.c                    | 83 ++++++++++++++++++++
>  7 files changed, 281 insertions(+), 55 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/accel/adxl345.txt
>  create mode 100644 drivers/iio/accel/adxl345.h
>  rename drivers/iio/accel/{adxl345.c => adxl345_core.c} (62%)
>  create mode 100644 drivers/iio/accel/adxl345_i2c.c
>  create mode 100644 drivers/iio/accel/adxl345_spi.c
>
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko

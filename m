From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] mfd: tps65912: Remove old driver in preparation
 for new driver
Date: Fri, 25 Sep 2015 17:52:15 +0100
Message-ID: <20150925165215.GJ27197@x1>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-3-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443106374-4126-3-git-send-email-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 24 Sep 2015, Andrew F. Davis wrote:

> The old tps65912 driver is being replaced, delete old driver.
>=20
> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> ---
>  drivers/gpio/Kconfig                   |   6 -
>  drivers/gpio/Makefile                  |   1 -
>  drivers/gpio/gpio-tps65912.c           | 153 ----------
>  drivers/mfd/Kconfig                    |  26 --
>  drivers/mfd/Makefile                   |   4 -
>  drivers/mfd/tps65912-core.c            | 175 -----------
>  drivers/mfd/tps65912-i2c.c             | 139 ---------
>  drivers/mfd/tps65912-irq.c             | 217 -------------
>  drivers/mfd/tps65912-spi.c             | 141 ---------
>  drivers/regulator/Kconfig              |   6 -
>  drivers/regulator/Makefile             |   1 -
>  drivers/regulator/tps65912-regulator.c | 541 -----------------------=
----------
>  include/linux/mfd/tps65912.h           | 328 --------------------
>  13 files changed, 1738 deletions(-)
>  delete mode 100644 drivers/gpio/gpio-tps65912.c
>  delete mode 100644 drivers/mfd/tps65912-core.c
>  delete mode 100644 drivers/mfd/tps65912-i2c.c
>  delete mode 100644 drivers/mfd/tps65912-irq.c
>  delete mode 100644 drivers/mfd/tps65912-spi.c
>  delete mode 100644 drivers/regulator/tps65912-regulator.c
>  delete mode 100644 include/linux/mfd/tps65912.h

I initially thought it was a bad idea due to bisectability blah blah
blah, but as the next patch adds a completely new incarnation I
thought this point to be moot.

Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

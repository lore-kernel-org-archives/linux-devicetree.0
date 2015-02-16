From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/4] mfd: lubbock_cplds: add lubbock IO board
Date: Mon, 16 Feb 2015 13:05:49 +0000
Message-ID: <20150216130549.GF14545@x1>
References: <1422111903-22176-1-git-send-email-robert.jarzmik@free.fr>
 <1422111903-22176-2-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422111903-22176-2-git-send-email-robert.jarzmik-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, 24 Jan 2015, Robert Jarzmik wrote:

> Lubbock () board is the IO motherboard of the Intel PXA25x Developmen=
t
> Platform, which supports the Lubbock pxa25x soc board.
>=20
> Historically, this support was in arch/arm/mach-pxa/lubbock.c. When
> gpio-pxa was moved to drivers/pxa, it became a driver, and its
> initialization and probing happened at postcore initcall. The lubbock
> code used to install the chained lubbock interrupt handler at init_ir=
q()
> time.
>=20
> The consequence of the gpio-pxa change is that the installed chained =
irq
> handler lubbock_irq_handler() was overwritten in pxa_gpio_probe(_dt)(=
),
> removing :
>  - the handler
>  - the falling edge detection setting of GPIO0, which revealed the
>    interrupt request from the lubbock IO board.
>=20
> As a fix, move the gpio0 chained handler setup to a place where we ha=
ve
> the guarantee that pxa_gpio_probe() was called before, so that lubboc=
k
> handler becomes the true IRQ chained handler of GPIO0, demuxing the
> lubbock IO board interrupts.
>=20
> This patch moves all that handling to a mfd driver. It's only purpose
> for the time being is the interrupt handling, but in the future it
> should encompass all the motherboard CPLDs handling :
>  - leds
>  - switches
>  - hexleds
>=20
> Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
> ---
> Since v1: change the name from cottula to lubbock_io
>             Dmitry pointed out the Cottula was the pxa25x family name=
,
> 	    lubbock was the pxa25x development board name. Therefore the
> 	    name was changed to lubbock_io (lubbock IO board)

Are you sure this is what you want to do?  We don't usually support
'boards' per say.  Instead we support 'devices', then pull each of
those devices together using some h/w description mechanism.

Board files are so yesterday!

Besides, this is MFD, where we support single pieces of silicon which
happen to support multiple devices.  I definitely don't want to support
boards here.

You might want to re-think the naming and your (sales) pitch.

> 	  change the resources to bi-irq ioresource
> 	    Discussion between Arnd and Robert to change the gpio
> 	    request by a irq request.
> Since v2: take into account Mark's review
>       	    Use irq flags from resources (DT case and pdata case).
> 	    Change of name from lubbock_io to lubbock-io
> Since v3: take into account Lee's review + Russell's advice
>             whitespace errors fixes
> 	    debug/info messages formatting
> 	    return X; empty lines
> ---
>  drivers/mfd/Kconfig   |  10 +++
>  drivers/mfd/Makefile  |   1 +
>  drivers/mfd/lubbock.c | 199 ++++++++++++++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 210 insertions(+)
>  create mode 100644 drivers/mfd/lubbock.c
>=20
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 2e6b731..4d8939f 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -91,6 +91,16 @@ config MFD_AXP20X
>  	  components like regulators or the PEK (Power Enable Key) under th=
e
>  	  corresponding menus.
> =20
> +config MFD_LUBBOCK
> +	bool "Lubbock Motherboard"
> +	def_bool ARCH_LUBBOCK
> +	select MFD_CORE
> +	help
> +	  This driver supports the Lubbock multifunction chip found on the
> +	  pxa25x development platform system (named Lubbock). This IO board
> +	  supports the interrupts handling, ethernet controller, flash chip=
s,
> +	  etc ...
> +
>  config MFD_CROS_EC
>  	tristate "ChromeOS Embedded Controller"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 53467e2..aff1f4f 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_MFD_88PM805)	+=3D 88pm805.o 88pm80x.o
>  obj-$(CONFIG_MFD_SM501)		+=3D sm501.o
>  obj-$(CONFIG_MFD_ASIC3)		+=3D asic3.o tmio_core.o
>  obj-$(CONFIG_MFD_BCM590XX)	+=3D bcm590xx.o
> +obj-$(CONFIG_MFD_LUBBOCK)	+=3D lubbock.o
>  obj-$(CONFIG_MFD_CROS_EC)	+=3D cros_ec.o
>  obj-$(CONFIG_MFD_CROS_EC_I2C)	+=3D cros_ec_i2c.o
>  obj-$(CONFIG_MFD_CROS_EC_SPI)	+=3D cros_ec_spi.o
> diff --git a/drivers/mfd/lubbock.c b/drivers/mfd/lubbock.c
> new file mode 100644
> index 0000000..4077fc5
> --- /dev/null
> +++ b/drivers/mfd/lubbock.c
> @@ -0,0 +1,199 @@
> +/*
> + * Intel Cotulla MFD - lubbock motherboard
> + *
> + * Copyright (C) 2014 Robert Jarzmik
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * Lubbock motherboard driver, supporting Lubbock (aka. PXA25X) SoC =
board.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mfd/core.h>

Why have you included this?  I don't see the use of the MFD framework
anywhere.  So what makes this an MFD?

I'm going to stop here, as I think I need more of an explanation so
what you're trying to achieve with this driver.

[...]

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

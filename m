From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/8] power: Add support for DA9150 Charger
Date: Mon, 16 Jun 2014 14:27:49 +0100
Message-ID: <20140616132749.GW14323@lee--X1>
References: <cover.1402484954.git.Adam.Thomson.Opensource@diasemi.com>
 <d4ef0d7ce2d6a2919d528ed75e82d2b99ec8d962.1402484954.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d4ef0d7ce2d6a2919d528ed75e82d2b99ec8d962.1402484954.git.Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Thomson <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 11 Jun 2014, Adam Thomson wrote:

> This patch adds support for DA9150 Charger & Fuel-Guage IC Charger.
>=20
> Signed-off-by: Adam Thomson <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/power/Kconfig              |  23 ++
>  drivers/power/Makefile             |   1 +
>  drivers/power/da9150-charger.c     | 790 +++++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/da9150/charger.h |  58 +++
>  4 files changed, 872 insertions(+)
>  create mode 100644 drivers/power/da9150-charger.c
>  create mode 100644 include/linux/mfd/da9150/charger.h

[...]

> diff --git a/include/linux/mfd/da9150/charger.h b/include/linux/mfd/d=
a9150/charger.h
> new file mode 100644
> index 0000000..73c41b3
> --- /dev/null
> +++ b/include/linux/mfd/da9150/charger.h
> @@ -0,0 +1,58 @@
> +/*
> + * DA9150 MFD Driver - Charger Data
> + *
> + * Copyright (c) 2014 Dialog Semiconductor
> + *
> + * Author: Adam Thomson <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute  it and/or mo=
dify it
> + * under  the terms of  the GNU General  Public License as published=
 by the
> + * Free Software Foundation;  either version 2 of the  License, or (=
at your
> + * option) any later version.
> + */
> +
> +#ifndef _DA9150_CHARGER_H
> +#define _DA9150_CHARGER_H

Two '_'s are normally preferred.

> +#include <linux/device.h>
> +#include <linux/i2c.h>

What are you using this for?

> +#include <linux/power_supply.h>
> +#include <linux/notifier.h>
> +#include <linux/usb/otg.h>
> +#include <linux/timer.h>
> +#include <linux/iio/consumer.h>
> +
> +#include <linux/mfd/da9150/core.h>
> +
> +

Extra '\n' here.

> +struct da9150_charger_attr_map {
> +	struct device_attribute attr;
> +	u16 reg;
> +	u8 shift;
> +	u8 mask;
> +};
> +
> +/* Private data */
> +struct da9150_charger {
> +	struct da9150 *da9150;
> +	struct device *dev;
> +
> +	struct power_supply ac;
> +	struct power_supply usb;
> +	struct power_supply battery;

Do you want these (or pointers to these) here?

How much space do they take up?

> +	struct power_supply *supply_online;
> +
> +	struct usb_phy *usb_phy;
> +	struct notifier_block otg_nb;
> +	struct work_struct otg_work;
> +	unsigned long usb_event;
> +
> +	struct iio_channel *ibus_chan;
> +	struct iio_channel *vbus_chan;
> +	struct iio_channel *tjunc_chan;
> +	struct iio_channel *vbat_chan;
> +
> +	bool invalid_tbat;
> +};
> +
> +#endif /* _DA9150_CHARGER_H */

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

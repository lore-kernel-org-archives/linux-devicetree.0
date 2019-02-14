From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH v4 4/4] gnss: add driver for mediatek receivers
Date: Thu, 14 Feb 2019 11:00:19 +0100
Message-ID: <20190214100019.GA4197@Red>
References: <1550070569-18588-1-git-send-email-lollivier@baylibre.com>
 <1550070569-18588-5-git-send-email-lollivier@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550070569-18588-5-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Feb 13, 2019 at 04:09:29PM +0100, Loys Ollivier wrote:
> Add driver for serial-connected Mediatek-based GNSS receivers.
> 
> These devices typically boot transmitting vendor specific NMEA output
> sequences. The serial port bit rate is read from the device tree
> "current-speed".
> 
> Note that the driver uses the generic GNSS serial implementation and
> therefore essentially only manages power abstracted into three power
> states: ACTIVE, STANDBY, and OFF.
> 
> For mediatek receivers with a main supply and no enable-gpios, this simply
> means that the main supply is disabled in STANDBY and OFF (the optional
> backup supply is kept enabled while the driver is bound).
> 
> Note that the timepulse-support is left unimplemented.
> 
> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> ---
> v4:
> No changes
> 
> v3:
> Sorted the Kconfig and Makefile
> Retained the original Copyright
> Removed "mediatek,mt3339" compatible.
> 
> v2: 
> Renamed from gtop/Globaltop to mtk/Mediatek.
> Added "mediatek,mt3339" compatible.
> 
>  drivers/gnss/Kconfig  |  13 +++++
>  drivers/gnss/Makefile |   3 +
>  drivers/gnss/mtk.c    | 152 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 168 insertions(+)
>  create mode 100644 drivers/gnss/mtk.c
> 
> diff --git a/drivers/gnss/Kconfig b/drivers/gnss/Kconfig
> index 6abc88514512..6d8c8027e1cd 100644
> --- a/drivers/gnss/Kconfig
> +++ b/drivers/gnss/Kconfig
> @@ -15,6 +15,19 @@ if GNSS
>  config GNSS_SERIAL
>  	tristate
>  
> +config GNSS_MTK_SERIAL
> +	tristate "Mediatek GNSS receiver support"
> +	depends on SERIAL_DEV_BUS
> +	select GNSS_SERIAL
> +	help
> +	  Say Y here if you have a Mediatek-based GNSS receiver which uses a
> +	  serial interface.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called gnss-mtk.
> +
> +	  If unsure, say N.
> +
>  config GNSS_SIRF_SERIAL
>  	tristate "SiRFstar GNSS receiver support"
>  	depends on SERIAL_DEV_BUS
> diff --git a/drivers/gnss/Makefile b/drivers/gnss/Makefile
> index 5cf0ebe0330a..451f11401ecc 100644
> --- a/drivers/gnss/Makefile
> +++ b/drivers/gnss/Makefile
> @@ -9,6 +9,9 @@ gnss-y := core.o
>  obj-$(CONFIG_GNSS_SERIAL)		+= gnss-serial.o
>  gnss-serial-y := serial.o
>  
> +obj-$(CONFIG_GNSS_MTK_SERIAL)		+= gnss-mtk.o
> +gnss-mtk-y := mtk.o
> +
>  obj-$(CONFIG_GNSS_SIRF_SERIAL)		+= gnss-sirf.o
>  gnss-sirf-y := sirf.o
>  
> diff --git a/drivers/gnss/mtk.c b/drivers/gnss/mtk.c
> new file mode 100644
> index 000000000000..a5aad08fb9d7
> --- /dev/null
> +++ b/drivers/gnss/mtk.c
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek GNSS receiver driver
> + *
> + * Copyright (C) 2018 Johan Hovold <johan@kernel.org>
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/gnss.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/serdev.h>
> +
> +#include "serial.h"
> +
> +struct mtk_data {
> +	struct regulator *v_bckp;
> +	struct regulator *vcc;
> +};
> +
> +static int mtk_set_active(struct gnss_serial *gserial)
> +{
> +	struct mtk_data *data = gnss_serial_get_drvdata(gserial);
> +	int ret;
> +
> +	ret = regulator_enable(data->vcc);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

Hello

This could be simplified to return regulator_enable(data->vcc);
Furthermore, after this simplification, the function seems useless.

Same comment for mtk_set_standby()

Regards

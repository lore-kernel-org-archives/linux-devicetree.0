From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 4/4] gnss: add driver for mediatek receivers
Date: Fri, 25 Jan 2019 10:30:13 +0100
Message-ID: <20190125093013.GD3691@localhost>
References: <1547744074-28308-1-git-send-email-lollivier@baylibre.com>
 <1547744074-28308-5-git-send-email-lollivier@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1547744074-28308-5-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Loys Ollivier <lollivier@baylibre.com>
Cc: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 17, 2019 at 05:54:34PM +0100, Loys Ollivier wrote:
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
> 
> v2: 
> Renamed from gtop/Globaltop to mtk/Mediatek.
> Added "mediatek,mt3339" compatible.
> 
>  drivers/gnss/Kconfig  |  13 +++++
>  drivers/gnss/Makefile |   3 +
>  drivers/gnss/core.c   |   1 +
>  drivers/gnss/mtk.c    | 153 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 170 insertions(+)
>  create mode 100644 drivers/gnss/mtk.c
> 
> diff --git a/drivers/gnss/Kconfig b/drivers/gnss/Kconfig
> index 6abc88514512..51e6282d092a 100644
> --- a/drivers/gnss/Kconfig
> +++ b/drivers/gnss/Kconfig
> @@ -40,4 +40,17 @@ config GNSS_UBX_SERIAL
>  
>  	  If unsure, say N.
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

Add before the SiRF entry too keep the entries sorted.

> +
>  endif # GNSS
> diff --git a/drivers/gnss/Makefile b/drivers/gnss/Makefile
> index 5cf0ebe0330a..43318375aa51 100644
> --- a/drivers/gnss/Makefile
> +++ b/drivers/gnss/Makefile
> @@ -14,3 +14,6 @@ gnss-sirf-y := sirf.o
>  
>  obj-$(CONFIG_GNSS_UBX_SERIAL)		+= gnss-ubx.o
>  gnss-ubx-y := ubx.o
> +
> +obj-$(CONFIG_GNSS_MTK_SERIAL)		+= gnss-mtk.o
> +gnss-mtk-y := mtk.o

Ditto.

> diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
> index 4291a0dd22aa..320cfca80d5f 100644
> --- a/drivers/gnss/core.c
> +++ b/drivers/gnss/core.c
> @@ -334,6 +334,7 @@ static const char * const gnss_type_names[GNSS_TYPE_COUNT] = {
>  	[GNSS_TYPE_NMEA]	= "NMEA",
>  	[GNSS_TYPE_SIRF]	= "SiRF",
>  	[GNSS_TYPE_UBX]		= "UBX",
> +	[GNSS_TYPE_MTK]		= "MTK",
>  };
>  
>  static const char *gnss_type_name(struct gnss_device *gdev)

So this should go in the previous patch.

> diff --git a/drivers/gnss/mtk.c b/drivers/gnss/mtk.c
> new file mode 100644
> index 000000000000..c91d4d251098
> --- /dev/null
> +++ b/drivers/gnss/mtk.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek GNSS receiver driver
> + *
> + * Copyright (C) 2018 Loys Ollivier <lollivier@baylibre.com>

As this just a copy of the ubx driver with the "ubx" prefix replaced
with "mtk", you need to retain the original copyright statement.

I'm not even sure the search and replace work is copyrightable at all...

I see now why you wanted merge this with the ubx driver, but I still
think they should be kept apart for now. Maybe we can move common bits
into the generic implementation (library) when we get a third "copy".

The rest of the driver obviously looks fine. ;) Possibly with the
exception of the added mediatek compatible as mentioned before.

> +#ifdef CONFIG_OF
> +static const struct of_device_id mtk_of_match[] = {
> +	{ .compatible = "globaltop,pa6h" },
> +	{ .compatible = "mediatek,mt3339" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_of_match);
> +#endif
> +
> +static struct serdev_device_driver mtk_driver = {
> +	.driver	= {
> +		.name		= "gnss-mtk",
> +		.of_match_table	= of_match_ptr(mtk_of_match),
> +		.pm		= &gnss_serial_pm_ops,
> +	},
> +	.probe	= mtk_probe,
> +	.remove	= mtk_remove,
> +};
> +module_serdev_device_driver(mtk_driver);
> +
> +MODULE_AUTHOR("Loys Ollivier <lollivier@baylibre.com>");
> +MODULE_DESCRIPTION("Mediatek GNSS receiver driver");
> +MODULE_LICENSE("GPL v2");

Johan

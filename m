From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 2/4] iio/proximity: add mb12x2 driver to Kconfig and
 Makefile
Date: Sun, 24 Feb 2019 17:55:56 +0100
Message-ID: <49905636-cdba-f9e1-f8d4-7876d2981c4b@suse.de>
References: <20190224162235.7kidyum2dwg5bua5@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190224162235.7kidyum2dwg5bua5@arbad>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: arnd@arndb.de, davem@davemloft.net, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jic23@kernel.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh+dt@kernel.org, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com
List-Id: devicetree@vger.kernel.org

Am 24.02.19 um 17:22 schrieb Andreas Klinger:
> Makefile and Kconfig: add configuration for mb12x2 ultrasonic proximity
> driver
> 
> Signed-off-by: Andreas Klinger <ak@it-klinger.de>
> ---
>  drivers/iio/proximity/Kconfig  | 11 +++++++++++
>  drivers/iio/proximity/Makefile |  1 +
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
> index b99367a89f81..5d57ca44e30d 100644
> --- a/drivers/iio/proximity/Kconfig
> +++ b/drivers/iio/proximity/Kconfig
> @@ -45,6 +45,17 @@ config LIDAR_LITE_V2
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called pulsedlight-lite-v2
>  
> +config MB12X2
> +	tristate "MaxSonar MB12X2 family ultrasonic sensors"
> +	depends on I2C
> +	help
> +	  Say Y to build a driver for the ultrasonic sensors of MaxSonar
> +	  with i2c interface. It can be used to measure the distance of
> +	  objects.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called mb12x2.
> +
>  config RFD77402
>  	tristate "RFD77402 ToF sensor"
>  	depends on I2C
> diff --git a/drivers/iio/proximity/Makefile b/drivers/iio/proximity/Makefile
> index 6d031f903c4c..c56b72a8be87 100644
> --- a/drivers/iio/proximity/Makefile
> +++ b/drivers/iio/proximity/Makefile
> @@ -6,6 +6,7 @@
>  # When adding new entries keep the list in alphabetical order
>  obj-$(CONFIG_AS3935)		+= as3935.o
>  obj-$(CONFIG_ISL29501)		+= isl29501.o
> +obj-$(CONFIG_MB12X2)		+= mb12x2.o

This commit will fail to build, as you add the source file only in 3/4.
It needs to be in this patch.

Regards,
Andreas

>  obj-$(CONFIG_LIDAR_LITE_V2)	+= pulsedlight-lidar-lite-v2.o
>  obj-$(CONFIG_RFD77402)		+= rfd77402.o
>  obj-$(CONFIG_SRF04)		+= srf04.o
> 


-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)

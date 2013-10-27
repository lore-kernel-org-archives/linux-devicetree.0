From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/4] charger-manager: Use IIO subsystem to read battery
 temperature instead of legacy method
Date: Sun, 27 Oct 2013 12:17:39 +0100
Message-ID: <20131027111739.GC2437@xo-6d-61-c0.localdomain>
References: <1382446317-32613-1-git-send-email-cw00.choi@samsung.com>
 <1382446317-32613-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1382446317-32613-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: anton@enomsg.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dwmw2@infradead.org, grant.likely@linaro.org, rob.herring@calxeda.com, myungjoo.ham@samsung.com, kyungmin.park@samsung.com
List-Id: devicetree@vger.kernel.org

Hi!

> diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
> index e6f92b4..6700191 100644
> --- a/drivers/power/Kconfig
> +++ b/drivers/power/Kconfig
> @@ -309,6 +309,7 @@ config CHARGER_MANAGER
>  	bool "Battery charger manager for multiple chargers"
>  	depends on REGULATOR && RTC_CLASS
>  	select EXTCON
> +	select IIO
>  	help
>            Say Y to enable charger-manager support, which allows multiple
>            chargers attached to a battery and multiple batteries attached to a

Umm. Are there charger-manager users that don't have temperature sensor on IIO?

> +	if (desc->channel) {
> +		temp = iio_read_channel_raw(desc->channel, last_temp_mC);
> +
> +		/*
> +		 * The charger-manager use IIO subsystem to read ADC raw data
> +		 * from IIO ADC device drvier. The each device driver has
> +		 * own non-standard ADC table. If user of charger-manager
> +		 * would like to get correct temperature value, have to convert
> +		 * 'last_temp_mC' variable according to proper calculation
> +		 * method and own ADC table.
> +		 */
> +
> +		if (*last_temp_mC >= desc->iio_adc_overheat)
> +			temp = CM_TEMP_NORMAL;	/* Overheat */
> +		else if (*last_temp_mC <= desc->iio_adc_cold)
> +			temp = CM_TEMP_COLD;	/* Cold */
> +		else
> +			temp = CM_TEMP_NORMAL;	/* Normal */

Something is definitely wrong here.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

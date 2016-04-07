From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6] iio: dac: Add support for the AD5592R/AD5593R
 ADCs/DACs
Date: Thu, 7 Apr 2016 12:57:48 -0500
Message-ID: <20160407175748.GL32257@rob-hp-laptop>
References: <1459842379-26275-1-git-send-email-michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459842379-26275-1-git-send-email-michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 05, 2016 at 09:46:19AM +0200, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org wrote:
> From: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
> 
> This patch adds support for the AD5592R (spi) and AD5593R (i2c)
> ADC/DAC/GPIO devices.
> 
> Signed-off-by: Paul Cercueil <paul.cercueil-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Michael Hennerich <michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> ---
> 
> Changes since v1:
> 	* Fix mutex usage
> 	* Remove unnecessary NULL pointer guards
> 	* Add comment explaining the invalid data read
> 	* AD5593R Remove surplus adc readback
> 
> Changes since v2:
> 	* Use child nodes to describe channels
> 	* Fix probe return and driver remove path
> 	* Move locking closer to where its used
> 	* Remove WARN_ON but return error
> 	* Remove OPEN DRAIN configuration option
> 
> Changes since v3:
> 	* Documentation: Add missing vendor prefixes in the examples
> 	* Minor function reordering in remove() to match the reverse of probe()
> 
> Changes since v4:
> 	* Documentation: Add missing gpio bindings
> 	* Kconfig: Select GPIOLIB and remove ifdefs in code
> 	* Remove surplus error check in ad5592r_gpio_request()
> 	* Add comment about reset magic
> 
> Changes since v5:
> 	* Remove surplus error check
> 	* Remove additional ifdef CONFIG_GPIOLIB guards in the header
> 	* Bindings: Add additional comments about CH_MODE_DAC_AND_ADC mode
> ---
>  .../devicetree/bindings/iio/dac/ad5592r.txt        | 155 +++++

I've acked this twice before, and the last change seems minor. 
Please add acks unless it is more than minor changes and you need it 
reviewed again.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/dac/Kconfig                            |  27 +
>  drivers/iio/dac/Makefile                           |   3 +
>  drivers/iio/dac/ad5592r-base.c                     | 691 +++++++++++++++++++++
>  drivers/iio/dac/ad5592r-base.h                     |  76 +++
>  drivers/iio/dac/ad5592r.c                          | 164 +++++
>  drivers/iio/dac/ad5593r.c                          | 131 ++++
>  include/dt-bindings/iio/adi,ad5592r.h              |  16 +
>  8 files changed, 1263 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/dac/ad5592r.txt
>  create mode 100644 drivers/iio/dac/ad5592r-base.c
>  create mode 100644 drivers/iio/dac/ad5592r-base.h
>  create mode 100644 drivers/iio/dac/ad5592r.c
>  create mode 100644 drivers/iio/dac/ad5593r.c
>  create mode 100644 include/dt-bindings/iio/adi,ad5592r.h
> 

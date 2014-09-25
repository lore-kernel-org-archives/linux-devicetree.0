From: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 1/2] iio: vadc: Qualcomm SPMI PMIC voltage ADC driver
Date: Thu, 25 Sep 2014 15:47:05 +0300
Message-ID: <1411649225.18580.134.camel@iivanov-dev>
References: <1411563415-11933-1-git-send-email-svarbanov@mm-sol.com>
	 <1411563415-11933-2-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411563415-11933-2-git-send-email-svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Boyd <sboyd@codeauro>
List-Id: devicetree@vger.kernel.org


Hi Stan, few comment bellow.

On Wed, 2014-09-24 at 15:56 +0300, Stanimir Varbanov wrote:
> The voltage ADC is peripheral of Qualcomm SPMI PMIC chips. It has
> 15bits resolution and register space inside PMIC accessible across
> SPMI bus.
> 
> The vadc driver registers itself through IIO interface.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/iio/adc/Kconfig                       |   10 +
>  drivers/iio/adc/Makefile                      |    1 +
>  drivers/iio/adc/qcom-spmi-vadc.c              | 1029 +++++++++++++++++++++++++
>  include/dt-bindings/iio/qcom,spmi-pmic-vadc.h |  119 +++
>  4 files changed, 1159 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/iio/adc/qcom-spmi-vadc.c
>  create mode 100644 include/dt-bindings/iio/qcom,spmi-pmic-vadc.h
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 11b048a..ec48360 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -206,6 +206,16 @@ config NAU7802
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called nau7802.
>  
> +config QCOM_SPMI_VADC
> +	tristate "Qualcomm SPMI PMIC voltage ADC"
> +	depends on SPMI

+ select REGMAP_SPMI

<snip>

> +
> +static int vadc_read(struct vadc_priv *vadc, u16 offset, u8 *data)
> +{
> +	return regmap_bulk_read(vadc->regmap, vadc->base + offset, data, 1);

just regmap_read() ?

> +}
> +

General comment, most of the dev_dbg looks like legitimate dev_err's to me.

Regards,
Ivan 

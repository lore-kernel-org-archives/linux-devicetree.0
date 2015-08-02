From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] iio: adc: ti-adc128s052: Add devicetree support
Date: Sun, 2 Aug 2015 18:01:03 +0100
Message-ID: <55BE4CCF.1080102@kernel.org>
References: <1437581064-9733-1-git-send-email-denis@eukrea.com>
 <1437581064-9733-4-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437581064-9733-4-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?Q?Eric_B=c3=a9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 22/07/15 17:04, Denis Carikli wrote:
> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/iio/adc/ti-adc128s052.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc128s052.c
> index 8aca0ff..2558508 100644
> --- a/drivers/iio/adc/ti-adc128s052.c
> +++ b/drivers/iio/adc/ti-adc128s052.c
> @@ -13,10 +13,11 @@
>   */
>  
>  #include <linux/err.h>
> -#include <linux/spi/spi.h>
>  #include <linux/module.h>
>  #include <linux/iio/iio.h>
> +#include <linux/of.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/spi/spi.h>
Why the reorder?
>  
>  struct adc128_configuration {
>  	const struct iio_chan_spec	*channels;
> @@ -183,10 +184,21 @@ static const struct spi_device_id adc128_id[] = {
>  };
>  MODULE_DEVICE_TABLE(spi, adc128_id);
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id adc128_of_match[] = {
> +	{ .compatible = "ti,adc128s052" },
> +	{ .compatible = "ti,adc122s021" },
> +	{ .compatible = "ti,adc108s022" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, adc128_of_match);
> +#endif
> +
>  static struct spi_driver adc128_driver = {
>  	.driver = {
>  		.name = "adc128s052",
>  		.owner = THIS_MODULE,
> +		.of_match_table = of_match_ptr(adc128_of_match),
>  	},
>  	.probe = adc128_probe,
>  	.remove = adc128_remove,
> 

From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] iio: adc: ti_am335x_adc: refactor DT parsing into
 a function
Date: Sat, 30 Aug 2014 10:44:27 +0100
Message-ID: <54019CFB.7070906@kernel.org>
References: <1409141990-29627-1-git-send-email-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1409141990-29627-1-git-send-email-vigneshr@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Felipe Balbi <balbi@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 27/08/14 13:19, Vignesh R wrote:
> Refactor DT parsing into a seperate function from probe() to
> help addition of more DT parameters later.
> 
> No functional changes.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
Entirely sensible, will pick up once we have sorted patch 2.
> ---
>  drivers/iio/adc/ti_am335x_adc.c |   29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_adc.c
> index 63b2bb6..dfb0db0 100644
> --- a/drivers/iio/adc/ti_am335x_adc.c
> +++ b/drivers/iio/adc/ti_am335x_adc.c
> @@ -407,16 +407,30 @@ static const struct iio_info tiadc_info = {
>  	.driver_module = THIS_MODULE,
>  };
>  
> +static int tiadc_parse_dt(struct platform_device *pdev,
> +				struct tiadc_device *adc_dev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct property *prop;
> +	const __be32 *cur;
> +	int channels = 0;
> +	u32 val;
> +
> +	of_property_for_each_u32(node, "ti,adc-channels", prop, cur, val) {
> +		adc_dev->channel_line[channels] = val;
> +		channels++;
> +	}
> +
> +	adc_dev->channels = channels;
> +	return 0;
> +}
> +
>  static int tiadc_probe(struct platform_device *pdev)
>  {
>  	struct iio_dev		*indio_dev;
>  	struct tiadc_device	*adc_dev;
>  	struct device_node	*node = pdev->dev.of_node;
> -	struct property		*prop;
> -	const __be32		*cur;
>  	int			err;
> -	u32			val;
> -	int			channels = 0;
>  
>  	if (!node) {
>  		dev_err(&pdev->dev, "Could not find valid DT data.\n");
> @@ -432,12 +446,7 @@ static int tiadc_probe(struct platform_device *pdev)
>  	adc_dev = iio_priv(indio_dev);
>  
>  	adc_dev->mfd_tscadc = ti_tscadc_dev_get(pdev);
> -
> -	of_property_for_each_u32(node, "ti,adc-channels", prop, cur, val) {
> -		adc_dev->channel_line[channels] = val;
> -		channels++;
> -	}
> -	adc_dev->channels = channels;
> +	tiadc_parse_dt(pdev, adc_dev);
>  
>  	indio_dev->dev.parent = &pdev->dev;
>  	indio_dev->name = dev_name(&pdev->dev);
> 

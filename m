From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: adc: ti_am335x_adc: refactor DT parsing into
 a function
Date: Thu, 09 Apr 2015 15:13:57 +0100
Message-ID: <55268925.7000005@kernel.org>
References: <1427800357-21680-1-git-send-email-vigneshr@ti.com> <1427800357-21680-2-git-send-email-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427800357-21680-2-git-send-email-vigneshr-l0cyMroinI0@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Karol Wrona <k.wrona-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jan Kardell <jan.kardell-KSZdJiTw9mzQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fcooper-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 31/03/15 12:12, Vignesh R wrote:
> Refactor DT parsing into a separate function from probe() to
> help addition of more DT parameters later.
> 
> No functional changes.
> 
> Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
Clearly going to need this whatever the outcome of the second patch being
reviewed.

Applied to the togreg branch of iio.git - initially pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan
> ---
>  drivers/iio/adc/ti_am335x_adc.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_adc.c
> index 2e5cc4409f78..2f818405ffbe 100644
> --- a/drivers/iio/adc/ti_am335x_adc.c
> +++ b/drivers/iio/adc/ti_am335x_adc.c
> @@ -396,16 +396,30 @@ static const struct iio_info tiadc_info = {
>  	.driver_module = THIS_MODULE,
>  };
>  
> +static int tiadc_parse_dt(struct platform_device *pdev,
> +			  struct tiadc_device *adc_dev)
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
> @@ -421,12 +435,7 @@ static int tiadc_probe(struct platform_device *pdev)
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

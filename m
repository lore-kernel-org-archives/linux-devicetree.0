From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] iio: adc: ti-ads7950: Change regulator matching
 string to "vref"
Date: Sat, 14 Jan 2017 12:52:21 +0000
Message-ID: <47d15fe8-85c5-6e1c-cd89-71398ad79def@kernel.org>
References: <1484157171-15571-1-git-send-email-david@lechnology.com>
 <1484157171-15571-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484157171-15571-4-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/01/17 17:52, David Lechner wrote:
> This changes the reference voltage regulator matching string from "refin"
> to "vref". This is to be consistent with other A/DC chips that also use
> "vref-supply" in their device tree bindings.
> 
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
>  drivers/iio/adc/ti-ads7950.c | 6 +++---
Again, we missed this before and it would have been nice to have
had it as vref (which is matches the datasheet).  The question
becomes how do we handle this going forward with no risk of breaking
existing device trees.  We may have to do an optional get on one
name and then a non optional on the second. It's ugly, but
would fix this up in a 'safe' way.

Jonathan
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
> index b587fa6..16a0663 100644
> --- a/drivers/iio/adc/ti-ads7950.c
> +++ b/drivers/iio/adc/ti-ads7950.c
> @@ -411,15 +411,15 @@ static int ti_ads7950_probe(struct spi_device *spi)
>  	spi_message_init_with_transfers(&st->scan_single_msg,
>  					st->scan_single_xfer, 3);
>  
> -	st->reg = devm_regulator_get(&spi->dev, "refin");
> +	st->reg = devm_regulator_get(&spi->dev, "vref");
>  	if (IS_ERR(st->reg)) {
> -		dev_err(&spi->dev, "Failed get get regulator \"refin\"\n");
> +		dev_err(&spi->dev, "Failed get get regulator \"vref\"\n");
>  		return PTR_ERR(st->reg);
>  	}
>  
>  	ret = regulator_enable(st->reg);
>  	if (ret) {
> -		dev_err(&spi->dev, "Failed to enable regulator \"refin\"\n");
> +		dev_err(&spi->dev, "Failed to enable regulator \"vref\"\n");
>  		return ret;
>  	}
>  
> 

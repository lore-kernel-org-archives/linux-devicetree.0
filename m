From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/10] staging: iio: tsl2583: check return values from
 taos_chip_{on,off}
Date: Sun, 30 Oct 2016 17:54:53 +0000
Message-ID: <be600176-0883-0e0f-dd5d-dae84990bc09@kernel.org>
References: <1477648821-3786-1-git-send-email-masneyb@onstation.org>
 <1477648821-3786-6-git-send-email-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477648821-3786-6-git-send-email-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28/10/16 11:00, Brian Masney wrote:
> The return value from taos_chip_on() and taos_chip_off() was not
> checked in taos_luxtable_store() and taos_probe(). This patch adds
> proper error checking to these function calls.
> 
> Signed-off-by: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
This does raise the question of whether we should have a remove that turns
the device off, but that's a separate issue!
I don't however like the jumping to a single exit point.
That should have been done in the later patch where you add locking rather
than here.

I'll take it anyway though on the basis the ugliness doesn't last long.

Jonathan
> ---
>  drivers/staging/iio/light/tsl2583.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/iio/light/tsl2583.c b/drivers/staging/iio/light/tsl2583.c
> index f8ccb4d..e975bba 100644
> --- a/drivers/staging/iio/light/tsl2583.c
> +++ b/drivers/staging/iio/light/tsl2583.c
> @@ -727,7 +727,7 @@ static ssize_t taos_luxtable_store(struct device *dev,
>  	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>  	struct tsl2583_chip *chip = iio_priv(indio_dev);
>  	int value[ARRAY_SIZE(taos_device_lux) * 3 + 1];
> -	int n;
> +	int n, ret = -EINVAL;
>  
>  	get_options(buf, ARRAY_SIZE(value), value);
>  
> @@ -739,23 +739,31 @@ static ssize_t taos_luxtable_store(struct device *dev,
>  	n = value[0];
>  	if ((n % 3) || n < 6 || n > ((ARRAY_SIZE(taos_device_lux) - 1) * 3)) {
>  		dev_info(dev, "LUX TABLE INPUT ERROR 1 Value[0]=%d\n", n);
> -		return -EINVAL;
> +		goto done;
>  	}
>  	if ((value[(n - 2)] | value[(n - 1)] | value[n]) != 0) {
>  		dev_info(dev, "LUX TABLE INPUT ERROR 2 Value[0]=%d\n", n);
> -		return -EINVAL;
> +		goto done;
>  	}
>  
> -	if (chip->taos_chip_status == TSL258X_CHIP_WORKING)
> -		taos_chip_off(indio_dev);
> +	if (chip->taos_chip_status == TSL258X_CHIP_WORKING) {
> +		ret = taos_chip_off(indio_dev);
> +		if (ret < 0)
> +			goto done;
> +	}
>  
>  	/* Zero out the table */
>  	memset(taos_device_lux, 0, sizeof(taos_device_lux));
>  	memcpy(taos_device_lux, &value[1], (value[0] * 4));
>  
> -	taos_chip_on(indio_dev);
> +	ret = taos_chip_on(indio_dev);
> +	if (ret < 0)
> +		goto done;
>  
> -	return len;
> +	ret = len;
> +
> +done:
> +	return ret;
>  }
>  
>  static DEVICE_ATTR(illuminance0_calibscale, S_IRUGO | S_IWUSR,
> @@ -883,7 +891,9 @@ static int taos_probe(struct i2c_client *clientp,
>  	taos_defaults(chip);
>  
>  	/* Make sure the chip is on */
> -	taos_chip_on(indio_dev);
> +	ret = taos_chip_on(indio_dev);
> +	if (ret < 0)
> +		return ret;
>  
>  	dev_info(&clientp->dev, "Light sensor found.\n");
>  	return 0;
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFCv4 5/7] mfd: twl4030-madc: Use twl_i2c_read/write_u16 for
 16 bit registers
Date: Sat, 01 Mar 2014 11:49:00 +0000
Message-ID: <5311C92C.20901@kernel.org>
References: <1393374270-20079-1-git-send-email-sre@debian.org> <1393444990-28140-1-git-send-email-sre@debian.org> <1393444990-28140-6-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393444990-28140-6-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/02/14 20:03, Sebastian Reichel wrote:
> Simplify reading and writing of 16 bit TWL registers in the
> driver by using twl_i2c_read_u16 and twl_i2c_write_u16.
>
> Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Nice
Acked-by: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>   drivers/mfd/twl4030-madc.c | 39 ++++++++-------------------------------
>   1 file changed, 8 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/mfd/twl4030-madc.c b/drivers/mfd/twl4030-madc.c
> index c90013e..d918670 100644
> --- a/drivers/mfd/twl4030-madc.c
> +++ b/drivers/mfd/twl4030-madc.c
> @@ -206,25 +206,19 @@ const struct twl4030_madc_conversion_method twl4030_conversion_methods[] = {
>    */
>   static int twl4030_madc_channel_raw_read(struct twl4030_madc_data *madc, u8 reg)
>   {
> -	u8 msb, lsb;
> +	u16 val;
>   	int ret;
>   	/*
>   	 * For each ADC channel, we have MSB and LSB register pair. MSB address
>   	 * is always LSB address+1. reg parameter is the address of LSB register
>   	 */
> -	ret = twl_i2c_read_u8(TWL4030_MODULE_MADC, &msb, reg + 1);
> +	ret = twl_i2c_read_u16(TWL4030_MODULE_MADC, &val, reg);
>   	if (ret) {
> -		dev_err(madc->dev, "unable to read MSB register 0x%X\n",
> -			reg + 1);
> -		return ret;
> -	}
> -	ret = twl_i2c_read_u8(TWL4030_MODULE_MADC, &lsb, reg);
> -	if (ret) {
> -		dev_err(madc->dev, "unable to read LSB register 0x%X\n", reg);
> +		dev_err(madc->dev, "unable to read register 0x%X\n", reg);
>   		return ret;
>   	}
>
> -	return (int)(((msb << 8) | lsb) >> 6);
> +	return (int)(val >> 6);
>   }
>
>   /*
> @@ -573,7 +567,6 @@ static int twl4030_madc_wait_conversion_ready(struct twl4030_madc_data *madc,
>   int twl4030_madc_conversion(struct twl4030_madc_request *req)
>   {
>   	const struct twl4030_madc_conversion_method *method;
> -	u8 ch_msb, ch_lsb;
>   	int ret;
>
>   	if (!req || !twl4030_madc)
> @@ -589,37 +582,21 @@ int twl4030_madc_conversion(struct twl4030_madc_request *req)
>   		ret = -EBUSY;
>   		goto out;
>   	}
> -	ch_msb = (req->channels >> 8) & 0xff;
> -	ch_lsb = req->channels & 0xff;
>   	method = &twl4030_conversion_methods[req->method];
>   	/* Select channels to be converted */
> -	ret = twl_i2c_write_u8(TWL4030_MODULE_MADC, ch_msb, method->sel + 1);
> +	ret = twl_i2c_write_u16(TWL4030_MODULE_MADC, req->channels, method->sel);
>   	if (ret) {
>   		dev_err(twl4030_madc->dev,
> -			"unable to write sel register 0x%X\n", method->sel + 1);
> -		goto out;
> -	}
> -	ret = twl_i2c_write_u8(TWL4030_MODULE_MADC, ch_lsb, method->sel);
> -	if (ret) {
> -		dev_err(twl4030_madc->dev,
> -			"unable to write sel register 0x%X\n", method->sel + 1);
> +			"unable to write sel register 0x%X\n", method->sel);
>   		goto out;
>   	}
>   	/* Select averaging for all channels if do_avg is set */
>   	if (req->do_avg) {
> -		ret = twl_i2c_write_u8(TWL4030_MODULE_MADC,
> -				       ch_msb, method->avg + 1);
> +		ret = twl_i2c_write_u16(TWL4030_MODULE_MADC, req->channels,
> +				       method->avg);
>   		if (ret) {
>   			dev_err(twl4030_madc->dev,
>   				"unable to write avg register 0x%X\n",
> -				method->avg + 1);
> -			goto out;
> -		}
> -		ret = twl_i2c_write_u8(TWL4030_MODULE_MADC,
> -				       ch_lsb, method->avg);
> -		if (ret) {
> -			dev_err(twl4030_madc->dev,
> -				"unable to write avg reg 0x%X\n",
>   				method->avg);
>   			goto out;
>   		}
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

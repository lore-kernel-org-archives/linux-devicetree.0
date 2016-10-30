From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 03/10] staging: iio: tsl2583: return proper error code
 instead of -1
Date: Sun, 30 Oct 2016 17:50:05 +0000
Message-ID: <5c1b8527-91e9-e5df-8c0a-2e39d405fb15@kernel.org>
References: <1477648821-3786-1-git-send-email-masneyb@onstation.org>
 <1477648821-3786-4-git-send-email-masneyb@onstation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477648821-3786-4-git-send-email-masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Mark.Rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 28/10/16 11:00, Brian Masney wrote:
> taos_als_calibrate() has a code path where -1 is returned. This patch
> changes the code so that a proper error code is returned.
> 
> Signed-off-by: Brian Masney <masneyb-1iNe0GrtECGEi8DpZVb4nw@public.gmane.org>
Applied to the togreg branch of iio.git and pushed out as
testing for the autobuilders to play with it.
(I'm going to begin to get lazy on this message ;)
> ---
>  drivers/staging/iio/light/tsl2583.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/light/tsl2583.c b/drivers/staging/iio/light/tsl2583.c
> index 35c1696..47fd373 100644
> --- a/drivers/staging/iio/light/tsl2583.c
> +++ b/drivers/staging/iio/light/tsl2583.c
> @@ -373,7 +373,7 @@ static int taos_als_calibrate(struct iio_dev *indio_dev)
>  			!= (TSL258X_CNTL_ADC_ENBL | TSL258X_CNTL_PWR_ON)) {
>  		dev_err(&chip->client->dev,
>  			"taos_als_calibrate failed: device not powered on with ADC enabled\n");
> -		return -1;
> +		return -EINVAL;
>  	}
>  
>  	ret = i2c_smbus_write_byte(chip->client,
> 

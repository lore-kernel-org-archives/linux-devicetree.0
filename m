From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] staging: iio: hmc5843: Add all available models to
 device tree id table.
Date: Tue, 18 Feb 2014 10:40:50 +0000
Message-ID: <530338B2.603@kernel.org>
References: <1392387929-31491-1-git-send-email-marek@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392387929-31491-1-git-send-email-marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org
Cc: pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 14/02/14 14:25, Marek Belisko wrote:
> Signed-off-by: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
I wonder how this got missed.  However, for those data elements to be useful, you will
need to read them somewhere in the driver I think.... (if there is any magic
that puts this in the relevant i2c locations then point it out to me!)
> ---
>   drivers/staging/iio/magnetometer/hmc5843.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/iio/magnetometer/hmc5843.c b/drivers/staging/iio/magnetometer/hmc5843.c
> index d4f4dd9..f595fdc 100644
> --- a/drivers/staging/iio/magnetometer/hmc5843.c
> +++ b/drivers/staging/iio/magnetometer/hmc5843.c
> @@ -630,7 +630,9 @@ static const struct i2c_device_id hmc5843_id[] = {
>   MODULE_DEVICE_TABLE(i2c, hmc5843_id);
>
>   static const struct of_device_id hmc5843_of_match[] = {
> -	{ .compatible = "honeywell,hmc5843" },
> +	{ .compatible = "honeywell,hmc5843", .data = (void *)HMC5843_ID },
> +	{ .compatible = "honeywell,hmc5883", .data = (void *)HMC5883_ID },
> +	{ .compatible = "honeywell,hmc5883l", .data = (void *)HMC5883L_ID },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, hmc5843_of_match);
>

From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: temperature: tsys01: Add OF match table
Date: Tue, 20 Jun 2017 18:14:59 +0100
Message-ID: <20170620181459.444e14c3@kernel.org>
References: <1497369142-32473-1-git-send-email-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1497369142-32473-1-git-send-email-manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, william.markezana-ya7vCgA9bt58UrSeD/g0lQ@public.gmane.org, ludovic.tancerel-sbt5i+FMW2pmsedzY7GhzwC/G2K4zDHf@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 13 Jun 2017 21:22:22 +0530
Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Add of_match_table for Measurement Specialties TSYS01 temperature sensor
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Applied.  Thanks,
> ---
>  drivers/iio/temperature/tsys01.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/iio/temperature/tsys01.c b/drivers/iio/temperature/tsys01.c
> index 3e60c61..d8aa211 100644
> --- a/drivers/iio/temperature/tsys01.c
> +++ b/drivers/iio/temperature/tsys01.c
> @@ -214,11 +214,18 @@ static const struct i2c_device_id tsys01_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, tsys01_id);
>  
> +static const struct of_device_id tsys01_of_match[] = {
> +	{ .compatible = "meas,tsys01", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, tsys01_of_match);
> +
>  static struct i2c_driver tsys01_driver = {
>  	.probe = tsys01_i2c_probe,
>  	.id_table = tsys01_id,
>  	.driver = {
>  		   .name = "tsys01",
> +		   .of_match_table = of_match_ptr(tsys01_of_match),
>  		   },
>  };
>  

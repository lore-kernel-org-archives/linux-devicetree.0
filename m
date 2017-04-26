From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] iio: adc: meson-saradc: mark all meson_sar_adc_data
 static and const
Date: Wed, 26 Apr 2017 07:31:28 +0100
Message-ID: <c1dd71e0-8c25-17ac-b113-291ebbdd5972@kernel.org>
References: <20170417182820.26670-1-martin.blumenstingl@googlemail.com>
 <20170417182820.26670-4-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170417182820.26670-4-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GH
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 17/04/17 19:28, Martin Blumenstingl wrote:
> These are only passed as of_device_id.data and never modified. Thus we
> can mark them as static const, just like the of_device_id instances
> where they are used.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Reordering the patches would make this simpler as you'd only have
to do the existing ones.

Not a bit issue though so you could just not bother...

Jonathan
> ---
>  drivers/iio/adc/meson_saradc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index cf13691009ee..8f742b71b165 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -843,31 +843,31 @@ static const struct iio_info meson_sar_adc_iio_info = {
>  	.driver_module = THIS_MODULE,
>  };
>  
> -struct meson_sar_adc_data meson_sar_adc_meson8_data = {
> +static const struct meson_sar_adc_data meson_sar_adc_meson8_data = {
>  	.has_bl30_integration = false,
>  	.resolution = 10,
>  	.name = "meson-meson8b-saradc",
>  };
>  
> -struct meson_sar_adc_data meson_sar_adc_meson8b_data = {
> +static const struct meson_sar_adc_data meson_sar_adc_meson8b_data = {
>  	.has_bl30_integration = false,
>  	.resolution = 10,
>  	.name = "meson-meson8b-saradc",
>  };
>  
> -struct meson_sar_adc_data meson_sar_adc_gxbb_data = {
> +static const struct meson_sar_adc_data meson_sar_adc_gxbb_data = {
>  	.has_bl30_integration = true,
>  	.resolution = 10,
>  	.name = "meson-gxbb-saradc",
>  };
>  
> -struct meson_sar_adc_data meson_sar_adc_gxl_data = {
> +static const struct meson_sar_adc_data meson_sar_adc_gxl_data = {
>  	.has_bl30_integration = true,
>  	.resolution = 12,
>  	.name = "meson-gxl-saradc",
>  };
>  
> -struct meson_sar_adc_data meson_sar_adc_gxm_data = {
> +static const struct meson_sar_adc_data meson_sar_adc_gxm_data = {
>  	.has_bl30_integration = true,
>  	.resolution = 12,
>  	.name = "meson-gxm-saradc",
> 

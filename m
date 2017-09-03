From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: pressure: add support to LPS33HW and LPS35HW
Date: Sun, 3 Sep 2017 17:55:13 +0100
Message-ID: <20170903175513.7f177d2b@archlinux>
References: <20170902173915.17341-1-lorenzo.bianconi@st.com>
        <20170902173915.17341-2-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170902173915.17341-2-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat,  2 Sep 2017 19:39:14 +0200
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> add support to STMicroelectronics LPS33HW and LPS35HW pressure sensors
> to st_pressure framework
> 
> http://www.st.com/resource/en/datasheet/lps33hw.pdf
> http://www.st.com/resource/en/datasheet/lps35hw.pdf
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Thanks,

Jonathan
> ---
>  drivers/iio/pressure/st_pressure.h      |  4 ++++
>  drivers/iio/pressure/st_pressure_core.c |  2 ++
>  drivers/iio/pressure/st_pressure_i2c.c  | 10 ++++++++++
>  drivers/iio/pressure/st_pressure_spi.c  | 10 ++++++++++
>  4 files changed, 26 insertions(+)
> 
> diff --git a/drivers/iio/pressure/st_pressure.h b/drivers/iio/pressure/st_pressure.h
> index 7d995937adba..e67eb0d971bf 100644
> --- a/drivers/iio/pressure/st_pressure.h
> +++ b/drivers/iio/pressure/st_pressure.h
> @@ -19,6 +19,8 @@ enum st_press_type {
>  	LPS25H,
>  	LPS331AP,
>  	LPS22HB,
> +	LPS33HW,
> +	LPS35HW,
>  	ST_PRESS_MAX,
>  };
>  
> @@ -26,6 +28,8 @@ enum st_press_type {
>  #define LPS25H_PRESS_DEV_NAME		"lps25h"
>  #define LPS331AP_PRESS_DEV_NAME		"lps331ap"
>  #define LPS22HB_PRESS_DEV_NAME		"lps22hb"
> +#define LPS33HW_PRESS_DEV_NAME		"lps33hw"
> +#define LPS35HW_PRESS_DEV_NAME		"lps35hw"
>  
>  /**
>   * struct st_sensors_platform_data - default press platform data
> diff --git a/drivers/iio/pressure/st_pressure_core.c b/drivers/iio/pressure/st_pressure_core.c
> index 0c1c092cc157..b8890e37a2d2 100644
> --- a/drivers/iio/pressure/st_pressure_core.c
> +++ b/drivers/iio/pressure/st_pressure_core.c
> @@ -419,6 +419,8 @@ static const struct st_sensor_settings st_press_sensors_settings[] = {
>  		.wai_addr = ST_SENSORS_DEFAULT_WAI_ADDRESS,
>  		.sensors_supported = {
>  			[0] = LPS22HB_PRESS_DEV_NAME,
> +			[1] = LPS33HW_PRESS_DEV_NAME,
> +			[2] = LPS35HW_PRESS_DEV_NAME,
>  		},
>  		.ch = (struct iio_chan_spec *)st_press_lps22hb_channels,
>  		.num_ch = ARRAY_SIZE(st_press_lps22hb_channels),
> diff --git a/drivers/iio/pressure/st_pressure_i2c.c b/drivers/iio/pressure/st_pressure_i2c.c
> index 7f15e927fa2b..fbb59059e942 100644
> --- a/drivers/iio/pressure/st_pressure_i2c.c
> +++ b/drivers/iio/pressure/st_pressure_i2c.c
> @@ -37,6 +37,14 @@ static const struct of_device_id st_press_of_match[] = {
>  		.compatible = "st,lps22hb-press",
>  		.data = LPS22HB_PRESS_DEV_NAME,
>  	},
> +	{
> +		.compatible = "st,lps33hw",
> +		.data = LPS33HW_PRESS_DEV_NAME,
> +	},
> +	{
> +		.compatible = "st,lps35hw",
> +		.data = LPS35HW_PRESS_DEV_NAME,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, st_press_of_match);
> @@ -59,6 +67,8 @@ static const struct i2c_device_id st_press_id_table[] = {
>  	{ LPS25H_PRESS_DEV_NAME,  LPS25H },
>  	{ LPS331AP_PRESS_DEV_NAME, LPS331AP },
>  	{ LPS22HB_PRESS_DEV_NAME, LPS22HB },
> +	{ LPS33HW_PRESS_DEV_NAME, LPS33HW },
> +	{ LPS35HW_PRESS_DEV_NAME, LPS35HW },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(i2c, st_press_id_table);
> diff --git a/drivers/iio/pressure/st_pressure_spi.c b/drivers/iio/pressure/st_pressure_spi.c
> index f5ebd36bb4bf..9a3441b128e7 100644
> --- a/drivers/iio/pressure/st_pressure_spi.c
> +++ b/drivers/iio/pressure/st_pressure_spi.c
> @@ -41,6 +41,14 @@ static const struct of_device_id st_press_of_match[] = {
>  		.compatible = "st,lps22hb-press",
>  		.data = LPS22HB_PRESS_DEV_NAME,
>  	},
> +	{
> +		.compatible = "st,lps33hw",
> +		.data = LPS33HW_PRESS_DEV_NAME,
> +	},
> +	{
> +		.compatible = "st,lps35hw",
> +		.data = LPS35HW_PRESS_DEV_NAME,
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, st_press_of_match);
> @@ -83,6 +91,8 @@ static const struct spi_device_id st_press_id_table[] = {
>  	{ LPS25H_PRESS_DEV_NAME },
>  	{ LPS331AP_PRESS_DEV_NAME },
>  	{ LPS22HB_PRESS_DEV_NAME },
> +	{ LPS33HW_PRESS_DEV_NAME },
> +	{ LPS35HW_PRESS_DEV_NAME },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(spi, st_press_id_table);

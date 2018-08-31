From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 19/30] iio: adc: sun4i-gpadc-iio: rework:
 support nvmem calibration data
Date: Fri, 31 Aug 2018 11:07:22 +0200
Message-ID: <20180831090722.zf65lkozjpozngu5@flea>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-20-embed3d@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vminzmpyj645vdzq"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBTEKUTOAKGQEKWZWTKA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180830154518.29507-20-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vminzmpyj645vdzq
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Aug 30, 2018 at 05:45:07PM +0200, Philipp Rossak wrote:
> This patch reworks the driver to support nvmem calibration cells.
> The driver checks if the nvmem calibration is supported and reads out
> the nvmem.
> 
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/iio/adc/sun4i-gpadc-iio.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
> index 18ab72e52d78..2fd73d143815 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
> @@ -27,6 +27,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> @@ -70,6 +71,7 @@ struct gpadc_data {
>  	bool		has_mod_clk;
>  	u32		temp_data_base;
>  	int		sensor_count;
> +	bool		supports_nvmem;
>  };
>  
>  static irqreturn_t sun4i_gpadc_data_irq_handler(int irq, void *dev_id);
> @@ -146,6 +148,7 @@ struct sun4i_gpadc_iio {
>  	struct clk			*bus_clk;
>  	struct clk			*mod_clk;
>  	struct reset_control		*reset;
> +	u32				calibration_data[2];
>  };
>  
>  static const struct iio_chan_spec sun4i_gpadc_channels[] = {
> @@ -484,6 +487,9 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
>  	struct resource *mem;
>  	void __iomem *base;
>  	int ret;
> +	struct nvmem_cell *cell;
> +	ssize_t cell_size;
> +	u32 *cell_data;
>  
>  	info->data = of_device_get_match_data(&pdev->dev);
>  	if (!info->data)
> @@ -494,6 +500,24 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> +	if (info->data->supports_nvmem) {
> +
> +		cell = nvmem_cell_get(&pdev->dev, "calibration");
> +		if (IS_ERR(cell)) {
> +			if (PTR_ERR(cell) == -EPROBE_DEFER)
> +				return PTR_ERR(cell);

You're masking real errors here, if the issue isn't that the property
isn't found.

> +		} else {
> +			cell_data = (u32 *)nvmem_cell_read(cell, &cell_size);
> +			if (cell_size != 8)
> +				dev_err(&pdev->dev,
> +					"Calibration data has wrong size\n");
> +			else {
> +				info->calibration_data[0] = cell_data[0];
> +				info->calibration_data[1] = cell_data[1];

How are those calibration data organized when there is multiple channels?

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--vminzmpyj645vdzq--

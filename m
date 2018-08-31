From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 17/30] iio: adc: sun4i-gpadc-iio: rework:
 support clocks and reset
Date: Fri, 31 Aug 2018 11:03:07 +0200
Message-ID: <20180831090307.v3bp445sgugquh6f@flea>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-18-embed3d@gmail.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o4ox2v23labjh637"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBTMIUTOAKGQE7SMC4GI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180830154518.29507-18-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--o4ox2v23labjh637
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Aug 30, 2018 at 05:45:05PM +0200, Philipp Rossak wrote:
> For adding newer sensor some basic rework of the code is necessary.
> 
> The SoCs after H3 has newer thermal sensor ADCs, which have two clock
> inputs (bus clock and sampling clock) and a reset. The registers are
> also re-arranged.
> 
> This commit reworks the code, adds the process of the clocks and resets.
> 
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/iio/adc/sun4i-gpadc-iio.c | 72 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 70 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
> index c278e165e161..c12de48c4e86 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
> @@ -22,6 +22,7 @@
>   * shutdown for not being used.
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/completion.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -31,6 +32,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> +#include <linux/reset.h>
>  #include <linux/thermal.h>
>  #include <linux/delay.h>
>  
> @@ -63,6 +65,9 @@ struct gpadc_data {
>  	int		(*ths_suspend)(struct sun4i_gpadc_iio *info);
>  	int		(*ths_resume)(struct sun4i_gpadc_iio *info);
>  	bool		support_irq;
> +	bool		has_bus_clk;
> +	bool		has_bus_rst;
> +	bool		has_mod_clk;
>  	u32		temp_data_base;
>  };
>  
> @@ -127,6 +132,9 @@ struct sun4i_gpadc_iio {
>  	struct mutex			mutex;
>  	struct thermal_zone_device	*tzd;
>  	struct device			*sensor_device;
> +	struct clk			*bus_clk;
> +	struct clk			*mod_clk;
> +	struct reset_control		*reset;
>  };
>  
>  static const struct iio_chan_spec sun4i_gpadc_channels[] = {
> @@ -472,8 +480,13 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -	info->regmap = devm_regmap_init_mmio(&pdev->dev, base,
> -					     &sun4i_gpadc_regmap_config);
> +	if (info->data->has_bus_clk)
> +		info->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "bus",
> +				base, &sun4i_gpadc_regmap_config);
> +	else
> +		info->regmap = devm_regmap_init_mmio(&pdev->dev, base,
> +				&sun4i_gpadc_regmap_config);
> +
>  	if (IS_ERR(info->regmap)) {
>  		ret = PTR_ERR(info->regmap);
>  		dev_err(&pdev->dev, "failed to init regmap: %d\n", ret);
> @@ -498,9 +511,58 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
>  		}
>  	}
>  
> +	if (info->data->has_bus_rst) {
> +		info->reset = devm_reset_control_get(&pdev->dev, NULL);
> +		if (IS_ERR(info->reset)) {
> +			ret = PTR_ERR(info->reset);
> +			return ret;
> +		}
> +
> +		ret = reset_control_deassert(info->reset);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (info->data->has_bus_clk) {
> +		info->bus_clk = devm_clk_get(&pdev->dev, "bus");
> +		if (IS_ERR(info->bus_clk)) {
> +			ret = PTR_ERR(info->bus_clk);
> +			goto assert_reset;
> +		}
> +
> +		ret = clk_prepare_enable(info->bus_clk);
> +		if (ret)
> +			goto assert_reset;

That should be done in the runtime_resume hook

> +	}
> +
> +	if (info->data->has_mod_clk) {
> +		info->mod_clk = devm_clk_get(&pdev->dev, "mod");
> +		if (IS_ERR(info->mod_clk)) {
> +			ret = PTR_ERR(info->mod_clk);
> +			goto disable_bus_clk;
> +		}
> +
> +		/* Running at 4MHz */
> +		ret = clk_set_rate(info->mod_clk, 4000000);
> +		if (ret)
> +			goto disable_bus_clk;

Why?

> +		ret = clk_prepare_enable(info->mod_clk);
> +		if (ret)
> +			goto disable_bus_clk;
> +	}
> +
>  	info->sensor_device = &pdev->dev;
>  
>  	return 0;
> +
> +disable_bus_clk:
> +	clk_disable_unprepare(info->bus_clk);
> +
> +assert_reset:
> +	reset_control_assert(info->reset);

You should check for the variables here before calling those
functions, if you end up here with your variable not set, you'll have
improper refcounting.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--o4ox2v23labjh637--

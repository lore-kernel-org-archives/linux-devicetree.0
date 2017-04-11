From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 7/8] mfd: tps6105x: Add OF device ID table
Date: Tue, 11 Apr 2017 14:57:01 +0100
Message-ID: <20170411135701.2x7umkdt6azprpia@dell>
References: <20170404153036.6651-1-javier@osg.samsung.com>
 <20170404153036.6651-8-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170404153036.6651-8-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 04 Apr 2017, Javier Martinez Canillas wrote:

> The driver doesn't have a struct of_device_id table but supported devices
> are registered via Device Trees. This is working on the assumption that a
> I2C device registered via OF will always match a legacy I2C device ID and
> that the MODALIAS reported will always be of the form i2c:<device>.
> 
> But this could change in the future so the correct approach is to have a
> OF device ID table if the devices are registered via OF.
> 
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> 
> ---
> 
> Changes in v4: None
> Changes in v3:
> - Add a vendor prefix to the compatible string (Rob Herring).
> 
> Changes in v2:
> - Don't use of_match_ptr() to avoid build warning when CONFIG_OF is disabled.
> 
>  drivers/mfd/tps6105x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
  
> diff --git a/drivers/mfd/tps6105x.c b/drivers/mfd/tps6105x.c
> index baa12ea666fb..187848c93779 100644
> --- a/drivers/mfd/tps6105x.c
> +++ b/drivers/mfd/tps6105x.c
> @@ -173,9 +173,17 @@ static const struct i2c_device_id tps6105x_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, tps6105x_id);
>  
> +static const struct of_device_id tps6105x_of_match[] = {
> +	{ .compatible = "ti,tps61050" },
> +	{ .compatible = "ti,tps61052" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, tps6105x_of_match);
> +
>  static struct i2c_driver tps6105x_driver = {
>  	.driver = {
>  		.name	= "tps6105x",
> +		.of_match_table = tps6105x_of_match,
>  	},
>  	.probe		= tps6105x_probe,
>  	.remove		= tps6105x_remove,

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

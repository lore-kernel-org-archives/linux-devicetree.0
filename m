From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/2] s5p-tv: Add initial DT-support for HDMIPHY
Date: Sun, 18 Mar 2012 18:24:58 +0000
Message-ID: <20120318182458.9CCC43E07BF@localhost>
References: <1331912532-7798-1-git-send-email-k.lewandowsk@samsung.com> <1331912532-7798-3-git-send-email-k.lewandowsk@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1331912532-7798-3-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: t.stanislaws@samsung.com
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, thomas.abraham@linaro.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>
List-Id: devicetree@vger.kernel.org

On Fri, 16 Mar 2012 16:42:12 +0100, Karol Lewandowski <k.lewandowsk@samsung.com> wrote:
> Make it possible to instantiate driver from device tree description.
> 
> Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  drivers/media/video/s5p-tv/hdmiphy_drv.c |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/media/video/s5p-tv/hdmiphy_drv.c b/drivers/media/video/s5p-tv/hdmiphy_drv.c
> index 6693f4a..ddf3008 100644
> --- a/drivers/media/video/s5p-tv/hdmiphy_drv.c
> +++ b/drivers/media/video/s5p-tv/hdmiphy_drv.c
> @@ -18,6 +18,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/err.h>
> +#include <linux/of.h>
>  
>  #include <media/v4l2-subdev.h>
>  
> @@ -165,10 +166,19 @@ static const struct i2c_device_id hdmiphy_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, hdmiphy_id);
>  
> +#ifdef CONFIG_OF
> +static struct of_device_id hdmiphy_dt_match[] = {
> +	{ .compatible = "samsung,s5pv210-hdmiphy" },

Ditto here; needs to be listed in documentation.

g.

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, hdmiphy_dt_match);
> +#endif
> +
>  static struct i2c_driver hdmiphy_driver = {
>  	.driver = {
>  		.name	= "s5p-hdmiphy",
>  		.owner	= THIS_MODULE,
> +		.of_match_table = of_match_ptr(hdmiphy_dt_match),
>  	},
>  	.probe		= hdmiphy_probe,
>  	.remove		= __devexit_p(hdmiphy_remove),
> -- 
> 1.7.9
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies,Ltd.

From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/2] s5p-tv: Add initial DT-support for TV mixer
Date: Sun, 18 Mar 2012 18:24:25 +0000
Message-ID: <20120318182425.517BF3E07BF@localhost>
References: <1331912532-7798-1-git-send-email-k.lewandowsk@samsung.com> <1331912532-7798-2-git-send-email-k.lewandowsk@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1331912532-7798-2-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: t.stanislaws@samsung.com
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, thomas.abraham@linaro.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>
List-Id: devicetree@vger.kernel.org

On Fri, 16 Mar 2012 16:42:11 +0100, Karol Lewandowski <k.lewandowsk@samsung.com> wrote:
> Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/media/video/s5p-tv/mixer_drv.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/media/video/s5p-tv/mixer_drv.c b/drivers/media/video/s5p-tv/mixer_drv.c
> index 0064309..2eb48ea 100644
> --- a/drivers/media/video/s5p-tv/mixer_drv.c
> +++ b/drivers/media/video/s5p-tv/mixer_drv.c
> @@ -448,6 +448,14 @@ static int __devexit mxr_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id mxr_dt_match[] = {
> +	{ .compatible = "samsung,s5pv210-tvmixer" },

Need to add this new compatible string to
Documentation/devicetree/bindings.

Otherwise looks good.

g.

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, mxr_dt_match);
> +#endif
> +
>  static struct platform_driver mxr_driver __refdata = {
>  	.probe = mxr_probe,
>  	.remove = __devexit_p(mxr_remove),
> @@ -455,6 +463,7 @@ static struct platform_driver mxr_driver __refdata = {
>  		.name = MXR_DRIVER_NAME,
>  		.owner = THIS_MODULE,
>  		.pm = &mxr_pm_ops,
> +		.of_match_table = of_match_ptr(mxr_dt_match),
>  	}
>  };
>  
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

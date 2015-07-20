From: Alexander Stein <alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org>
Subject: Re: [PATCH v10 1/5] drm/layerscape: Add Freescale DCU DRM driver
Date: Mon, 20 Jul 2015 09:18:16 +0200
Message-ID: <2160582.6fH0nmeH2v@ws-stein>
References: <1437129543-8037-1-git-send-email-jianwei.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437129543-8037-1-git-send-email-jianwei.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jianwei Wang <jianwei.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Wang <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xiubo Li <lixiubo-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 17 July 2015 18:38:59, Jianwei Wang wrote:
> [...]
> +static const struct regmap_config fsl_dcu_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +};

This defaults to REGCACHE_NONE which in the end sets regmap.cache_only = true.

> [...]
> +#ifdef CONFIG_PM_SLEEP
> +static int fsl_dcu_drm_pm_suspend(struct device *dev)
> +{
> +	struct fsl_dcu_drm_device *fsl_dev = dev_get_drvdata(dev);
> +
> +	if (!fsl_dev)
> +		return 0;
> +
> +	drm_kms_helper_poll_disable(fsl_dev->drm);
> +	regcache_cache_only(fsl_dev->regmap, true);

This should raise a warning (see http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/base/regmap/regcache.c#n472) as map->cache_bypass is set because of REGCACHE_NONE.
I think you set the cache_type to REGCACHE_FLAT, but neither _LZO or _RBTREE (see https://lkml.org/lkml/2015/7/16/552 for that)

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-11xx
Fax:    +49 (0) 0) 3765 38600-41xx
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

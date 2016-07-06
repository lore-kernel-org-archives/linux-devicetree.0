From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 2/4] soc: mediatek: Init MT8173 scpsys driver earlier
Date: Wed, 6 Jul 2016 13:22:20 +0800
Message-ID: <1467782540.26485.11.camel@mtksdaap41>
References: <1463390894-32062-1-git-send-email-jamesjj.liao@mediatek.com>
	 <1463390894-32062-3-git-send-email-jamesjj.liao@mediatek.com>
	 <34025ec4-19d3-8b25-d669-50c6f19159cd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <34025ec4-19d3-8b25-d669-50c6f19159cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 2016-07-02 at 18:35 +0200, Matthias Brugger wrote:
> 
> On 05/16/2016 11:28 AM, James Liao wrote:
> > Some power domain comsumers may init before module_init.
> > So the power domain provider (scpsys) need to be initialized
> > earlier too.
> >
> > Take an example for our IOMMU (M4U) and SMI. SMI is a bridge
> > between IOMMU and multimedia HW. SMI is responsible to
> > enable/disable iommu and help transfer data for each multimedia
> > HW. Both of them have to wait until the power and clocks are
> > enabled.
> >
> > So scpsys driver should be initialized before SMI, and SMI should
> > be initialized before IOMMU, and then init IOMMU consumers
> > (display/vdec/venc/camera etc.).
> >
> > IOMMU is subsys_init by default. So we need to init scpsys driver
> > before subsys_init.
> >
> > Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Reviewed-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > ---
> >  drivers/soc/mediatek/mtk-scpsys.c | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > index 5870a24..00c0adb 100644
> > --- a/drivers/soc/mediatek/mtk-scpsys.c
> > +++ b/drivers/soc/mediatek/mtk-scpsys.c
> > @@ -617,4 +617,21 @@ static struct platform_driver scpsys_drv = {
> >  		.of_match_table = of_match_ptr(of_scpsys_match_tbl),
> >  	},
> >  };
> > -builtin_platform_driver(scpsys_drv);
> > +
> > +static int __init scpsys_drv_init(void)
> > +{
> > +	return platform_driver_register(&scpsys_drv);
> > +}
> > +
> > +/*
> > + * There are some Mediatek drivers which depend on the power domain driver need
> > + * to probe in earlier initcall levels. So scpsys driver also need to probe
> > + * earlier.
> > + *
> > + * IOMMU(M4U) and SMI drivers for example. SMI is a bridge between IOMMU and
> > + * multimedia HW. IOMMU depends on SMI, and SMI is a power domain consumer,
> > + * so the proper probe sequence should be scpsys -> SMI -> IOMMU driver.
> > + * IOMMU drivers are initialized during subsys_init by default, so we need to
> > + * move SMI and scpsys drivers to subsys_init or earlier init levels.
> > + */
> > +subsys_initcall(scpsys_drv_init);
> >
> 
> Can't we achieve this with probe deferring? I'm not really keen on 
> coding the order of the different drivers like this.

Hi Matthias,

Some drivers such as IOMMU don't support probe deferring. So scpsys need
to init before them by changing init level.


Best regards,

James


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

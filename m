From: Honghui Zhang <honghui.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v9 2/4] soc: mediatek: Init MT8173 scpsys driver earlier
Date: Tue, 15 Nov 2016 18:45:08 +0800
Message-ID: <1479206708.28796.9.camel@mtksdaap41>
References: <1476953798-23263-1-git-send-email-jamesjj.liao@mediatek.com>
         <1476953798-23263-3-git-send-email-jamesjj.liao@mediatek.com>
         <14a1ebb2-fda2-278b-b2f0-8f9c6ff6a83d@gmail.com>
         <1477879702.6649.4.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477879702.6649.4.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2016-10-31 at 10:08 +0800, James Liao wrote:
> On Mon, 2016-10-31 at 01:08 +0100, Matthias Brugger wrote:
> > Hi James,
> > 
> > On 10/20/2016 10:56 AM, James Liao wrote:
> > > Some power domain comsumers may init before module_init.
> > > So the power domain provider (scpsys) need to be initialized
> > > earlier too.
> > >
> > > Take an example for our IOMMU (M4U) and SMI. SMI is a bridge
> > > between IOMMU and multimedia HW. SMI is responsible to
> > > enable/disable iommu and help transfer data for each multimedia
> > > HW. Both of them have to wait until the power and clocks are
> > > enabled.
> > >
> > > So scpsys driver should be initialized before SMI, and SMI should
> > > be initialized before IOMMU, and then init IOMMU consumers
> > > (display/vdec/venc/camera etc.).
> > >
> > > IOMMU is subsys_init by default. So we need to init scpsys driver
> > > before subsys_init.
> > >
> > > Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > > Reviewed-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> > > ---
> > 
> > I didn't applied this patch for now.
> > I answered you in v7 of this series [1]. I would prefer to see if we can 
> > fix that otherwise.
> > 
> > Would be great if you or Yong could provide some feedback.
> > 

Hi, Matthias,
  Yong had verified your propose and it seems didn't work[1].
But I'm looking at the recently merged device link patches[2], it maybe
could help with the probe sequence issue.

If we set the iommu client as the smi larb's device consumer of
device_link with the DL_DEV_PROBING flags, it will be wait for smi
larb's probe done. But I'm not test that solution yet, need to do a bit
more test to verify this.

thanks.

[1]
https://lists.linuxfoundation.org/pipermail/iommu/2016-July/018034.html
[2]https://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1261311.html

> > Thanks,
> > Matthias
> > 
> > [1] https://patchwork.kernel.org/patch/9397405/
> > 
> > >  drivers/soc/mediatek/mtk-scpsys.c | 19 ++++++++++++++++++-
> > >  1 file changed, 18 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > > index fa9ee69..dd7a07d 100644
> > > --- a/drivers/soc/mediatek/mtk-scpsys.c
> > > +++ b/drivers/soc/mediatek/mtk-scpsys.c
> > > @@ -613,4 +613,21 @@ static int scpsys_probe(struct platform_device *pdev)
> > >  		.of_match_table = of_match_ptr(of_scpsys_match_tbl),
> > >  	},

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

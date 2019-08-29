From: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v4, 12/33] drm/mediatek: split DISP_REG_CONFIG_DSI_SEL
 setting into another use case
Date: Thu, 29 Aug 2019 20:39:27 +0800
Message-ID: <1567082367.30648.2.camel@mhfsdcap03>
References: <1562625253-29254-1-git-send-email-yongqiang.niu@mediatek.com>
         <1562625253-29254-13-git-send-email-yongqiang.niu@mediatek.com>
         <1563341736.29169.15.camel@mtksdaap41>
Reply-To: <yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563341736.29169.15.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: CK Hu <ck.hu@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, 2019-07-17 at 13:35 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> On Tue, 2019-07-09 at 06:33 +0800, yongqiang.niu@mediatek.com wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > 
> > Here is two modifition in this patch:
> > 1.bls->dpi0 and rdma1->dsi are differen usecase,
> > Split DISP_REG_CONFIG_DSI_SEL setting into anther usecase
> > 2.remove DISP_REG_CONFIG_DPI_SEL setting, DPI_SEL_IN_BLS is 0 and
> > this is same with hardware defautl setting,
> > 
> 
> You move 2 register setting out of the path from BLS to DPI0, does this
> path still work? Please make sure that all modification could work on
> all supported SoC.
> 
> Regards,
> CK
> 

DPI_SEL_IN_BLS is 0 and this is same with hardware default setting as
description in patch.
the removed sentence is useless.


> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > index d015c1a..47b3e35 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> > @@ -400,10 +400,9 @@ static void mtk_ddp_sout_sel(void __iomem *config_regs,
> >  	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
> >  		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
> >  			       config_regs + DISP_REG_CONFIG_OUT_SEL);
> > +	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
> >  		writel_relaxed(DSI_SEL_IN_RDMA,
> >  			       config_regs + DISP_REG_CONFIG_DSI_SEL);
> > -		writel_relaxed(DPI_SEL_IN_BLS,
> > -			       config_regs + DISP_REG_CONFIG_DPI_SEL);
> >  	}
> >  }
> >  
> 
> 

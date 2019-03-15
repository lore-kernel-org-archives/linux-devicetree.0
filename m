From: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH 10/18] drm/mediatek: add gmc_bits for ovl private data
Date: Fri, 15 Mar 2019 10:34:12 +0800
Message-ID: <1552617252.31200.24.camel@mhfsdcap03>
References: <1545638931-24938-1-git-send-email-yongqiang.niu@mediatek.com>
 <1545638931-24938-11-git-send-email-yongqiang.niu@mediatek.com>
 <CANMq1KC_JwVfvFd46_gP_wK_QNO0LTZOcwRAbotF6MghYivJYw@mail.gmail.com>
Reply-To: yongqiang.niu@mediatek.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CANMq1KC_JwVfvFd46_gP_wK_QNO0LTZOcwRAbotF6MghYivJYw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2018-12-25 at 12:15 +0800, Nicolas Boichat wrote:
> On Mon, Dec 24, 2018 at 6:53 PM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
> >
> > This patch add gmc_bits for ovl private data
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 23 +++++++++++++++++++++--
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > index 28d1911..afb313c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -39,7 +39,9 @@
> >  #define DISP_REG_OVL_ADDR_MT8173               0x0f40
> >  #define DISP_REG_OVL_ADDR(ovl, n)              ((ovl)->data->addr + 0x20 * (n))
> >
> > -#define        OVL_RDMA_MEM_GMC        0x40402020
> > +#define GMC_THRESHOLD_BITS     16
> > +#define GMC_THRESHOLD_HIGH     ((1 << GMC_THRESHOLD_BITS) / 4)
> > +#define GMC_THRESHOLD_LOW      ((1 << GMC_THRESHOLD_BITS) / 8)
> >
> >  #define OVL_CON_BYTE_SWAP      BIT(24)
> >  #define OVL_CON_MTX_YUV_TO_RGB (6 << 16)
> > @@ -57,6 +59,7 @@
> >
> >  struct mtk_disp_ovl_data {
> >         unsigned int addr;
> > +       unsigned int gmc_bits;
> >         bool fmt_rgb565_is_0;
> >  };
> >
> > @@ -140,9 +143,23 @@ static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
> >  static void mtk_ovl_layer_on(struct mtk_ddp_comp *comp, unsigned int idx)
> >  {
> >         unsigned int reg;
> > +       unsigned int gmc_thrshd_l;
> > +       unsigned int gmc_thrshd_h;
> > +       unsigned int gmc_value;
> > +       struct mtk_disp_ovl *ovl = comp_to_ovl(comp);
> >
> >         writel(0x1, comp->regs + DISP_REG_OVL_RDMA_CTRL(idx));
> > -       writel(OVL_RDMA_MEM_GMC, comp->regs + DISP_REG_OVL_RDMA_GMC(idx));
> > +
> > +       gmc_thrshd_l = GMC_THRESHOLD_LOW >>
> > +                     (GMC_THRESHOLD_BITS - ovl->data->gmc_bits);
> > +       gmc_thrshd_h = GMC_THRESHOLD_HIGH >>
> > +                     (GMC_THRESHOLD_BITS - ovl->data->gmc_bits);
> > +       if (ovl->data->gmc_bits == 10)
> > +               gmc_value = gmc_thrshd_h | gmc_thrshd_h << 16;
> 
> I don't really get what this does, but is it intentional that you
> don't use gmc_thrshd_l here?
> 
GMC register was set RDMA ultra and pre-ultra threshold.
MT8183 GMC register define is different with other SOC, gmc_thrshd_l not
used here.

> Also, if you only ever use 8 or 10 bits gmc, maybe it's easier to
> hard-code the 2 values?
> if (ovl->data->gmc_bits == 10)
>   gmc_value = OVL_RDMA_MEM_GMC_10BIT;
> else
>   gmc_value = OVL_RDMA_MEM_GMC_8BIT; //0x40402020
> 

our internal maintainer prefer calculate GMC setting with private data
gmc bit instead of hard-core.
and with calculation function that will be more flexible 

> > +       else
> > +               gmc_value = gmc_thrshd_l | gmc_thrshd_l << 8 |
> > +                           gmc_thrshd_h << 16 | gmc_thrshd_h << 24;
> > +       writel(gmc_value, comp->regs + DISP_REG_OVL_RDMA_GMC(idx));
> >
> >         reg = readl(comp->regs + DISP_REG_OVL_SRC_CON);
> >         reg = reg | BIT(idx);
> > @@ -324,11 +341,13 @@ static int mtk_disp_ovl_remove(struct platform_device *pdev)
> >
> >  static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
> >         .addr = DISP_REG_OVL_ADDR_MT2701,
> > +       .gmc_bits = 8,
> >         .fmt_rgb565_is_0 = false,
> >  };
> >
> >  static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
> >         .addr = DISP_REG_OVL_ADDR_MT8173,
> > +       .gmc_bits = 8,
> >         .fmt_rgb565_is_0 = true,
> >  };
> >
> > --
> > 1.8.1.1.dirty
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

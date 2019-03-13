From: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [RESEND PATCH v1, 00/18] add drm support for MT8183
Date: Wed, 13 Mar 2019 18:49:08 +0800
Message-ID: <CANMq1KC31g7=NiW2zHLxqv9yH7a11qRLdieSyoES446ZJxi8Sw@mail.gmail.com>
References: <1552465563-6940-1-git-send-email-yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552465563-6940-1-git-send-email-yongqiang.niu@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 13, 2019 at 4:53 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> This series are based on 4.20-rc1 and provide 18 patches to
> support mediatek SOC MT8183

v1 (https://patchwork.freedesktop.org/series/54451/#rev1) had a large
number of comments, and I don't think you addressed any of them here?
Can you please do so before resending?

> Yongqiang Niu (18):
>   drm/mediatek: update dt-bindings for mt8183
>   drm/mediatek: add mutex mod and sof into ddp private data
>   drm/mediatek: redefine mtk_ddp_sout_sel
>   drm/mediatek: move rdma sout from mtk_ddp_mout_en into
>     mtk_ddp_sout_sel
>   drm/mediatek: add ddp component CCORR
>   drm/mediatek: add mmsys private data for ddp path config
>   drm/mediatek: add commponent OVL0_2L
>   drm/mediatek: add component OVL1_2L
>   drm/mediatek: add component DITHER
>   drm/mediatek: add gmc_bits for ovl private data
>   drm/medaitek: add layer_nr for ovl private data
>   drm/mediatek: add function to connect module with it's previous one
>   drm/mediatek: add ddp write register common api
>   drm/mediatek: add connect function for ovl
>   drm/mediatek: add RDMA1 fifo size into RDMA private data
>   drm/mediatek: add function mtk_ddp_comp_get_type
>   drm/mediatek: add ovl0/ovl0_2l usecase
>   drm/mediatek: add support for mediatek SOC MT8183
>
>  .../bindings/display/mediatek/mediatek,disp.txt    |  11 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  64 ++-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  23 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  42 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 458 ++++++++++++++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |  11 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 100 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  24 ++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  55 +++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   4 +
>  10 files changed, 688 insertions(+), 104 deletions(-)
>
> --
> 1.8.1.1.dirty
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

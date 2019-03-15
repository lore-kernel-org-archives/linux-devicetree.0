From: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [RESEND PATCH v1 00/18] add drm support for MT8183
Date: Fri, 15 Mar 2019 09:37:25 +0800
Message-ID: <1552613845.31200.7.camel@mhfsdcap03>
References: <1552565120-24329-1-git-send-email-yongqiang.niu@mediatek.com>
         <c6859dd1-5689-d64d-69cd-5996eb0abea8@gmail.com>
Reply-To: <yongqiang.niu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c6859dd1-5689-d64d-69cd-5996eb0abea8@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: ck.hu@mediatek.com, p.zabel@pengutronix.de, robh+dt@kernel.org, airlied@linux.ie, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bibby.Hsieh@mediatek.com, yt.shen@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, 2019-03-14 at 18:35 +0100, Matthias Brugger wrote:
> 
> On 14/03/2019 13:05, yongqiang.niu@mediatek.com wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > 
> > This series are based on 4.20-rc1 and provide 18 patches to
> > support mediatek SOC MT8183
> > Resend first version 
> > 
> 
> I think you send the very same series several times yesterday. Please check your
> config and make sure that you don't send a series more then once. If for any
> reason you have to resend the series then please specify in the cover letter why
> you resend it.
> 
> Reviewing series can take a while, be patient. If nobody reacts to your series
> you can send a reminder email (best if you just hit reply-all on the cover
> letter) asking kindly for review. Sending out the same series on a daily or
> hourly basis will most probably lead to confusion, as people don't know which
> version is the "good" one. In the end it has the contrary affect from what you
> want to achieve (getting someone to review your series).
> 
> Regards,
> Matthias
> 

sorry for the confusion.

there was some problem with my upstream account setting yesterday, the
first several letters was rejected by
"linux-arm-kernel@lists.infradead.org" and "devicetree@vger.kernel.org".

after the problem was fixed, i have resent the last one, which include
the key world "Resend first version".


> > Yongqiang Niu (18):
> >   drm/mediatek: update dt-bindings for mt8183
> >   drm/mediatek: add mutex mod and sof into ddp private data
> >   drm/mediatek: redefine mtk_ddp_sout_sel
> >   drm/mediatek: move rdma sout from mtk_ddp_mout_en into
> >     mtk_ddp_sout_sel
> >   drm/mediatek: add ddp component CCORR
> >   drm/mediatek: add mmsys private data for ddp path config
> >   drm/mediatek: add commponent OVL0_2L
> >   drm/mediatek: add component OVL1_2L
> >   drm/mediatek: add component DITHER
> >   drm/mediatek: add gmc_bits for ovl private data
> >   drm/medaitek: add layer_nr for ovl private data
> >   drm/mediatek: add function to connect module with it's previous one
> >   drm/mediatek: add ddp write register common api
> >   drm/mediatek: add connect function for ovl
> >   drm/mediatek: add RDMA1 fifo size into RDMA private data
> >   drm/mediatek: add function mtk_ddp_comp_get_type
> >   drm/mediatek: add ovl0/ovl0_2l usecase
> >   drm/mediatek: add support for mediatek SOC MT8183
> > 
> >  .../bindings/display/mediatek/mediatek,disp.txt    |  11 +-
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  64 ++-
> >  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  23 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  42 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp.c             | 458 ++++++++++++++++-----
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |  11 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 100 +++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  24 ++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  55 +++
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   4 +
> >  10 files changed, 688 insertions(+), 104 deletions(-)
> > 

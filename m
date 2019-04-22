From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH,v1] media: mtk-vcodec: fix vp9 content playback error with
 show exist frame
Date: Mon, 22 Apr 2019 15:44:27 +0900
Message-ID: <CAAFQd5CUL=yE2-igsAPrt42DWW=4Xjzcyb_8zGWHRtiC5Acs6g@mail.gmail.com>
References: <1554106718-23107-1-git-send-email-maoguang.meng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554106718-23107-1-git-send-email-maoguang.meng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maoguang.meng@mediatek.com
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, gtk_ruiwang@mediatek.com, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 1, 2019 at 5:19 PM <maoguang.meng@mediatek.com> wrote:
>
> From: Maoguang Meng <maoguang.meng@mediatek.com>
>
> Update referenced frame buffer's reference count when playing vp9
> content which has show_existing_frame flag, and copy enough buffer
> data to current shown frame.
>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> ---
>  .../media/platform/mtk-vcodec/vdec/vdec_vp9_if.c   |   16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> index bc8349b..d950837 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_if.c
> @@ -481,15 +481,15 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
>                  */
>                 if ((frm_to_show->fb != NULL) &&
>                         (inst->cur_fb->base_y.size >=
> -                       frm_to_show->fb->base_y.size)) {
> +                       frm_to_show->fb->base_y.size) &&
> +                       (inst->cur_fb->base_c.size >=
> +                       frm_to_show->fb->base_c.size)) {
>                         memcpy((void *)inst->cur_fb->base_y.va,
>                                 (void *)frm_to_show->fb->base_y.va,
> -                               vsi->buf_w *
> -                               vsi->buf_h);
> +                               frm_to_show->fb->base_y.size);
>                         memcpy((void *)inst->cur_fb->base_c.va,
>                                 (void *)frm_to_show->fb->base_c.va,
> -                               vsi->buf_w *
> -                               vsi->buf_h / 2);
> +                               frm_to_show->fb->base_c.size);
>                 } else {
>                         /* After resolution change case, current CAPTURE buffer
>                          * may have less buffer size than frm_to_show buffer
> @@ -895,7 +895,7 @@ static int vdec_vp9_decode(unsigned long h_vdec, struct mtk_vcodec_mem *bs,
>
>                 if (vsi->resolution_changed) {
>                         if (!vp9_alloc_work_buf(inst)) {
> -                               ret = -EINVAL;
> +                               ret = -EIO;
>                                 goto DECODE_ERROR;
>                         }
>                 }
> @@ -924,14 +924,12 @@ static int vdec_vp9_decode(unsigned long h_vdec, struct mtk_vcodec_mem *bs,
>
>                 if (vsi->show_existing_frame && (vsi->frm_to_show_idx <
>                                         VP9_MAX_FRM_BUF_NUM)) {
> -                       mtk_vcodec_err(inst,
> +                       mtk_vcodec_debug(inst,
>                                 "Skip Decode drv->new_fb_idx=%d, drv->frm_to_show_idx=%d",
>                                 vsi->new_fb_idx, vsi->frm_to_show_idx);
>
>                         vp9_ref_cnt_fb(inst, &vsi->new_fb_idx,
>                                         vsi->frm_to_show_idx);
> -                       ret = -EINVAL;
> -                       goto DECODE_ERROR;
>                 }
>
>                 /* VPU assign the buffer pointer in its address space,
> --
> 1.7.9.5
>

Thanks for the patch!

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

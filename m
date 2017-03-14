From: =?UTF-8?B?V3UtQ2hlbmcgTGkgKOadjuWLmeiqoCk=?= <wuchengli-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] media: mtk-jpeg: fix continuous log "Context is NULL"
Date: Tue, 14 Mar 2017 23:24:05 +0800
Message-ID: <CAOMLVLiQRiVgNr+UB=DiSuhjFtgphBgLSp4Q72Y_L9Gs8BqDww@mail.gmail.com>
References: <1489501282-52137-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1489501282-52137-1-git-send-email-minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Bin Liu <bin.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rick Chang <rick.chang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 14, 2017 at 10:21 PM, Minghsiu Tsai
<minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> The symptom is continuous log "mtk-jpeg 18004000.jpegdec: Context is NULL"
> in kernel log. It is becauese the error handling in irq doesn't clear
> interrupt.
>
> The calling flow like as below when issue happen
> mtk_jpeg_device_run()
> mtk_jpeg_job_abort()
>   v4l2_m2m_job_finish() -> m2m_dev->curr_ctx = NULL;
> mtk_jpeg_dec_irq()
>   v4l2_m2m_get_curr_priv()
>      -> m2m_dev->curr_ctx == NULL
>      -> return NULL
> log "Context is NULL"
>
> There is race condition between job_abort() and irq. In order to simplify
> code, don't want to add extra flag to maintain state, empty job_abort() and
> clear interrupt before v4l2_m2m_get_curr_priv() in irq.
>
> Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Reviewed-by: Wu-Cheng Li <wuchengli-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Wu-Cheng Li <wuchengli-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index b10183f..c02bc7f 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -862,15 +862,6 @@ static int mtk_jpeg_job_ready(void *priv)
>
>  static void mtk_jpeg_job_abort(void *priv)
>  {
> -       struct mtk_jpeg_ctx *ctx = priv;
> -       struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> -       struct vb2_buffer *src_buf, *dst_buf;
> -
> -       src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> -       dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> -       v4l2_m2m_buf_done(to_vb2_v4l2_buffer(src_buf), VB2_BUF_STATE_ERROR);
> -       v4l2_m2m_buf_done(to_vb2_v4l2_buffer(dst_buf), VB2_BUF_STATE_ERROR);
> -       v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>  }
>
>  static struct v4l2_m2m_ops mtk_jpeg_m2m_ops = {
> @@ -941,6 +932,8 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
>         u32 dec_ret;
>         int i;
>
> +       dec_ret = mtk_jpeg_dec_get_int_status(jpeg->dec_reg_base);
> +       dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
>         ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
>         if (!ctx) {
>                 v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
> @@ -951,9 +944,6 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
>         dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>         jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(src_buf);
>
> -       dec_ret = mtk_jpeg_dec_get_int_status(jpeg->dec_reg_base);
> -       dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
> -
>         if (dec_irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
>                 mtk_jpeg_dec_reset(jpeg->dec_reg_base);
>
> --
> 1.9.1
>

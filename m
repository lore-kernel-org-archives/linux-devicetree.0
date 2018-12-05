From: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v11 4/4] media: add Rockchip VPU JPEG encoder driver
Date: Wed, 05 Dec 2018 13:04:03 -0300
Message-ID: <92f2751675e0f2be95cbf8bb1181a2c92437daed.camel@collabora.com>
References: <20181130173433.24185-1-ezequiel@collabora.com>
 <20181130173433.24185-5-ezequiel@collabora.com>
 <07aed803-0e2f-c7c1-7f1c-752b82ffad7c@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <07aed803-0e2f-c7c1-7f1c-752b82ffad7c-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Dufresne <nicolas.dufresne-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Miouyouyou <myy-tmjzNUIc0P1+EYZtW95mkQ@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Wed, 2018-12-05 at 16:01 +0100, Hans Verkuil wrote:
> On 11/30/18 18:34, Ezequiel Garcia wrote:
> > Add a mem2mem driver for the VPU available on Rockchip SoCs.
> > Currently only JPEG encoding is supported, for RK3399 and RK3288
> > platforms.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > ---
> 
> <snip>
> 
[..]
> 
> 
> Unless something unexpected happens, then v12 should be the final
> version and I'll make a pull request for it. Note that it will
> probably won't make 4.20, unless you manage to do it within the next
> hour :-)
> 

Thanks for the review. Here are the changes that will be on v12.

Besides your feedback, I found a missing parenthesis issue,
which seems to have sneaked into v11! Apparently, v11 had
last minute changes and I failed to run v4l2-compliance.  

diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
index f2752a0c71c0..962412c79b91 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_drv.c
@@ -60,11 +60,13 @@ static void rockchip_vpu_job_finish(struct rockchip_vpu_dev *vpu,
 	dst->sequence = ctx->sequence_cap++;
 
 	dst->field = src->field;
-	if (dst->flags & V4L2_BUF_FLAG_TIMECODE)
+	if (src->flags & V4L2_BUF_FLAG_TIMECODE)
 		dst->timecode = src->timecode;
 	dst->vb2_buf.timestamp = src->vb2_buf.timestamp;
-	dst->flags &= ~V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
-	dst->flags |= src->flags & V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
+	dst->flags &= ~(V4L2_BUF_FLAG_TSTAMP_SRC_MASK |
+			V4L2_BUF_FLAG_TIMECODE);
+	dst->flags |= src->flags & (V4L2_BUF_FLAG_TSTAMP_SRC_MASK |
+				    V4L2_BUF_FLAG_TIMECODE);
 
 	avail_size = vb2_plane_size(&dst->vb2_buf, 0) -
 		     ctx->vpu_dst_fmt->header_size;
@@ -151,6 +153,12 @@ enc_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	src_vq->drv_priv = ctx;
 	src_vq->ops = &rockchip_vpu_enc_queue_ops;
 	src_vq->mem_ops = &vb2_dma_contig_memops;
+
+	/*
+	 * Driver does mostly sequential access, so sacrifice TLB efficiency
+	 * for faster allocation. Also, no CPU access on the source queue,
+	 * so no kernel mapping needed.
+	 */
 	src_vq->dma_attrs = DMA_ATTR_ALLOC_SINGLE_PAGES |
 			    DMA_ATTR_NO_KERNEL_MAPPING;
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
@@ -197,8 +205,6 @@ static int rockchip_vpu_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctx->jpeg_quality = ctrl->val;
 		break;
 	default:
-		vpu_err("Invalid control id = %d, val = %d\n",
-			ctrl->id, ctrl->val);
 		return -EINVAL;
 	}
 
diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
index 6aadd194e999..3dbd15d5fabe 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_enc.c
@@ -142,7 +142,7 @@ rockchip_vpu_get_default_fmt(struct rockchip_vpu_ctx *ctx, bool bitstream)
 	formats = dev->variant->enc_fmts;
 	num_fmts = dev->variant->num_enc_fmts;
 	for (i = 0; i < num_fmts; i++) {
-		if (bitstream == formats[i].codec_mode != RK_VPU_MODE_NONE)
+		if (bitstream == (formats[i].codec_mode != RK_VPU_MODE_NONE))
 			return &formats[i];
 	}
 	return NULL;

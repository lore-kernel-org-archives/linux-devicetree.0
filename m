From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH] media: rockchip: rkvdec_queue_ops can be static
Date: Mon, 14 Oct 2019 03:08:22 +0800
Message-ID: <20191013190822.klfeelozbfx6qrnz@332d0cec05f4>
References: <20191011093342.3471-4-boris.brezillon@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20191011093342.3471-4-boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, kbuild-all-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Nicolas Dufresne <nicolas-dDhyB4GVkw9AFePFGvp55w@public.gmane.org>, Boris Brezillon <boris.brezillon-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ezequiel Garcia <ezequiel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Fixes: 0fb0ad38c9ed ("media: rockchip: Add the rkvdec driver")
Signed-off-by: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 rkvdec-h264.c |    6 +++---
 rkvdec.c      |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/rockchip/vdec/rkvdec-h264.c b/drivers/staging/media/rockchip/vdec/rkvdec-h264.c
index d241afe12edd6..2d62ab739dbc8 100644
--- a/drivers/staging/media/rockchip/vdec/rkvdec-h264.c
+++ b/drivers/staging/media/rockchip/vdec/rkvdec-h264.c
@@ -695,9 +695,9 @@ static u32 poc_reg_tbl_bottom_field[16] = {
 	RKVDEC_REG_H264_POC_REFER2(1)
 };
 
-struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
-			       struct rkvdec_h264_run *run,
-			       unsigned int dpb_idx)
+static struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
+				      struct rkvdec_h264_run *run,
+				      unsigned int dpb_idx)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
 	const struct v4l2_h264_dpb_entry *dpb = run->decode_params->dpb;
diff --git a/drivers/staging/media/rockchip/vdec/rkvdec.c b/drivers/staging/media/rockchip/vdec/rkvdec.c
index 3531ce0dd3e72..5f07d589e4f9c 100644
--- a/drivers/staging/media/rockchip/vdec/rkvdec.c
+++ b/drivers/staging/media/rockchip/vdec/rkvdec.c
@@ -495,7 +495,7 @@ static void rkvdec_stop_streaming(struct vb2_queue *q)
 	rkvdec_queue_cleanup(q, VB2_BUF_STATE_ERROR);
 }
 
-const struct vb2_ops rkvdec_queue_ops = {
+static const struct vb2_ops rkvdec_queue_ops = {
 	.queue_setup = rkvdec_queue_setup,
 	.buf_prepare = rkvdec_buf_prepare,
 	.buf_queue = rkvdec_buf_queue,

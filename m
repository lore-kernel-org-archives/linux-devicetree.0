From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 1/4] VPU: mediatek: Add mdp support
Date: Fri, 22 Jul 2016 16:33:00 +0800
Message-ID: <1469176383-35210-2-git-send-email-minghsiu.tsai@mediatek.com>
References: <1469176383-35210-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1469176383-35210-1-git-send-email-minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

VPU driver add mdp support

Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.h |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.h b/drivers/media/platform/mtk-vpu/mtk_vpu.h
index f457479..291ae46 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.h
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.h
@@ -53,6 +53,8 @@ typedef void (*ipi_handler_t) (void *data,
 			 handle H264 video encoder job, and vice versa.
  * @IPI_VENC_VP8:	 The interrupt fro vpu is to notify kernel to
 			 handle VP8 video encoder job,, and vice versa.
+ * @IPI_MDP:		 The interrupt from vpu is to notify kernel to
+			 handle MDP (Media Data Path) job, and vice versa.
  * @IPI_MAX:		 The maximum IPI number
  */
 
@@ -63,6 +65,7 @@ enum ipi_id {
 	IPI_VDEC_VP9,
 	IPI_VENC_H264,
 	IPI_VENC_VP8,
+	IPI_MDP,
 	IPI_MAX,
 };
 
@@ -71,11 +74,13 @@ enum ipi_id {
  *
  * @VPU_RST_ENC: encoder reset id
  * @VPU_RST_DEC: decoder reset id
+ * @VPU_RST_MDP: MDP (Media Data Path) reset id
  * @VPU_RST_MAX: maximum reset id
  */
 enum rst_id {
 	VPU_RST_ENC,
 	VPU_RST_DEC,
+	VPU_RST_MDP,
 	VPU_RST_MAX,
 };
 
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

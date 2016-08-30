From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v5 5/5] media: mtk-mdp: support pixelformat V4L2_PIX_FMT_MT21C
Date: Tue, 30 Aug 2016 20:25:44 +0800
Message-ID: <1472559944-55114-6-git-send-email-minghsiu.tsai@mediatek.com>
References: <1472559944-55114-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1472559944-55114-1-git-send-email-minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add V4L2_PIX_FMT_MT21C in format list.

Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |    8 ++++++++
 drivers/media/platform/mtk-mdp/mtk_mdp_regs.c |    4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
index 927132a..0184dbe 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
@@ -54,6 +54,14 @@ static struct mtk_mdp_pix_align mtk_mdp_size_align = {
 
 static const struct mtk_mdp_fmt mtk_mdp_formats[] = {
 	{
+		.pixelformat	= V4L2_PIX_FMT_MT21C,
+		.depth		= { 8, 4 },
+		.row_depth	= { 8, 8 },
+		.num_planes	= 2,
+		.num_comp	= 2,
+		.align		= &mtk_mdp_size_align,
+		.flags		= MTK_MDP_FMT_FLAG_OUTPUT,
+	}, {
 		.pixelformat	= V4L2_PIX_FMT_NV12M,
 		.depth		= { 8, 4 },
 		.row_depth	= { 8, 8 },
diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_regs.c b/drivers/media/platform/mtk-mdp/mtk_mdp_regs.c
index a5601e1..86d57f3 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_regs.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_regs.c
@@ -29,6 +29,8 @@ enum MDP_COLOR_ENUM {
 	MDP_COLOR_NV12 = MDP_COLORFMT_PACK(0, 2, 1, 1, 1, 8, 1, 0, 12),
 	MDP_COLOR_I420 = MDP_COLORFMT_PACK(0, 3, 0, 1, 1, 8, 1, 0, 8),
 	MDP_COLOR_YV12 = MDP_COLORFMT_PACK(0, 3, 0, 1, 1, 8, 1, 1, 8),
+	/* Mediatek proprietary format */
+	MDP_COLOR_420_MT21 = MDP_COLORFMT_PACK(5, 2, 1, 1, 1, 256, 1, 0, 12),
 };
 
 static int32_t mtk_mdp_map_color_format(int v4l2_format)
@@ -37,6 +39,8 @@ static int32_t mtk_mdp_map_color_format(int v4l2_format)
 	case V4L2_PIX_FMT_NV12M:
 	case V4L2_PIX_FMT_NV12:
 		return MDP_COLOR_NV12;
+	case V4L2_PIX_FMT_MT21C:
+		return MDP_COLOR_420_MT21;
 	case V4L2_PIX_FMT_YUV420M:
 	case V4L2_PIX_FMT_YUV420:
 		return MDP_COLOR_I420;
-- 
1.7.9.5

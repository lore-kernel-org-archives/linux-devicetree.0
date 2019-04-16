From: Stu Hsieh <stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 13/15] [media] mtk-mipicsi: add the function for Get/Set
 PARM for application
Date: Tue, 16 Apr 2019 17:27:41 +0800
Message-ID: <1555406863-18069-14-git-send-email-stu.hsieh@mediatek.com>
References: <1555406863-18069-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1555406863-18069-1-git-send-email-stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stu Hsieh <stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch add the function for Get/Set PARM for application.

Application can get the information about number of link.

Signed-off-by: Stu Hsieh <stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 5e4028d0d5e1..5db9c68b0da9 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -346,6 +346,38 @@ static int get_subdev_link(const struct soc_camera_device *icd,
 	return 0;
 }
 
+static int mtk_mipicsi_get_parm(struct soc_camera_device *icd,
+	struct v4l2_streamparm *a)
+{
+	unsigned int link = 0U;
+	u8 link_reg_val = 0x0U;
+	int ret = 0;
+
+	/*get camera link number*/
+	ret = get_subdev_link(icd, &link, &link_reg_val);
+	if (ret < 0)
+		return ret;
+
+	a->parm.capture.timeperframe.numerator = 1;
+	a->parm.capture.timeperframe.denominator = 30;
+	a->parm.capture.reserved[0] = link_reg_val;
+	a->parm.capture.reserved[1] = (u32)(icd->use_count);
+	dev_info(icd->parent, "use count %d\n", icd->use_count);
+
+	return 0;
+}
+
+static int mtk_mipicsi_set_param(struct soc_camera_device *icd,
+	struct v4l2_streamparm *a)
+{
+	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
+
+	if (ici->ops->get_parm == NULL)
+		return ici->ops->get_parm(icd, a);
+
+	return 0;
+}
+
 static u32 get_bytesperline(const u32 fmt, const u32 width)
 {
 	u32 bytesperline = 0;
@@ -884,6 +916,8 @@ static struct soc_camera_host_ops mtk_soc_camera_host_ops = {
 	.poll			= vb2_fop_poll,
 	.querycap		= mtk_mipicsi_querycap,
 	.set_bus_param		= mtk_mipicsi_set_bus_param,
+	.get_parm		= mtk_mipicsi_get_parm,
+	.set_parm		= mtk_mipicsi_set_param,
 };
 
 static void mtk_mipicsi_ana_init(void __iomem *base)
-- 
2.18.0

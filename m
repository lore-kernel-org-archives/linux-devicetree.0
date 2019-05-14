From: Stu Hsieh <stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 11/13] [media] mtk-mipicsi: add function to get the format
Date: Tue, 14 May 2019 14:13:48 +0800
Message-ID: <1557814430-9675-12-git-send-email-stu.hsieh@mediatek.com>
References: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1557814430-9675-1-git-send-email-stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stu Hsieh <stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch add function to get the format

This function can get the subdev format and host format.
Calculate the number of format which intersection of subdev and host.

Signed-off-by: Stu Hsieh <stu.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 151 ++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index cf46fcd01a19..1b885de6d990 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -56,6 +56,7 @@
 #define MIPICSI_CLK (MIPICSI_COMMON_CLK + MTK_CAMDMA_MAX_NUM)
 #define MAX_DES_LINK 4U
 #define SUBDEV_LINK_REG 0x49
+#define MTK_DATAWIDTH_8					(0x01U << 7U)
 #define MAX_SUPPORT_WIDTH             4096U
 #define MAX_SUPPORT_HEIGHT            4096U
 #define MAX_BUFFER_NUM                  32U
@@ -134,6 +135,7 @@ struct mtk_mipicsi_dev {
 	struct regmap		*seninf_top;
 	void __iomem		*seninf_mux[MTK_CAMDMA_MAX_NUM];
 	void __iomem		*camsv[MTK_CAMDMA_MAX_NUM];
+	u16			width_flags;	/* max 12 bits */
 	struct list_head	fb_list;
 	spinlock_t		lock;
 	spinlock_t		queue_lock;
@@ -152,6 +154,50 @@ struct mtk_mipicsi_dev {
 	u32 bytesperline;
 };
 
+static const struct soc_mbus_lookup mtk_mipicsi_formats[] = {
+{
+	.code = MEDIA_BUS_FMT_YUYV8_2X8,
+	.fmt = {
+		.fourcc			= V4L2_PIX_FMT_YUYV,
+		.name			= "YUYV",
+		.bits_per_sample	= 8,
+		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
+		.order			= SOC_MBUS_ORDER_LE,
+		.layout			= SOC_MBUS_LAYOUT_PACKED,
+	},
+}, {
+	.code = MEDIA_BUS_FMT_YVYU8_2X8,
+	.fmt = {
+		.fourcc			= V4L2_PIX_FMT_YVYU,
+		.name			= "YVYU",
+		.bits_per_sample	= 8,
+		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
+		.order			= SOC_MBUS_ORDER_LE,
+		.layout			= SOC_MBUS_LAYOUT_PACKED,
+	},
+}, {
+	.code = MEDIA_BUS_FMT_UYVY8_2X8,
+	.fmt = {
+		.fourcc			= V4L2_PIX_FMT_UYVY,
+		.name			= "UYVY",
+		.bits_per_sample	= 8,
+		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
+		.order			= SOC_MBUS_ORDER_LE,
+		.layout			= SOC_MBUS_LAYOUT_PACKED,
+	},
+}, {
+	.code = MEDIA_BUS_FMT_VYUY8_2X8,
+	.fmt = {
+		.fourcc			= V4L2_PIX_FMT_VYUY,
+		.name			= "VYUY",
+		.bits_per_sample	= 8,
+		.packing		= SOC_MBUS_PACKING_2X8_PADHI,
+		.order			= SOC_MBUS_ORDER_LE,
+		.layout			= SOC_MBUS_LAYOUT_PACKED,
+	},
+},
+};
+
 #define MTK_MIPICSI_BUS_PARAM (V4L2_MBUS_MASTER |	\
 		V4L2_MBUS_HSYNC_ACTIVE_HIGH |	\
 		V4L2_MBUS_HSYNC_ACTIVE_LOW |	\
@@ -196,6 +242,43 @@ static void mtk_mipicsi_ana_clk_enable(void __iomem *base, bool enable)
 	}
 }
 
+static int mtk_mipicsi_try_bus_param(struct soc_camera_device *icd,
+					    unsigned char buswidth)
+{
+	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
+	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
+	struct mtk_mipicsi_dev *mipicsi = ici->priv;
+	struct v4l2_mbus_config cfg = {.type = V4L2_MBUS_CSI2_DPHY,};
+	unsigned long common_flags = 0;
+	int ret = 0;
+
+	ret = v4l2_subdev_call(sd, video, g_mbus_config, &cfg);
+	if (ret == 0) {
+		common_flags = soc_mbus_config_compatible(&cfg,
+				MTK_MIPICSI_BUS_PARAM);
+		if (common_flags == 0U) {
+			dev_warn(icd->parent, "Flags incompatible: camera 0x%x\n",
+				cfg.flags);
+			return -EINVAL;
+		}
+	} else {
+		if (ret != -ENOIOCTLCMD)
+			return ret;
+	}
+
+	if ((((u16)1U << (buswidth - 1U)) & mipicsi->width_flags) != 0U)
+		return 0;
+
+	return -EINVAL;
+}
+
+static bool mtk_mipicsi_packing_supported(const struct soc_mbus_pixelfmt *fmt)
+{
+	return	fmt->packing == SOC_MBUS_PACKING_NONE ||
+		(fmt->bits_per_sample == 8U &&
+		 fmt->packing == SOC_MBUS_PACKING_2X8_PADHI);
+}
+
 static int get_subdev_register(const struct soc_camera_device *icd,
 	struct v4l2_dbg_register *reg)
 {
@@ -322,6 +405,72 @@ static void mtk_mipicsi_remove_device(struct soc_camera_device *icd)
 	(void)pm_runtime_put_sync(icd->parent);
 }
 
+static int mtk_mipicsi_get_formats(struct soc_camera_device *icd,
+		unsigned int idx, struct soc_camera_format_xlate *xlate)
+{
+	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
+	int formats = 0, ret, i;
+	int n = ARRAY_SIZE(mtk_mipicsi_formats);
+
+	struct v4l2_subdev_mbus_code_enum mbus_code = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+		.index = idx,
+	};
+	/* subdev format */
+	const struct soc_mbus_pixelfmt *fmt;
+
+	ret = v4l2_subdev_call(sd, pad, enum_mbus_code, NULL, &mbus_code);
+	if (ret < 0)
+		/* No more formats */
+		return 0;
+
+	/* get subdev support format */
+	fmt = soc_mbus_get_fmtdesc(mbus_code.code);
+	if (fmt == NULL) {
+		dev_err(icd->parent, "Invalid format code #%u: %d",
+			idx, mbus_code.code);
+		return 0;
+	}
+
+	/* This also checks support for the requested bits-per-sample */
+	ret = mtk_mipicsi_try_bus_param(icd, fmt->bits_per_sample);
+	if (ret < 0) {
+		dev_err(icd->parent, "Fail to try the bus parameters.\n");
+		return 0;
+	}
+
+	switch (mbus_code.code) {
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_2X8:
+			dev_dbg(icd->parent, "Providing format %s using code %d\n",
+				fmt->name, mbus_code.code);
+		break;
+	default:
+		if (!mtk_mipicsi_packing_supported(fmt))
+			return 0;
+		if (xlate != NULL)
+			dev_dbg(icd->parent,
+				"Providing format %s in pass-through mode\n",
+				fmt->name);
+		break;
+	}
+
+	/* get camera host and subdev format intersection */
+	for (i = 0; i < n; ++i)
+		if (mtk_mipicsi_formats[i].fmt.fourcc == fmt->fourcc) {
+			++formats;
+			if (xlate != NULL) {
+				xlate->host_fmt = &mtk_mipicsi_formats[i].fmt;
+				xlate->code = mbus_code.code;
+				xlate++;
+			}
+		}
+
+	return formats;
+}
+
 static bool is_supported(const u32 pixformat)
 {
 	switch (pixformat) {
@@ -711,6 +860,7 @@ static struct soc_camera_host_ops mtk_soc_camera_host_ops = {
 	.owner			= THIS_MODULE,
 	.add			= mtk_mipicsi_add_device,
 	.remove			= mtk_mipicsi_remove_device,
+	.get_formats            = mtk_mipicsi_get_formats,
 	.set_fmt		= mtk_mipicsi_set_fmt,
 	.try_fmt		= mtk_mipicsi_try_fmt,
 	.init_videobuf2	= mtk_mipicsi_init_videobuf2,
@@ -1297,6 +1447,7 @@ static int mtk_mipicsi_probe(struct platform_device *pdev)
 	mipicsi->soc_host.priv		= mipicsi;
 	mipicsi->soc_host.v4l2_dev.dev	= &pdev->dev;
 	mipicsi->soc_host.nr		= mipicsi->id;
+	mipicsi->width_flags		= MTK_DATAWIDTH_8;
 	mipicsi->streamon		= false;
 
 	ret = soc_camera_host_register(&mipicsi->soc_host);
-- 
2.18.0

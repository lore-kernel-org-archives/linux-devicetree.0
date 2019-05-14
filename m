From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v3 05/13] [media] mtk-mipicsi: get the w/h/bytepwerline for mtk_mipicsi
Date: Tue, 14 May 2019 14:13:42 +0800
Message-ID: <1557814430-9675-6-git-send-email-stu.hsieh@mediatek.com>
References: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch get the w/h/bytepwerline to save in mtk_mipicsi.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 9c65b96456c4..920848e965e3 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -132,6 +132,9 @@ struct mtk_mipicsi_dev {
 	u32 id;
 	int clk_num;
 	struct clk		*clk[MIPICSI_CLK];
+	u32 width;
+	u32 height;
+	u32 bytesperline;
 };
 
 #define MTK_MIPICSI_BUS_PARAM (V4L2_MBUS_MASTER |	\
@@ -143,13 +146,36 @@ struct mtk_mipicsi_dev {
 		V4L2_MBUS_PCLK_SAMPLE_FALLING |	\
 		V4L2_MBUS_DATA_ACTIVE_HIGH)
 
+static u32 get_bytesperline(const u32 fmt, const u32 width)
+{
+	u32 bytesperline = 0;
+
+	switch (fmt) {
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_2X8:
+		bytesperline = width * 2U;
+		break;
+	default:
+		break;
+	}
+
+	return bytesperline;
+}
+
 static int mtk_mipicsi_add_device(struct soc_camera_device *icd)
 {
+	struct soc_camera_host *ici = to_soc_camera_host(icd->parent);
+	struct mtk_mipicsi_dev *mipicsi = ici->priv;
 	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
 	int ret;
+	u32 width;
+	u32 height;
+	u32 fmt;
 
 	/* Get width/height info from subdev. Then use them to set register */
 	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &format);
@@ -158,6 +184,21 @@ static int mtk_mipicsi_add_device(struct soc_camera_device *icd)
 		return ret;
 	}
 
+	width = format.format.width;
+	height = format.format.height;
+	fmt = format.format.code;
+	mipicsi->bytesperline = get_bytesperline(fmt, width);
+	if ((width == 0U) || (width > MAX_SUPPORT_WIDTH) ||
+	    (height == 0U) || (height > MAX_SUPPORT_HEIGHT) ||
+	    (mipicsi->bytesperline == 0U)) {
+		dev_err(icd->parent, "invalid sub device width/height/bytesperline %d/%d/%d\n",
+			width, height, mipicsi->bytesperline);
+		return -EINVAL;
+	}
+
+	mipicsi->width = width;
+	mipicsi->height = height;
+
 	/*
 	 * If power domain was closed before, it will be open.
 	 * Then clock will be open and register will be set
-- 
2.18.0

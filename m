From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 11/14] [media] mtk-mipicsi: add function to get the format
Date: Tue, 4 Jun 2019 18:11:52 +0800
Message-ID: <1559643115-15124-12-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch add function to get the format

This function can get the subdev format and host format.
Calculate the number of format which intersection of subdev and host.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 9e45786a0282..aaaea5c6f280 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -52,6 +52,7 @@
 
 #define MTK_MIPICSI_DRV_NAME "mtk-mipicsi"
 #define MTK_PLATFORM_STR "platform:mt2712"
+#define MTK_DATAWIDTH_8					(0x01U << 7U)
 #define MAX_SUPPORT_WIDTH             4096U
 #define MAX_SUPPORT_HEIGHT            4096U
 #define MAX_BUFFER_NUM                  32U
@@ -158,6 +159,7 @@ struct mtk_mipicsi_dev {
 	unsigned int			num_user_formats;
 	const struct mtk_format		**user_formats;
 	const struct mtk_format		*current_fmt;
+	u16			width_flags;	/* max 12 bits */
 
 	struct mtk_mipicsi_buf	cam_buf[MAX_BUFFER_NUM];
 	struct list_head	fb_list;
@@ -1522,6 +1524,7 @@ static int mtk_mipicsi_probe(struct platform_device *pdev)
 		goto err_vb2_queue;
 	}
 
+	mipicsi->width_flags = MTK_DATAWIDTH_8;
 	mipicsi->streamon = false;
 
 	ret = mtk_mipicsi_subdev_init(mipicsi);
-- 
2.18.0

From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v3 06/13] [media] mtk-mipicsi: add function to support SerDes for link number
Date: Tue, 14 May 2019 14:13:43 +0800
Message-ID: <1557814430-9675-7-git-send-email-stu.hsieh@mediatek.com>
References: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557814430-9675-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch add function to support SerDes for link number.

Mt2712 can server at most four camera link for each mipicsi port.
Therefore, driver need to know how many camera link in SerDes and
set the mipicsi HW to serve.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 920848e965e3..117eb1939014 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -53,6 +53,8 @@
 #define MIPICSI_COMMON_CLK 2
 #define MTK_CAMDMA_MAX_NUM 4U
 #define MIPICSI_CLK (MIPICSI_COMMON_CLK + MTK_CAMDMA_MAX_NUM)
+#define MAX_DES_LINK 4U
+#define SUBDEV_LINK_REG 0x49
 #define MAX_SUPPORT_WIDTH             4096U
 #define MAX_SUPPORT_HEIGHT            4096U
 #define MAX_BUFFER_NUM                  32U
@@ -103,6 +105,8 @@
 #define IMGO_STRIDE					0x238
 #define DMA_FRAME_HEADER_EN				0xE00
 
+#define SerDes_support 1
+
 /* buffer for one video frame */
 struct mtk_mipicsi_buf {
 	struct list_head queue;
@@ -127,6 +131,8 @@ struct mtk_mipicsi_dev {
 	spinlock_t		queue_lock;
 	struct mtk_mipicsi_buf	cam_buf[MAX_BUFFER_NUM];
 	bool streamon;
+	unsigned int link;
+	u8 link_reg_val;
 	unsigned long enqueue_cnt;
 	char drv_name[16];
 	u32 id;
@@ -146,6 +152,64 @@ struct mtk_mipicsi_dev {
 		V4L2_MBUS_PCLK_SAMPLE_FALLING |	\
 		V4L2_MBUS_DATA_ACTIVE_HIGH)
 
+static int get_subdev_register(const struct soc_camera_device *icd,
+	struct v4l2_dbg_register *reg)
+{
+	struct v4l2_subdev *sd = soc_camera_to_subdev(icd);
+	int ret = 0;
+
+	reg->match.type = V4L2_CHIP_MATCH_SUBDEV;
+	reg->match.addr = 0;
+	ret = v4l2_subdev_call(sd, core, g_register, reg);
+	if (ret != 2) {
+		dev_err(icd->parent, "mipicsi get des register 0x%llx fail, ret=%d\n",
+			reg->reg, ret);
+		return -EIO;
+	}
+
+	dev_info(icd->parent, "read DES [reg/val/ret] is [0x%llx/0x%llx/%d]\n",
+		reg->reg, reg->val, ret);
+	return ret;
+}
+
+static int get_subdev_link(const struct soc_camera_device *icd,
+	unsigned int *link, u8 *link_reg_val)
+{
+	struct v4l2_dbg_register reg;
+	int ret = 0;
+	unsigned int index = 0U;
+	*link_reg_val = 0x0U;
+
+	if (SerDes_support == 0) {
+		*link = 1;
+		*link_reg_val = 0x1;
+		dev_info(icd->parent, "subdev not support SerDes\n");
+		return 0;
+	}
+
+	if (link == NULL)
+		return -EINVAL;
+
+	memset(&reg, 0, sizeof(reg));
+	/*get camera link number*/
+	reg.reg = SUBDEV_LINK_REG;
+	ret = get_subdev_register(icd, &reg);
+	if (ret < 0)
+		return ret;
+
+	*link = 0U;
+	for (index = 0U; index < MAX_DES_LINK; ++index) {
+		if ((reg.val & 0x01U) == 0x01U) {
+			*link += 1U;
+			*link_reg_val |= (0x01U << index);
+		}
+		reg.val >>= 1U;
+	}
+
+	dev_info(icd->parent, "%u camera linked to sub device\n", *link);
+	return 0;
+}
+
 static u32 get_bytesperline(const u32 fmt, const u32 width)
 {
 	u32 bytesperline = 0;
@@ -177,6 +241,7 @@ static int mtk_mipicsi_add_device(struct soc_camera_device *icd)
 	u32 height;
 	u32 fmt;
 
+	(void)get_subdev_link(icd, &mipicsi->link, &mipicsi->link_reg_val);
 	/* Get width/height info from subdev. Then use them to set register */
 	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &format);
 	if (ret < 0) {
-- 
2.18.0

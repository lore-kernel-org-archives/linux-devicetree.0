From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 14/14] [media] mtk-mipicsi: add function to support SerDes for link number
Date: Tue, 4 Jun 2019 18:11:55 +0800
Message-ID: <1559643115-15124-15-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch add function to support SerDes for link number.

Mt2712 can serve at most four camera link for each mipicsi port.
Therefore, driver need to know how many camera link in SerDes and
set the mipicsi HW to serve.

The value "link_reg" defined in dts, and use it to get the link status
for SerDes.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 53 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 9b5983b39f2b..ab703e3469ca 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -143,6 +143,7 @@ struct mtk_mipicsi_subdev {
 	struct v4l2_async_subdev asd;
 	struct v4l2_subdev *subdev;
 	unsigned int max_vc;
+	u32 link_reg;
 };
 
 struct mtk_mipicsi_channel {
@@ -257,12 +258,37 @@ static const struct file_operations mtk_mipicsi_debug_fops = {
 };
 #endif /* CONFIG_DEBUG_FS */
 
+static int get_subdev_register(struct mtk_mipicsi_dev *mipicsi,
+			       struct v4l2_dbg_register *reg)
+{
+	struct v4l2_subdev *sd = mipicsi->mipicsi_sd.subdev;
+	struct device *dev = &mipicsi->pdev->dev;
+	int ret = 0;
+
+	reg->match.type = V4L2_CHIP_MATCH_SUBDEV;
+	reg->match.addr = 0;
+	ret = v4l2_subdev_call(sd, core, g_register, reg);
+	if (ret != 2) {
+		dev_err(dev, "mipicsi get des register 0x%llx fail, ret=%d\n",
+		reg->reg, ret);
+		return -EIO;
+	}
+
+	dev_info(dev, "read DES [reg/val/ret] is [0x%llx/0x%llx/%d]\n",
+		 reg->reg, reg->val, ret);
+
+	return ret;
+}
+
+
 static int get_subdev_link(struct mtk_mipicsi_dev *mipicsi,
 	unsigned int *link, u8 *link_reg_val)
 {
 	struct device *dev = &mipicsi->pdev->dev;
 	struct mtk_mipicsi_subdev *sd = &mipicsi->mipicsi_sd;
-
+	struct v4l2_dbg_register reg;
+	int ret = 0;
+	unsigned int index = 0;
 
 	if (sd->max_vc == 1) {
 		*link = 1;
@@ -274,6 +300,24 @@ static int get_subdev_link(struct mtk_mipicsi_dev *mipicsi,
 
 	dev_info(dev, "mtk mipicsi support %d channel\n", sd->max_vc);
 
+	memset(&reg, 0, sizeof(reg));
+	/*get camera link number*/
+	reg.reg = sd->link_reg;
+	ret = get_subdev_register(mipicsi, &reg);
+	if (ret < 0)
+		return ret;
+
+	*link = 0;
+	for (index = 0; index < sd->max_vc; index++) {
+		if ((reg.val & 0x01) == 0x01) {
+			*link += 1;
+			*link_reg_val |= (0x01 << index);
+		}
+		reg.val >>= 1;
+	}
+
+	dev_info(dev, "%u camera linked to sub device\n", *link);
+
 	return 0;
 }
 
@@ -1199,6 +1243,13 @@ static int mtk_mipicsi_node_parse(struct mtk_mipicsi_dev *mipicsi)
 		sd->max_vc = 1;
 	}
 
+	ret = of_property_read_u32(dev->of_node, "mediatek,serdes_link_reg",
+				   &sd->link_reg);
+	if (ret != 0) {
+		dev_info(dev, "not set mediatek,serdes_link_reg, can't read subdev link number\n");
+		sd->link_reg = 0x0;
+	}
+
 	/* get and parse seninf_mux_camsv */
 	camsv_num = of_count_phandle_with_args(dev->of_node,
 		"mediatek,seninf_mux_camsv", NULL);
-- 
2.18.0

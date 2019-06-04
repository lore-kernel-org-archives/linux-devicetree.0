From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 07/14] [media] mtk-mipicsi: add function to get the number of subdev link
Date: Tue, 4 Jun 2019 18:11:48 +0800
Message-ID: <1559643115-15124-8-git-send-email-stu.hsieh@mediatek.com>
References: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559643115-15124-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch add function to get subdev link.

Mt2712 can serve at most four camera link for each mipicsi port.
The number of link according to the value which is
defined in dts, the string is "mediatek,mipicsi_max_vc".
This value "max_vc" is the number of subdev link.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index f5cb29077022..ea1edbc6401b 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -120,6 +120,7 @@ struct mtk_mipicsi_subdev {
 	struct device_node *node;
 	struct v4l2_async_subdev asd;
 	struct v4l2_subdev *subdev;
+	unsigned int max_vc;
 };
 
 struct mtk_mipicsi_channel {
@@ -153,6 +154,8 @@ struct mtk_mipicsi_dev {
 	struct mtk_mipicsi_buf	cam_buf[MAX_BUFFER_NUM];
 	struct list_head	fb_list;
 	bool streamon;
+	unsigned int link;
+	u8 link_reg_val;
 	char drv_name[16];
 	u32 id;
 
@@ -182,6 +185,25 @@ static const struct mtk_format mtk_mipicsi_formats[] = {
 },
 };
 
+static int get_subdev_link(struct mtk_mipicsi_dev *mipicsi,
+	unsigned int *link, u8 *link_reg_val)
+{
+	struct device *dev = &mipicsi->pdev->dev;
+	struct mtk_mipicsi_subdev *sd = &mipicsi->mipicsi_sd;
+
+	if (sd->max_vc == 1) {
+		*link = 1;
+		*link_reg_val = 0x1;
+		dev_info(dev, "mtk mipicsi support 1 channel\n");
+
+		return 0;
+	}
+
+	dev_info(dev, "mtk mipicsi support %d channel\n", sd->max_vc);
+
+	return 0;
+}
+
 static void mtk_mipicsi_ana_clk_enable(void __iomem *base, bool enable)
 {
 	if (enable) {
@@ -877,6 +899,7 @@ static int mtk_mipicsi_node_parse(struct mtk_mipicsi_dev *mipicsi)
 	struct resource *res = NULL;
 	struct device_node *common_node = NULL;
 	struct platform_device *pdev = NULL;
+	struct mtk_mipicsi_subdev *sd = &mipicsi->mipicsi_sd;
 
 	dev = &mipicsi->pdev->dev;
 	pdev = mipicsi->pdev;
@@ -891,6 +914,14 @@ static int mtk_mipicsi_node_parse(struct mtk_mipicsi_dev *mipicsi)
 	(void)sprintf(mipicsi->drv_name, MTK_MIPICSI_DRV_NAME"%d",
 		mipicsi->id);
 
+	/*get the number of virtual channel*/
+	ret = of_property_read_u32(dev->of_node, "mediatek,mipicsi_max_vc",
+				   &sd->max_vc);
+	if (ret != 0) {
+		dev_info(dev, "not set mediatek,mipicsi_max_vc, use default value 1\n");
+		sd->max_vc = 1;
+	}
+
 	/* get and parse seninf_mux_camsv */
 	camsv_num = of_count_phandle_with_args(dev->of_node,
 		"mediatek,seninf_mux_camsv", NULL);
@@ -1165,6 +1196,8 @@ static int mtk_mipicsi_open(struct file *file)
 	if (ret)
 		v4l2_subdev_call(sd, core, s_power, 0);
 
+	get_subdev_link(mipicsi, &mipicsi->link, &mipicsi->link_reg_val);
+
 	pm_runtime_get_sync(&mipicsi->pdev->dev);
 
 fh_rel:
-- 
2.18.0

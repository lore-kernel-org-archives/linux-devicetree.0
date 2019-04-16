From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v2 03/15] [media] mtk-mipicsi: add pm function
Date: Tue, 16 Apr 2019 17:27:31 +0800
Message-ID: <1555406863-18069-4-git-send-email-stu.hsieh@mediatek.com>
References: <1555406863-18069-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555406863-18069-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch add PM function to enable/disable clk and larb.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index e26bebe17fe5..ec4f6b503b32 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -464,6 +464,85 @@ static struct soc_camera_host_ops mtk_soc_camera_host_ops = {
 	.set_bus_param		= mtk_mipicsi_set_bus_param,
 };
 
+static int mtk_mipicsi_pm_suspend(struct device *dev)
+{
+	struct soc_camera_host *ici = to_soc_camera_host(dev);
+	struct mtk_mipicsi_dev *mipicsi = NULL;
+	int ret = 0;
+	int i = 0;
+
+	mipicsi = container_of(ici, struct mtk_mipicsi_dev, soc_host);
+	if (mipicsi->soc_host.icd != NULL) {
+		struct v4l2_subdev *sd =
+			soc_camera_to_subdev(mipicsi->soc_host.icd);
+
+		ret = v4l2_subdev_call(sd, core, s_power, 0);
+		if (ret == -ENOIOCTLCMD)
+			ret = 0;
+	}
+
+	/* close digtal and analog clock */
+	for (i = 0; i < mipicsi->clk_num; ++i)
+		clk_disable_unprepare(mipicsi->clk[i]);
+
+	if (mipicsi->larb_pdev != NULL)
+		mtk_smi_larb_put(mipicsi->larb_pdev);
+
+	return ret;
+}
+
+static int mtk_mipicsi_suspend(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return mtk_mipicsi_pm_suspend(dev);
+}
+
+static int mtk_mipicsi_pm_resume(struct device *dev)
+{
+	struct soc_camera_host *ici = to_soc_camera_host(dev);
+	struct mtk_mipicsi_dev *mipicsi =
+		container_of(ici, struct mtk_mipicsi_dev, soc_host);
+	int ret = 0;
+	int i = 0;
+
+	if (mipicsi->soc_host.icd != NULL) {
+		struct v4l2_subdev *sd =
+			soc_camera_to_subdev(mipicsi->soc_host.icd);
+
+		ret = v4l2_subdev_call(sd, core, s_power, 1);
+		if (ret == -ENOIOCTLCMD)
+			ret = 0;
+	}
+
+	if (mipicsi->larb_pdev != NULL) {
+		ret = mtk_smi_larb_get(mipicsi->larb_pdev);
+		if (ret != 0)
+			return ret;
+	}
+
+	/* enable digtal clock */
+	for (i = 0; i < mipicsi->clk_num; ++i)
+		(void)clk_prepare_enable(mipicsi->clk[i]);
+
+	return ret;
+}
+
+static int mtk_mipicsi_resume(struct device *dev)
+{
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	return mtk_mipicsi_pm_resume(dev);
+}
+
+static const struct dev_pm_ops mtk_mipicsi_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_mipicsi_suspend, mtk_mipicsi_resume)
+	SET_RUNTIME_PM_OPS(mtk_mipicsi_pm_suspend,
+		mtk_mipicsi_pm_resume, NULL)
+};
+
 static int seninf_mux_camsv_node_parse(struct mtk_mipicsi_dev *mipicsi,
 		int index)
 {
@@ -756,6 +835,7 @@ static const struct of_device_id mtk_mipicsi_of_match[] = {
 static struct platform_driver mtk_mipicsi_driver = {
 	.driver		= {
 		.name	= MTK_MIPICSI_DRV_NAME,
+		.pm	= &mtk_mipicsi_pm,
 		.of_match_table = of_match_ptr(mtk_mipicsi_of_match),
 	},
 	.probe		= mtk_mipicsi_probe,
-- 
2.18.0

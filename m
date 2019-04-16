From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v2 15/15] [media] mtk-mipicsi: add debugfs for mipicsi driver
Date: Tue, 16 Apr 2019 17:27:43 +0800
Message-ID: <1555406863-18069-16-git-send-email-stu.hsieh@mediatek.com>
References: <1555406863-18069-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555406863-18069-1-git-send-email-stu.hsieh@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, CK Hu <ck.hu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

This patch add debugfs for mipicsi driver.

Signed-off-by: Stu Hsieh <stu.hsieh@mediatek.com>
---
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
index 321bb4c88027..484fc9147b69 100644
--- a/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
+++ b/drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c
@@ -48,6 +48,7 @@
 #include <soc/mediatek/smi.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
+#include <linux/debugfs.h>
 
 #ifdef CONFIG_VB2_MEDIATEK_DMA_SG
 #include "mtkbuf-dma-cache-sg.h"
@@ -86,6 +87,7 @@
 #define SENINF_NCSI2_INT_EN				0xB0
 #define SENINF_NCSI2_INT_STATUS				0xB4
 #define SENINF_NCSI2_DBG_SEL				0xB8
+#define SENINF_NCSI2_DBG_PORT				0xBC
 #define SENINF_NCSI2_HSRX_DBG				0xD8
 #define SENINF_NCSI2_DI					0xDC
 #define SENINF_NCSI2_DI_CTRL				0xE4
@@ -95,6 +97,7 @@
 #define SENINF_TOP_MUX					0x08
 
 #define SENINF_MUX_CTRL					0x00
+#define SENINF_MUX_DEBUG_2				0x14
 
 #define CAMSV_MODULE_EN					0x10
 #define CAMSV_FMT_SEL					0x14
@@ -117,6 +120,7 @@
 #define DMA_FRAME_HEADER_EN				0xE00
 
 #define SerDes_support 1
+#define CONFIG_DEBUG_FS 1
 
 static int mtk_mipicsi_dbg_level;
 #define mtk_mipicsi_dbg(level, fmt, args...)				 \
@@ -173,6 +177,9 @@ struct mtk_mipicsi_dev {
 	u32 width;
 	u32 height;
 	u32 bytesperline;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *mtk_mipicsi_debugfs;
+#endif
 };
 
 static const struct soc_mbus_lookup mtk_mipicsi_formats[] = {
@@ -228,6 +235,49 @@ static const struct soc_mbus_lookup mtk_mipicsi_formats[] = {
 		V4L2_MBUS_PCLK_SAMPLE_FALLING |	\
 		V4L2_MBUS_DATA_ACTIVE_HIGH)
 
+#ifdef CONFIG_DEBUG_FS
+static ssize_t mtk_mipicsi_debug_read(struct file *file, char __user *user_buf,
+			      size_t count, loff_t *ppos)
+{
+	struct device *dev = file->private_data;
+	struct soc_camera_host *soc_host = to_soc_camera_host(dev);
+	struct mtk_mipicsi_dev *mipicsi = soc_host->priv;
+	u32 int_val;
+	u32 dbg_port;
+	u32 cnt_val;
+	u32 hcnt;
+	u32 vcnt;
+	char buf[256];
+	char cnt_info[150];
+	int i;
+
+	int_val = readl(mipicsi->seninf + SENINF_NCSI2_INT_STATUS);
+	dbg_port = readl(mipicsi->seninf + SENINF_NCSI2_DBG_PORT);
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, sizeof(buf), "%s\nSENINF_NCSI2_INT_STATUS: 0x%X\n"
+		"SENINF_NCSI2_DBG_PORT: 0x%X\n",
+		dev_name(dev), int_val, dbg_port);
+
+	for (i = 0; i < mipicsi->camsv_num; ++i) {
+		cnt_val = readl(mipicsi->seninf_mux[i] + SENINF_MUX_DEBUG_2);
+		hcnt = (cnt_val >> 16) & 0xFFFF;
+		vcnt = cnt_val & 0xFFFF;
+		memset(cnt_info, 0, sizeof(cnt_info));
+		snprintf(cnt_info, sizeof(cnt_info),
+			"HCNT[%d]: 0x%X\n"
+			"VCNT[%d]: 0x%X\n",
+			i, hcnt, i, vcnt);
+		strcat(buf, cnt_info);
+	}
+
+	return simple_read_from_buffer(user_buf, count, ppos, buf, strlen(buf));
+}
+static const struct file_operations mtk_mipicsi_debug_fops = {
+	.open = simple_open,
+	.read = mtk_mipicsi_debug_read,
+};
+#endif /* CONFIG_DEBUG_FS */
+
 static void mtk_mipicsi_ana_clk_enable(void __iomem *base, bool enable)
 {
 	if (enable) {
@@ -1582,6 +1632,16 @@ static int mtk_mipicsi_probe(struct platform_device *pdev)
 		goto clean;
 	}
 
+#ifdef CONFIG_DEBUG_FS
+	mipicsi->mtk_mipicsi_debugfs =
+		debugfs_create_file(mipicsi->drv_name, 0444, NULL,
+			(void *)(&pdev->dev), &mtk_mipicsi_debug_fops);
+	if (mipicsi->mtk_mipicsi_debugfs == NULL) {
+		dev_err(&pdev->dev, "debugfs_create_file fail\n");
+		goto clean;
+	}
+#endif
+
 	dev_info(&pdev->dev, "probe done\n");
 	return ret;
 clean:
@@ -1594,6 +1654,11 @@ static int mtk_mipicsi_remove(struct platform_device *pdev)
 {
 	struct soc_camera_host *soc_host = to_soc_camera_host(&pdev->dev);
 
+#ifdef CONFIG_DEBUG_FS
+	struct mtk_mipicsi_dev *mipicsi = soc_host->priv;
+
+	debugfs_remove(mipicsi->mtk_mipicsi_debugfs);
+#endif
 	soc_camera_host_unregister(soc_host);
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.18.0

From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/2] venus: use on-chip interconnect API
Date: Thu, 12 Sep 2019 11:29:47 +0300
Message-ID: <20190912082948.22836-2-stanimir.varbanov@linaro.org>
References: <20190912082948.22836-1-stanimir.varbanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912082948.22836-1-stanimir.varbanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Vikash Garodia <vgarodia@codeaurora.org>, Andy Gross <agross@kernel.org>, Georgi Djakov <georgi.djakov@linaro.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-Id: devicetree@vger.kernel.org

This aims to add a requests for bandwidth scaling depending
on the resolution and framerate (macroblocks per second). The
exact value of the requested bandwidth is get from a
pre-calculated tables for encoder and decoder.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/Kconfig              |  1 +
 drivers/media/platform/qcom/venus/core.c    | 34 +++++++++++
 drivers/media/platform/qcom/venus/core.h    | 14 +++++
 drivers/media/platform/qcom/venus/helpers.c | 67 ++++++++++++++++++++-
 4 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 83a785010753..97332dcb944c 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -483,6 +483,7 @@ config VIDEO_QCOM_VENUS
 	tristate "Qualcomm Venus V4L2 encoder/decoder driver"
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on (ARCH_QCOM && IOMMU_DMA) || COMPILE_TEST
+	depends on INTERCONNECT || !INTERCONNECT
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select QCOM_SCM if ARCH_QCOM
 	select VIDEOBUF2_DMA_SG
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index e6eff512a8a1..71aab25700e8 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -5,6 +5,7 @@
  */
 #include <linux/clk.h>
 #include <linux/init.h>
+#include <linux/interconnect.h>
 #include <linux/ioctl.h>
 #include <linux/list.h>
 #include <linux/module.h>
@@ -239,6 +240,14 @@ static int venus_probe(struct platform_device *pdev)
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);
 
+	core->video_path = of_icc_get(dev, "video-mem");
+	if (IS_ERR(core->video_path))
+		return PTR_ERR(core->video_path);
+
+	core->cpucfg_path = of_icc_get(dev, "cpu-cfg");
+	if (IS_ERR(core->cpucfg_path))
+		return PTR_ERR(core->cpucfg_path);
+
 	core->irq = platform_get_irq(pdev, 0);
 	if (core->irq < 0)
 		return core->irq;
@@ -273,6 +282,10 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
+	if (ret)
+		return ret;
+
 	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
 		return ret;
@@ -355,6 +368,9 @@ static int venus_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
+	icc_put(core->video_path);
+	icc_put(core->cpucfg_path);
+
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	return ret;
@@ -464,9 +480,27 @@ static const struct freq_tbl sdm845_freq_table[] = {
 	{  244800, 100000000 },	/* 1920x1080@30 */
 };
 
+static const struct bw_tbl sdm845_bw_table_enc[] = {
+	{ 1944000, 1612000, 0, 2416000, 0 },	/* 3840x2160@60 */
+	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
+	{  489600,  723000, 0,  973000, 0 },	/* 1920x1080@60 */
+	{  244800,  370000, 0,	495000, 0 },	/* 1920x1080@30 */
+};
+
+static const struct bw_tbl sdm845_bw_table_dec[] = {
+	{ 2073600, 3929000, 0, 5551000, 0 },	/* 4096x2160@60 */
+	{ 1036800, 1987000, 0, 2797000, 0 },	/* 4096x2160@30 */
+	{  489600, 1040000, 0, 1298000, 0 },	/* 1920x1080@60 */
+	{  244800,  530000, 0,  659000, 0 },	/* 1920x1080@30 */
+};
+
 static const struct venus_resources sdm845_res = {
 	.freq_tbl = sdm845_freq_table,
 	.freq_tbl_size = ARRAY_SIZE(sdm845_freq_table),
+	.bw_tbl_enc = sdm845_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
+	.bw_tbl_dec = sdm845_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.max_load = 3110400,	/* 4096x2160@90 */
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 922cb7e64bfa..661eaa7b81ec 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -26,10 +26,22 @@ struct reg_val {
 	u32 value;
 };
 
+struct bw_tbl {
+	u32 mbs_per_sec;
+	u32 avg;
+	u32 peak;
+	u32 avg_10bit;
+	u32 peak_10bit;
+};
+
 struct venus_resources {
 	u64 dma_mask;
 	const struct freq_tbl *freq_tbl;
 	unsigned int freq_tbl_size;
+	const struct bw_tbl *bw_tbl_enc;
+	unsigned int bw_tbl_enc_size;
+	const struct bw_tbl *bw_tbl_dec;
+	unsigned int bw_tbl_dec_size;
 	const struct reg_val *reg_tbl;
 	unsigned int reg_tbl_size;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
@@ -115,6 +127,8 @@ struct venus_core {
 	struct clk *core1_clk;
 	struct clk *core0_bus_clk;
 	struct clk *core1_bus_clk;
+	struct icc_path *video_path;
+	struct icc_path *cpucfg_path;
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 1ad96c25ab09..f18458921f5d 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -5,6 +5,7 @@
  */
 #include <linux/clk.h>
 #include <linux/iopoll.h>
+#include <linux/interconnect.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/pm_runtime.h>
@@ -388,6 +389,65 @@ static u32 load_per_type(struct venus_core *core, u32 session_type)
 	return mbs_per_sec;
 }
 
+static void mbs_to_bw(struct venus_inst *inst, u32 mbs, u32 *avg, u32 *peak)
+{
+	const struct venus_resources *res = inst->core->res;
+	const struct bw_tbl *bw_tbl;
+	unsigned int num_rows, i;
+
+	*avg = 0;
+	*peak = 0;
+
+	if (mbs == 0)
+		return;
+
+	if (inst->session_type == VIDC_SESSION_TYPE_ENC) {
+		num_rows = res->bw_tbl_enc_size;
+		bw_tbl = res->bw_tbl_enc;
+	} else if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
+		num_rows = res->bw_tbl_dec_size;
+		bw_tbl = res->bw_tbl_dec;
+	} else {
+		return;
+	}
+
+	if (!bw_tbl || num_rows == 0)
+		return;
+
+	for (i = 0; i < num_rows; i++) {
+		if (mbs > bw_tbl[i].mbs_per_sec)
+			break;
+
+		if (inst->dpb_fmt & HFI_COLOR_FORMAT_10_BIT_BASE) {
+			*avg = bw_tbl[i].avg_10bit;
+			*peak = bw_tbl[i].peak_10bit;
+		} else {
+			*avg = bw_tbl[i].avg;
+			*peak = bw_tbl[i].peak;
+		}
+	}
+}
+
+static int load_scale_bw(struct venus_core *core)
+{
+	struct venus_inst *inst = NULL;
+	u32 mbs_per_sec, avg, peak, total_avg = 0, total_peak = 0;
+
+	mutex_lock(&core->lock);
+	list_for_each_entry(inst, &core->instances, list) {
+		mbs_per_sec = load_per_instance(inst);
+		mbs_to_bw(inst, mbs_per_sec, &avg, &peak);
+		total_avg += avg;
+		total_peak += peak;
+	}
+	mutex_unlock(&core->lock);
+
+	dev_dbg(core->dev, "total: avg_bw: %u, peak_bw: %u\n",
+		total_avg, total_peak);
+
+	return icc_set_bw(core->video_path, total_avg, total_peak);
+}
+
 int venus_helper_load_scale_clocks(struct venus_core *core)
 {
 	const struct freq_tbl *table = core->res->freq_tbl;
@@ -431,10 +491,15 @@ int venus_helper_load_scale_clocks(struct venus_core *core)
 	if (ret)
 		goto err;
 
+	ret = load_scale_bw(core);
+	if (ret)
+		goto err;
+
 	return 0;
 
 err:
-	dev_err(dev, "failed to set clock rate %lu (%d)\n", freq, ret);
+	dev_err(dev, "failed to set clock rate %lu or bandwidth (%d)\n",
+		freq, ret);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(venus_helper_load_scale_clocks);
-- 
2.17.1

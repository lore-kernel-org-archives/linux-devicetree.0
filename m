Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 2/2] i2c: Add Qualcomm CCI I2C driver
Date: Mon,  6 Aug 2018 16:34:16 +0530
Message-Id: <20180806110416.4288-3-vkoul@kernel.org>
In-Reply-To: <20180806110416.4288-1-vkoul@kernel.org>
References: <20180806110416.4288-1-vkoul@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>, Vinod Koul <vkoul@kernel.org>
List-ID: <devicetree@vger.kernel.org>

From: Todor Tomov <todor.tomov@linaro.org>

This commit adds I2C driver for the Camera Control Interface
(CCI) I2C controller found on the Qualcomm SoC processors.

CCI versions supported:
 - 1.0.8 - found on MSM8916/APQ8016
 - 1.4.0 - found on MSM8996/APQ8096

Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/i2c/busses/Kconfig        |  10 +
 drivers/i2c/busses/Makefile       |   1 +
 drivers/i2c/busses/i2c-qcom-cci.c | 814 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 825 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-qcom-cci.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 4f8df2ec87b1..033958bcdd4b 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -828,6 +828,16 @@ config I2C_PXA_SLAVE
 	  is necessary for systems where the PXA may be a target on the
 	  I2C bus.
 
+config I2C_QCOM_CCI
+	tristate "Qualcomm Camera Control Interface"
+	depends on ARCH_QCOM
+	help
+	  If you say yes to this option, support will be included for the
+	  built-in camera control interface on the Qualcomm SoCs.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-qcom-cci.
+
 config I2C_QUP
 	tristate "Qualcomm QUP based I2C controller"
 	depends on ARCH_QCOM
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 5a869144a0c5..d6e48ec3372a 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_I2C_PNX)		+= i2c-pnx.o
 obj-$(CONFIG_I2C_PUV3)		+= i2c-puv3.o
 obj-$(CONFIG_I2C_PXA)		+= i2c-pxa.o
 obj-$(CONFIG_I2C_PXA_PCI)	+= i2c-pxa-pci.o
+obj-$(CONFIG_I2C_QCOM_CCI)	+= i2c-qcom-cci.o
 obj-$(CONFIG_I2C_QUP)		+= i2c-qup.o
 obj-$(CONFIG_I2C_RIIC)		+= i2c-riic.o
 obj-$(CONFIG_I2C_RK3X)		+= i2c-rk3x.o
diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
new file mode 100644
index 000000000000..3459acd40ab0
--- /dev/null
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -0,0 +1,814 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
+// Copyright (c) 2017-18 Linaro Limited.
+
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define CCI_HW_VERSION				0x0
+#define CCI_RESET_CMD				0x004
+#define CCI_RESET_CMD_MASK			0x0f73f3f7
+#define CCI_RESET_CMD_M0_MASK			0x000003f1
+#define CCI_RESET_CMD_M1_MASK			0x0003f001
+#define CCI_QUEUE_START				0x008
+#define CCI_HALT_REQ				0x034
+#define CCI_HALT_REQ_I2C_M0_Q0Q1		BIT(0)
+#define CCI_HALT_REQ_I2C_M1_Q0Q1		BIT(1)
+
+#define CCI_I2C_Mm_SCL_CTL(m)			(0x100 + 0x100 * (m))
+#define CCI_I2C_Mm_SDA_CTL_0(m)			(0x104 + 0x100 * (m))
+#define CCI_I2C_Mm_SDA_CTL_1(m)			(0x108 + 0x100 * (m))
+#define CCI_I2C_Mm_SDA_CTL_2(m)			(0x10c + 0x100 * (m))
+#define CCI_I2C_Mm_MISC_CTL(m)			(0x110 + 0x100 * (m))
+
+#define CCI_I2C_Mm_READ_DATA(m)			(0x118 + 0x100 * (m))
+#define CCI_I2C_Mm_READ_BUF_LEVEL(m)		(0x11c + 0x100 * (m))
+#define CCI_I2C_Mm_Qn_EXEC_WORD_CNT(m, n)	(0x300 + 0x200 * (m) + 0x100 * (n))
+#define CCI_I2C_Mm_Qn_CUR_WORD_CNT(m, n)	(0x304 + 0x200 * (m) + 0x100 * (n))
+#define CCI_I2C_Mm_Qn_CUR_CMD(m, n)		(0x308 + 0x200 * (m) + 0x100 * (n))
+#define CCI_I2C_Mm_Qn_REPORT_STATUS(m, n)	(0x30c + 0x200 * (m) + 0x100 * (n))
+#define CCI_I2C_Mm_Qn_LOAD_DATA(m, n)		(0x310 + 0x200 * (m) + 0x100 * (n))
+
+#define CCI_IRQ_GLOBAL_CLEAR_CMD		0xc00
+#define CCI_IRQ_MASK_0				0xc04
+#define CCI_IRQ_MASK_0_I2C_M0_RD_DONE		BIT(0)
+#define CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT		BIT(4)
+#define CCI_IRQ_MASK_0_I2C_M0_Q1_REPORT		BIT(8)
+#define CCI_IRQ_MASK_0_I2C_M1_RD_DONE		BIT(12)
+#define CCI_IRQ_MASK_0_I2C_M1_Q0_REPORT		BIT(16)
+#define CCI_IRQ_MASK_0_I2C_M1_Q1_REPORT		BIT(20)
+#define CCI_IRQ_MASK_0_RST_DONE_ACK		BIT(24)
+#define CCI_IRQ_MASK_0_I2C_M0_Q0Q1_HALT_ACK	BIT(25)
+#define CCI_IRQ_MASK_0_I2C_M1_Q0Q1_HALT_ACK	BIT(26)
+#define CCI_IRQ_MASK_0_I2C_M0_ERROR		0x18000ee6
+#define CCI_IRQ_MASK_0_I2C_M1_ERROR		0x60ee6000
+#define CCI_IRQ_CLEAR_0				0xc08
+#define CCI_IRQ_STATUS_0			0xc0c
+#define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE		BIT(0)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT	BIT(4)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT	BIT(8)
+#define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE		BIT(12)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT	BIT(16)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT	BIT(20)
+#define CCI_IRQ_STATUS_0_RST_DONE_ACK		BIT(24)
+#define CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK	BIT(25)
+#define CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK	BIT(26)
+#define CCI_IRQ_STATUS_0_I2C_M0_ERROR		0x18000ee6
+#define CCI_IRQ_STATUS_0_I2C_M1_ERROR		0x60ee6000
+
+#define CCI_TIMEOUT_MS 100
+#define NUM_MASTERS 2
+#define NUM_QUEUES 2
+
+/* Max number of resources + 1 for a NULL terminator */
+#define CCI_RES_MAX 6
+
+enum cci_i2c_cmd {
+	CCI_I2C_SET_PARAM = 1,
+	CCI_I2C_WAIT,
+	CCI_I2C_WAIT_SYNC,
+	CCI_I2C_WAIT_GPIO_EVENT,
+	CCI_I2C_TRIG_I2C_EVENT,
+	CCI_I2C_LOCK,
+	CCI_I2C_UNLOCK,
+	CCI_I2C_REPORT,
+	CCI_I2C_WRITE,
+	CCI_I2C_READ,
+	CCI_I2C_WRITE_DISABLE_P,
+	CCI_I2C_READ_DISABLE_P,
+};
+
+enum {
+	I2C_MODE_STANDARD,
+	I2C_MODE_FAST,
+	I2C_MODE_FAST_PLUS,
+};
+
+enum cci_i2c_queue_t {
+	QUEUE_0,
+	QUEUE_1
+};
+
+struct cci_res {
+	char *clock[CCI_RES_MAX];
+	u32 clock_rate[CCI_RES_MAX];
+};
+
+struct hw_params {
+	u16 thigh;
+	u16 tlow;
+	u16 tsu_sto;
+	u16 tsu_sta;
+	u16 thd_dat;
+	u16 thd_sta;
+	u16 tbuf;
+	u8 scl_stretch_en;
+	u16 trdhld;
+	u16 tsp;
+};
+
+struct cci_clock {
+	struct clk *clk;
+	const char *name;
+	u32 freq;
+};
+
+struct cci;
+
+struct cci_master {
+	struct i2c_adapter adap;
+	u16 master;
+	u8 mode;
+	int status;
+	bool complete_pending;
+	struct completion irq_complete;
+	struct cci *cci;
+
+};
+
+struct cci_data {
+	unsigned int num_masters;
+	struct i2c_adapter_quirks quirks;
+	u16 queue_size[NUM_QUEUES];
+	struct cci_res res;
+	struct hw_params params[3];
+};
+
+struct cci {
+	struct device *dev;
+	void __iomem *base;
+	u32 irq;
+	const struct cci_data *data;
+	struct clk_bulk_data *clock;
+	u32 *clock_freq;
+	int nclocks;
+	struct cci_master master[NUM_MASTERS];
+};
+
+/**
+ * cci_clock_set_rate() - Set clock frequency rates
+ * @nclocks: Number of clocks
+ * @clock: Clock array
+ * @clock_freq: Clock frequency rate array
+ * @dev: Device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int cci_clock_set_rate(int nclocks, struct clk_bulk_data *clock,
+			      u32 *clock_freq, struct device *dev)
+{
+	int i, ret;
+	long rate;
+
+	for (i = 0; i < nclocks; i++)
+		if (clock_freq[i]) {
+			rate = clk_round_rate(clock[i].clk, clock_freq[i]);
+			if (rate < 0) {
+				dev_err(dev, "clk round rate failed: %ld\n",
+					rate);
+				return rate;
+			}
+
+			ret = clk_set_rate(clock[i].clk, clock_freq[i]);
+			if (ret < 0) {
+				dev_err(dev, "clk set rate failed: %d\n", ret);
+				return ret;
+			}
+		}
+
+	return 0;
+}
+
+static irqreturn_t cci_isr(int irq, void *dev)
+{
+	struct cci *cci = dev;
+	u32 val, reset = 0;
+
+	val = readl(cci->base + CCI_IRQ_STATUS_0);
+	writel(val, cci->base + CCI_IRQ_CLEAR_0);
+	writel(0x1, cci->base + CCI_IRQ_GLOBAL_CLEAR_CMD);
+
+	if (val & CCI_IRQ_STATUS_0_RST_DONE_ACK) {
+		if (cci->master[0].complete_pending) {
+			cci->master[0].complete_pending = false;
+			complete(&cci->master[0].irq_complete);
+		}
+
+		if (cci->master[1].complete_pending) {
+			cci->master[1].complete_pending = false;
+			complete(&cci->master[1].irq_complete);
+		}
+	}
+
+	if (val & CCI_IRQ_STATUS_0_I2C_M0_RD_DONE ||
+			val & CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT ||
+			val & CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT) {
+		cci->master[0].status = 0;
+		complete(&cci->master[0].irq_complete);
+	}
+
+	if (val & CCI_IRQ_STATUS_0_I2C_M1_RD_DONE ||
+			val & CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT ||
+			val & CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT) {
+		cci->master[1].status = 0;
+		complete(&cci->master[1].irq_complete);
+	}
+
+	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
+		cci->master[0].complete_pending = true;
+		reset = CCI_RESET_CMD_M0_MASK;
+	}
+
+	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK)) {
+		cci->master[1].complete_pending = true;
+		reset = CCI_RESET_CMD_M1_MASK;
+	}
+
+	if (unlikely(reset))
+		writel(reset, cci->base + CCI_RESET_CMD);
+
+	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_ERROR)) {
+		dev_err_ratelimited(cci->dev, "Master 0 error 0x%08x\n", val);
+		cci->master[0].status = -EIO;
+		writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ);
+	}
+
+	if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_ERROR)) {
+		dev_err_ratelimited(cci->dev, "Master 1 error 0x%08x\n", val);
+		cci->master[1].status = -EIO;
+		writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int cci_halt(struct cci *cci, u8 master_num)
+{
+	struct cci_master *master;
+	unsigned long time;
+	u32 val;
+
+	switch (master_num) {
+	case 0:
+		val = CCI_HALT_REQ_I2C_M0_Q0Q1;
+		master = &cci->master[0];
+		break;
+	case 1:
+		val = CCI_HALT_REQ_I2C_M1_Q0Q1;
+		master = &cci->master[1];
+		break;
+	default:
+		dev_err(cci->dev, "Invalid master:%d\n", master_num);
+		return -EINVAL;
+	}
+
+	master->complete_pending = true;
+	writel(val, cci->base + CCI_HALT_REQ);
+
+	time = wait_for_completion_timeout(&master->irq_complete,
+					   msecs_to_jiffies(CCI_TIMEOUT_MS));
+	if (!time) {
+		dev_err(cci->dev, "CCI halt timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int cci_reset(struct cci *cci)
+{
+	unsigned long time;
+
+	cci->master[0].complete_pending = true;
+	writel(CCI_RESET_CMD_MASK, cci->base + CCI_RESET_CMD);
+
+	time = wait_for_completion_timeout
+		(&cci->master[0].irq_complete,
+		 msecs_to_jiffies(CCI_TIMEOUT_MS));
+	if (!time) {
+		dev_err(cci->dev, "CCI reset timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int cci_init(struct cci *cci, const struct hw_params *hw)
+{
+	u32 val = CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
+			CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT |
+			CCI_IRQ_MASK_0_I2C_M0_Q1_REPORT |
+			CCI_IRQ_MASK_0_I2C_M1_RD_DONE |
+			CCI_IRQ_MASK_0_I2C_M1_Q0_REPORT |
+			CCI_IRQ_MASK_0_I2C_M1_Q1_REPORT |
+			CCI_IRQ_MASK_0_RST_DONE_ACK |
+			CCI_IRQ_MASK_0_I2C_M0_Q0Q1_HALT_ACK |
+			CCI_IRQ_MASK_0_I2C_M1_Q0Q1_HALT_ACK |
+			CCI_IRQ_MASK_0_I2C_M0_ERROR |
+			CCI_IRQ_MASK_0_I2C_M1_ERROR;
+	int i;
+
+	writel(val, cci->base + CCI_IRQ_MASK_0);
+
+	for (i = 0; i < cci->data->num_masters; i++) {
+		val = hw->thigh << 16 | hw->tlow;
+		writel(val, cci->base + CCI_I2C_Mm_SCL_CTL(i));
+
+		val = hw->tsu_sto << 16 | hw->tsu_sta;
+		writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_0(i));
+
+		val = hw->thd_dat << 16 | hw->thd_sta;
+		writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_1(i));
+
+		val = hw->tbuf;
+		writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_2(i));
+
+		val = hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
+		writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
+	}
+
+	return 0;
+}
+
+static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
+{
+	unsigned long time;
+	u32 val;
+	int ret;
+
+	val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
+	writel(val, cci->base + CCI_I2C_Mm_Qn_EXEC_WORD_CNT(master, queue));
+
+	val = BIT(master * 2 + queue);
+	writel(val, cci->base + CCI_QUEUE_START);
+
+	time = wait_for_completion_timeout(&cci->master[master].irq_complete,
+					   msecs_to_jiffies(CCI_TIMEOUT_MS));
+	if (!time) {
+		dev_err(cci->dev, "master %d queue %d timeout\n",
+			master, queue);
+
+		cci_halt(cci, master);
+
+		return -ETIMEDOUT;
+	}
+
+	ret = cci->master[master].status;
+	if (ret < 0)
+		dev_err(cci->dev, "master %d queue %d error %d\n",
+			master, queue, ret);
+
+	return ret;
+}
+
+static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
+{
+	int ret = 0;
+	u32 val;
+
+	val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
+
+	if (val == cci->data->queue_size[queue])
+		return -EINVAL;
+
+	if (val) {
+		val = CCI_I2C_REPORT | BIT(8);
+		writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
+
+		ret = cci_run_queue(cci, master, queue);
+	}
+
+	return ret;
+}
+
+static int cci_i2c_read(struct cci *cci, u16 master,
+			u16 addr, u8 *buf, u16 len)
+{
+	u32 val, words_read, words_exp;
+	u8 queue = QUEUE_1;
+	int i, index = 0, ret;
+	bool first = 0;
+
+	/*
+	 * Call validate queue to make sure queue is empty before starting.
+	 * This is to avoid overflow / underflow of queue.
+	 */
+	ret = cci_validate_queue(cci, master, queue);
+	if (ret < 0)
+		return ret;
+
+	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
+	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
+
+	val = CCI_I2C_READ | len << 4;
+	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
+
+	ret = cci_run_queue(cci, master, queue);
+	if (ret < 0)
+		return ret;
+
+	words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
+	words_exp = len / 4 + 1;
+	if (words_read != words_exp) {
+		dev_err(cci->dev, "words read = %d, words expected = %d\n",
+			words_read, words_exp);
+		return -EIO;
+	}
+
+	do {
+		val = readl(cci->base + CCI_I2C_Mm_READ_DATA(master));
+
+		for (i = 0; i < 4 && index < len; i++) {
+			if (first) {
+				first = false;
+				continue;
+			}
+			buf[index++] = (val >> (i * 8)) & 0xff;
+		}
+	} while (--words_read);
+
+	return 0;
+}
+
+static int cci_i2c_write(struct cci *cci, u16 master,
+			 u16 addr, u8 *buf, u16 len)
+{
+	u8 queue = QUEUE_0;
+	u8 load[12] = { 0 };
+	int i = 0, j, ret;
+	u32 val;
+
+	/*
+	 * Call validate queue to make sure queue is empty before starting.
+	 * This is to avoid overflow / underflow of queue.
+	 */
+	ret = cci_validate_queue(cci, master, queue);
+	if (ret < 0)
+		return ret;
+
+	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
+	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
+
+	load[i++] = CCI_I2C_WRITE | len << 4;
+
+	for (j = 0; j < len; j++)
+		load[i++] = buf[j];
+
+	for (j = 0; j < i; j += 4) {
+		val = load[j];
+		val |= load[j + 1] << 8;
+		val |= load[j + 2] << 16;
+		val |= load[j + 3] << 24;
+		writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
+	}
+
+	val = CCI_I2C_REPORT | BIT(8);
+	writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
+
+	return cci_run_queue(cci, master, queue);
+}
+
+static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+{
+	struct cci_master *cci_master = i2c_get_adapdata(adap);
+	struct cci *cci = cci_master->cci;
+	int i, ret = 0;
+
+	for (i = 0; i < num; i++) {
+		if (msgs[i].flags & I2C_M_RD)
+			ret = cci_i2c_read(cci, cci_master->master,
+					   msgs[i].addr, msgs[i].buf,
+					   msgs[i].len);
+		else
+			ret = cci_i2c_write(cci, msgs[i].addr,
+					    cci_master->master,
+					    msgs[i].buf, msgs[i].len);
+
+		if (ret < 0) {
+			dev_err(cci->dev, "cci i2c xfer error %d", ret);
+			break;
+		}
+	}
+
+	if (!ret)
+		ret = num;
+
+	return ret;
+}
+
+static u32 cci_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C;
+}
+
+static const struct i2c_algorithm cci_algo = {
+	.master_xfer	= cci_xfer,
+	.functionality	= cci_func,
+};
+
+static int cci_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *of_node;
+	struct resource *r;
+	struct cci *cci;
+	char name[16];
+	int ret = 0, i;
+	u32 val;
+
+	cci = devm_kzalloc(dev, sizeof(*cci), GFP_KERNEL);
+	if (!cci)
+		return -ENOMEM;
+
+	cci->dev = dev;
+	platform_set_drvdata(pdev, cci);
+	cci->data = device_get_match_data(&pdev->dev);
+	if (!cci->data) {
+		dev_err(&pdev->dev, "Driver data is null, abort\n");
+		return -EIO;
+	}
+
+	for (i = 0; i < cci->data->num_masters; i++) {
+		cci->master[i].adap.quirks = &cci->data->quirks;
+		cci->master[i].adap.algo = &cci_algo;
+		cci->master[i].adap.dev.parent = cci->dev;
+		cci->master[i].master = i;
+		cci->master[i].cci = cci;
+		i2c_set_adapdata(&cci->master[i].adap, cci);
+		snprintf(cci->master[i].adap.name,
+			 sizeof(cci->master[i].adap.name),
+			 "Qualcomm Camera Control Interface: %d", i);
+
+		/* find the child node for i2c-bus as we are on cci node */
+		snprintf(name, sizeof(name), "i2c-bus%d", i);
+		of_node = of_get_child_by_name(dev->of_node, name);
+		if (!of_node) {
+			dev_err(dev, "couldn't find i2cbus child node\n");
+			return -EINVAL;
+		}
+		cci->master[i].adap.dev.of_node = of_node;
+
+		cci->master[i].mode = I2C_MODE_STANDARD;
+		ret = of_property_read_u32(of_node, "clock-frequency", &val);
+		if (!ret) {
+			if (val == 400000)
+				cci->master[i].mode = I2C_MODE_FAST;
+			else if (val == 1000000)
+				cci->master[i].mode = I2C_MODE_FAST_PLUS;
+		}
+
+		init_completion(&cci->master[i].irq_complete);
+	}
+
+	/* Memory */
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	cci->base = devm_ioremap_resource(dev, r);
+	if (IS_ERR(cci->base)) {
+		dev_err(dev, "could not map memory\n");
+		return PTR_ERR(cci->base);
+	}
+
+	/* Interrupt */
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0) {
+		dev_err(dev, "missing IRQ: %d\n", ret);
+		return ret;
+	}
+	cci->irq = ret;
+
+	ret = devm_request_irq(dev, cci->irq, cci_isr,
+			       IRQF_TRIGGER_RISING, dev_name(dev), cci);
+	if (ret < 0) {
+		dev_err(dev, "request_irq failed, ret: %d\n", ret);
+		return ret;
+	}
+
+	disable_irq(cci->irq);
+
+	/* Clocks */
+
+	cci->nclocks = 0;
+	while (cci->data->res.clock[cci->nclocks])
+		cci->nclocks++;
+
+	cci->clock = devm_kcalloc(dev, cci->nclocks,
+				  sizeof(*cci->clock), GFP_KERNEL);
+	if (!cci->clock)
+		return -ENOMEM;
+
+	cci->clock_freq = devm_kcalloc(dev, cci->nclocks,
+				       sizeof(*cci->clock_freq), GFP_KERNEL);
+	if (!cci->clock_freq)
+		return -ENOMEM;
+
+	for (i = 0; i < cci->nclocks; i++) {
+		struct clk_bulk_data *clock = &cci->clock[i];
+
+		clock->clk = devm_clk_get(dev, cci->data->res.clock[i]);
+		if (IS_ERR(clock->clk))
+			return PTR_ERR(clock->clk);
+
+		clock->id = cci->data->res.clock[i];
+		cci->clock_freq[i] = cci->data->res.clock_rate[i];
+	}
+
+	ret = cci_clock_set_rate(cci->nclocks, cci->clock,
+				 cci->clock_freq, dev);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(cci->nclocks, cci->clock);
+	if (ret < 0)
+		return ret;
+
+	val = readl_relaxed(cci->base + CCI_HW_VERSION);
+	dev_dbg(dev, "%s: CCI HW version = 0x%08x", __func__, val);
+
+	enable_irq(cci->irq);
+
+	ret = cci_reset(cci);
+	if (ret < 0)
+		goto error;
+
+	for (i = 0; i < cci->data->num_masters; i++) {
+		ret = cci_init(cci, &cci->data->params[cci->master[i].mode]);
+		if (ret < 0)
+			goto error;
+
+		ret = i2c_add_adapter(&cci->master[i].adap);
+		if (ret < 0)
+			goto error_i2c;
+	}
+
+	return 0;
+
+error_i2c:
+	for (; i >= 0; i--)
+		i2c_del_adapter(&cci->master[i].adap);
+error:
+	disable_irq(cci->irq);
+	clk_bulk_disable_unprepare(cci->nclocks, cci->clock);
+
+	return ret;
+}
+
+static int cci_remove(struct platform_device *pdev)
+{
+	struct cci *cci = platform_get_drvdata(pdev);
+	int i;
+
+	disable_irq(cci->irq);
+	clk_bulk_disable_unprepare(cci->nclocks, cci->clock);
+
+	for (i = 0; i < cci->data->num_masters; i++)
+		i2c_del_adapter(&cci->master[i].adap);
+
+	return 0;
+}
+
+static const struct cci_data cci_v1_0_8_data = {
+	.num_masters = 1,
+	.queue_size = { 64, 16 },
+	.quirks = {
+		.max_write_len = 10,
+		.max_read_len = 12,
+	},
+	.res = {
+		.clock = {
+			"camss_top_ahb",
+			"cci_ahb",
+			"camss_ahb",
+			"cci"
+		},
+		.clock_rate = {
+			0,
+			80000000,
+			0,
+			19200000
+		},
+	},
+	.params = {
+		{
+			/* I2C_MODE_STANDARD */
+			.thigh = 78,
+			.tlow = 114,
+			.tsu_sto = 28,
+			.tsu_sta = 28,
+			.thd_dat = 10,
+			.thd_sta = 77,
+			.tbuf = 118,
+			.scl_stretch_en = 0,
+			.trdhld = 6,
+			.tsp = 1
+		},
+		{
+			/* I2C_MODE_FAST */
+			.thigh = 20,
+			.tlow = 28,
+			.tsu_sto = 21,
+			.tsu_sta = 21,
+			.thd_dat = 13,
+			.thd_sta = 18,
+			.tbuf = 32,
+			.scl_stretch_en = 0,
+			.trdhld = 6,
+			.tsp = 3
+		},
+	},
+};
+
+static const struct cci_data cci_v1_4_0_data = {
+	.num_masters = 2,
+	.queue_size = { 64, 16 },
+	.quirks = {
+		.max_write_len = 11,
+		.max_read_len = 12,
+	},
+	.res = {
+		.clock = {
+			"camss_top_ahb",
+			"cci_ahb",
+			"camss_ahb",
+			"cci"
+		},
+		.clock_rate = {
+			0,
+			0,
+			0,
+			37500000
+		},
+	},
+	.params = {
+		{
+			/* I2C_MODE_STANDARD */
+			.thigh = 201,
+			.tlow = 174,
+			.tsu_sto = 204,
+			.tsu_sta = 231,
+			.thd_dat = 22,
+			.thd_sta = 162,
+			.tbuf = 227,
+			.scl_stretch_en = 0,
+			.trdhld = 6,
+			.tsp = 3
+		},
+		{
+			/* I2C_MODE_FAST */
+			.thigh = 38,
+			.tlow = 56,
+			.tsu_sto = 40,
+			.tsu_sta = 40,
+			.thd_dat = 22,
+			.thd_sta = 35,
+			.tbuf = 62,
+			.scl_stretch_en = 0,
+			.trdhld = 6,
+			.tsp = 3
+		},
+		{
+			/* I2C_MODE_FAST_PLUS */
+			.thigh = 16,
+			.tlow = 22,
+			.tsu_sto = 17,
+			.tsu_sta = 18,
+			.thd_dat = 16,
+			.thd_sta = 15,
+			.tbuf = 24,
+			.scl_stretch_en = 0,
+			.trdhld = 3,
+			.tsp = 3
+		}
+
+	},
+
+};
+
+static const struct of_device_id cci_dt_match[] = {
+	{ .compatible = "qcom,cci-v1.0.8", .data = &cci_v1_0_8_data },
+	{ .compatible = "qcom,cci-v1.4.0", .data = &cci_v1_4_0_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cci_dt_match);
+
+static struct platform_driver qcom_cci_driver = {
+	.probe  = cci_probe,
+	.remove = cci_remove,
+	.driver = {
+		.name = "i2c-qcom-cci",
+		.of_match_table = cci_dt_match,
+	},
+};
+
+module_platform_driver(qcom_cci_driver);
+
+MODULE_DESCRIPTION("Qualcomm Camera Control Interface driver");
+MODULE_AUTHOR("Todor Tomov <todor.tomov@linaro.org>");
+MODULE_LICENSE("GPL v2");
-- 
2.14.4

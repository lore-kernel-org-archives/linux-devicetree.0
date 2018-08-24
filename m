Return-Path: <SRS0=RiwX=LH=bwave.cc=wulina@kernel.org>
Message-ID: <5b7fc28b.1c69fb81.1b089.1a23SMTPIN_ADDED_BROKEN@mx.google.com>
Date: Fri, 24 Aug 2018 16:30:13 +0800
From: "=?gb2312?B?zuLA9sTI?=" <wulina@bwave.cc>
Subject: [PATCH] media: platform: rcar-dab: add the dab module driver for renesas r8a77965.
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
To: robh+dt <robh+dt@kernel.org>, "mark.rutland" <mark.rutland@arm.com>, "catalin.marinas" <catalin.marinas@arm.com>, "will.deacon" <will.deacon@arm.com>, mturquette <mturquette@baylibre.com>, sboyd <sboyd@codeaurora.org>, mchehab <mchehab@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>, linux-renesas-soc <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-media <linux-media@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

This patch adds dab driver in order to provide the dab related interfaces.
It contains fft, fic and msc sub-modules.

Signed-off-by: wulina <wulina@bwave.cc>
---
 .../devicetree/bindings/media/renesas,dab.txt      |  20 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   9 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |   1 +
 drivers/media/platform/Kconfig                     |  11 +
 drivers/media/platform/Makefile                    |   2 +
 drivers/media/platform/rcar-dab/Makefile           |   2 +
 drivers/media/platform/rcar-dab/dabdev.c           | 453 +++++++++++++++++++++
 drivers/media/platform/rcar-dab/dabdev.h           |  44 ++
 drivers/media/platform/rcar-dab/rcar_dab.c         | 166 ++++++++
 drivers/media/platform/rcar-dab/rcar_dab.h         | 146 +++++++
 10 files changed, 854 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/renesas,dab.txt
 create mode 100644 drivers/media/platform/rcar-dab/Makefile
 create mode 100644 drivers/media/platform/rcar-dab/dabdev.c
 create mode 100644 drivers/media/platform/rcar-dab/dabdev.h
 create mode 100644 drivers/media/platform/rcar-dab/rcar_dab.c
 create mode 100644 drivers/media/platform/rcar-dab/rcar_dab.h

diff --git a/Documentation/devicetree/bindings/media/renesas,dab.txt b/Documentation/devicetree/bindings/media/renesas,dab.txt
new file mode 100644
index 0000000..ad9c2d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/renesas,dab.txt
@@ -0,0 +1,20 @@
+Renesas R-Car Gen3 DAB hardware accelerator (DAB)
+------------------------------------------------------------
+Bindings, specific for this driver:
+ - compatible: Should be "renesas,sh-mobile-ceu"
+ - reg: register base and size.
+ - interrupts: associated with that channel.
+ - clocks: phandle and clock specifier of that channel.
+ - clock-names: clock input name string: "dabclk".
+ - status: the status of the driver.
+
+Example:
+
+dab0:dab@e6730000{
+	compatible = "renesas,dab";
+	reg = <0 0xe6730000 0 0x10C>;
+	interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&cpg CPG_MOD 1016>;
+	clock-names = "dabclk";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 4de8e13..cdb6b70 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2531,5 +2531,14 @@
 				};
 			};
 		};
+
+		dab0:dab@e6730000{
+			compatible = "renesas,dab";
+			reg = <0 0xe6730000 0 0x10C>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1016>;
+			clock-names = "dabclk";
+			status = "okay";
+		};
 	};
 };
diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 2db24f3..a9ba636 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -227,6 +227,7 @@ static const struct mssr_mod_clk r8a77965_mod_clks[] __initconst = {
 	DEF_MOD("ssi2",			1013,	MOD_CLK_ID(1005)),
 	DEF_MOD("ssi1",			1014,	MOD_CLK_ID(1005)),
 	DEF_MOD("ssi0",			1015,	MOD_CLK_ID(1005)),
+	DEF_MOD("dab0",			1016,	R8A77965_CLK_S3D2),
 	DEF_MOD("scu-all",		1017,	R8A77965_CLK_S3D4),
 	DEF_MOD("scu-dvc1",		1018,	MOD_CLK_ID(1017)),
 	DEF_MOD("scu-dvc0",		1019,	MOD_CLK_ID(1017)),
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 7f2eb2c..226c6b7 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -151,6 +151,17 @@ source "drivers/media/platform/xilinx/Kconfig"
 source "drivers/media/platform/rcar-vin/Kconfig"
 source "drivers/media/platform/atmel/Kconfig"
 
+config RCAR_DAB
+	tristate "RCAR M3N DAB hardware accelerator module support"
+	depends on ARCH_R8A77965
+	default n
+	---help---
+	  This module makes the DAB hardware accelerator interface available
+	  that contains fft, fic and msc sub-modules.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called rcar-dab.
+
 config VIDEO_TI_CAL
 	tristate "TI CAL (Camera Adaptation Layer) driver"
 	depends on VIDEO_DEV && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 327f80a..8e001e9 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -74,6 +74,8 @@ obj-$(CONFIG_VIDEO_RCAR_VIN)		+= rcar-vin/
 obj-$(CONFIG_VIDEO_ATMEL_ISC)		+= atmel/
 obj-$(CONFIG_VIDEO_ATMEL_ISI)		+= atmel/
 
+obj-$(CONFIG_RCAR_DAB)  += rcar-dab/
+
 obj-$(CONFIG_VIDEO_STM32_DCMI)		+= stm32/
 
 ccflags-y += -I$(srctree)/drivers/media/i2c
diff --git a/drivers/media/platform/rcar-dab/Makefile b/drivers/media/platform/rcar-dab/Makefile
new file mode 100644
index 0000000..216412f
--- /dev/null
+++ b/drivers/media/platform/rcar-dab/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_RCAR_DAB)	+= dab.o
+dab-objs			:= rcar_dab.o dabdev.o
diff --git a/drivers/media/platform/rcar-dab/dabdev.c b/drivers/media/platform/rcar-dab/dabdev.c
new file mode 100644
index 0000000..6f5a684
--- /dev/null
+++ b/drivers/media/platform/rcar-dab/dabdev.c
@@ -0,0 +1,453 @@
+/*
+ * Driver for Renesas R-Car DAB
+ *
+ * Copyright (C) 2018 Bwave Technology Co.,Ltd.
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/mutex.h>
+#include <linux/uaccess.h>
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <asm/irq.h>
+#include <linux/interrupt.h>
+#include <linux/dma-mapping.h>
+#include "rcar_dab.h"
+#include "dabdev.h"
+
+static struct dab_device *dab_dev;
+static struct class *dab_class;
+static int dab_major = -1;
+
+static void dab_device_init(struct dab_device *dabdev)
+{
+	mutex_init(&dabdev->lock);
+	init_waitqueue_head(&dabdev->wait);
+}
+
+static irqreturn_t dab_interrupt(int irq, void *dev_instance)
+{
+	struct dab_device *dabdev = (struct dab_device *)dev_instance;
+	int handled = 0;
+
+	mutex_lock(&dabdev->lock);
+	if (dabdev->status == FFT_START) {
+		if (rcar_dab_check(dabdev->regs, DAB_FFT_MASK) == 0)
+			dabdev->status = FFT_END;
+	}
+	if (dabdev->status == FIC_START) {
+		if (rcar_dab_check(dabdev->regs, DAB_FIC_MASK) == 0)
+			dabdev->status = FIC_END;
+	}
+	if (dabdev->status == MSC_START) {
+		if (rcar_dab_check(dabdev->regs, DAB_MSC_MASK) == 0)
+			dabdev->status = MSC_END;
+	}
+	wake_up_interruptible(&dabdev->wait);
+	mutex_unlock(&dabdev->lock);
+
+	return IRQ_RETVAL(handled);
+}
+
+static int dab_open(struct inode *inode, struct file *file)
+{
+	int ret = 0;
+
+	ret = clk_prepare_enable(dab_dev->dabclk);
+	if (ret) {
+		dev_err(dab_dev->dev,
+			"[%s]:clk_prepare_enable error!\n", __func__);
+		return ret;
+	}
+
+	ret = request_irq(dab_dev->irq,
+				dab_interrupt, IRQF_SHARED,
+				DEVICE_NAME, dab_dev);
+	if (ret) {
+		dev_err(dab_dev->dev,
+			"[%s]:Error requesting IRQ!\n", __func__);
+		return ret;
+	}
+	file->private_data = dab_dev;
+
+	return ret;
+}
+
+static int dab_close(struct inode *inode, struct file *file)
+{
+	struct dab_device *dabdev = file->private_data;
+
+	free_irq(dabdev->irq, dabdev);
+
+	clk_disable_unprepare(dabdev->dabclk);
+
+	return 0;
+}
+
+static int dab_data_handler(struct dab_device *dabdev,
+				enum dab_status out_status)
+{
+	long timeout;
+
+	timeout = wait_event_interruptible_timeout(dabdev->wait,
+				dabdev->status == out_status,
+				msecs_to_jiffies(DAB_TIMEOUT));
+	if (!timeout) {
+		dev_err(dabdev->dev, "[%s]:error %d %d!\n",
+			__func__, out_status, dabdev->status);
+		return -EIO;
+	}
+	return 0;
+}
+
+static int dab_fft(struct dab_fft_req __user *fft_req,
+			struct dab_device *dabdev)
+{
+	int ret = 0;
+
+	dma_addr_t in_addr, out_addr;
+
+	dabdev->in_buf = dma_alloc_coherent(dabdev->dev->parent,
+						fft_req->in_len,
+						&in_addr,
+						GFP_KERNEL);
+	if (dabdev->in_buf == NULL) {
+		dev_err(dabdev->dev,
+			"[%s]:dma_alloc_coherent error!\n", __func__);
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	dabdev->out_buf = dma_alloc_coherent(dabdev->dev->parent,
+						fft_req->out_len,
+						&out_addr,
+						GFP_KERNEL);
+	if (dabdev->out_buf == NULL) {
+		dev_err(dabdev->dev,
+			"[%s]:dma_alloc_coherent error!\n", __func__);
+		ret = -ENOMEM;
+		goto error;
+	}
+	if (copy_from_user(dabdev->in_buf, fft_req->in_buf, fft_req->in_len)) {
+		dev_err(dabdev->dev, "[%s]:copy_from_user error!\n", __func__);
+		ret = -EFAULT;
+		goto error;
+	}
+	rcar_dab_fft_init(dabdev->regs, in_addr, out_addr, fft_req);
+	rcar_dab_fft_start(dabdev->regs);
+	ret = dab_data_handler(dabdev, FFT_END);
+	if (copy_to_user(fft_req->out_buf, dabdev->out_buf, fft_req->out_len)) {
+		dev_err(dabdev->dev, "[%s]:copy_to_user error!\n", __func__);
+		ret = -EFAULT;
+		goto error;
+	}
+	rcar_dab_fft_stop(dabdev->regs);
+	if (ret < 0) {
+		dev_err(dabdev->dev,
+			"[%s]:rcar_dab_fft_stop error!\n", __func__);
+		goto error;
+	}
+
+error:
+	if (dabdev->in_buf)
+		dma_free_coherent(dabdev->dev->parent,
+					fft_req->in_len,
+					dabdev->in_buf,
+					in_addr);
+	if (dabdev->out_buf)
+		dma_free_coherent(dabdev->dev->parent,
+					fft_req->out_len,
+					dabdev->out_buf,
+					out_addr);
+	return ret;
+}
+
+static int dab_fic(struct dab_fic_req __user *fic_req,
+			struct dab_device *dabdev)
+{
+	int ret = 0;
+	int get_len = 0;
+	unsigned char crc_status = 0;
+	dma_addr_t in_addr, out_addr;
+
+	dabdev->in_buf = dma_alloc_coherent(dabdev->dev->parent,
+						fic_req->in_len,
+						&in_addr,
+						GFP_KERNEL);
+	if (dabdev->in_buf == NULL) {
+		dev_err(dabdev->dev,
+			"[%s]:dma_alloc_coherent error!\n", __func__);
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	dabdev->out_buf = dma_alloc_coherent(dabdev->dev->parent,
+						fic_req->out_len,
+						&out_addr,
+						GFP_KERNEL);
+	if (dabdev->out_buf == NULL) {
+		dev_err(dabdev->dev,
+			"[%s]:dma_alloc_coherent error!\n", __func__);
+		ret = -ENOMEM;
+		goto error;
+	}
+	if (copy_from_user(dabdev->in_buf, fic_req->in_buf, fic_req->in_len)) {
+		dev_err(dabdev->dev, "[%s]:copy_from_user error!\n", __func__);
+		ret = -EFAULT;
+		goto error;
+	}
+	rcar_dab_fic_init(dabdev->regs, in_addr, out_addr, fic_req);
+	rcar_dab_fic_start(dabdev->regs);
+	ret = dab_data_handler(dabdev, FIC_END);
+	rcar_dab_fic_stop(dabdev->regs);
+	if (ret < 0) {
+		dev_err(dabdev->dev,
+			"[%s]:rcar_dab_fic_stop error!\n", __func__);
+		goto error;
+	}
+	rcar_dab_get_result(dabdev->regs, &get_len, &crc_status);
+	put_user(get_len, &fic_req->get_len);
+	put_user(crc_status, &fic_req->crc_sta);
+	if ((get_len == 0) || (crc_status == 1)) {
+		dev_err(dabdev->dev,
+			"[%s]:error!len:%d, status: %d\n",
+			__func__, get_len, crc_status);
+		ret = -EIO;
+		goto error;
+	}
+	if (copy_to_user(fic_req->out_buf, dabdev->out_buf, fic_req->get_len)) {
+		dev_err(dabdev->dev, "[%s]:copy_to_user error!\n", __func__);
+		ret = -EFAULT;
+		goto error;
+	}
+error:
+	if (dabdev->in_buf)
+		dma_free_coherent(dabdev->dev->parent,
+					fic_req->in_len,
+					dabdev->in_buf,
+					in_addr);
+	if (dabdev->out_buf)
+		dma_free_coherent(dabdev->dev->parent,
+					fic_req->out_len,
+					dabdev->out_buf,
+					out_addr);
+	return ret;
+}
+
+static int dab_msc(struct dab_msc_req __user *msc_req,
+			struct dab_device *dabdev)
+{
+	int ret = 0;
+	int get_len;
+	dma_addr_t in_addr, out_addr;
+
+	dabdev->in_buf = dma_alloc_coherent(dabdev->dev->parent,
+						msc_req->in_len,
+						&in_addr,
+						GFP_KERNEL);
+	if (dabdev->in_buf == NULL) {
+		dev_err(dabdev->dev,
+			"[%s]:dma_alloc_coherent error!\n", __func__);
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	dabdev->out_buf = dma_alloc_coherent(dabdev->dev->parent,
+						msc_req->out_len,
+						&out_addr,
+						GFP_KERNEL);
+	if (dabdev->out_buf == NULL) {
+		dev_err(dabdev->dev,
+			"[%s]:dma_alloc_coherent error!\n", __func__);
+		ret = -ENOMEM;
+		goto error;
+	}
+	if (copy_from_user(dabdev->in_buf, msc_req->in_buf, msc_req->in_len)) {
+		dev_err(dabdev->dev, "[%s]:copy_from_user error!\n", __func__);
+		ret = -EFAULT;
+		goto error;
+	}
+	rcar_dab_msc_init(dabdev->regs, in_addr, out_addr, msc_req);
+	rcar_dab_msc_start(dabdev->regs);
+	ret = dab_data_handler(dabdev, MSC_END);
+	rcar_dab_msc_stop(dabdev->regs);
+	if (ret < 0) {
+		dev_err(dabdev->dev,
+			"[%s]:rcar_dab_msc_stop error!\n", __func__);
+		goto error;
+	}
+	rcar_dab_get_result(dabdev->regs, &get_len, NULL);
+	put_user(get_len, &msc_req->get_len);
+	if (get_len == 0) {
+		dev_err(dabdev->dev, "[%s]:error!len:%d\n", __func__, get_len);
+		ret = -EIO;
+		goto error;
+	}
+	if (copy_to_user(msc_req->out_buf, dabdev->out_buf, msc_req->get_len)) {
+		dev_err(dabdev->dev, "[%s]:copy_to_user error!\n", __func__);
+		ret = -EFAULT;
+		goto error;
+	}
+error:
+	if (dabdev->in_buf)
+		dma_free_coherent(dabdev->dev->parent,
+					msc_req->in_len,
+					dabdev->in_buf,
+					in_addr);
+	if (dabdev->out_buf)
+		dma_free_coherent(dabdev->dev->parent,
+					msc_req->out_len,
+					dabdev->out_buf,
+					out_addr);
+	return ret;
+}
+
+static long dab_unlocked_ioctl(struct file *file, u_int cmd, u_long arg)
+{
+	void __user *argp = (void __user *)arg;
+	struct dab_device *dabdev = file->private_data;
+	int ret = 0;
+
+	switch (cmd) {
+	case DAB_IOC_FFT:
+		mutex_lock(&dabdev->lock);
+		dabdev->status = FFT_START;
+		mutex_unlock(&dabdev->lock);
+		ret = dab_fft(argp, dabdev);
+		break;
+	case DAB_IOC_FIC:
+		mutex_lock(&dabdev->lock);
+		dabdev->status = FIC_START;
+		mutex_unlock(&dabdev->lock);
+		ret = dab_fic(argp, dabdev);
+		break;
+	case DAB_IOC_MSC:
+		mutex_lock(&dabdev->lock);
+		dabdev->status = MSC_START;
+		mutex_unlock(&dabdev->lock);
+		ret = dab_msc(argp, dabdev);
+		break;
+	default:
+		ret = -ENOTTY;
+	}
+
+	return ret;
+}
+
+static const struct file_operations dab_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= dab_unlocked_ioctl,
+	.open		= dab_open,
+	.release	= dab_close,
+};
+
+static int dab_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *mem;
+	void __iomem *addr;
+
+	dab_dev = kzalloc(sizeof(*dab_dev), GFP_KERNEL);
+	if (!dab_dev)
+		return -ENOMEM;
+
+	memset(dab_dev, 0, sizeof(struct dab_device));
+
+	dab_dev->dabclk = clk_get(dev, "dabclk");
+	if (!dab_dev->dabclk) {
+		dev_err(&pdev->dev, "[%s]:devm_clk_get error!\n", __func__);
+		kfree(dab_dev);
+		return -ENOMEM;
+	}
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem) {
+		dev_err(&pdev->dev,
+			"[%s]:platform_get_resource error!\n", __func__);
+		kfree(dab_dev);
+		return -ENOMEM;
+	}
+	addr = ioremap(mem->start, (mem->end - mem->start + 1));
+	if (addr)
+		dab_dev->regs = addr;
+	else{
+		dev_err(&pdev->dev, "[%s]:map error!\n", __func__);
+		kfree(dab_dev);
+		return -ENOMEM;
+	}
+
+	dab_dev->irq = platform_get_irq(pdev, 0);
+	if (dab_dev->irq < 0) {
+		dev_err(&pdev->dev, "[%s]:No IRQ resource\n", __func__);
+		iounmap(dab_dev->regs);
+		kfree(dab_dev);
+		return dab_dev->irq;
+	}
+
+	dab_major = register_chrdev(0, DEVICE_NAME, &dab_fops);
+	if (dab_major < 0) {
+		dev_err(&pdev->dev,
+			"Can't allocate major number %d for DAB\n", dab_major);
+		iounmap(dab_dev->regs);
+		kfree(dab_dev);
+		return dab_major;
+	}
+
+	dab_class = class_create(THIS_MODULE, DEVICE_NAME);
+	if (IS_ERR(dab_class)) {
+		dev_err(&pdev->dev, "class_create %s error!\n", DEVICE_NAME);
+		unregister_chrdev(dab_major, DEVICE_NAME);
+		iounmap(dab_dev->regs);
+		kfree(dab_dev);
+		return PTR_ERR(dab_class);
+	}
+
+	dab_dev->dev = device_create(dab_class,
+					dev, MKDEV(dab_major, 0),
+					NULL, DEVICE_NAME);
+
+	dab_device_init(dab_dev);
+
+	return 0;
+}
+
+static int dab_remove(struct platform_device *pdev)
+{
+	device_destroy(dab_class, MKDEV(dab_major, 0));
+	class_destroy(dab_class);
+	unregister_chrdev(dab_major, DEVICE_NAME);
+	iounmap(dab_dev->regs);
+	kfree(dab_dev);
+	return 0;
+}
+
+static const struct of_device_id dab_dt_ids[] = {
+	{ .compatible = "renesas,dab" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, dab_dt_ids);
+
+static struct platform_driver dab_driver = {
+	.probe = dab_probe,
+	.remove = dab_remove,
+	.driver = {
+		.name		= DEVICE_NAME,
+		.owner		= THIS_MODULE,
+		.of_match_table = dab_dt_ids,
+	},
+};
+module_platform_driver(dab_driver);
+MODULE_DESCRIPTION("DAB Driver");
+MODULE_LICENSE("GPL");
+
diff --git a/drivers/media/platform/rcar-dab/dabdev.h b/drivers/media/platform/rcar-dab/dabdev.h
new file mode 100644
index 0000000..33bf5ae
--- /dev/null
+++ b/drivers/media/platform/rcar-dab/dabdev.h
@@ -0,0 +1,44 @@
+/*
+ * Driver for Renesas R-Car DAB
+ *
+ * Copyright (C) 2018 Bwave Technology Co.,Ltd.
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#ifndef	_DAB_DEV_H_
+#define	_DAB_DEV_H_
+
+#define	DAB_DMA
+#define	DEVICE_NAME		"rcar-dab"
+#define	DAB_TIMEOUT		1000 /* Timeout in 1 seconds */
+
+#define	DAB_PHY_ADDR_IN	0xbfff0000
+#define	DAB_PHY_ADDR_OUT	0xbff00000
+
+enum dab_status {
+	FFT_START = 0,
+	FFT_END,
+	FIC_START,
+	FIC_END,
+	MSC_START,
+	MSC_END,
+};
+
+struct dab_device {
+	unsigned int			irq;
+	struct mutex			lock;
+	wait_queue_head_t		wait;
+	struct device			*dev;
+	enum dab_status			status;
+	struct clk			*dabclk;
+	struct rcar_dab_regs __iomem *regs;
+	unsigned char		*in_buf;
+	unsigned char		*out_buf;
+};
+
+
+#endif
diff --git a/drivers/media/platform/rcar-dab/rcar_dab.c b/drivers/media/platform/rcar-dab/rcar_dab.c
new file mode 100644
index 0000000..aa0fac9
--- /dev/null
+++ b/drivers/media/platform/rcar-dab/rcar_dab.c
@@ -0,0 +1,166 @@
+/*
+ * Driver for Renesas R-Car DAB
+ *
+ * Copyright (C) 2018 Bwave Technology Co.,Ltd.
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#include <linux/io.h>
+#include <linux/types.h>
+#include "rcar_dab.h"
+
+
+int rcar_dab_check_withtimeout(struct rcar_dab_regs *regs, unsigned int mask)
+{
+	unsigned int status = 0;
+	int timeout = 1000;
+
+	while (((status&mask) != mask) && timeout > 0) {
+		status = readl(&regs->intsr);
+		timeout--;
+	}
+	if (timeout == 0)
+		return -1;
+	return 0;
+}
+
+int rcar_dab_check(struct rcar_dab_regs *regs, unsigned int mask)
+{
+	unsigned int status = readl(&regs->intsr);
+	unsigned int intcr1 = readl(&regs->intcr1);
+
+	if (status & mask) {
+		writel(intcr1 | mask, &regs->intcr1);
+		writel(status & ~mask, &regs->intsr);
+		return 0;
+	} else
+		return -1;
+}
+
+void rcar_dab_get_result(struct rcar_dab_regs *regs,
+			unsigned int *get_len,  unsigned char *crc_status)
+{
+	if (get_len)
+		*get_len = readl(&regs->decoutlenr) & 0x1FFF;
+	if (crc_status)
+		*crc_status = readl(&regs->fibcrcsr) & 0x1;
+}
+
+void rcar_dab_enable_int(struct rcar_dab_regs *regs, unsigned int mask)
+{
+	unsigned int intcr1, status;
+
+	status = readl(&regs->intsr);
+	status &= ~mask;
+	writel(status, &regs->intsr);
+
+	intcr1 = readl(&regs->intcr1);
+	intcr1 &= ~mask;
+	writel(intcr1, &regs->intcr1);
+}
+
+void rcar_dab_disable_int(struct rcar_dab_regs *regs, unsigned int mask)
+{
+	unsigned int intcr1, status;
+
+	intcr1 = readl(&regs->intcr1);
+	intcr1 |= mask;
+	writel(intcr1, &regs->intcr1);
+
+	status = readl(&regs->intsr);
+	status &= ~mask;
+	writel(status, &regs->intsr);
+}
+
+void rcar_dab_fft_init(struct rcar_dab_regs *regs, unsigned int in_addr,
+			unsigned int out_addr, struct dab_fft_req *fft_req)
+{
+	writel(fft_req->mode, &regs->fftssr);
+
+	writel(fft_req->n_ofdm, &regs->fftnumofdmr);
+
+	writel(in_addr, &regs->fftinaddr);
+
+	writel(out_addr, &regs->fftoutaddr);
+}
+
+void rcar_dab_fft_start(struct rcar_dab_regs *regs)
+{
+	rcar_dab_enable_int(regs, DAB_FFT_MASK);
+
+	writel(1, &regs->fftcr);
+
+	writel(1, &regs->fftreqcr);
+}
+
+void rcar_dab_fft_stop(struct rcar_dab_regs *regs)
+{
+	rcar_dab_disable_int(regs, DAB_FFT_MASK);
+
+	writel(0, &regs->fftcr);
+}
+
+void rcar_dab_fic_init(struct rcar_dab_regs *regs, unsigned int in_addr,
+			unsigned int out_addr, struct dab_fic_req *fic_req)
+{
+	writel(fic_req->trans_mode, &regs->fecmsr1);
+
+	writel(fic_req->fic_msc_mode, &regs->fecmsr2);
+
+	writel(in_addr, &regs->ficinaddr);
+
+	writel(out_addr, &regs->ficoutaddr);
+
+	writel(fic_req->descr_bypscr, &regs->descr_bypscr);
+}
+
+void rcar_dab_fic_start(struct rcar_dab_regs *regs)
+{
+	rcar_dab_enable_int(regs, DAB_FIC_MASK);
+
+	writel(1, &regs->ficreqcr);
+}
+
+void rcar_dab_fic_stop(struct rcar_dab_regs *regs)
+{
+	rcar_dab_disable_int(regs, DAB_FIC_MASK);
+}
+
+void rcar_dab_msc_init(struct rcar_dab_regs *regs, unsigned int in_addr,
+			unsigned int out_addr, struct dab_msc_req *msc_req)
+{
+	writel(msc_req->trans_mode, &regs->fecmsr1);
+
+	writel(msc_req->fic_msc_mode, &regs->fecmsr2);
+
+	writel(in_addr, &regs->mscinaddr);
+
+	writel(out_addr, &regs->mscoutaddr);
+
+	writel(msc_req->descr_bypscr, &regs->descr_bypscr);
+
+	writel(msc_req->bitrate, &regs->fecbrcr);
+
+	writel(msc_req->prot_level, &regs->fecplcr);
+
+	writel(msc_req->ep_type, &regs->fecetcr);
+
+	writel(msc_req->sch_idx, &regs->schidxcr);
+}
+
+void rcar_dab_msc_start(struct rcar_dab_regs *regs)
+{
+	rcar_dab_enable_int(regs, DAB_MSC_MASK);
+
+	writel(1, &regs->mscreqcr);
+}
+
+void rcar_dab_msc_stop(struct rcar_dab_regs *regs)
+{
+	rcar_dab_disable_int(regs, DAB_MSC_MASK);
+}
+
diff --git a/drivers/media/platform/rcar-dab/rcar_dab.h b/drivers/media/platform/rcar-dab/rcar_dab.h
new file mode 100644
index 0000000..1c4db3e
--- /dev/null
+++ b/drivers/media/platform/rcar-dab/rcar_dab.h
@@ -0,0 +1,146 @@
+/*
+ * Driver for Renesas R-Car DAB
+ *
+ * Copyright (C) 2018 Bwave Technology Co.,Ltd.
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#ifndef	_RCAR_DAB_H_
+#define	_RCAR_DAB_H_
+
+#define DAB_FFT_MASK		0x1
+#define DAB_FIC_MASK		0x2
+#define DAB_MSC_MASK	0x4
+
+struct rcar_dab_regs {
+	unsigned int	fftcr;
+	unsigned int	fftssr;
+	unsigned int	reserved1;
+	unsigned int	fftreqcr;
+	unsigned int	fftinaddr;
+	unsigned int	fftoutaddr;
+	unsigned int	fftnumofdmr;
+	unsigned int	reserved2[9];
+	unsigned int	feccr;
+	unsigned int	fecmsr1;
+	unsigned int	fecmsr2;
+	unsigned int	fecbrcr;
+	unsigned int	fecplcr;
+	unsigned int	fecetcr;
+	unsigned int	ficreqcr;
+	unsigned int	ficinaddr;
+	unsigned int	ficoutaddr;
+	unsigned int	reserved3[7];
+	unsigned int	schcr;
+	unsigned int	mscreqcr;
+	unsigned int	mscinaddr;
+	unsigned int	mscoutaddr;
+	unsigned int	asfcr;
+	unsigned int	asfrstcr;
+	unsigned int	schidxcr;
+	unsigned int	descr_bypscr;
+	unsigned int	reserved4[8];
+	unsigned int	intsr;
+	unsigned int	intcr1;
+	unsigned int	reserved5[14];
+	unsigned int	fibcrcsr;
+	unsigned int	decoutlenr;
+	unsigned int	asfsyncsr;
+};
+
+enum dab_fft_modes {
+	DAB_FFT_MODE_256,
+	DAB_FFT_MODE_512,
+	DAB_FFT_MODE_1024,
+	DAB_FFT_MODE_2048,
+};
+
+enum dab_trans_mode {
+	DAB_TRANS_MODE_I = 1,
+	DAB_TRANS_MODE_II,
+	DAB_TRANS_MODE_III,
+	DAB_TRANS_MODE_IV,
+};
+
+enum dab_fic_msc_mode {
+	DAB_FIC_MODE,
+	DAB_MSC_MODE,
+};
+
+enum dab_prot_level {
+	DAB_PROT_LEVEL_EEP = 4,
+	DAB_PROT_LEVEL_UEP,
+};
+
+enum dab_ep_type {
+	DAB_EP_TYPE_UEP,
+	DAB_EP_TYPE_EEP_A,
+	DAB_EP_TYPE_EEP_B,
+};
+
+struct dab_fft_req {
+	enum dab_fft_modes	mode;
+	char		n_ofdm;
+	unsigned char	*in_buf;
+	unsigned char	*out_buf;
+	int		in_len;
+	int		out_len;
+};
+
+struct dab_fic_req {
+	enum dab_trans_mode	trans_mode;
+	enum dab_fic_msc_mode	fic_msc_mode;
+	unsigned char		descr_bypscr;
+	unsigned char		*in_buf;
+	unsigned char		*out_buf;
+	int			in_len;
+	int			out_len;
+	unsigned char		crc_sta;
+	unsigned int		get_len;
+};
+
+struct dab_msc_req {
+	enum dab_trans_mode	trans_mode;
+	enum dab_fic_msc_mode	fic_msc_mode;
+	enum dab_prot_level	prot_level;
+	enum dab_ep_type	ep_type;
+	unsigned char	descr_bypscr;
+	unsigned char	sch_idx;
+	unsigned short	bitrate;
+	unsigned char	*in_buf;
+	unsigned char	*out_buf;
+	int		in_len;
+	int		out_len;
+	unsigned int	get_len;
+};
+
+#define	DAB_IOC_MAGIC		'd'
+#define	DAB_IOC_MAXNR		255
+
+#define	DAB_IOC_FFT	_IOWR(DAB_IOC_MAGIC, 0, struct dab_fft_req *)
+#define	DAB_IOC_FIC	_IOWR(DAB_IOC_MAGIC, 1, struct dab_fic_req *)
+#define	DAB_IOC_MSC	_IOWR(DAB_IOC_MAGIC, 2, struct dab_msc_req *)
+
+int rcar_dab_check(struct rcar_dab_regs *regs, unsigned int mask);
+int rcar_dab_check_withtimeout(struct rcar_dab_regs *regs, unsigned int mask);
+void rcar_dab_get_result(struct rcar_dab_regs *regs,
+			unsigned int *get_len, unsigned char *crc_status);
+void rcar_dab_fft_init(struct rcar_dab_regs *regs, unsigned int in_addr,
+			unsigned int out_addr, struct dab_fft_req *fft_req);
+void rcar_dab_fft_start(struct rcar_dab_regs *regs);
+void rcar_dab_fft_stop(struct rcar_dab_regs *regs);
+void rcar_dab_fic_init(struct rcar_dab_regs *regs, unsigned int in_addr,
+			unsigned int out_addr, struct dab_fic_req *fic_req);
+void rcar_dab_fic_start(struct rcar_dab_regs *regs);
+void rcar_dab_fic_stop(struct rcar_dab_regs *regs);
+void rcar_dab_msc_init(struct rcar_dab_regs *regs, unsigned int in_addr,
+			unsigned int out_addr, struct dab_msc_req *msc_req);
+void rcar_dab_msc_start(struct rcar_dab_regs *regs);
+void rcar_dab_msc_stop(struct rcar_dab_regs *regs);
+void rcar_dab_fec_stop(struct rcar_dab_regs *regs);
+
+#endif
-- 
2.7.4

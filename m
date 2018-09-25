From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [RFC PATCH] soc: qcom: rmtfs_mem: Control remoteproc from rmtfs_mem
Date: Tue, 25 Sep 2018 01:06:07 -0700
Message-ID: <20180925080607.30565-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

rmtfs_mem provides access to physical storage and is crucial for the
operation of the Qualcomm modem subsystem.

The rmtfs_mem implementation must be available before the modem
subsystem is booted and a solution where the modem remoteproc will
verify that the rmtfs_mem is available has been discussed in the past.
But this would not handle the case where the rmtfs_mem provider is
restarted, which would cause fatal loss of access to the storage device
for the modem.

The suggestion is therefor to link the rmtfs_mem to its associated
remote processor instance and control it based on the availability of
the rmtfs_mem implementation.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

The currently implemented workaround in the Linaro QCOMLT releases is to
blacklist the qcom_q6v5_pil kernel module and load this explicitly after rmtfs
has been started.

With this patch the modem module can be loaded automatically by the
platform_bus and will only be booted as the rmtfs becomes available. Performing
actions such as upgrading (and restarting) the rmtfs service will cause the
modem to automatically restart and hence continue to function after the
upgrade.

 .../reserved-memory/qcom,rmtfs-mem.txt        |  7 ++++++
 drivers/remoteproc/qcom_q6v5_pil.c            |  1 +
 drivers/soc/qcom/Kconfig                      |  1 +
 drivers/soc/qcom/rmtfs_mem.c                  | 23 ++++++++++++++++++-
 4 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.txt b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.txt
index 8562ba1dce69..95b209e7f5d1 100644
--- a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.txt
+++ b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.txt
@@ -32,6 +32,13 @@ access block device data using the Remote Filesystem protocol.
 	Value type: <u32>
 	Definition: vmid of the remote processor, to set up memory protection.
 
+- rproc:
+	Usage: optional
+	Value type: <phandle>
+	Definition: reference to a remoteproc node, that should be powered up
+		    while the remote file system memory instance is ready to
+		    handle requests from the remote subsystem.
+
 = EXAMPLE
 The following example shows the remote filesystem memory setup for APQ8016,
 with the rmtfs region for the Hexagon DSP (id #1) located at 0x86700000.
diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index d7a4b9eca5d2..1445a38e8b34 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -1142,6 +1142,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	qproc = (struct q6v5 *)rproc->priv;
 	qproc->dev = &pdev->dev;
 	qproc->rproc = rproc;
+	rproc->auto_boot = false;
 	platform_set_drvdata(pdev, qproc);
 
 	ret = q6v5_init_mem(qproc, pdev);
diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 01fb6aba61d2..1109272479b9 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -88,6 +88,7 @@ config QCOM_QMI_HELPERS
 config QCOM_RMTFS_MEM
 	tristate "Qualcomm Remote Filesystem memory driver"
 	depends on ARCH_QCOM
+	depends on REMOTEPROC
 	select QCOM_SCM
 	help
 	  The Qualcomm remote filesystem memory driver is used for allocating
diff --git a/drivers/soc/qcom/rmtfs_mem.c b/drivers/soc/qcom/rmtfs_mem.c
index 8a3678c2e83c..8b08be310397 100644
--- a/drivers/soc/qcom/rmtfs_mem.c
+++ b/drivers/soc/qcom/rmtfs_mem.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/remoteproc.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -39,6 +40,8 @@ struct qcom_rmtfs_mem {
 	unsigned int client_id;
 
 	unsigned int perms;
+
+	struct rproc *rproc;
 };
 
 static ssize_t qcom_rmtfs_mem_show(struct device *dev,
@@ -80,11 +83,18 @@ static int qcom_rmtfs_mem_open(struct inode *inode, struct file *filp)
 	struct qcom_rmtfs_mem *rmtfs_mem = container_of(inode->i_cdev,
 							struct qcom_rmtfs_mem,
 							cdev);
+	int ret = 0;
 
 	get_device(&rmtfs_mem->dev);
 	filp->private_data = rmtfs_mem;
 
-	return 0;
+	if (rmtfs_mem->rproc) {
+		ret = rproc_boot(rmtfs_mem->rproc);
+		if (ret)
+			put_device(&rmtfs_mem->dev);
+	}
+
+	return ret;
 }
 static ssize_t qcom_rmtfs_mem_read(struct file *filp,
 			      char __user *buf, size_t count, loff_t *f_pos)
@@ -127,6 +137,9 @@ static int qcom_rmtfs_mem_release(struct inode *inode, struct file *filp)
 {
 	struct qcom_rmtfs_mem *rmtfs_mem = filp->private_data;
 
+	if (rmtfs_mem->rproc)
+		rproc_shutdown(rmtfs_mem->rproc);
+
 	put_device(&rmtfs_mem->dev);
 
 	return 0;
@@ -156,6 +169,7 @@ static int qcom_rmtfs_mem_probe(struct platform_device *pdev)
 	struct qcom_scm_vmperm perms[2];
 	struct reserved_mem *rmem;
 	struct qcom_rmtfs_mem *rmtfs_mem;
+	phandle rproc_phandle;
 	u32 client_id;
 	u32 vmid;
 	int ret;
@@ -181,6 +195,13 @@ static int qcom_rmtfs_mem_probe(struct platform_device *pdev)
 	rmtfs_mem->client_id = client_id;
 	rmtfs_mem->size = rmem->size;
 
+	ret = of_property_read_u32(node, "rproc", &rproc_phandle);
+	if (!ret) {
+		rmtfs_mem->rproc = rproc_get_by_phandle(rproc_phandle);
+		if (!rmtfs_mem->rproc)
+			return -EPROBE_DEFER;
+	}
+
 	device_initialize(&rmtfs_mem->dev);
 	rmtfs_mem->dev.parent = &pdev->dev;
 	rmtfs_mem->dev.groups = qcom_rmtfs_mem_groups;
-- 
2.18.0

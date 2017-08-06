From: matthew.gerlach@linux.intel.com
Subject: [PATCH 3/3] fpga: intel: Add QSPI FPGA Management Entity Feature
Date: Sun,  6 Aug 2017 11:24:04 -0700
Message-ID: <1502043844-3626-4-git-send-email-matthew.gerlach@linux.intel.com>
References: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vndao@altera.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, mchehab@kernel.org, linux-fpga@vger.kernel.org
Cc: Matthew Gerlach <matthew.gerlach@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Add FPGA Management Entity Feature to support Atera
ASMI Parallel 2 IP core. This feature allows
the flash used to configure the FPGA at power up
to be updated over PCIe using mtd-utils.

Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>
---
 drivers/fpga/intel/feature-dev.h |   6 ++-
 drivers/fpga/intel/fme-main.c    | 100 +++++++++++++++++++++++++++++++++++++++
 drivers/fpga/intel/pcie.c        |   7 +++
 drivers/fpga/intel/pcie_check.c  |   6 +++
 4 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/intel/feature-dev.h b/drivers/fpga/intel/feature-dev.h
index 9303828..5ae799b 100644
--- a/drivers/fpga/intel/feature-dev.h
+++ b/drivers/fpga/intel/feature-dev.h
@@ -40,6 +40,7 @@
 #define FME_FEATURE_GLOBAL_PERF     "fme_gperf"
 #define FME_FEATURE_GLOBAL_ERR      "fme_error"
 #define FME_FEATURE_PR_MGMT         "fme_pr"
+#define FME_FEATURE_QSPI_FLASH	    "fme_qspi_flash"
 
 #define PORT_FEATURE_HEADER         "port_hdr"
 #define PORT_FEATURE_UAFU           "port_uafu"
@@ -60,6 +61,7 @@
 #define FME_GLOBAL_PERF_REVISION	0
 #define FME_GLOBAL_ERR_REVISION	0
 #define FME_PR_MGMT_REVISION		1
+#define FME_QSPI_REVISION 0
 
 #define PORT_HEADER_REVISION		0
 /* UAFU's header info depends on the downloaded GBS */
@@ -1225,9 +1227,9 @@ enum fme_feature_id {
 	FME_FEATURE_ID_GLOBAL_PERF = 0x3,
 	FME_FEATURE_ID_GLOBAL_ERR = 0x4,
 	FME_FEATURE_ID_PR_MGMT = 0x5,
-
+	FME_FEATURE_ID_QSPI_FLASH = 0x6,
 	/* one for fme header. */
-	FME_FEATURE_ID_MAX = 0x6,
+	FME_FEATURE_ID_MAX = 0x7,
 };
 
 enum port_feature_id {
diff --git a/drivers/fpga/intel/fme-main.c b/drivers/fpga/intel/fme-main.c
index 776fe36..03aacb3 100644
--- a/drivers/fpga/intel/fme-main.c
+++ b/drivers/fpga/intel/fme-main.c
@@ -27,6 +27,7 @@
 #include <linux/uaccess.h>
 #include <linux/intel-fpga.h>
 #include <linux/fpga/fpga-mgr.h>
+#include <linux/mtd/altera-asmip2.h>
 
 #include "feature-dev.h"
 #include "fme.h"
@@ -659,6 +660,101 @@ struct feature_ops power_mgmt_ops = {
 	.uinit = power_mgmt_uinit,
 };
 
+#define FLASH_CAPABILITY_OFT 8
+
+static int qspi_flash_init(struct platform_device *pdev,
+			   struct feature *feature)
+{
+	u64 reg;
+	struct altera_asmip2_plat_data qdata;
+	struct platform_device *cdev;
+	int ret = 0;
+	char name[40];
+
+	scnprintf(name, sizeof(name), "%s-%p", feature->name, feature->ioaddr);
+
+	reg = readq(feature->ioaddr + FLASH_CAPABILITY_OFT);
+	dev_info(&pdev->dev, "%s %s %d 0x%llx 0x%x 0x%x\n",
+		 __func__, name, feature->resource_index,
+		 reg, readl(feature->ioaddr + FLASH_CAPABILITY_OFT),
+		 readl(feature->ioaddr + FLASH_CAPABILITY_OFT + 4));
+
+
+	cdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
+
+	if (!cdev) {
+		dev_err(&pdev->dev, "platform_device_alloc failed in %s\n",
+			__func__);
+		return -ENOMEM;
+	}
+
+	cdev->dev.parent = &pdev->dev;
+
+	memset(&qdata, 0, sizeof(qdata));
+	qdata.csr_base = feature->ioaddr + FLASH_CAPABILITY_OFT;
+	qdata.num_chip_sel = 1;
+
+	ret = platform_device_add_data(cdev, &qdata, sizeof(qdata));
+
+	if (ret) {
+		dev_err(&pdev->dev, "platform_device_add_data in %s\n",
+			__func__);
+		goto error;
+	}
+
+	cdev->driver_override = kstrdup(ALTERA_ASMIP2_DRV_NAME, GFP_KERNEL);
+
+	ret = platform_device_add(cdev);
+
+	if (ret) {
+		dev_err(&pdev->dev, "platform_device_add failed with %d\n",
+			ret);
+		goto error;
+	}
+	return ret;
+
+error:
+	platform_device_put(cdev);
+	return ret;
+}
+
+static int qspi_match(struct device *dev, void *data)
+{
+	return !strcmp(dev_name(dev), data);
+}
+
+static void qspi_flash_uinit(struct platform_device *pdev,
+			     struct feature *feature)
+{
+	struct device *parent = &pdev->dev;
+	struct device *dev;
+	struct platform_device *cdev;
+	char name[40];
+
+	scnprintf(name, sizeof(name), "%s-%p", feature->name, feature->ioaddr);
+
+	dev = device_find_child(parent, name, qspi_match);
+
+	if (!dev) {
+		dev_err(&pdev->dev, "%s NOT found\n", ALTERA_ASMIP2_DRV_NAME);
+		return;
+	}
+
+	cdev = to_platform_device(dev);
+
+	if (!cdev) {
+		dev_err(&pdev->dev, "no platform container\n");
+		return;
+	}
+
+	platform_device_unregister(cdev);
+}
+
+struct feature_ops qspi_flash_ops = {
+	.init = qspi_flash_init,
+	.uinit = qspi_flash_uinit,
+};
+
 static struct feature_driver fme_feature_drvs[] = {
 	{
 		.name = FME_FEATURE_HEADER,
@@ -685,6 +781,10 @@ static struct feature_driver fme_feature_drvs[] = {
 		.ops = &global_perf_ops,
 	},
 	{
+		.name = FME_FEATURE_QSPI_FLASH,
+		.ops = &qspi_flash_ops,
+	},
+	{
 		.ops = NULL,
 	},
 };
diff --git a/drivers/fpga/intel/pcie.c b/drivers/fpga/intel/pcie.c
index a64151a..8f4f3e0 100644
--- a/drivers/fpga/intel/pcie.c
+++ b/drivers/fpga/intel/pcie.c
@@ -28,6 +28,7 @@
 #include <linux/uuid.h>
 #include <linux/kdev_t.h>
 #include <linux/mfd/core.h>
+#include <linux/mtd/altera-asmip2.h>
 
 #include "feature-dev.h"
 
@@ -617,6 +618,12 @@ static struct feature_info fme_features[] = {
 		.resource_size = sizeof(struct feature_fme_pr),
 		.feature_index = FME_FEATURE_ID_PR_MGMT,
 		.revision_id = FME_PR_MGMT_REVISION
+	},
+	{
+		.name = FME_FEATURE_QSPI_FLASH,
+		.resource_size = ALTERA_ASMIP2_RESOURCE_SIZE,
+		.feature_index = FME_FEATURE_ID_QSPI_FLASH,
+		.revision_id = FME_QSPI_REVISION
 	}
 };
 
diff --git a/drivers/fpga/intel/pcie_check.c b/drivers/fpga/intel/pcie_check.c
index e707d72..f0027e1 100644
--- a/drivers/fpga/intel/pcie_check.c
+++ b/drivers/fpga/intel/pcie_check.c
@@ -51,6 +51,11 @@
 #define FME_FEATURE_PR_MGMT_ID			0x5
 #define FME_FEATURE_PR_MGMT_VERSION		0x0
 
+#define FME_FEATURE_QSPI_FLASH_TYPE		DFH_TYPE_PRIVATE
+#define FME_FEATURE_QSPI_FLASH_NEXT_OFFSET	0x2000
+#define FME_FEATURE_QSPI_FLASH_ID		FME_FEATURE_ID_QSPI_FLASH
+#define FME_FEATURE_QSPI_FLASH_VERSION		FME_QSPI_REVISION
+
 #define PORT_FEATURE_HEADER_TYPE		DFH_TYPE_AFU
 #define PORT_FEATURE_HEADER_NEXT_OFFSET		0x1000
 #define PORT_FEATURE_HEADER_ID			DFH_CCI_VERSION
@@ -91,6 +96,7 @@ static struct feature_header default_fme_feature_hdr[] = {
 	DEFAULT_REG(FME_FEATURE_GLOBAL_PERF),
 	DEFAULT_REG(FME_FEATURE_GLOBAL_ERR),
 	DEFAULT_REG(FME_FEATURE_PR_MGMT),
+	DEFAULT_REG(FME_FEATURE_QSPI_FLASH),
 };
 
 void check_features_header(struct pci_dev *pdev, struct feature_header *hdr,
-- 
2.7.4

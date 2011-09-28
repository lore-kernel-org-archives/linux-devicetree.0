From: Daniel Drake <dsd@laptop.org>
Subject: [PATCH 1/3] mfd: allow mfd_cell association with device tree node
Date: Wed, 28 Sep 2011 10:08:10 +0100 (BST)
Message-ID: <20110928090810.6ECC19D401D__18653.1513616957$1317203536$gmane$org@zog.reactivated.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sameo@linux.intel.com, grant.likely@secretlab.ca
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, dilinger@queued.net, broonie@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

This allows a mfd_cell to be linked with a device tree node, which
then allows child drivers to have easy access to that handle.

Signed-off-by: Daniel Drake <dsd@laptop.org>
---
 drivers/mfd/mfd-core.c   |    1 +
 include/linux/mfd/core.h |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/mfd-core.c b/drivers/mfd/mfd-core.c
index 0902523..7d22dcd 100644
--- a/drivers/mfd/mfd-core.c
+++ b/drivers/mfd/mfd-core.c
@@ -87,6 +87,7 @@ static int mfd_add_device(struct device *parent, int id,
 		goto fail_device;
 
 	pdev->dev.parent = parent;
+	pdev->dev.of_node = cell->of_node;
 
 	if (cell->pdata_size) {
 		ret = platform_device_add_data(pdev,
diff --git a/include/linux/mfd/core.h b/include/linux/mfd/core.h
index 4e76163..9b836f9 100644
--- a/include/linux/mfd/core.h
+++ b/include/linux/mfd/core.h
@@ -15,6 +15,7 @@
 #define MFD_CORE_H
 
 #include <linux/platform_device.h>
+#include <linux/of.h>
 
 /*
  * This struct describes the MFD part ("cell").
@@ -37,6 +38,9 @@ struct mfd_cell {
 	void			*platform_data;
 	size_t			pdata_size;
 
+	/* association with device tree node (optional) */
+	struct device_node	*of_node;
+
 	/*
 	 * These resources can be specified relative to the parent device.
 	 * For accessing hardware you should use resources from the platform dev
-- 
1.7.6.2

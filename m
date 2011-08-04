From: David Brown <davidb@codeaurora.org>
Subject: [PATCH] of/address: Add of_iomap_nocache
Date: Thu,  4 Aug 2011 02:53:49 -0700
Message-ID: <1312451629-28036-1-git-send-email-davidb@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: David Brown <davidb@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Add uncached mappings from devicetree nodes similar to regular io
mappings.

Signed-off-by: David Brown <davidb@codeaurora.org>
---
 drivers/of/address.c       |   19 +++++++++++++++++++
 include/linux/of_address.h |    1 +
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 72c33fb..9bee7f8 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -613,3 +613,22 @@ void __iomem *of_iomap(struct device_node *np, int index)
 	return ioremap(res.start, resource_size(&res));
 }
 EXPORT_SYMBOL(of_iomap);
+
+/**
+ * of_iomap_nocache - Maps the memory mapped IO for a given
+ *                    device_node, using ioremap_nocache.
+ * @device:	the device whose io range will be mapped
+ * @index:	index of the io range
+ *
+ * Returns a pointer to the mapped memory
+ */
+void __iomem *of_iomap_nocache(struct device_node *np, int index)
+{
+	struct resource res;
+
+	if (of_address_to_resource(np, index, &res))
+		return NULL;
+
+	return ioremap_nocache(res.start, 1 + res.end - res.start);
+}
+EXPORT_SYMBOL(of_iomap_nocache);
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index 3118623..3ce1277 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -12,6 +12,7 @@ extern struct device_node *of_find_matching_node_by_address(
 					const struct of_device_id *matches,
 					u64 base_address);
 extern void __iomem *of_iomap(struct device_node *device, int index);
+extern void __iomem *of_iomap_nocache(struct device_node *device, int index);
 
 /* Extract an address from a device, returns the region size and
  * the address space flags too. The PCI version uses a BAR number
-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.

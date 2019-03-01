Return-Path: <SRS0=/CI9=RE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:34196 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387538AbfCAPwv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Mar 2019 10:52:51 -0500
From: Kejia Hu <kejia.hu@codethink.co.uk>
Subject: [PATCH v2 1/6] soc/tegra: initial tegra-automotive detection
Date: Fri,  1 Mar 2019 15:35:35 +0000
Message-Id: <20190301153540.14954-2-kejia.hu@codethink.co.uk>
In-Reply-To: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
References: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
Sender: devicetree-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, digetx@gmail.com
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Thomas Preston <thomas.preston@codethink.co.uk>, Kejia Hu <kejia.hu@codethink.co.uk>
List-ID: <devicetree@vger.kernel.org>

From: Ben Dooks <ben.dooks@codethink.co.uk>

Add an initial soc_is_tegra_auto() with detection
via a change in the device-tree.

Also print the path taken through soc_is_tegra_auto() to
allow debugging. Only print when debug is enabled as this
function may be be called from multiple places, resulting
in duplicated messages in production.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Signed-off-by: Kejia Hu <kejia.hu@codethink.co.uk>
---
 drivers/soc/tegra/common.c             | 23 +++++++++++++++++++++++
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  2 ++
 include/soc/tegra/common.h             |  1 +
 include/soc/tegra/fuse.h               |  1 +
 4 files changed, 27 insertions(+)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index 7bfb154d6fa5..a10bd26fb5df 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 
 #include <soc/tegra/common.h>
+#include <soc/tegra/fuse.h>
 
 static const struct of_device_id tegra_machine_match[] = {
 	{ .compatible = "nvidia,tegra20", },
@@ -34,3 +35,25 @@ bool soc_is_tegra(void)
 
 	return match != NULL;
 }
+
+static const struct of_device_id tegra_machine_match_auto[] = {
+	{ .compatible = "nvidia,tegra20auto", },
+	{ .compatible = "nvidia,tegra30auto", },
+	{ },
+};
+
+bool soc_is_tegra_auto(void)
+{
+	struct device_node *root;
+	bool id_match  = false;
+
+	root = of_find_node_by_path("/");
+
+	if (root && of_match_node(tegra_machine_match_auto, root))
+		id_match = true;
+
+	pr_debug("%s of_device_id match %d, tegra_sku_info.is_automotive %d\n",
+			__func__, id_match, tegra_sku_info.is_automotive);
+
+	return id_match || tegra_sku_info.is_automotive;
+}
diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index e5a4d8f98b10..b2727afad24b 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -110,6 +110,8 @@ void __init tegra_init_revision(void)
 
 	tegra_sku_info.revision = rev;
 
+	tegra_sku_info.is_automotive = false;
+
 	tegra_sku_info.sku_id = tegra_fuse_read_early(FUSE_SKU_INFO);
 }
 
diff --git a/include/soc/tegra/common.h b/include/soc/tegra/common.h
index fc13a9a134e9..8dd178ddc6a6 100644
--- a/include/soc/tegra/common.h
+++ b/include/soc/tegra/common.h
@@ -10,5 +10,6 @@
 #define __SOC_TEGRA_COMMON_H__
 
 bool soc_is_tegra(void);
+bool soc_is_tegra_auto(void);
 
 #endif /* __SOC_TEGRA_COMMON_H__ */
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 8fb2f8a87339..ea4caf6f0cf7 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -56,6 +56,7 @@ struct tegra_sku_info {
 	int gpu_speedo_id;
 	int gpu_speedo_value;
 	enum tegra_revision revision;
+	bool is_automotive;
 };
 
 u32 tegra_read_straps(void);
-- 
2.11.0

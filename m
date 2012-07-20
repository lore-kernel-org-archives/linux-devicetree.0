From: Laura Abbott <lauraa@codeaurora.org>
Subject: [PATCH] dt/flattree: Add stub defintions for flat device tree functions
Date: Fri, 20 Jul 2012 10:49:03 -0700
Message-ID: <1342806543-18469-1-git-send-email-lauraa@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org
Cc: mbohan@codeaurora.org, linux-arm-msm@vger.kernel.org, Laura Abbott <lauraa@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Several flattened device tree functions are missing stub functions
when CONFIG_OF_FLATTREE is not selected, creating compilation
errors. Add the stub functions.

Signed-off-by: Laura Abbott <lauraa@codeaurora.org>
---
 include/linux/of_fdt.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index ed136ad..e3d59cd 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -119,6 +119,11 @@ extern void unflatten_device_tree(void);
 extern void early_init_devtree(void *);
 #else /* CONFIG_OF_FLATTREE */
 static inline void unflatten_device_tree(void) {}
+static inline void *of_get_flat_dt_prop(unsigned long node, const char *name,
+				 unsigned long *size) { return NULL; }
+
+static inline int of_flat_dt_is_compatible(unsigned long node,
+				const char *name) { return 0; }
 #endif /* CONFIG_OF_FLATTREE */
 
 #endif /* __ASSEMBLY__ */
-- 
1.7.8.3

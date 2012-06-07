From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] of: export of_platform_populate()
Date: Thu,  7 Jun 2012 17:57:36 -0600
Message-ID: <1339113456-27089-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Without this, modules can't use this API, leading to build failures.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
This is useful in 3.5.

 drivers/of/platform.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 343ad29..3132ea0 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -462,4 +462,5 @@ int of_platform_populate(struct device_node *root,
 	of_node_put(root);
 	return rc;
 }
+EXPORT_SYMBOL_GPL(of_platform_populate);
 #endif /* CONFIG_OF_ADDRESS */
-- 
1.7.0.4

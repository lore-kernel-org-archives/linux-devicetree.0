Return-Path: <SRS0=RGXl=TW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:4460 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfEVFfu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 May 2019 01:35:50 -0400
From: Puneet Saxena <puneets@nvidia.com>
Subject: [PATCH] of: resered-memory: ignore disabled memory-region nodes
Date: Wed, 22 May 2019 11:05:53 +0530
Message-ID: <1558503353-13179-2-git-send-email-puneets@nvidia.com>
In-Reply-To: <1558503353-13179-1-git-send-email-puneets@nvidia.com>
References: <1558503353-13179-1-git-send-email-puneets@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: pantelis.antoniou@konsulko.com, frowand.list@gmail.com, devicetree@vger.kernel.org
Cc: treding@nvidia.com, vdumpa@nvidia.com, snikam@nvidia.com
List-ID: <devicetree@vger.kernel.org>

From: Krishna Reddy <vdumpa@nvidia.com>

Ignore disabled nodes in the memory-region nodes list and continue
to initialize the rest of enabled nodes.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
---
 drivers/of/of_reserved_mem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 1977ee0adcb1..58d95d774e3b 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -314,6 +314,7 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 	struct device_node *target;
 	struct reserved_mem *rmem;
 	int ret;
+	const char *status;
 
 	if (!np || !dev)
 		return -EINVAL;
@@ -322,6 +323,10 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 	if (!target)
 		return -ENODEV;
 
+	status = of_get_property(target, "status", NULL);
+	if (status && strcmp(status, "okay") != 0 && strcmp(status, "ok") != 0)
+		return 0;
+
 	rmem = __find_rmem(target);
 	of_node_put(target);
 
-- 
2.7.4

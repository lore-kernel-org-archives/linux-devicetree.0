From: Felipe Balbi <balbi@ti.com>
Subject: [PATCH] of: address: use resource_size helper
Date: Tue,  7 Jun 2011 21:55:24 +0300
Message-ID: <1307472924-10907-1-git-send-email-balbi@ti.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@ti.com>
List-Id: devicetree@vger.kernel.org

that should be the approved way of calculating
the size of resources. No functional changes.

Signed-off-by: Felipe Balbi <balbi@ti.com>
---
 drivers/of/address.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index deefc0c..6e7b2cf 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -624,6 +624,6 @@ void __iomem *of_iomap(struct device_node *np, int index)
 	if (of_address_to_resource(np, index, &res))
 		return NULL;
 
-	return ioremap(res.start, 1 + res.end - res.start);
+	return ioremap(res.start, resource_size(&res));
 }
 EXPORT_SYMBOL(of_iomap);
-- 
1.7.6.rc0

From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH] of/irq: Avoid calling list_first_entry() for empty list
Date: Sun, 23 Jun 2013 15:50:07 +0800
Message-ID: <1371973807.23555.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

list_first_entry() expects the list is not empty, we need to check if list is
empty before calling list_first_entry(). Thus use list_first_entry_or_null()
instead of list_first_entry().

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/of/irq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index a3c1c5a..5c645c7 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -482,8 +482,9 @@ void __init of_irq_init(const struct of_device_id *matches)
 		}
 
 		/* Get the next pending parent that might have children */
-		desc = list_first_entry(&intc_parent_list, typeof(*desc), list);
-		if (list_empty(&intc_parent_list) || !desc) {
+		desc = list_first_entry_or_null(&intc_parent_list,
+						typeof(*desc), list);
+		if (!desc) {
 			pr_err("of_irq_init: children remain, but no parents\n");
 			break;
 		}
-- 
1.8.1.2

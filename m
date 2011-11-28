From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH] of/irq: of_irq_init: add check for parent equal to child node
Date: Sun, 27 Nov 2011 20:49:10 -0600
Message-ID: <1322448550-15392-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: Grant Likely <grant.likely@secretlab.ca>, benh@kernel.crashing.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

With the revert of "of/irq: of_irq_find_parent: check for parent equal to
child" (dc9372808412edb), we need another way to handle parent node equal
to the child node. This can simply be handled in of_irq_init by checking
for this condition.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
---
 drivers/of/irq.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 791270b..19c0115 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -424,6 +424,8 @@ void __init of_irq_init(const struct of_device_id *matches)
 
 		desc->dev = np;
 		desc->interrupt_parent = of_irq_find_parent(np);
+		if (desc->interrupt_parent == np)
+			desc->interrupt_parent = NULL;
 		list_add_tail(&desc->list, &intc_desc_list);
 	}
 
-- 
1.7.5.4

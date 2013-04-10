From: Ming Lei <ming.lei@canonical.com>
Subject: [PATCH] of: export of_get_next_parent
Date: Wed, 10 Apr 2013 17:47:07 +0800
Message-ID: <1365587227-26137-1-git-send-email-ming.lei@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Ming Lei <ming.lei@canonical.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

The function is called by at least three drivers now:

	pinctrl
	mfd/vexpress
	v4l2-core

The 3rd one can be built as module, so export the function to
avoid build failure.

Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: devicetree-discuss@lists.ozlabs.org
Signed-off-by: Ming Lei <ming.lei@canonical.com>
---
 drivers/of/base.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index c6443de..a2a0ddc 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -382,6 +382,7 @@ struct device_node *of_get_next_parent(struct device_node *node)
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return parent;
 }
+EXPORT_SYMBOL(of_get_next_parent);
 
 /**
  *	of_get_next_child - Iterate a node childs
-- 
1.7.9.5

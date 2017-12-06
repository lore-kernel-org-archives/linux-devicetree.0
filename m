From: Vasyl Gomonovych <gomonovych@gmail.com>
Subject: [PATCH] of: irq: Fix function description comment
Date: Wed,  6 Dec 2017 23:43:34 +0100
Message-ID: <1512600215-12580-1-git-send-email-gomonovych@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, gomonovych@gmail.com
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Make small cleanup in function description for
of_irq_parse_raw

Signed-off-by: Vasyl Gomonovych <gomonovych@gmail.com>
---
 drivers/of/irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index ec00ae7..7dcea86 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -83,9 +83,8 @@ struct device_node *of_irq_find_parent(struct device_node *child)
 
 /**
  * of_irq_parse_raw - Low level interrupt tree parsing
- * @parent:	the device interrupt parent
  * @addr:	address specifier (start of "reg" property of the device) in be32 format
- * @out_irq:	structure of_irq updated by this function
+ * @out_irq:	structure of_phandle_args updated by this function
  *
  * Returns 0 on success and a negative number on error
  *
-- 
1.9.1

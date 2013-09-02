From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] of_irq.h: fix build warnings when CONFIG_OF is not enabled
Date: Mon, 02 Sep 2013 08:54:01 -0700
Message-ID: <5224B499.4010600@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build warnings when CONFIG_OF is not enabled:

include/linux/of_irq.h:82:7: warning: 'struct device_node' declared inside parameter list [enabled by default]
include/linux/of_irq.h:82:7: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/of_irq.h:87:47: warning: 'struct device_node' declared inside parameter list [enabled by default]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc:	Grant Likely <grant.likely@linaro.org>
Cc:	Rob Herring <rob.herring@calxeda.com>
Cc:	devicetree@vger.kernel.org
---
 include/linux/of_irq.h |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20130830.orig/include/linux/of_irq.h
+++ linux-next-20130830/include/linux/of_irq.h
@@ -78,6 +78,8 @@ extern void of_irq_init(const struct of_
 #endif /* CONFIG_OF_IRQ */
 
 #else /* !CONFIG_OF */
+struct device_node;
+
 static inline unsigned int irq_of_parse_and_map(struct device_node *dev,
 						int index)
 {

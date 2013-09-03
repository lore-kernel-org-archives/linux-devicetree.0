From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] of_irq.h: fix build warnings when CONFIG_OF is not enabled
Date: Tue, 03 Sep 2013 16:25:27 -0700
Message-ID: <52266FE7.9030506@infradead.org>
References: <5224B499.4010600@infradead.org> <CAL_Jsq+82vm_vt5EpcG1zvWmL_H4KY=91tB1WH5yUhHsiM11DA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+82vm_vt5EpcG1zvWmL_H4KY=91tB1WH5yUhHsiM11DA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build warnings when CONFIG_OF is not enabled:
(seen on i386 and x86_64)

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
@@ -1,6 +1,8 @@
 #ifndef __OF_IRQ_H
 #define __OF_IRQ_H
 
+struct device_node;
+
 #if defined(CONFIG_OF)
 struct of_irq;
 #include <linux/types.h>

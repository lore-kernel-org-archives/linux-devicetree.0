From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v2 1/6] mailbox: arm_mhu: reorder header inclusion and drop unneeded ones
Date: Wed, 24 May 2017 11:16:38 +0100
Message-ID: <1495621003-4291-2-git-send-email-sudeep.holla@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, Alexey Klimov <alexey.klimov@arm.com>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch just re-orders some of the headers includes and also drop
the ones that are unnecessary.

Cc: Alexey Klimov <alexey.klimov@arm.com>
Cc: Jassi Brar <jaswinder.singh@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/mailbox/arm_mhu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/mailbox/arm_mhu.c b/drivers/mailbox/arm_mhu.c
index 99befa76e37c..be0f293a9457 100644
--- a/drivers/mailbox/arm_mhu.c
+++ b/drivers/mailbox/arm_mhu.c
@@ -13,16 +13,13 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/interrupt.h>
-#include <linux/spinlock.h>
-#include <linux/mutex.h>
-#include <linux/delay.h>
-#include <linux/slab.h>
+#include <linux/amba/bus.h>
+#include <linux/device.h>
 #include <linux/err.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
-#include <linux/module.h>
-#include <linux/amba/bus.h>
 #include <linux/mailbox_controller.h>
+#include <linux/module.h>
 
 #define INTR_STAT_OFS	0x0
 #define INTR_SET_OFS	0x8
-- 
2.7.4

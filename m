From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 09/16] driver core: Arrange headers alphabetically
Date: Thu, 23 Feb 2017 18:19:29 +0200
Message-ID: <1487866776-24578-10-git-send-email-sakari.ailus@linux.intel.com>
References: <1487866776-24578-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1487866776-24578-1-git-send-email-sakari.ailus@linux.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
Cc: sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, mika.westerberg@linux.intel.com, rafael@kernel.org, mark.rutland@arm.com, broonie@kernel.org, robh@kernel.org, ahs3@redhat.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/base/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 8c25e68..5669505 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -13,19 +13,19 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/fwnode.h>
+#include <linux/genhd.h>
 #include <linux/init.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/string.h>
+#include <linux/kallsyms.h>
 #include <linux/kdev_t.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/netdevice.h>
 #include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
-#include <linux/genhd.h>
-#include <linux/kallsyms.h>
-#include <linux/mutex.h>
 #include <linux/pm_runtime.h>
-#include <linux/netdevice.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 #include <linux/sysfs.h>
 
 #include "base.h"
-- 
2.7.4


From: Jeremy Kerr <jeremy.kerr@canonical.com>
Subject: [PATCH 1/3] of: include linux/proc_fs.h
Date: Wed, 23 Dec 2009 09:45:18 +0800
Message-ID: <1261532718.575422.369701385795.1.gpush@pororo>
References: <1261532718.575048.365032094903.0.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753505AbZLWBp5@vger.kernel.org>
In-Reply-To: <1261532718.575048.365032094903.0.gpush@pororo>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

We use a few procfs-specific functions (eg, proc_device_tree_*) which
aren't covered by the current includes. This causes the following build
error on arm:

drivers/of/base.c: In function 'prom_add_property':
drivers/of/base.c:861: error: implicit declaration of function 'proc_device_tree_add_prop'
drivers/of/base.c: In function 'prom_remove_property':
drivers/of/base.c:902: error: implicit declaration of function 'proc_device_tree_remove_prop'
drivers/of/base.c: In function 'prom_update_property':
drivers/of/base.c:946: error: implicit declaration of function 'proc_device_tree_update_prop'

Add proc_fs.h for these prototypes.

Signed-off-by: Jeremy Kerr <jeremy.kerr@canonical.com>

---
 drivers/of/base.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 974f64e..2dcb7a3 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/spinlock.h>
+#include <linux/proc_fs.h>
 
 struct device_node *allnodes;
 

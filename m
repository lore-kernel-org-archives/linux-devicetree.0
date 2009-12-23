From: Jeremy Kerr <jeremy.kerr@canonical.com>
Subject: [PATCH 3/3] proc_devtree: include linux/of.h
Date: Wed, 23 Dec 2009 09:45:18 +0800
Message-ID: <1261532718.576015.537671965190.3.gpush@pororo>
References: <1261532718.575048.365032094903.0.gpush@pororo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753705AbZLWBqY@vger.kernel.org>
In-Reply-To: <1261532718.575048.365032094903.0.gpush@pororo>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Currenly, proc_devtree.c depends on asm/prom.h to include linux/of.h, to
provide some device-tree definitions (eg, struct property).

Instead, include linux/of.h directly. We still need asm/prom.h for
HAVE_ARCH_DEVTREE_FIXUPS.

Signed-off-by: Jeremy Kerr <jeremy.kerr@canonical.com>

---
 fs/proc/proc_devtree.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/proc/proc_devtree.c b/fs/proc/proc_devtree.c
index 31fc7e0..2ea10dd 100644
--- a/fs/proc/proc_devtree.c
+++ b/fs/proc/proc_devtree.c
@@ -9,6 +9,7 @@
 #include <linux/proc_fs.h>
 #include <linux/stat.h>
 #include <linux/string.h>
+#include <linux/of.h>
 #include <asm/prom.h>
 #include <asm/uaccess.h>
 #include "internal.h"

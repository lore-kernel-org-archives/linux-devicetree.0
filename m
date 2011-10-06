From: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
Subject: [PATCH] of: include errno.h
Date: Thu, 06 Oct 2011 15:40:44 +0300
Message-ID: <20111006124044.1066.7111.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

When compiling ath6kl for beagleboard (omap2plus_defconfig plus
CONFIG_ATH6KL, CONFIG_OF disable) with current linux-next compilation
fails:

include/linux/of.h:269: error: 'ENOSYS' undeclared (first use in this function)
include/linux/of.h:276: error: 'ENOSYS' undeclared (first use in this function)
include/linux/of.h:289: error: 'ENOSYS' undeclared (first use in this function)

Fix this by including errno.h from of.h.

Signed-off-by: Kalle Valo <kvalo-A+ZNKFmMK5xy9aJCnZT0Uw@public.gmane.org>
---
 include/linux/of.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 9180dc5..219c29d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -17,6 +17,7 @@
  */
 #include <linux/types.h>
 #include <linux/bitops.h>
+#include <linux/errno.h>
 #include <linux/kref.h>
 #include <linux/mod_devicetable.h>
 #include <linux/spinlock.h>

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH v2] libfdt: remove unnecessary include directive from <linux/libfdt.h>
Date: Sun,  7 Jan 2018 12:02:16 +0900
Message-ID: <1515294136-19427-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>, Kate Stewart <kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

<linux/libfdt.h> is a wrapper of scripts/dtc/libfdt/libfdt.h
It should not do more than its job.  In fact, libfdt.h depends
on fdt.h, and scripts/dtc/libfdt/libfdt.h includes fdt.h already.
Trust the work in the upstream DTC project.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

Changes in v2:
  - Rephrase commit-log a bit (remove ../../)

 include/linux/libfdt.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/libfdt.h b/include/linux/libfdt.h
index 27ba06e..90ed4eb 100644
--- a/include/linux/libfdt.h
+++ b/include/linux/libfdt.h
@@ -3,7 +3,6 @@
 #define _INCLUDE_LIBFDT_H_
 
 #include <linux/libfdt_env.h>
-#include "../../scripts/dtc/libfdt/fdt.h"
 #include "../../scripts/dtc/libfdt/libfdt.h"
 
 #endif /* _INCLUDE_LIBFDT_H_ */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

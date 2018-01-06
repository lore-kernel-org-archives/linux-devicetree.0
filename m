From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] libfdt: remove unnecessary include directive from <linux/libfdt.h>
Date: Sun,  7 Jan 2018 02:48:55 +0900
Message-ID: <1515260935-30163-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

<linux/libfdt.h> is a wrapper of ../../scripts/dtc/libfdt/libfdt.h
It should not do more than its job.  In fact, libfdt.h depends on fdt.h,
and ../../scripts/dtc/libfdt/libfdt.h includes fdt.h already.
Trust the work in the upstream DTC project.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

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

From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/3] MIPS: prepare for user enabling of CONFIG_OF
Date: Tue,  2 Jun 2015 17:46:42 -0500
Message-ID: <1433285204-4307-2-git-send-email-robh@kernel.org>
References: <1433285204-4307-1-git-send-email-robh@kernel.org>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1433285204-4307-1-git-send-email-robh@kernel.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

In preparation to allow users to enable DeviceTree without arch or
machine selecting it, we need to fix build errors on MIPS. When
CONFIG_OF is enabled, device_tree_init cannot be resolved. This is
trivially fixed by using CONFIG_USE_OF instead of CONFIG_OF for prom.h.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/include/asm/prom.h | 2 +-
 arch/mips/kernel/prom.c      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/prom.h b/arch/mips/include/asm/prom.h
index 8ebc2aa..0b4b668 100644
--- a/arch/mips/include/asm/prom.h
+++ b/arch/mips/include/asm/prom.h
@@ -11,7 +11,7 @@
 #ifndef __ASM_PROM_H
 #define __ASM_PROM_H
 
-#ifdef CONFIG_OF
+#ifdef CONFIG_USE_OF
 #include <linux/bug.h>
 #include <linux/io.h>
 #include <linux/types.h>
diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index e303cb1..b130033 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -18,6 +18,7 @@
 #include <linux/of_fdt.h>
 #include <linux/of_platform.h>
 
+#include <asm/bootinfo.h>
 #include <asm/page.h>
 #include <asm/prom.h>
 
-- 
2.1.0

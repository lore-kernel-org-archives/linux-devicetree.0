From: Alban Bedel <albeu@free.fr>
Subject: [PATCH 08/14] MIPS: ath79: Use the common clk API
Date: Fri, 17 Apr 2015 16:24:23 +0200
Message-ID: <1429280669-2986-9-git-send-email-albeu@free.fr>
References: <1429280669-2986-1-git-send-email-albeu@free.fr>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429280669-2986-1-git-send-email-albeu@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, Alban Bedel <albeu@free.fr>, Andrew Bresticker <abrestic@chromium.org>, Qais Yousef <qais.yousef@imgtec.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Make the code simpler and open the way for device tree clocks.

Signed-off-by: Alban Bedel <albeu@free.fr>
---
 arch/mips/Kconfig       |  1 +
 arch/mips/ath79/clock.c | 29 ++---------------------------
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1fa7f2f..a7b8ef4 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -120,6 +120,7 @@ config ATH79
 	select CSRC_R4K
 	select DMA_NONCOHERENT
 	select HAVE_CLK
+	select COMMON_CLK
 	select CLKDEV_LOOKUP
 	select IRQ_CPU
 	select MIPS_MACHINE
diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 226ddf0..1fcb691 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -17,6 +17,7 @@
 #include <linux/err.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/clk-provider.h>
 
 #include <asm/div64.h>
 
@@ -28,21 +29,15 @@
 #define AR724X_BASE_FREQ	5000000
 #define AR913X_BASE_FREQ	5000000
 
-struct clk {
-	unsigned long rate;
-};
-
 static void __init ath79_add_sys_clkdev(const char *id, unsigned long rate)
 {
 	struct clk *clk;
 	int err;
 
-	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
+	clk = clk_register_fixed_rate(NULL, id, NULL, CLK_IS_ROOT, rate);
 	if (!clk)
 		panic("failed to allocate %s clock structure", id);
 
-	clk->rate = rate;
-
 	err = clk_register_clkdev(clk, id, NULL);
 	if (err)
 		panic("unable to register %s clock device", id);
@@ -468,23 +463,3 @@ ath79_get_sys_clk_rate(const char *id)
 
 	return rate;
 }
-
-/*
- * Linux clock API
- */
-int clk_enable(struct clk *clk)
-{
-	return 0;
-}
-EXPORT_SYMBOL(clk_enable);
-
-void clk_disable(struct clk *clk)
-{
-}
-EXPORT_SYMBOL(clk_disable);
-
-unsigned long clk_get_rate(struct clk *clk)
-{
-	return clk->rate;
-}
-EXPORT_SYMBOL(clk_get_rate);
-- 
2.0.0

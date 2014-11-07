From: Kevin Cernekee <cernekee@gmail.com>
Subject: [PATCH V4 01/14] sh: Eliminate unused irq_reg_{readl,writel} accessors
Date: Thu,  6 Nov 2014 22:44:16 -0800
Message-ID: <1415342669-30640-2-git-send-email-cernekee@gmail.com>
References: <1415342669-30640-1-git-send-email-cernekee@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1415342669-30640-1-git-send-email-cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: tglx@linutronix.de, jason@lakedaemon.net, linux-sh@vger.kernel.org
Cc: arnd@arndb.de, f.fainelli@gmail.com, ralf@linux-mips.org, sergei.shtylyov@cogentembedded.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

Defining these macros way down in arch/sh/.../irq.c doesn't cause
kernel/irq/generic-chip.c to use them.  As far as I can tell this code
has no effect.

Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
---
 arch/sh/boards/mach-se/7343/irq.c | 3 ---
 arch/sh/boards/mach-se/7722/irq.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/sh/boards/mach-se/7343/irq.c b/arch/sh/boards/mach-se/7343/irq.c
index 7646bf0..1087dba 100644
--- a/arch/sh/boards/mach-se/7343/irq.c
+++ b/arch/sh/boards/mach-se/7343/irq.c
@@ -14,9 +14,6 @@
 #define DRV_NAME "SE7343-FPGA"
 #define pr_fmt(fmt) DRV_NAME ": " fmt
 
-#define irq_reg_readl	ioread16
-#define irq_reg_writel	iowrite16
-
 #include <linux/init.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
diff --git a/arch/sh/boards/mach-se/7722/irq.c b/arch/sh/boards/mach-se/7722/irq.c
index f5e2af1..00e6992 100644
--- a/arch/sh/boards/mach-se/7722/irq.c
+++ b/arch/sh/boards/mach-se/7722/irq.c
@@ -11,9 +11,6 @@
 #define DRV_NAME "SE7722-FPGA"
 #define pr_fmt(fmt) DRV_NAME ": " fmt
 
-#define irq_reg_readl	ioread16
-#define irq_reg_writel	iowrite16
-
 #include <linux/init.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
-- 
2.1.1

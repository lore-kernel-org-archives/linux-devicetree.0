From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 06/21] arc: remove unnecessary prom.h includes
Date: Thu, 26 Sep 2013 13:50:41 -0500
Message-ID: <1380221456-11192-7-git-send-email-robherring2@gmail.com>
References: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Vineet Gupta <vgupta@synopsys.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Remove unnecessary prom.h includes in preparation to remove prom.h.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/kernel/devtree.c | 1 -
 arch/arc/kernel/setup.c   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arc/kernel/devtree.c b/arch/arc/kernel/devtree.c
index 2340af0..6fb5137 100644
--- a/arch/arc/kernel/devtree.c
+++ b/arch/arc/kernel/devtree.c
@@ -14,7 +14,6 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
-#include <asm/prom.h>
 #include <asm/clk.h>
 #include <asm/mach_desc.h>
 
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 2c68bc7e..f30cf31 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -21,7 +21,6 @@
 #include <asm/setup.h>
 #include <asm/page.h>
 #include <asm/irq.h>
-#include <asm/prom.h>
 #include <asm/unwind.h>
 #include <asm/clk.h>
 #include <asm/mach_desc.h>
-- 
1.8.1.2

From: Rob Herring <robh@kernel.org>
Subject: [PATCH] x86: olpc: Remove calling of_platform_bus_probe
Date: Fri, 16 Nov 2018 14:18:20 -0600
Message-ID: <20181116201820.10065-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: devicetree@vger.kernel.org

The DT core will probe the DT by default now, so the OLPC platform code
calling of_platform_bus_probe is not necessary. The algorithm for what
nodes are probed is a little different in how compatible is handled, but
since OLPC uses compatible strings for matching it is not affected by
this difference.

Also, only the battery node located at the root level gets a device
created as the dcon is a PCI device and the RTC device is created in
olpc-xo1-rtc.c.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/x86/platform/olpc/olpc_dt.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
index 24d2175a9480..b4ab779f1d47 100644
--- a/arch/x86/platform/olpc/olpc_dt.c
+++ b/arch/x86/platform/olpc/olpc_dt.c
@@ -19,7 +19,6 @@
 #include <linux/kernel.h>
 #include <linux/memblock.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/of_pdt.h>
 #include <asm/olpc.h>
 #include <asm/olpc_ofw.h>
@@ -285,20 +284,3 @@ void __init olpc_dt_build_devicetree(void)
 	pr_info("PROM DT: Built device tree with %u bytes of memory.\n",
 			prom_early_allocated);
 }
-
-/* A list of DT node/bus matches that we want to expose as platform devices */
-static struct of_device_id __initdata of_ids[] = {
-	{ .compatible = "olpc,xo1-battery" },
-	{ .compatible = "olpc,xo1-dcon" },
-	{ .compatible = "olpc,xo1-rtc" },
-	{},
-};
-
-static int __init olpc_create_platform_devices(void)
-{
-	if (machine_is_olpc())
-		return of_platform_bus_probe(NULL, of_ids, NULL);
-	else
-		return 0;
-}
-device_initcall(olpc_create_platform_devices);
-- 
2.19.1

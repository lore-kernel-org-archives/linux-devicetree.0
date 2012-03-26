From: David Daney <ddaney.cavm@gmail.com>
Subject: [PATCH v7 1/4] MIPS: Don't define early_init_devtree() and device_tree_init() in prom.c for CPU_CAVIUM_OCTEON
Date: Mon, 26 Mar 2012 12:31:18 -0700
Message-ID: <1332790281-9648-2-git-send-email-ddaney.cavm@gmail.com>
References: <1332790281-9648-1-git-send-email-ddaney.cavm@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1332790281-9648-1-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>
Cc: linux-kernel@vger.kernel.org, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney@cavium.com>

This code is not common enough to be in a shared file, so OCTEON defines
it's own versions.

When the last of this target specific code is moved out, we can remove
all of this.

Signed-off-by: David Daney <david.daney@cavium.com>
---
 arch/mips/kernel/prom.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index 558b539..4aaa5c0 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -60,6 +60,7 @@ void __init early_init_dt_setup_initrd_arch(unsigned long start,
 }
 #endif
 
+#ifndef CONFIG_CPU_CAVIUM_OCTEON
 void __init early_init_devtree(void *params)
 {
 	/* Setup flat device-tree pointer */
@@ -95,3 +96,4 @@ void __init device_tree_init(void)
 	/* free the space reserved for the dt blob */
 	free_mem_mach(base, size);
 }
+#endif /* !CONFIG_CPU_CAVIUM_OCTEON */
-- 
1.7.2.3

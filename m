From: Thomas Chou <thomas@wytron.com.tw>
Subject: [PATCH] of/mips: fix fdt size as be32
Date: Wed, 24 Nov 2010 15:35:48 +0800
Message-ID: <1290584148-23111-1-git-send-email-thomas@wytron.com.tw>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, ralf@linux-mips.org, grant.likely@secretlab.ca, David Daney <ddaney@caviumnetworks.com>, Dezhong Diao <dediao@cisco.com>, Thomas Chou <thomas@wytron.com.tw>
List-Id: devicetree@vger.kernel.org

The totalsize field was be32. And the reserve bootmem would cause
failure.

Signed-off-by: Thomas Chou <thomas@wytron.com.tw>
---
 arch/mips/kernel/prom.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index e000b27..9dbe583 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -100,7 +100,7 @@ void __init device_tree_init(void)
 		return;
 
 	base = virt_to_phys((void *)initial_boot_params);
-	size = initial_boot_params->totalsize;
+	size = be32_to_cpu(initial_boot_params->totalsize);
 
 	/* Before we do anything, lets reserve the dt blob */
 	reserve_mem_mach(base, size);
-- 
1.7.3.2

From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 17/28] xtensa: use early_init_dt_scan
Date: Mon, 16 Sep 2013 18:09:13 -0500
Message-ID: <1379372965-22359-18-git-send-email-robherring2@gmail.com>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, linux-xtensa@linux-xtensa.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Convert xtensa to use new early_init_dt_scan function.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-xtensa@linux-xtensa.org
---
 arch/xtensa/kernel/setup.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index fc31ec1..65974a8 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -219,9 +219,13 @@ static int __init parse_bootparam(const bp_tag_t* tag)
 }
 
 #ifdef CONFIG_OF
+bool __initdata dt_memory_scan = false;
 
 void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 {
+	if (!dt_memory_scan)
+		return;
+
 	size &= PAGE_MASK;
 	add_sysmem_bank(MEMORY_TYPE_CONVENTIONAL, base, base + size);
 }
@@ -233,20 +237,13 @@ void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
 
 void __init early_init_devtree(void *params)
 {
-	/* Setup flat device-tree pointer */
-	initial_boot_params = params;
+	if (sysmem.nr_banks == 0)
+		dt_memory_scan = true;
 
-	/* Retrieve various informations from the /chosen node of the
-	 * device-tree, including the platform type, initrd location and
-	 * size, TCE reserve, and more ...
-	 */
-	if (!command_line[0])
-		of_scan_flat_dt(early_init_dt_scan_chosen, command_line);
+	early_init_dt_scan(params);
 
-	/* Scan memory nodes and rebuild MEMBLOCKs */
-	of_scan_flat_dt(early_init_dt_scan_root, NULL);
-	if (sysmem.nr_banks == 0)
-		of_scan_flat_dt(early_init_dt_scan_memory, NULL);
+	if (!command_line[0])
+		strlcpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
 }
 
 static int __init xtensa_device_probe(void)
-- 
1.8.1.2

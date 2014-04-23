From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 02/21] mips: lantiq: copy built-in DTB out of init section
Date: Tue, 22 Apr 2014 20:18:02 -0500
Message-ID: <1398215901-25609-3-git-send-email-robherring2@gmail.com>
References: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh@kernel.org>

The existing code is buggy because built-in DTBs are in init memory.
Fix this by using the unflatten_and_copy_device_tree function.

This removes all accesses to FDT header data by the arch code.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
v2: no change

 arch/mips/lantiq/prom.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/mips/lantiq/prom.c b/arch/mips/lantiq/prom.c
index 19686c5..cdea687 100644
--- a/arch/mips/lantiq/prom.c
+++ b/arch/mips/lantiq/prom.c
@@ -76,18 +76,7 @@ void __init plat_mem_setup(void)
 
 void __init device_tree_init(void)
 {
-	unsigned long base, size;
-
-	if (!initial_boot_params)
-		return;
-
-	base = virt_to_phys((void *)initial_boot_params);
-	size = be32_to_cpu(initial_boot_params->totalsize);
-
-	/* Before we do anything, lets reserve the dt blob */
-	reserve_bootmem(base, size, BOOTMEM_DEFAULT);
-
-	unflatten_device_tree();
+	unflatten_and_copy_device_tree();
 }
 
 void __init prom_init(void)
-- 
1.9.1

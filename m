From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 28/28] mips: use common of_flat_dt_get_machine_name
Date: Mon, 16 Sep 2013 18:09:24 -0500
Message-ID: <1379372965-22359-29-git-send-email-robherring2@gmail.com>
References: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1379372965-22359-1-git-send-email-robherring2@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Convert mips to use the common of_flat_dt_get_machine_name function.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
---
 arch/mips/kernel/prom.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index 0b2485f..3c3b0df 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -47,24 +47,11 @@ void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
 	return __alloc_bootmem(size, align, __pa(MAX_DMA_ADDRESS));
 }
 
-int __init early_init_dt_scan_model(unsigned long node,	const char *uname,
-				    int depth, void *data)
-{
-	if (!depth) {
-		char *model = of_get_flat_dt_prop(node, "model", NULL);
-
-		if (model)
-			mips_set_machine_name(model);
-	}
-	return 0;
-}
-
 void __init __dt_setup_arch(struct boot_param_header *bph)
 {
 	if (!early_init_dt_scan(bph))
 		return;
 
-	/* try to load the mips machine name */
-	of_scan_flat_dt(early_init_dt_scan_model, NULL);
+	mips_set_machine_name(of_flat_dt_get_machine_name());
 }
 #endif
-- 
1.8.1.2

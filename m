From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 27/29] arm64: use common of_flat_dt_get_machine_name
Date: Mon,  7 Oct 2013 11:29:35 -0500
Message-ID: <1381163377-21044-28-git-send-email-robherring2@gmail.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Convert arm64 to use the common of_flat_dt_get_machine_name function.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/kernel/setup.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 7feb0c9..a4ed2d3 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -124,8 +124,6 @@ static void __init setup_processor(void)
 
 static void __init setup_machine_fdt(phys_addr_t dt_phys)
 {
-	unsigned long dt_root;
-
 	if (!dt_phys || !early_init_dt_scan(phys_to_virt(dt_phys))) {
 		early_print("\n"
 			"Error: invalid device tree blob at physical address 0x%p (virtual address 0x%p)\n"
@@ -137,14 +135,7 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
 			cpu_relax();
 	}
 
-	dt_root = of_get_flat_dt_root();
-
-	machine_name = of_get_flat_dt_prop(dt_root, "model", NULL);
-	if (!machine_name)
-		machine_name = of_get_flat_dt_prop(dt_root, "compatible", NULL);
-	if (!machine_name)
-		machine_name = "<unknown>";
-	pr_info("Machine: %s\n", machine_name);
+	machine_name = of_flat_dt_get_machine_name();
 }
 
 /*
-- 
1.8.1.2

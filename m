From: Tali Perry <tali.perry1@gmail.com>
Subject: [PATCH v1 1/1] clk: npcm750: fix base address and of_clk_get_by_name
 error handling. Also update error messages to be more informative
Date: Tue,  1 May 2018 10:23:27 +0300
Message-ID: <1525159407-31708-2-git-send-email-tali.perry1@gmail.com>
References: <1525159407-31708-1-git-send-email-tali.perry1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525159407-31708-1-git-send-email-tali.perry1@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sboyd@kernel.org, brendanhiggins@google.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, weiyongjunl@huawei.com, avifishman70@gmail.com, tmaimon77@gmail.com, raltherr@google.com
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Nuvoton NPCM7XX Clock Controller
fix base address and of_clk_get_by_name error handling.
    Also update error messages to be more informative.
    
    In case clk_base allocation is erronoeous the return value is null.
    Also fix handling of of_clk_get_by_name returns an error. 
    Print a better error message pointing to the dt-binding documention.


Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Tali Perry (2):
 
---
 drivers/clk/clk-npcm7xx.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-npcm7xx.c b/drivers/clk/clk-npcm7xx.c
index 7e4964b9e5c8..6ff97f79fcd7 100644
--- a/drivers/clk/clk-npcm7xx.c
+++ b/drivers/clk/clk-npcm7xx.c
@@ -583,7 +583,7 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 
 
 	clk_base = ioremap(res.start, resource_size(&res));
-	if (IS_ERR(clk_base))
+	if (!clk_base)
 		goto npcm7xx_init_error;
 
 
@@ -604,24 +604,27 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 
 	/* Read fixed clocks. These 3 clocks must be defined in DT */
 	clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_REFCLK);
-	if (!IS_ERR(clk)) {
-		pr_err("failed to find external REFCLK: %ld\n",
+	if (IS_ERR(clk)) {
+		pr_err("failed to find external REFCLK on device tree, err=%ld\n",
 			PTR_ERR(clk));
 		clk_put(clk);
+		goto npcm7xx_init_fail_no_clk_on_dt;
 	}
 
 	clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_SYSBYPCK);
-	if (!IS_ERR(clk)) {
-		pr_err("failed to find external SYSBYPCK: %ld\n",
+	if (IS_ERR(clk)) {
+		pr_err("failed to find external SYSBYPCK on device tree, err=%ld\n",
 			PTR_ERR(clk));
 		clk_put(clk);
+		goto npcm7xx_init_fail_no_clk_on_dt;
 	}
 
 	clk = of_clk_get_by_name(clk_np, NPCM7XX_CLK_S_MCBYPCK);
-	if (!IS_ERR(clk)) {
-		pr_err("failed to find external MCBYPCK: %ld\n",
+	if (IS_ERR(clk)) {
+		pr_err("failed to find external MCBYPCK on device tree, err=%ld\n",
 			PTR_ERR(clk));
 		clk_put(clk);
+		goto npcm7xx_init_fail_no_clk_on_dt;
 	}
 
 	/* Register plls */
@@ -705,6 +708,9 @@ static void __init npcm7xx_clk_init(struct device_node *clk_np)
 
 	return;
 
+npcm7xx_init_fail_no_clk_on_dt:
+	pr_err("see Documentation/devicetree/bindings/clock/"
+					"nuvoton,npcm750-clk.txt  for details\n");
 npcm7xx_init_fail:
 	if (npcm7xx_clk_data->num)
 		kfree(npcm7xx_clk_data->hws);
-- 
2.14.1

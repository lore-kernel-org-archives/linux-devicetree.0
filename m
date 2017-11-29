From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 3/9] soc: brcmstb: Make CPU credit offset more parameterized
Date: Wed, 29 Nov 2017 12:18:43 -0800
Message-ID: <20171129201849.17522-4-f.fainelli@gmail.com>
References: <20171129201849.17522-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171129201849.17522-1-f.fainelli@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: bcm-kernel-feedback-list@broadcom.com
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Gregory Fong <gregory.0xf0@gmail.com>, Brian Norris <computersforpeace@gmail.com>, "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

In preparation for fixing and changing values in the CPU_CREDIT_REG
register for B53-based systems, make the offset parameterized.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/soc/bcm/brcmstb/biuctrl.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/bcm/brcmstb/biuctrl.c b/drivers/soc/bcm/brcmstb/biuctrl.c
index 3c39415d484f..c3c548fcaa8c 100644
--- a/drivers/soc/bcm/brcmstb/biuctrl.c
+++ b/drivers/soc/bcm/brcmstb/biuctrl.c
@@ -26,6 +26,7 @@
 
 static void __iomem *cpubiuctrl_base;
 static bool mcp_wr_pairing_en;
+static unsigned int cpu_credit_reg_offset = CPU_CREDIT_REG_OFFSET;
 
 static int __init mcp_write_pairing_set(void)
 {
@@ -34,15 +35,15 @@ static int __init mcp_write_pairing_set(void)
 	if (!cpubiuctrl_base)
 		return -1;
 
-	creds = readl_relaxed(cpubiuctrl_base + CPU_CREDIT_REG_OFFSET);
+	creds = readl_relaxed(cpubiuctrl_base + cpu_credit_reg_offset);
 	if (mcp_wr_pairing_en) {
 		pr_info("MCP: Enabling write pairing\n");
 		writel_relaxed(creds | CPU_CREDIT_REG_MCPx_WR_PAIRING_EN_MASK,
-			     cpubiuctrl_base + CPU_CREDIT_REG_OFFSET);
+			     cpubiuctrl_base + cpu_credit_reg_offset);
 	} else if (creds & CPU_CREDIT_REG_MCPx_WR_PAIRING_EN_MASK) {
 		pr_info("MCP: Disabling write pairing\n");
 		writel_relaxed(creds & ~CPU_CREDIT_REG_MCPx_WR_PAIRING_EN_MASK,
-				cpubiuctrl_base + CPU_CREDIT_REG_OFFSET);
+				cpubiuctrl_base + cpu_credit_reg_offset);
 	} else {
 		pr_info("MCP: Write pairing already disabled\n");
 	}
@@ -81,7 +82,7 @@ static int brcmstb_cpu_credit_reg_suspend(void)
 {
 	if (cpubiuctrl_base)
 		cpu_credit_reg_dump =
-			readl_relaxed(cpubiuctrl_base + CPU_CREDIT_REG_OFFSET);
+			readl_relaxed(cpubiuctrl_base + cpu_credit_reg_offset);
 	return 0;
 }
 
@@ -89,7 +90,7 @@ static void brcmstb_cpu_credit_reg_resume(void)
 {
 	if (cpubiuctrl_base)
 		writel_relaxed(cpu_credit_reg_dump,
-				cpubiuctrl_base + CPU_CREDIT_REG_OFFSET);
+				cpubiuctrl_base + cpu_credit_reg_offset);
 }
 
 static struct syscore_ops brcmstb_cpu_credit_syscore_ops = {
-- 
2.9.3

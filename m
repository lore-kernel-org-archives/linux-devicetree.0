From: "Florian Fainelli" <f.fainelli@gmail.com>
Subject: [PATCH 1/3] ARM: kernel: get cpu clock rate from cpu clock node first
Date: Thu, 20 Jun 2013 15:39:04 +0100
Message-ID: <1371739146-32639-2-git-send-email-f.fainelli@gmail.com>
References: <1371739146-32639-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1371739146-32639-1-git-send-email-f.fainelli@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lorenzo.pieralisi@arm.com
Cc: Florian Fainelli <f.fainelli@gmail.com>, nico@linaro.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The current topology code will only attempt to parse a "clock-frequency"
property for a given CPU node. Some platforms such as the ecx-2000
provide a clock node. Change the logic to first look for a clock node,
and if we fail, fallback to parsing a "clock-frequency" property. To
avoid unnecessary casting, change rate from u32 to unsigned long, and
introduce the "prop" variable to hold the contents of the
"clock-frequency" property.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/kernel/topology.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
index c5a5954..8f340a1 100644
--- a/arch/arm/kernel/topology.c
+++ b/arch/arm/kernel/topology.c
@@ -21,6 +21,7 @@
 #include <linux/of.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/clk.h>
 
 #include <asm/cputype.h>
 #include <asm/topology.h>
@@ -104,7 +105,9 @@ static void __init parse_dt_topology(void)
 	cpu_capacity = kzalloc(alloc_size, GFP_NOWAIT);
 
 	while ((cn = of_find_node_by_type(cn, "cpu"))) {
-		const u32 *rate, *reg;
+		const u32 *prop, *reg;
+		unsigned long rate;
+		struct clk *cpu_clk;
 		int len;
 
 		if (cpu >= num_possible_cpus())
@@ -117,11 +120,17 @@ static void __init parse_dt_topology(void)
 		if (cpu_eff->compatible == NULL)
 			continue;
 
-		rate = of_get_property(cn, "clock-frequency", &len);
-		if (!rate || len != 4) {
-			pr_err("%s missing clock-frequency property\n",
-				cn->full_name);
-			continue;
+		cpu_clk = of_clk_get(cn, 0);
+		if (IS_ERR(cpu_clk)) {
+			prop = of_get_property(cn, "clock-frequency", &len);
+			if (!prop || len != 4) {
+				pr_err("%s missing clock-frequency property\n",
+					cn->full_name);
+				continue;
+			}
+			rate = be32_to_cpup(prop);
+		} else {
+			rate = clk_get_rate(cpu_clk);
 		}
 
 		reg = of_get_property(cn, "reg", &len);
@@ -130,7 +139,7 @@ static void __init parse_dt_topology(void)
 			continue;
 		}
 
-		capacity = ((be32_to_cpup(rate)) >> 20) * cpu_eff->efficiency;
+		capacity = (rate >> 20) * cpu_eff->efficiency;
 
 		/* Save min capacity of the system */
 		if (capacity < min_capacity)
-- 
1.8.1.2

From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Subject: [PATCH 3/3] arc: get rate from clk driver instead of reading device
 tree
Date: Fri,  3 Mar 2017 14:30:02 +0300
Message-ID: <1488540602-11438-4-git-send-email-vzakhar@synopsys.com>
References: <1488540602-11438-1-git-send-email-vzakhar@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <1488540602-11438-1-git-send-email-vzakhar@synopsys.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: linux-snps-arc@lists.infradead.org
Cc: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>, devicetree@vger.kernel.org, Vineet Gupta <vgupta@synopys.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

We were reading clock rate directly from device tree "clock-frequency"
property of corresponding clock node in show_cpuinfo function.

Such approach is correct only in case cpu is always clocked by
"fixed-clock". If we use clock driver that allows rate to be changed
this won't work as rate may change during the time or even
"clock-frequency" property may not be presented at all.

So this commit replaces reading device tree with getting rate from clock
driver. This approach is much more flexible and will work for both fixed
and mutable clocks.

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 arch/arc/kernel/setup.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 3093fa8..fa62404 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -10,6 +10,7 @@
 #include <linux/fs.h>
 #include <linux/delay.h>
 #include <linux/root_dev.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/clocksource.h>
 #include <linux/console.h>
@@ -488,8 +489,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 {
 	char *str;
 	int cpu_id = ptr_to_cpu(v);
-	struct device_node *core_clk = of_find_node_by_name(NULL, "core_clk");
-	u32 freq = 0;
+	struct device *cpu_dev = get_cpu_device(cpu_id);
+	struct clk *cpu_clk;
+	unsigned long freq = 0;
 
 	if (!cpu_online(cpu_id)) {
 		seq_printf(m, "processor [%d]\t: Offline\n", cpu_id);
@@ -502,9 +504,15 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 
 	seq_printf(m, arc_cpu_mumbojumbo(cpu_id, str, PAGE_SIZE));
 
-	of_property_read_u32(core_clk, "clock-frequency", &freq);
+	cpu_clk = clk_get(cpu_dev, NULL);
+	if (IS_ERR(cpu_clk)) {
+		seq_printf(m, "CPU speed \t: Cannot get clock for processor [%d]\n",
+			   cpu_id);
+	} else {
+		freq = clk_get_rate(cpu_clk);
+	}
 	if (freq)
-		seq_printf(m, "CPU speed\t: %u.%02u Mhz\n",
+		seq_printf(m, "CPU speed\t: %lu.%02lu Mhz\n",
 			   freq / 1000000, (freq / 10000) % 100);
 
 	seq_printf(m, "Bogo MIPS\t: %lu.%02lu\n",
-- 
2.7.4

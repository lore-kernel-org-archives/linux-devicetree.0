From: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 6/9] RISC-V: Support per-hart timebase-frequency
Date: Thu, 26 Jul 2018 16:37:20 +0200
Message-ID: <20180726143723.16585-7-hch@lst.de>
References: <20180726143723.16585-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180726143723.16585-1-hch@lst.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: tglx@linutronix.de, palmer@sifive.com, jason@lakedaemon.net, marc.zyngier@arm.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org, atish.patra@wdc.com, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, shorne@gmail.com
List-Id: devicetree@vger.kernel.org

From: Palmer Dabbelt <palmer@sifive.com>

This isn't actually how I want to do it, I just needed something right
now.

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/kernel/time.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 0df9b2cbd645..1bb01dc2d0f1 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -24,17 +24,24 @@ void __init init_clockevent(void)
 	csr_set(sie, SIE_STIE);
 }
 
-void __init time_init(void)
+static long __init timebase_frequency(void)
 {
 	struct device_node *cpu;
 	u32 prop;
 
 	cpu = of_find_node_by_path("/cpus");
-	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
-		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
-	riscv_timebase = prop;
+	if (cpu && !of_property_read_u32(cpu, "timebase-frequency", &prop))
+		return prop;
+	cpu = of_find_node_by_path("/cpus/cpu@0");
+	if (cpu && !of_property_read_u32(cpu, "timebase-frequency", &prop))
+		return prop;
 
-	lpj_fine = riscv_timebase / HZ;
+	panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
+}
 
+void __init time_init(void)
+{
+	riscv_timebase = timebase_frequency();
+	lpj_fine = riscv_timebase / HZ;
 	init_clockevent();
 }
-- 
2.18.0

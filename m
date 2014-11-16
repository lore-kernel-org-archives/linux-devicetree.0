From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 16/22] MIPS: BMIPS: Add special cache handling in c-r4k.c
Date: Sat, 15 Nov 2014 16:17:40 -0800
Message-ID: <1416097066-20452-17-git-send-email-cernekee@gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416097066-20452-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

BMIPS435x and BMIPS438x have a single shared L1 D$ and load/store unit,
so it isn't necessary to raise IPIs to keep both CPUs coherent.

BMIPS5000 has VIPT L1 caches that handle aliases in hardware, and its I$
fills from D$.  But a special sequence with 2 SYNCs and 32 NOPs is needed
to ensure coherency.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/mm/c-r4k.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index fbcd867..dd261df 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -917,6 +917,18 @@ static inline void alias_74k_erratum(struct cpuinfo_mips *c)
 	}
 }
 
+static void b5k_instruction_hazard(void)
+{
+	__sync();
+	__sync();
+	__asm__ __volatile__(
+	"       nop; nop; nop; nop; nop; nop; nop; nop\n"
+	"       nop; nop; nop; nop; nop; nop; nop; nop\n"
+	"       nop; nop; nop; nop; nop; nop; nop; nop\n"
+	"       nop; nop; nop; nop; nop; nop; nop; nop\n"
+	: : : "memory");
+}
+
 static char *way_string[] = { NULL, "direct mapped", "2-way",
 	"3-way", "4-way", "5-way", "6-way", "7-way", "8-way"
 };
@@ -1683,6 +1695,37 @@ void r4k_cache_init(void)
 
 	coherency_setup();
 	board_cache_error_setup = r4k_cache_error_setup;
+
+	/*
+	 * Per-CPU overrides
+	 */
+	switch (current_cpu_type()) {
+	case CPU_BMIPS4350:
+	case CPU_BMIPS4380:
+		/* No IPI is needed because all CPUs share the same D$ */
+		flush_data_cache_page = r4k_blast_dcache_page;
+		break;
+	case CPU_BMIPS5000:
+		/* We lose our superpowers if L2 is disabled */
+		if (c->scache.flags & MIPS_CACHE_NOT_PRESENT)
+			break;
+
+		/* I$ fills from D$ just by emptying the write buffers */
+		flush_cache_page = (void *)b5k_instruction_hazard;
+		flush_cache_range = (void *)b5k_instruction_hazard;
+		flush_cache_sigtramp = (void *)b5k_instruction_hazard;
+		local_flush_data_cache_page = (void *)b5k_instruction_hazard;
+		flush_data_cache_page = (void *)b5k_instruction_hazard;
+		flush_icache_range = (void *)b5k_instruction_hazard;
+		local_flush_icache_range = (void *)b5k_instruction_hazard;
+
+		/* Cache aliases are handled in hardware; allow HIGHMEM */
+		current_cpu_data.dcache.flags &= ~MIPS_CACHE_ALIASES;
+
+		/* Optimization: an L2 flush implicitly flushes the L1 */
+		current_cpu_data.options |= MIPS_CPU_INCLUSIVE_CACHES;
+		break;
+	}
 }
 
 static int r4k_cache_pm_notifier(struct notifier_block *self, unsigned long cmd,
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

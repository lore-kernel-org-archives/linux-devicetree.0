From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 15/22] MIPS: BMIPS: Let each platform customize the CPU1 IRQ mask
Date: Sat, 15 Nov 2014 16:17:39 -0800
Message-ID: <1416097066-20452-16-git-send-email-cernekee@gmail.com>
References: <1416097066-20452-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416097066-20452-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On some chips like bcm3384, "other stuff" gets wired up to CPU1's IE_IRQ1
input, generating spurious IRQs.  In this case we want the platform code
to be able to mask it off.

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/include/asm/bmips.h | 1 +
 arch/mips/kernel/smp-bmips.c  | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/bmips.h b/arch/mips/include/asm/bmips.h
index cbacceb..30939b0 100644
--- a/arch/mips/include/asm/bmips.h
+++ b/arch/mips/include/asm/bmips.h
@@ -84,6 +84,7 @@ extern char bmips_smp_int_vec_end;
 extern int bmips_smp_enabled;
 extern int bmips_cpu_offset;
 extern cpumask_t bmips_booted_mask;
+extern unsigned long bmips_tp1_irqs;
 
 extern void bmips_ebase_setup(void);
 extern asmlinkage void plat_wired_tlb_setup(void);
diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 162391d..b8bd934 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -43,6 +43,7 @@ static int __maybe_unused max_cpus = 1;
 int bmips_smp_enabled = 1;
 int bmips_cpu_offset;
 cpumask_t bmips_booted_mask;
+unsigned long bmips_tp1_irqs = IE_IRQ1;
 
 #define RESET_FROM_KSEG0		0x80080800
 #define RESET_FROM_KSEG1		0xa0080800
@@ -257,7 +258,7 @@ static void bmips_smp_finish(void)
 	write_c0_compare(read_c0_count() + mips_hpt_frequency / HZ);
 
 	irq_enable_hazard();
-	set_c0_status(IE_SW0 | IE_SW1 | IE_IRQ1 | IE_IRQ5 | ST0_IE);
+	set_c0_status(IE_SW0 | IE_SW1 | bmips_tp1_irqs | IE_IRQ5 | ST0_IE);
 	irq_enable_hazard();
 }
 
@@ -387,7 +388,8 @@ void __ref play_dead(void)
 	 * IRQ handlers; this clears ST0_IE and returns immediately.
 	 */
 	clear_c0_cause(CAUSEF_IV | C_SW0 | C_SW1);
-	change_c0_status(IE_IRQ5 | IE_IRQ1 | IE_SW0 | IE_SW1 | ST0_IE | ST0_BEV,
+	change_c0_status(
+		IE_IRQ5 | bmips_tp1_irqs | IE_SW0 | IE_SW1 | ST0_IE | ST0_BEV,
 		IE_SW0 | IE_SW1 | ST0_IE | ST0_BEV);
 	irq_disable_hazard();
 
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

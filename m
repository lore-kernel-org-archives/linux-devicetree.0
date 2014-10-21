From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH/RFC 03/17] MIPS: BMIPS: Introduce helper function to change the reset vector
Date: Mon, 20 Oct 2014 21:27:53 -0700
Message-ID: <1413865687-15255-4-git-send-email-cernekee@gmail.com>
References: <1413865687-15255-1-git-send-email-cernekee@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413865687-15255-1-git-send-email-cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This will need to be called from a few different places, and the logic
is starting to get a bit hairy (with the need for IPIs, CPU bug
workarounds, and hazards).

Signed-off-by: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/kernel/smp-bmips.c | 65 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 58 insertions(+), 7 deletions(-)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 4e56911..8383fa4 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -35,6 +35,7 @@
 #include <asm/bmips.h>
 #include <asm/traps.h>
 #include <asm/barrier.h>
+#include <asm/cpu-features.h>
 
 static int __maybe_unused max_cpus = 1;
 
@@ -43,6 +44,9 @@ int bmips_smp_enabled = 1;
 int bmips_cpu_offset;
 cpumask_t bmips_booted_mask;
 
+#define RESET_FROM_KSEG0		0x80080800
+#define RESET_FROM_KSEG1		0xa0080800
+
 #ifdef CONFIG_SMP
 
 /* initial $sp, $gp - used by arch/mips/kernel/bmips_vec.S */
@@ -463,10 +467,61 @@ static inline void bmips_nmi_handler_setup(void)
 		&bmips_smp_int_vec_end);
 }
 
+struct reset_vec_info {
+	int cpu;
+	u32 val;
+};
+
+static void bmips_set_reset_vec_remote(void *vinfo)
+{
+	struct reset_vec_info *info = vinfo;
+	int shift = info->cpu & 0x01 ? 16 : 0;
+	u32 mask = ~(0xffff << shift), val = info->val >> 16;
+
+	preempt_disable();
+	if (smp_processor_id() > 0) {
+		smp_call_function_single(0, &bmips_set_reset_vec_remote,
+					 info, 1);
+	} else {
+		if (info->cpu & 0x02) {
+			/* BMIPS5200 "should" use mask/shift, but it's buggy */
+			bmips_write_zscm_reg(0xa0, (val << 16) | val);
+			bmips_read_zscm_reg(0xa0);
+		} else {
+			write_c0_brcm_bootvec((read_c0_brcm_bootvec() & mask) |
+					      (val << shift));
+		}
+	}
+	preempt_enable();
+}
+
+static void bmips_set_reset_vec(int cpu, u32 val)
+{
+	struct reset_vec_info info;
+
+	if (current_cpu_type() == CPU_BMIPS5000) {
+		/* this needs to run from CPU0 (which is always online) */
+		info.cpu = cpu;
+		info.val = val;
+		bmips_set_reset_vec_remote(&info);
+	} else {
+		void __iomem *cbr = BMIPS_GET_CBR();
+
+		if (cpu == 0)
+			__raw_writel(val, cbr + BMIPS_RELO_VECTOR_CONTROL_0);
+		else {
+			if (current_cpu_type() != CPU_BMIPS4380)
+				return;
+			__raw_writel(val, cbr + BMIPS_RELO_VECTOR_CONTROL_1);
+		}
+	}
+	__sync();
+	back_to_back_c0_hazard();
+}
+
 void bmips_ebase_setup(void)
 {
 	unsigned long new_ebase = ebase;
-	void __iomem __maybe_unused *cbr;
 
 	BUG_ON(ebase != CKSEG0);
 
@@ -492,9 +547,7 @@ void bmips_ebase_setup(void)
 		 * 0x8000_0400: normal vectors
 		 */
 		new_ebase = 0x80000400;
-		cbr = BMIPS_GET_CBR();
-		__raw_writel(0x80080800, cbr + BMIPS_RELO_VECTOR_CONTROL_0);
-		__raw_writel(0xa0080800, cbr + BMIPS_RELO_VECTOR_CONTROL_1);
+		bmips_set_reset_vec(0, RESET_FROM_KSEG0);
 		break;
 	case CPU_BMIPS5000:
 		/*
@@ -502,10 +555,8 @@ void bmips_ebase_setup(void)
 		 * 0x8000_1000: normal vectors
 		 */
 		new_ebase = 0x80001000;
-		write_c0_brcm_bootvec(0xa0088008);
+		bmips_set_reset_vec(0, RESET_FROM_KSEG0);
 		write_c0_ebase(new_ebase);
-		if (max_cpus > 2)
-			bmips_write_zscm_reg(0xa0, 0xa008a008);
 		break;
 	default:
 		return;
-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

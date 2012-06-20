From: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 4/5] sched, x86: Remove broken power estimation
Date: Wed, 20 Jun 2012 17:19:21 +0200
Message-ID: <1340205562-7653-5-git-send-email-vincent.guittot@linaro.org>
References: <1340205562-7653-1-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1340205562-7653-1-git-send-email-vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yong.zhang0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, namhyung-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>

The x86 sched power implementation has been broken forever and gets in
the way of other stuff, remove it.

For archaeological interest, fixing this code would require dealing with
the cross-cpu calling of these functions and more importantly, we need
to filter idle time out of the a/m-perf stuff because the ratio will go
down to 0 when idle, giving a 0 capacity which is not what we'd want.

Signed-off-by: Peter Zijlstra <a.p.zijlstra-/NLkJaSkS4VmR6Xm/wNWPw@public.gmane.org>
Link: http://lkml.kernel.org/n/tip-wjjwelpti8f8k7i1pdnzmdr8-Ckxz5ZWcFp/9qxiX1TGQuw@public.gmane.org
---
 arch/x86/kernel/cpu/Makefile |    2 +-
 arch/x86/kernel/cpu/sched.c  |   55 ------------------------------------------
 2 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 arch/x86/kernel/cpu/sched.c

diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index 6ab6aa2..c598126 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -14,7 +14,7 @@ CFLAGS_common.o		:= $(nostackp)
 
 obj-y			:= intel_cacheinfo.o scattered.o topology.o
 obj-y			+= proc.o capflags.o powerflags.o common.o
-obj-y			+= vmware.o hypervisor.o sched.o mshyperv.o
+obj-y			+= vmware.o hypervisor.o mshyperv.o
 obj-y			+= rdrand.o
 obj-y			+= match.o
 
diff --git a/arch/x86/kernel/cpu/sched.c b/arch/x86/kernel/cpu/sched.c
deleted file mode 100644
index a640ae5..0000000
--- a/arch/x86/kernel/cpu/sched.c
+++ /dev/null
@@ -1,55 +0,0 @@
-#include <linux/sched.h>
-#include <linux/math64.h>
-#include <linux/percpu.h>
-#include <linux/irqflags.h>
-
-#include <asm/cpufeature.h>
-#include <asm/processor.h>
-
-#ifdef CONFIG_SMP
-
-static DEFINE_PER_CPU(struct aperfmperf, old_perf_sched);
-
-static unsigned long scale_aperfmperf(void)
-{
-	struct aperfmperf val, *old = &__get_cpu_var(old_perf_sched);
-	unsigned long ratio, flags;
-
-	local_irq_save(flags);
-	get_aperfmperf(&val);
-	local_irq_restore(flags);
-
-	ratio = calc_aperfmperf_ratio(old, &val);
-	*old = val;
-
-	return ratio;
-}
-
-unsigned long arch_scale_freq_power(struct sched_domain *sd, int cpu)
-{
-	/*
-	 * do aperf/mperf on the cpu level because it includes things
-	 * like turbo mode, which are relevant to full cores.
-	 */
-	if (boot_cpu_has(X86_FEATURE_APERFMPERF))
-		return scale_aperfmperf();
-
-	/*
-	 * maybe have something cpufreq here
-	 */
-
-	return default_scale_freq_power(sd, cpu);
-}
-
-unsigned long arch_scale_smt_power(struct sched_domain *sd, int cpu)
-{
-	/*
-	 * aperf/mperf already includes the smt gain
-	 */
-	if (boot_cpu_has(X86_FEATURE_APERFMPERF))
-		return SCHED_LOAD_SCALE;
-
-	return default_scale_smt_power(sd, cpu);
-}
-
-#endif
-- 
1.7.9.5

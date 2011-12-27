From: Richard Zhao <richard.zhao@linaro.org>
Subject: [PATCH V5 2/7] arm/imx: cpufreq: remove loops_per_jiffy recalculate for smp
Date: Tue, 27 Dec 2011 16:24:17 +0800
Message-ID: <1324974262-30963-3-git-send-email-richard.zhao@linaro.org>
References: <1324974262-30963-1-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1324974262-30963-1-git-send-email-richard.zhao@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: linux@arm.linux.org.uk, davej@redhat.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, rdunlap@xenotime.net, kernel@pengutronix.de, shawn.guo@linaro.org, catalin.marinas@arm.com, eric.miao@linaro.org, mark.langsdorf@calxeda.com, davidb@codeaurora.org, arnd@arndb.de, bryanh@codeaurora.org, jamie@jamieiles.com, marc.zyngier@arm.com, linaro-dev@lists.linaro.org, patches@linaro.org, Richard Zhao <richard.zhao@linaro.org>
List-Id: devicetree@vger.kernel.org

arm registered cpufreq transition notifier to recalculate it.

Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
---
 arch/arm/plat-mxc/cpufreq.c |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/arch/arm/plat-mxc/cpufreq.c b/arch/arm/plat-mxc/cpufreq.c
index c937e75..364793a 100644
--- a/arch/arm/plat-mxc/cpufreq.c
+++ b/arch/arm/plat-mxc/cpufreq.c
@@ -99,16 +99,6 @@ static int mxc_set_target(struct cpufreq_policy *policy,
 
 	ret = set_cpu_freq(freq_Hz);
 
-#ifdef CONFIG_SMP
-	/* loops_per_jiffy is not updated by the cpufreq core for SMP systems.
-	 * So update it for all CPUs.
-	 */
-	for_each_possible_cpu(cpu)
-		per_cpu(cpu_data, cpu).loops_per_jiffy =
-		cpufreq_scale(per_cpu(cpu_data, cpu).loops_per_jiffy,
-					freqs.old, freqs.new);
-#endif
-
 	for_each_possible_cpu(cpu) {
 		freqs.cpu = cpu;
 		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-- 
1.7.5.4



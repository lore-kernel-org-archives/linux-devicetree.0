From: Gilad Ben-Yossef <gilad@benyossef.com>
Subject: [RFC PATCH 1/9] arm: avoid using on_each_cpu hard coded ret value
Date: Tue,  3 Jan 2012 16:19:05 +0200
Message-ID: <1325600353-10895-2-git-send-email-gilad@benyossef.com>
References: <1325600353-10895-1-git-send-email-gilad@benyossef.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1325600353-10895-1-git-send-email-gilad@benyossef.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Gilad Ben-Yossef <gilad@benyossef.com>, Michal Nazarewicz <mina86@mina86.com>, Will Deacon <will.deacon@arm.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@ghostprotocols.net>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

on_each_cpu always returns a hard coded return code of zero.

Removing all tests based on this return value saves run time
cycles for compares and code bloat for branches.

Cc: Michal Nazarewicz <mina86@mina86.com>
CC: Will Deacon <will.deacon@arm.com>
CC: Peter Zijlstra <a.p.zijlstra@chello.nl>
CC: Paul Mackerras <paulus@samba.org>
CC: Ingo Molnar <mingo@elte.hu>
CC: Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
CC: Russell King <linux@arm.linux.org.uk>
CC: Grant Likely <grant.likely@secretlab.ca>
CC: Rob Herring <rob.herring@calxeda.com>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree-discuss@lists.ozlabs.org
---
 arch/arm/kernel/perf_event.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/kernel/perf_event.c b/arch/arm/kernel/perf_event.c
index 88b0941..bfd58d8 100644
--- a/arch/arm/kernel/perf_event.c
+++ b/arch/arm/kernel/perf_event.c
@@ -617,7 +617,7 @@ static int __init
 cpu_pmu_reset(void)
 {
 	if (cpu_pmu && cpu_pmu->reset)
-		return on_each_cpu(cpu_pmu->reset, NULL, 1);
+		on_each_cpu(cpu_pmu->reset, NULL, 1);
 	return 0;
 }
 arch_initcall(cpu_pmu_reset);
-- 
1.7.0.4

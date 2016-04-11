From: Ashok Kumar <ashoks@broadcom.com>
Subject: [PATCH v4 6/6] arm64/perf: Add Broadcom Vulcan PMU support
Date: Mon, 11 Apr 2016 06:02:21 -0700
Message-ID: <1460379741-1181-7-git-send-email-ashoks@broadcom.com>
References: <1460379741-1181-1-git-send-email-ashoks@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1460379741-1181-1-git-send-email-ashoks@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, mark.rutland@arm.com, will.deacon@arm.com, Suzuki.Poulose@arm.com, robh+dt@kernel.org, catalin.marinas@arm.com
Cc: jchandra@broadcom.com, Ashok Kumar <ashoks@broadcom.com>, jglauber@cavium.com
List-Id: devicetree@vger.kernel.org

Broadcom Vulcan uses ARMv8 PMUv3 and supports most of
the ARMv8 recommended implementation defined events.

Added Vulcan events mapping for perf and perf_cache map.

Signed-off-by: Ashok Kumar <ashoks@broadcom.com>
---
 arch/arm64/kernel/perf_event.c | 60 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
index ac250b5..8174e01 100644
--- a/arch/arm64/kernel/perf_event.c
+++ b/arch/arm64/kernel/perf_event.c
@@ -233,6 +233,20 @@ static const unsigned armv8_thunder_perf_map[PERF_COUNT_HW_MAX] = {
 	[PERF_COUNT_HW_STALLED_CYCLES_BACKEND]	= ARMV8_PMUV3_PERFCTR_STALL_BACKEND,
 };
 
+/* Broadcom Vulcan events mapping */
+static const unsigned armv8_vulcan_perf_map[PERF_COUNT_HW_MAX] = {
+	PERF_MAP_ALL_UNSUPPORTED,
+	[PERF_COUNT_HW_CPU_CYCLES]		= ARMV8_PMUV3_PERFCTR_CPU_CYCLES,
+	[PERF_COUNT_HW_INSTRUCTIONS]		= ARMV8_PMUV3_PERFCTR_INST_RETIRED,
+	[PERF_COUNT_HW_CACHE_REFERENCES]	= ARMV8_PMUV3_PERFCTR_L1D_CACHE,
+	[PERF_COUNT_HW_CACHE_MISSES]		= ARMV8_PMUV3_PERFCTR_L1D_CACHE_REFILL,
+	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS]	= ARMV8_PMUV3_PERFCTR_BR_RETIRED,
+	[PERF_COUNT_HW_BRANCH_MISSES]		= ARMV8_PMUV3_PERFCTR_BR_MIS_PRED,
+	[PERF_COUNT_HW_BUS_CYCLES]		= ARMV8_PMUV3_PERFCTR_BUS_CYCLES,
+	[PERF_COUNT_HW_STALLED_CYCLES_FRONTEND]	= ARMV8_PMUV3_PERFCTR_STALL_FRONTEND,
+	[PERF_COUNT_HW_STALLED_CYCLES_BACKEND]	= ARMV8_PMUV3_PERFCTR_STALL_BACKEND,
+};
+
 static const unsigned armv8_pmuv3_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
 						[PERF_COUNT_HW_CACHE_OP_MAX]
 						[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
@@ -325,6 +339,35 @@ static const unsigned armv8_thunder_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
 	[C(BPU)][C(OP_WRITE)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_BR_MIS_PRED,
 };
 
+static const unsigned armv8_vulcan_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
+					      [PERF_COUNT_HW_CACHE_OP_MAX]
+					      [PERF_COUNT_HW_CACHE_RESULT_MAX] = {
+	PERF_CACHE_MAP_ALL_UNSUPPORTED,
+
+	[C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_IMPDEF_PERFCTR_L1D_CACHE_RD,
+	[C(L1D)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_RD,
+	[C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)]	= ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR,
+	[C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]	= ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR,
+
+	[C(L1I)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_PMUV3_PERFCTR_L1I_CACHE,
+	[C(L1I)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_L1I_CACHE_REFILL,
+
+	[C(ITLB)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_L1I_TLB_REFILL,
+	[C(ITLB)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_PMUV3_PERFCTR_L1I_TLB,
+
+	[C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
+	[C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
+	[C(DTLB)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
+	[C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]	= ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
+
+	[C(BPU)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_PMUV3_PERFCTR_BR_PRED,
+	[C(BPU)][C(OP_READ)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_BR_MIS_PRED,
+	[C(BPU)][C(OP_WRITE)][C(RESULT_ACCESS)]	= ARMV8_PMUV3_PERFCTR_BR_PRED,
+	[C(BPU)][C(OP_WRITE)][C(RESULT_MISS)]	= ARMV8_PMUV3_PERFCTR_BR_MIS_PRED,
+
+	[C(NODE)][C(OP_READ)][C(RESULT_ACCESS)]	= ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
+	[C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
+};
 
 static ssize_t
 armv8pmu_events_sysfs_show(struct device *dev,
@@ -890,6 +933,13 @@ static int armv8_thunder_map_event(struct perf_event *event)
 				ARMV8_PMU_EVTYPE_EVENT);
 }
 
+static int armv8_vulcan_map_event(struct perf_event *event)
+{
+	return armpmu_map_event(event, &armv8_vulcan_perf_map,
+				&armv8_vulcan_perf_cache_map,
+				ARMV8_PMU_EVTYPE_EVENT);
+}
+
 static void armv8pmu_read_num_pmnc_events(void *info)
 {
 	int *nb_cnt = info;
@@ -989,12 +1039,22 @@ static int armv8_thunder_pmu_init(struct arm_pmu *cpu_pmu)
 	return armv8pmu_probe_pmu(cpu_pmu);
 }
 
+static int armv8_vulcan_pmu_init(struct arm_pmu *cpu_pmu)
+{
+	armv8_pmu_init(cpu_pmu);
+	cpu_pmu->name			= "armv8_brcm_vulcan";
+	cpu_pmu->map_event		= armv8_vulcan_map_event;
+	cpu_pmu->pmu.attr_groups	= armv8_pmuv3_attr_groups;
+	return armv8pmu_probe_pmu(cpu_pmu);
+}
+
 static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "arm,armv8-pmuv3",	.data = armv8_pmuv3_init},
 	{.compatible = "arm,cortex-a53-pmu",	.data = armv8_a53_pmu_init},
 	{.compatible = "arm,cortex-a57-pmu",	.data = armv8_a57_pmu_init},
 	{.compatible = "arm,cortex-a72-pmu",	.data = armv8_a72_pmu_init},
 	{.compatible = "cavium,thunder-pmu",	.data = armv8_thunder_pmu_init},
+	{.compatible = "brcm,vulcan-pmu",	.data = armv8_vulcan_pmu_init},
 	{},
 };
 
-- 
2.1.0

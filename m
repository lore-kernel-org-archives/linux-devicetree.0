From: Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH v7 0/6] perf: Support for ARM DynamIQ Shared Unit
Date: Fri,  6 Oct 2017 11:36:04 +0100
Message-ID: <20171006103610.11853-1-suzuki.poulose@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan.Cameron-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for the PMU in ARM DynamIQ Shared Unit (DSU).
The DSU integrates one or more cores with an L3 memory system, control
logic, and external interfaces to form a multicore cluster. The PMU
allows counting the various events related to L3, SCU etc, using 32bit
independent counters along with a 64bit cycle counter.

The PMU can only be accessed via CPU system registers, which are common
to the cores connected to the same DSU. The PMU registers follow the
semantics of the ARMv8 PMU, mostly, with the exception that
the counters record the cluster wide events.

Tested on a Fast model with DSU. The driver only supports ARM64 at the
moment. It can be extended to support ARM32 by providing register
accessors like we do in arch/arm64/include/arm_dsu_pmu.h.

The firmware should setup appropriate bits in the ACTLR_EL3/EL2 to
allow EL1 access to the PMU registers.

Series applies on v4.14-rc3 and is also available at:

  git://linux-arm.org/linux-skp.git 4.14/dsu-v7

Changes since V6
 - Rebased to v4.14-rc3
 - Use of_cpu_device_node_get() instead of slower of_get_cpu_node(),
   where the former uses per_cpu data when available and falls back to
   former otherwise.
 - Added Reviewed-by tags from Jonathan
Changes since V5:
 - Pickedup ack from Rob
 - Address comments on V5 by Mark.
 - Use IRQ_NOBALANCING for IRQ handler
 - Don't expose events which could be unimplemented.
 - Get rid of dsu_pmu_event_supported and allow raw event
   code to be used without validating whether it is supported.
 - Rename "supported_cpus" mask to "associated_cpus"
 - Add Documentation for the PMU driver
 - Don't disable IRQ for dsu_pmu_{enable/disable}_counters
 - Use consistent return codes for validate_event/group calls.
 - Check PERF_ATTACH_TASK flag in event_init.
 - Allow missing CPUs in dsu_pmu_dt_get_cpus, to handle cases
   where kernel could have capped nr_cpus.
 - Cleanup sanity checking for the CPU before accessing DSU
 - Reject events with counting CPU not associated with DSU

Changes since V4:
 - Fix regressions introduced by v4, with the rename of generic
   helper.
 - Added reviewed-by tag from Rob

Changes since V3:
 - Rename the of generic helper to of_cpu_node_to_id(), and return
   -ENODEV upon failure than nr_cpus_id
 - Fix node name in device tree node example.

Suzuki K Poulose (6):
  perf: Export perf_event_update_userpage
  of: Add helper for mapping device node to logical CPU number
  coresight: of: Use of_cpu_node_to_id helper
  irqchip: gic-v3: Use of_cpu_node_to_id helper
  dt-bindings: Document devicetree binding for ARM DSU PMU
  perf: ARM DynamIQ Shared Unit PMU support

 .../devicetree/bindings/arm/arm-dsu-pmu.txt        |  27 +
 Documentation/perf/arm_dsu_pmu.txt                 |  28 +
 arch/arm64/include/asm/arm_dsu_pmu.h               | 124 ++++
 drivers/hwtracing/coresight/of_coresight.c         |  15 +-
 drivers/irqchip/irq-gic-v3.c                       |  29 +-
 drivers/of/base.c                                  |  26 +
 drivers/perf/Kconfig                               |   9 +
 drivers/perf/Makefile                              |   1 +
 drivers/perf/arm_dsu_pmu.c                         | 826 +++++++++++++++++++++
 include/linux/of.h                                 |   7 +
 kernel/events/core.c                               |   1 +
 11 files changed, 1054 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm-dsu-pmu.txt
 create mode 100644 Documentation/perf/arm_dsu_pmu.txt
 create mode 100644 arch/arm64/include/asm/arm_dsu_pmu.h
 create mode 100644 drivers/perf/arm_dsu_pmu.c

-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

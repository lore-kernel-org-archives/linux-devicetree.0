Return-Path: <SRS0=bjk3=QP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50070.outbound.protection.outlook.com ([40.107.5.70]:14256
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727373AbfBHSct (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Feb 2019 13:32:49 -0500
From: Frank Li <frank.li@nxp.com>
Subject: [PATCH 1/4] drivers/perf: imx_ddr: Add ddr performance counter
 support
Date: Fri, 8 Feb 2019 18:32:39 +0000
Message-ID: <1549650743-27581-1-git-send-email-Frank.Li@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "mark.rutland@arm.com" <mark.rutland@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lznuaa@gmail.com" <lznuaa@gmail.com>
Cc: Frank Li <frank.li@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add ddr performance monitor support for iMX8QXP.
Support below events.

  ddr0/activate/                                     [Kernel PMU event]
  ddr0/axid-read/                                    [Kernel PMU event]
  ddr0/axid-write/                                   [Kernel PMU event]
  ddr0/cycles/                                       [Kernel PMU event]
  ddr0/hp-read-credit-cnt/                           [Kernel PMU event]
  ddr0/hp-read/                                      [Kernel PMU event]
  ddr0/hp-req-nodcredit/                             [Kernel PMU event]
  ddr0/hp-xact-credit/                               [Kernel PMU event]
  ddr0/load-mode/                                    [Kernel PMU event]
  ddr0/lp-read-credit-cnt/                           [Kernel PMU event]
  ddr0/lp-req-nocredit/                              [Kernel PMU event]
  ddr0/lp-xact-credit/                               [Kernel PMU event]
  ddr0/mwr/                                          [Kernel PMU event]
  ddr0/precharge/                                    [Kernel PMU event]
  ddr0/raw-hazard/                                   [Kernel PMU event]
  ddr0/read-access/                                  [Kernel PMU event]
  ddr0/read-activate/                                [Kernel PMU event]
  ddr0/read-command/                                 [Kernel PMU event]
  ddr0/read-cycles/                                  [Kernel PMU event]
  ddr0/read-modify-write-command/                    [Kernel PMU event]
  ddr0/read-queue-depth/                             [Kernel PMU event]
  ddr0/read-write-transition/                        [Kernel PMU event]
  ddr0/read/                                         [Kernel PMU event]
  ddr0/refresh/                                      [Kernel PMU event]
  ddr0/selfresh/                                     [Kernel PMU event]
  ddr0/wr-xact-credit/                               [Kernel PMU event]
  ddr0/write-access/                                 [Kernel PMU event]
  ddr0/write-command/                                [Kernel PMU event]
  ddr0/write-credit-cnt/                             [Kernel PMU event]
  ddr0/write-cycles/                                 [Kernel PMU event]
  ddr0/write-queue-depth/                            [Kernel PMU event]
  ddr0/write/

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/perf/Kconfig             |   7 +
 drivers/perf/Makefile            |   1 +
 drivers/perf/fsl_imx8_ddr_perf.c | 532 +++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 540 insertions(+)
 create mode 100644 drivers/perf/fsl_imx8_ddr_perf.c

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index af9bc17..1e6664a 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -61,6 +61,13 @@ config ARM_DSU_PMU
 	  system, control logic. The PMU allows counting various events related
 	  to DSU.
=20
+config FSL_IMX8_DDR_PERF
+	tristate "Freescale i.MX8 DDR perf monitor"
+	depends on ARCH_MXC
+	  help
+	  Provides support for ddr perfomance monitor in i.MX8QX. Provide memory
+	  througput information.
+
 config HISI_PMU
        bool "HiSilicon SoC PMU"
        depends on ARM64 && ACPI
diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
index 909f27f..f832de7 100644
--- a/drivers/perf/Makefile
+++ b/drivers/perf/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_ARM_CCN) +=3D arm-ccn.o
 obj-$(CONFIG_ARM_DSU_PMU) +=3D arm_dsu_pmu.o
 obj-$(CONFIG_ARM_PMU) +=3D arm_pmu.o arm_pmu_platform.o
 obj-$(CONFIG_ARM_PMU_ACPI) +=3D arm_pmu_acpi.o
+obj-$(CONFIG_FSL_IMX8_DDR_PERF) +=3D fsl_imx8_ddr_perf.o
 obj-$(CONFIG_HISI_PMU) +=3D hisilicon/
 obj-$(CONFIG_QCOM_L2_PMU)	+=3D qcom_l2_pmu.o
 obj-$(CONFIG_QCOM_L3_PMU) +=3D qcom_l3_pmu.o
diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_p=
erf.c
new file mode 100644
index 0000000..63c068c
--- /dev/null
+++ b/drivers/perf/fsl_imx8_ddr_perf.c
@@ -0,0 +1,532 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2017 NXP
+ * Copyright 2016 Freescale Semiconductor, Inc.
+ *
+ * The code contained herein is licensed under the GNU General Public
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/perf_event.h>
+#include <linux/slab.h>
+
+
+#define COUNTER_CNTL		0x0
+#define COUNTER_READ		0x20
+
+#define COUNTER_DPCR1		0x30
+
+#define CNTL_OVER		0x1
+#define CNTL_CLEAR		0x2
+#define CNTL_EN			0x4
+#define CNTL_EN_MASK		0xFFFFFFFB
+#define CNTL_CLEAR_MASK		0xFFFFFFFD
+#define CNTL_OVER_MASK		0xFFFFFFFE
+
+#define CNTL_CSV_SHIFT		24
+#define CNTL_CSV_MASK		(0xFF << CNTL_CSV_SHIFT)
+
+#define EVENT_CYCLES_ID		0
+#define EVENT_CYCLES_COUNTER	0
+#define NUM_COUNTER		4
+#define MAX_EVENT		3
+
+#define to_ddr_pmu(p)		container_of(p, struct ddr_pmu, pmu)
+
+#define DDR_PERF_DEV_NAME	"ddr_perf"
+
+static DEFINE_IDA(ddr_ida);
+
+PMU_EVENT_ATTR_STRING(cycles, ddr_perf_cycles, "event=3D0x00");
+PMU_EVENT_ATTR_STRING(selfresh, ddr_perf_selfresh, "event=3D0x01");
+PMU_EVENT_ATTR_STRING(read-access, ddr_perf_read_accesses, "event=3D0x04")=
;
+PMU_EVENT_ATTR_STRING(write-access, ddr_perf_write_accesses, "event=3D0x05=
");
+PMU_EVENT_ATTR_STRING(read-queue-depth, ddr_perf_read_queue_depth,
+		"event=3D0x08");
+PMU_EVENT_ATTR_STRING(write-queue-depth, ddr_perf_write_queue_depth,
+		"event=3D0x09");
+PMU_EVENT_ATTR_STRING(lp-read-credit-cnt, ddr_perf_lp_read_credit_cnt,
+		"event=3D0x10");
+PMU_EVENT_ATTR_STRING(hp-read-credit-cnt, ddr_perf_hp_read_credit_cnt,
+		"event=3D0x11");
+PMU_EVENT_ATTR_STRING(write-credit-cnt, ddr_perf_write_credit_cnt,
+		"event=3D0x12");
+PMU_EVENT_ATTR_STRING(read-command, ddr_perf_read_command, "event=3D0x20")=
;
+PMU_EVENT_ATTR_STRING(write-command, ddr_perf_write_command, "event=3D0x21=
");
+PMU_EVENT_ATTR_STRING(read-modify-write-command,
+		ddr_perf_read_modify_write_command, "event=3D0x22");
+PMU_EVENT_ATTR_STRING(hp-read, ddr_perf_hp_read, "event=3D0x23");
+PMU_EVENT_ATTR_STRING(hp-req-nodcredit, ddr_perf_hp_req_nocredit, "event=
=3D0x24");
+PMU_EVENT_ATTR_STRING(hp-xact-credit, ddr_perf_hp_xact_credit, "event=3D0x=
25");
+PMU_EVENT_ATTR_STRING(lp-req-nocredit, ddr_perf_lp_req_nocredit, "event=3D=
0x26");
+PMU_EVENT_ATTR_STRING(lp-xact-credit, ddr_perf_lp_xact_credit, "event=3D0x=
27");
+PMU_EVENT_ATTR_STRING(wr-xact-credit, ddr_perf_wr_xact_credit, "event=3D0x=
29");
+PMU_EVENT_ATTR_STRING(read-cycles, ddr_perf_read_cycles, "event=3D0x2a");
+PMU_EVENT_ATTR_STRING(write-cycles, ddr_perf_write_cycles, "event=3D0x2b")=
;
+PMU_EVENT_ATTR_STRING(read-write-transition, ddr_perf_read_write_transitio=
n,
+		"event=3D0x30");
+PMU_EVENT_ATTR_STRING(precharge, ddr_perf_precharge, "event=3D0x31");
+PMU_EVENT_ATTR_STRING(activate, ddr_perf_activate, "event=3D0x32");
+PMU_EVENT_ATTR_STRING(load-mode, ddr_perf_load_mode, "event=3D0x33");
+PMU_EVENT_ATTR_STRING(mwr, ddr_perf_mwr, "event=3D0x34");
+PMU_EVENT_ATTR_STRING(read, ddr_perf_read, "event=3D0x35");
+PMU_EVENT_ATTR_STRING(read-activate, ddr_perf_read_activate, "event=3D0x36=
");
+PMU_EVENT_ATTR_STRING(refresh, ddr_perf_refresh, "event=3D0x37");
+PMU_EVENT_ATTR_STRING(write, ddr_perf_write, "event=3D0x38");
+PMU_EVENT_ATTR_STRING(raw-hazard, ddr_perf_raw_hazard, "event=3D0x39");
+
+PMU_EVENT_ATTR_STRING(axid-read, ddr_perf_axid_read, "event=3D0x41");
+PMU_EVENT_ATTR_STRING(axid-write, ddr_perf_axid_write, "event=3D0x42");
+
+#define DDR_CAP_AXI_ID 0x1
+
+struct fsl_ddr_devtype_data {
+	unsigned int flags;
+};
+
+static const struct fsl_ddr_devtype_data imx8_data;
+static const struct fsl_ddr_devtype_data imx8m_data =3D {
+	.flags =3D DDR_CAP_AXI_ID,
+};
+
+static const struct of_device_id imx_ddr_pmu_dt_ids[] =3D {
+	{ .compatible =3D "fsl,imx8-ddr-pmu", .data =3D (void *)&imx8_data},
+	{ .compatible =3D "fsl,imx8m-ddr-pmu", .data =3D (void *)&imx8m_data},
+	{ /* sentinel */ }
+};
+
+struct ddr_pmu {
+	struct pmu pmu;
+	void __iomem *base;
+	cpumask_t cpu;
+	struct	hlist_node node;
+	struct	device *dev;
+	struct perf_event *active_events[NUM_COUNTER];
+	int total_events;
+	bool cycles_active;
+	struct fsl_ddr_devtype_data *devtype;
+};
+
+static ssize_t ddr_perf_cpumask_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct ddr_pmu *pmu =3D dev_get_drvdata(dev);
+
+	return cpumap_print_to_pagebuf(true, buf, &pmu->cpu);
+}
+
+static struct device_attribute ddr_perf_cpumask_attr =3D
+	__ATTR(cpumask, 0444, ddr_perf_cpumask_show, NULL);
+
+static struct attribute *ddr_perf_cpumask_attrs[] =3D {
+	&ddr_perf_cpumask_attr.attr,
+	NULL,
+};
+
+static struct attribute_group ddr_perf_cpumask_attr_group =3D {
+	.attrs =3D ddr_perf_cpumask_attrs,
+};
+
+static struct attribute *ddr_perf_events_attrs[] =3D {
+	&ddr_perf_cycles.attr.attr,
+	&ddr_perf_selfresh.attr.attr,
+	&ddr_perf_read_accesses.attr.attr,
+	&ddr_perf_write_accesses.attr.attr,
+	&ddr_perf_read_queue_depth.attr.attr,
+	&ddr_perf_write_queue_depth.attr.attr,
+	&ddr_perf_lp_read_credit_cnt.attr.attr,
+	&ddr_perf_hp_read_credit_cnt.attr.attr,
+	&ddr_perf_write_credit_cnt.attr.attr,
+	&ddr_perf_read_command.attr.attr,
+	&ddr_perf_write_command.attr.attr,
+	&ddr_perf_read_modify_write_command.attr.attr,
+	&ddr_perf_hp_read.attr.attr,
+	&ddr_perf_hp_req_nocredit.attr.attr,
+	&ddr_perf_hp_xact_credit.attr.attr,
+	&ddr_perf_lp_req_nocredit.attr.attr,
+	&ddr_perf_lp_xact_credit.attr.attr,
+	&ddr_perf_wr_xact_credit.attr.attr,
+	&ddr_perf_read_cycles.attr.attr,
+	&ddr_perf_write_cycles.attr.attr,
+	&ddr_perf_read_write_transition.attr.attr,
+	&ddr_perf_precharge.attr.attr,
+	&ddr_perf_activate.attr.attr,
+	&ddr_perf_load_mode.attr.attr,
+	&ddr_perf_mwr.attr.attr,
+	&ddr_perf_read.attr.attr,
+	&ddr_perf_read_activate.attr.attr,
+	&ddr_perf_refresh.attr.attr,
+	&ddr_perf_write.attr.attr,
+	&ddr_perf_raw_hazard.attr.attr,
+	&ddr_perf_axid_read.attr.attr,
+	&ddr_perf_axid_write.attr.attr,
+	NULL,
+};
+
+static struct attribute_group ddr_perf_events_attr_group =3D {
+	.name =3D "events",
+	.attrs =3D ddr_perf_events_attrs,
+};
+
+PMU_FORMAT_ATTR(event, "config:0-63");
+PMU_FORMAT_ATTR(axi_id, "config1:0-63");
+
+static struct attribute *ddr_perf_format_attrs[] =3D {
+	&format_attr_event.attr,
+	&format_attr_axi_id.attr,
+	NULL,
+};
+
+static struct attribute_group ddr_perf_format_attr_group =3D {
+	.name =3D "format",
+	.attrs =3D ddr_perf_format_attrs,
+};
+
+static const struct attribute_group *attr_groups[] =3D {
+	&ddr_perf_events_attr_group,
+	&ddr_perf_format_attr_group,
+	&ddr_perf_cpumask_attr_group,
+	NULL,
+};
+
+static u32 ddr_perf_alloc_counter(struct ddr_pmu *pmu, int event)
+{
+	int i;
+
+	/* Always map cycle event to counter 0 */
+	if (event =3D=3D EVENT_CYCLES_ID)
+		return EVENT_CYCLES_COUNTER;
+
+	for (i =3D 1; i < NUM_COUNTER; i++)
+		if (pmu->active_events[i] =3D=3D NULL)
+			return i;
+
+	return -ENOENT;
+}
+
+static u32 ddr_perf_free_counter(struct ddr_pmu *pmu, int counter)
+{
+	if (counter < 0 || counter >=3D NUM_COUNTER)
+		return -ENOENT;
+
+	pmu->active_events[counter] =3D NULL;
+
+	return 0;
+}
+
+static u32 ddr_perf_read_counter(struct ddr_pmu *pmu, int counter)
+{
+	return readl(pmu->base + COUNTER_READ + counter * 4);
+}
+
+static int ddr_perf_event_init(struct perf_event *event)
+{
+	struct ddr_pmu *pmu =3D to_ddr_pmu(event->pmu);
+	struct hw_perf_event *hwc =3D &event->hw;
+
+	if (event->attr.type !=3D event->pmu->type)
+		return -ENOENT;
+
+	if (is_sampling_event(event) || event->attach_state & PERF_ATTACH_TASK)
+		return -EOPNOTSUPP;
+
+	if (event->cpu < 0) {
+		dev_warn(pmu->dev, "Can't provide per-task data!\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (event->attr.exclude_user        ||
+	    event->attr.exclude_kernel      ||
+	    event->attr.exclude_hv          ||
+	    event->attr.exclude_idle        ||
+	    event->attr.exclude_host        ||
+	    event->attr.exclude_guest       ||
+	    event->attr.sample_period)
+		return -EINVAL;
+
+	event->cpu =3D cpumask_first(&pmu->cpu);
+	hwc->idx =3D -1;
+
+	return 0;
+}
+
+
+static void ddr_perf_event_update(struct perf_event *event)
+{
+	struct ddr_pmu *pmu =3D to_ddr_pmu(event->pmu);
+	struct hw_perf_event *hwc =3D &event->hw;
+	u64 delta, prev_raw_count, new_raw_count;
+	int counter =3D hwc->idx;
+
+	do {
+		prev_raw_count =3D local64_read(&hwc->prev_count);
+		new_raw_count =3D ddr_perf_read_counter(pmu, counter);
+	} while (local64_cmpxchg(&hwc->prev_count, prev_raw_count,
+			new_raw_count) !=3D prev_raw_count);
+
+	delta =3D (new_raw_count - prev_raw_count) & 0xFFFFFFFF;
+
+	local64_add(delta, &event->count);
+}
+
+static void ddr_perf_event_enable(struct ddr_pmu *pmu, int config,
+				  int counter, bool enable)
+{
+	u8 reg =3D counter * 4 + COUNTER_CNTL;
+	int val;
+
+	if (enable) {
+		/* Clear counter, then enable it. */
+		writel(0, pmu->base + reg);
+		val =3D CNTL_EN | CNTL_CLEAR;
+		val |=3D (config << CNTL_CSV_SHIFT) & CNTL_CSV_MASK;
+	} else {
+		/* Disable counter */
+		val =3D readl(pmu->base + reg) & CNTL_EN_MASK;
+	}
+
+	writel(val, pmu->base + reg);
+
+	if (config =3D=3D EVENT_CYCLES_ID)
+		pmu->cycles_active =3D enable;
+}
+
+static void ddr_perf_event_start(struct perf_event *event, int flags)
+{
+	struct ddr_pmu *pmu =3D to_ddr_pmu(event->pmu);
+	struct hw_perf_event *hwc =3D &event->hw;
+	int counter =3D hwc->idx;
+
+	if (pmu->devtype->flags & DDR_CAP_AXI_ID) {
+		if (event->attr.config =3D=3D 0x41 ||
+		    event->attr.config =3D=3D 0x42) {
+			int val =3D event->attr.config1;
+			writel(val, pmu->base + COUNTER_DPCR1);
+		}
+	}
+
+	local64_set(&hwc->prev_count, 0);
+
+	ddr_perf_event_enable(pmu, event->attr.config, counter, true);
+	/*
+	 * If the cycles counter wasn't explicitly selected,
+	 * we will enable it now.
+	 */
+	if (counter > 0 && !pmu->cycles_active)
+		ddr_perf_event_enable(pmu, EVENT_CYCLES_ID,
+				      EVENT_CYCLES_COUNTER, true);
+}
+
+static int ddr_perf_event_add(struct perf_event *event, int flags)
+{
+	struct ddr_pmu *pmu =3D to_ddr_pmu(event->pmu);
+	struct hw_perf_event *hwc =3D &event->hw;
+	int counter;
+	int cfg =3D event->attr.config;
+
+	counter =3D ddr_perf_alloc_counter(pmu, cfg);
+	if (counter < 0) {
+		dev_warn(pmu->dev, "There are not enough counters\n");
+		return -EOPNOTSUPP;
+	}
+
+	pmu->active_events[counter] =3D event;
+	pmu->total_events++;
+	hwc->idx =3D counter;
+
+	if (flags & PERF_EF_START)
+		ddr_perf_event_start(event, flags);
+
+	local64_set(&hwc->prev_count, ddr_perf_read_counter(pmu, counter));
+
+	return 0;
+}
+
+static void ddr_perf_event_stop(struct perf_event *event, int flags)
+{
+	struct ddr_pmu *pmu =3D to_ddr_pmu(event->pmu);
+	struct hw_perf_event *hwc =3D &event->hw;
+	int counter =3D hwc->idx;
+
+	ddr_perf_event_enable(pmu, event->attr.config, counter, false);
+	ddr_perf_event_update(event);
+}
+
+static void ddr_perf_event_del(struct perf_event *event, int flags)
+{
+	struct ddr_pmu *pmu =3D to_ddr_pmu(event->pmu);
+	struct hw_perf_event *hwc =3D &event->hw;
+	int counter =3D hwc->idx;
+
+	ddr_perf_event_stop(event, PERF_EF_UPDATE);
+
+	ddr_perf_free_counter(pmu, counter);
+	pmu->total_events--;
+	hwc->idx =3D -1;
+
+	/* If all events have stopped, stop the cycles counter as well */
+	if ((pmu->total_events =3D=3D 0) && pmu->cycles_active)
+		ddr_perf_event_enable(pmu, EVENT_CYCLES_ID,
+				      EVENT_CYCLES_COUNTER, false);
+}
+
+static int ddr_perf_init(struct ddr_pmu *pmu, void __iomem *base,
+			 struct device *dev)
+{
+	*pmu =3D (struct ddr_pmu) {
+		.pmu =3D (struct pmu) {
+			.task_ctx_nr =3D perf_invalid_context,
+			.attr_groups =3D attr_groups,
+			.event_init  =3D ddr_perf_event_init,
+			.add	     =3D ddr_perf_event_add,
+			.del	     =3D ddr_perf_event_del,
+			.start	     =3D ddr_perf_event_start,
+			.stop	     =3D ddr_perf_event_stop,
+			.read	     =3D ddr_perf_event_update,
+		},
+		.base =3D base,
+		.dev =3D dev,
+	};
+
+	return ida_simple_get(&ddr_ida, 0, 0, GFP_KERNEL);
+}
+
+static irqreturn_t ddr_perf_irq_handler(int irq, void *p)
+{
+	int i;
+	u8 reg;
+	int val;
+	int counter;
+	struct ddr_pmu *pmu =3D (struct ddr_pmu *) p;
+	struct perf_event *event;
+
+	/*
+	 * The cycles counter has overflowed. Update all of the local counter
+	 * values, then reset the cycles counter, so the others can continue
+	 * counting.
+	 */
+	for (i =3D 0; i <=3D pmu->total_events; i++) {
+		if (pmu->active_events[i] !=3D NULL) {
+			event =3D pmu->active_events[i];
+			counter =3D event->hw.idx;
+			reg =3D counter * 4 + COUNTER_CNTL;
+			val =3D readl(pmu->base + reg);
+			ddr_perf_event_update(event);
+			if (val & CNTL_OVER) {
+				/* Clear counter, then re-enable it. */
+				ddr_perf_event_enable(pmu, event->attr.config,
+						      counter, true);
+				/* Update event again to reset prev_count */
+				ddr_perf_event_update(event);
+			}
+		}
+	}
+
+	/*
+	 * Reset the cycles counter regardless if it was explicitly
+	 * enabled or not.
+	 */
+	ddr_perf_event_enable(pmu, EVENT_CYCLES_ID,
+			      EVENT_CYCLES_COUNTER, true);
+
+	return IRQ_HANDLED;
+}
+
+static int ddr_perf_probe(struct platform_device *pdev)
+{
+	struct ddr_pmu *pmu;
+	struct device_node *np;
+	void __iomem *base;
+	struct resource *iomem;
+	char *name;
+	int num;
+	int ret;
+	u32 irq;
+	const struct of_device_id *of_id =3D
+		of_match_device(imx_ddr_pmu_dt_ids, &pdev->dev);
+
+	iomem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base =3D devm_ioremap_resource(&pdev->dev, iomem);
+	if (IS_ERR(base)) {
+		ret =3D PTR_ERR(base);
+		return ret;
+	}
+
+	np =3D pdev->dev.of_node;
+
+	pmu =3D kzalloc(sizeof(*pmu), GFP_KERNEL);
+	if (!pmu)
+		return -ENOMEM;
+
+	num =3D ddr_perf_init(pmu, base, &pdev->dev);
+	name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "ddr%d", num);
+
+	pmu->devtype =3D (struct fsl_ddr_devtype_data *)of_id->data;
+
+	cpumask_set_cpu(smp_processor_id(), &pmu->cpu);
+	ret =3D perf_pmu_register(&(pmu->pmu), name, -1);
+	if (ret)
+		goto ddr_perf_err;
+
+	/* Request irq */
+	irq =3D of_irq_get(np, 0);
+	if (irq < 0) {
+		pr_err("Failed to get irq: %d", irq);
+		goto ddr_perf_err;
+	}
+
+	ret =3D devm_request_threaded_irq(&pdev->dev, irq,
+					ddr_perf_irq_handler, NULL,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					DDR_PERF_DEV_NAME,
+					pmu);
+	if (ret < 0) {
+		pr_err("Request irq failed: %d", ret);
+		goto ddr_perf_irq_err;
+	}
+
+	return 0;
+
+ddr_perf_irq_err:
+	perf_pmu_unregister(&(pmu->pmu));
+ddr_perf_err:
+	pr_warn("i.MX8 DDR Perf PMU failed (%d), disabled\n", ret);
+	kfree(pmu);
+	return ret;
+}
+
+
+static int ddr_perf_remove(struct platform_device *pdev)
+{
+	struct ddr_pmu *pmu =3D platform_get_drvdata(pdev);
+
+	perf_pmu_unregister(&pmu->pmu);
+	kfree(pmu);
+
+	return 0;
+}
+
+static struct platform_driver imx_ddr_pmu_driver =3D {
+	.driver         =3D {
+		.name   =3D "imx-ddr-pmu",
+		.of_match_table =3D imx_ddr_pmu_dt_ids,
+	},
+	.probe          =3D ddr_perf_probe,
+	.remove         =3D ddr_perf_remove,
+};
+
+static int __init imx_ddr_pmu_init(void)
+{
+	return platform_driver_register(&imx_ddr_pmu_driver);
+}
+
+module_init(imx_ddr_pmu_init);
+
--=20
2.5.2

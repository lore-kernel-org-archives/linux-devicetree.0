From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC PATCH v4 2/2] drivers: mfd: vexpress: add Serial Power Controller (SPC) support
Date: Mon, 17 Jun 2013 16:51:09 +0100
Message-ID: <1371484269-11743-3-git-send-email-lorenzo.pieralisi@arm.com>
References: <1371484269-11743-1-git-send-email-lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1371484269-11743-1-git-send-email-lorenzo.pieralisi@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Pawel Moll <pawel.moll@arm.com>, Amit Kucheria <amit.kucheria@linaro.org>, Jon Medhurst <tixy@linaro.org>, Achin Gupta <achin.gupta@arm.com>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>
List-Id: devicetree@vger.kernel.org

The TC2 versatile express core tile integrates a logic block that provides =
the
interface between the dual cluster test-chip and the M3 microcontroller tha=
t
carries out power management. The logic block, called Serial Power Controll=
er
(SPC), contains several memory mapped registers to control among other thin=
gs
low-power states, operating points and reset control.

This patch provides a driver that enables run-time control of features
implemented by the SPC control logic.

The SPC control logic is required to be programmed very early in the boot
process to reset secondary CPUs on the TC2 testchip, set-up jump addresses =
and
wake-up IRQs for power management.
Since the SPC logic is also used to control clocks and operating points,
that have to be initialized early as well, the SPC interface consumers can =
not
rely on early initcalls ordering, which is inconsistent, to wait for SPC
initialization. Hence, in order to keep the components relying on the SPC
coded in a sane way, the driver puts in place a synchronization scheme that
allows kernel drivers to check if the SPC driver has been initialized and i=
f
not, to initialize it upon check.

A status variable is kept in memory so that loadable modules that require S=
PC
interface (eg CPUfreq drivers) can still check the correct initialization a=
nd
use the driver correctly after functions used at boot to init the driver ar=
e
freed.

The driver also provides a bridge interface through the vexpress config
infrastructure. Operations allowing to read/write operating points are
made to go via the same interface as configuration transactions so that
all requests to M3 are serialized.

Device tree bindings documentation for the SPC component is provided with
the patchset.

Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Olof Johansson <olof@lixom.net>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Jon Medhurst <tixy@linaro.org>
Signed-off-by: Achin Gupta <achin.gupta@arm.com>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Reviewed-by: Nicolas Pitre <nico@linaro.org>
---
 Documentation/devicetree/bindings/mfd/vexpress-spc.txt |  36 +
 drivers/mfd/Kconfig                                    |  13 +
 drivers/mfd/Makefile                                   |   1 +
 drivers/mfd/vexpress-spc.c                             | 666 ++++++++++
 include/linux/vexpress.h                               |  33 +
 5 files changed, 749 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/vexpress-spc.txt b/Docum=
entation/devicetree/bindings/mfd/vexpress-spc.txt
new file mode 100644
index 0000000..bd381d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/vexpress-spc.txt
@@ -0,0 +1,36 @@
+* ARM Versatile Express Serial Power Controller device tree bindings
+
+Latest ARM development boards implement a power management interface (seri=
al
+power controller - SPC) that is capable of managing power/voltage and
+operating point transitions, through memory mapped registers interface.
+
+On testchips like TC2 it also provides a serial configuration interface
+that can be used to retrieve temperature sensors, energy/voltage/current
+probes and oscillators values through the SYS configuration protocol defin=
ed
+for versatile express motherboards.
+
+- spc node
+
+=09- compatible:
+=09=09Usage: required
+=09=09Value type: <stringlist>
+=09=09Definition: must be
+=09=09=09    "arm,vexpress-spc,v2p-ca15_a7","arm,vexpress-spc"
+=09- reg:
+=09=09Usage: required
+=09=09Value type: <prop-encode-array>
+=09=09Definition: A standard property that specifies the base address
+=09=09=09    and the size of the SPC address space
+=09- interrupts:
+=09=09Usage: required
+=09=09Value type: <prop-encoded-array>
+=09=09Definition:  SPC interrupt configuration. A standard property
+=09=09=09     that follows ePAPR interrupts specifications
+
+Example:
+
+spc: spc@7fff0000 {
+=09compatible =3D "arm,vexpress-spc,v2p-ca15_a7", "arm,vexpress-spc";
+=09reg =3D <0x7fff0000 0x1000>;
+=09interrupts =3D <0 95 4>;
+};
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index d54e985..e032099 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1148,3 +1148,16 @@ config VEXPRESS_CONFIG
 =09help
 =09  Platform configuration infrastructure for the ARM Ltd.
 =09  Versatile Express.
+
+config VEXPRESS_SPC
+=09bool "Versatile Express SPC driver support"
+=09depends on ARM
+=09depends on VEXPRESS_CONFIG
+=09help
+=09  The Serial Power Controller (SPC) for ARM Ltd. test chips, is
+=09  an IP that provides a memory mapped interface to power controller
+=09  HW and also a configuration interface compatible with the existing
+=09  Versatile Express SYS configuration protocol. The driver provides
+=09  an API abstraction allowing to control operating points and to
+=09  program registers controlling low-level power management features
+=09  like power down flags, global and per-cpu wake-up IRQs.
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 718e94a..3a01203 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -153,5 +153,6 @@ obj-$(CONFIG_MFD_SEC_CORE)=09+=3D sec-core.o sec-irq.o
 obj-$(CONFIG_MFD_SYSCON)=09+=3D syscon.o
 obj-$(CONFIG_MFD_LM3533)=09+=3D lm3533-core.o lm3533-ctrlbank.o
 obj-$(CONFIG_VEXPRESS_CONFIG)=09+=3D vexpress-config.o vexpress-sysreg.o
+obj-$(CONFIG_VEXPRESS_SPC)=09+=3D vexpress-spc.o
 obj-$(CONFIG_MFD_RETU)=09=09+=3D retu-mfd.o
 obj-$(CONFIG_MFD_AS3711)=09+=3D as3711.o
diff --git a/drivers/mfd/vexpress-spc.c b/drivers/mfd/vexpress-spc.c
new file mode 100644
index 0000000..4c58c01
--- /dev/null
+++ b/drivers/mfd/vexpress-spc.c
@@ -0,0 +1,666 @@
+/*
+ * Versatile Express Serial Power Controller (SPC) support
+ *
+ * Copyright (C) 2013 ARM Ltd.
+ *
+ * Authors: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
+ *          Achin Gupta           <achin.gupta@arm.com>
+ *          Lorenzo Pieralisi     <lorenzo.pieralisi@arm.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
+ * kind, whether express or implied; without even the implied warranty
+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+#include <linux/vexpress.h>
+
+#include <asm/cacheflush.h>
+
+#define SPCLOG "vexpress-spc: "
+
+/* Clock multiplier factor for TC2 core tiles */
+#define PLL_MULT=09=0920
+
+/* SCC registers */
+#define A15_CONF=09=090x400
+#define SYS_INFO=09=090x700
+
+/* SPC registers */
+#define SPC_BASE=09=090xB00
+
+/* SPC Performance levels */
+#define PERF_LVL_A15=09=09(SPC_BASE + 0x00)
+#define PERF_REQ_A15=09=09(SPC_BASE + 0x04)
+#define PERF_LVL_A7=09=09(SPC_BASE + 0x08)
+#define PERF_REQ_A7=09=09(SPC_BASE + 0x0c)
+/* SPC SYS config ctrl registers */
+#define SYS_CFGCTRL=09=09(SPC_BASE + 0x10)
+#define SYS_CFGCTRL_REQ=09=09(SPC_BASE + 0x14)
+/* SPC power status and flag */
+#define PWC_STATUS=09=09(SPC_BASE + 0x18)
+#define PWC_FLAG=09=09(SPC_BASE + 0x1c)
+/* SPC wake-up IRQs status and mask */
+#define WAKE_INT_MASK=09=09(SPC_BASE + 0x24)
+#define WAKE_INT_RAW=09=09(SPC_BASE + 0x28)
+#define WAKE_INT_STAT=09=09(SPC_BASE + 0x2c)
+/* SPC power down registers */
+#define A15_PWRDN_EN=09=09(SPC_BASE + 0x30)
+#define A7_PWRDN_EN=09=09(SPC_BASE + 0x34)
+#define A7_PWRDNACK=09=09(SPC_BASE + 0x54)
+/* SPC CPU mailboxes and SYS config interface data */
+#define A15_BX_ADDR0=09=09(SPC_BASE + 0x68)
+#define SYS_CFG_WDATA=09=09(SPC_BASE + 0x70)
+#define SYS_CFG_RDATA=09=09(SPC_BASE + 0x74)
+#define A7_BX_ADDR0=09=09(SPC_BASE + 0x78)
+
+/* wake-up interrupt masks */
+#define GBL_WAKEUP_INT_MSK=09=09(0x3 << 10)
+#define WAKEUP_IRQ_MASK=09=09=090xFFF
+
+/* vexpress config function parameters used to retrieve OPPs */
+#define OPP_FUNCTION=09=096
+#define OPP_BASE_DEVICE=09=090x300
+#define OPP_A15_OFFSET=09=090x4
+#define OPP_A7_OFFSET=09=090xc
+/* SPC SYS CFGCTRL register format initializer */
+#define SYS_CFGCTRL_START=09(1 << 31)
+#define SYS_CFGCTRL_WRITE=09(1 << 30)
+#define SYS_CFGCTRL_FUNC(n)=09(((n) & 0x3f) << 20)
+#define SYS_CFGCTRL_DEVICE(n)=09(((n) & 0xfff) << 0)
+
+#define MAX_OPPS=098
+#define MAX_CLUSTERS=092
+
+enum {
+=09/*
+=09 * OPP functions are used to read OPP tables for
+=09 * A15 and A7 clusters
+=09 */
+=09OPP_TYPE_A15=09=09=3D 0,
+=09OPP_TYPE_A7=09=09=3D 1,
+=09/*
+=09 * Function that provides the Versatile Express SYS config IF
+=09 * through Data Communication Channel (DCC)
+=09 */
+=09SYS_CFGCTRL_TYPE=09=3D 2,
+=09INVALID_TYPE
+};
+
+#define STAT_COMPLETE(type)=09((1 << 0) << (type << 2))
+#define STAT_ERR(type)=09=09((1 << 1) << (type << 2))
+#define RESPONSE_MASK(type)=09(STAT_COMPLETE(type) | STAT_ERR(type))
+
+struct ve_spc_drvdata {
+=09void __iomem *baseaddr;
+=09/* A15 processor MPIDR[15:8] bitfield */
+=09u32 a15_clusid;
+=09u32 irq;
+=09/* Pending request type */
+=09u32 pend_req_type;
+=09/* Operating points table */
+=09u32 freqs[MAX_CLUSTERS][MAX_OPPS];
+=09/* Operating points cluster counter */
+=09u32 freqs_cnt[MAX_CLUSTERS];
+=09/*
+=09 * Versatile Express SPC configuration bridge data and functions
+=09 */
+=09u32 *config_data;
+=09struct vexpress_config_bridge *config_bridge;
+=09struct vexpress_config_func *opp_func, *perf_func;
+};
+
+/*
+ * SPC function types
+ *  - CONFIG_FUNC implements serial configuration interface
+ *  - PERF_FUNC implements performance levels management
+ */
+enum spc_func_type {
+=09CONFIG_FUNC =3D 0,
+=09PERF_FUNC   =3D 1,
+};
+
+struct ve_spc_func {
+=09enum spc_func_type type;
+=09u32 function;
+=09u32 device;
+};
+
+static struct ve_spc_drvdata *info;
+/* probe status */
+static int ve_spc_load_result =3D -EAGAIN;
+
+static inline bool cluster_is_a15(u32 cluster)
+{
+=09return cluster =3D=3D info->a15_clusid;
+}
+
+/* Initialization check/late probe interfaces */
+static int ve_spc_late_probe(void)
+{
+=09return ve_spc_load_result;
+}
+
+static inline bool ve_spc_initialized(void)
+{
+=09return ve_spc_load_result =3D=3D 0;
+}
+
+/**
+ * ve_spc_get_freq - get cluster operating frequency
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ *
+ * Return: frequency on success
+ *         < 0 on error
+ */
+int ve_spc_get_freq(u32 cluster)
+{
+=09u32 perf_cfg_reg;
+=09int perf, ret;
+
+=09if (!ve_spc_initialized() || (cluster >=3D MAX_CLUSTERS))
+=09=09return -EINVAL;
+
+=09perf_cfg_reg =3D cluster_is_a15(cluster) ? PERF_LVL_A15 : PERF_LVL_A7;
+=09ret =3D vexpress_config_read(info->perf_func, perf_cfg_reg, &perf);
+
+=09if (!ret)
+=09=09return info->freqs[cluster][perf];
+
+=09return ret;
+}
+EXPORT_SYMBOL_GPL(ve_spc_get_freq);
+
+static int ve_spc_find_perf_index(u32 cluster, u32 freq)
+{
+=09int idx;
+
+=09for (idx =3D 0; idx < info->freqs_cnt[cluster]; idx++)
+=09=09if (info->freqs[cluster][idx] =3D=3D freq)
+=09=09=09break;
+=09return (idx =3D=3D info->freqs_cnt[cluster]) ? -EINVAL : idx;
+}
+
+/**
+ * ve_spc_set_freq - set cluster operating frequency
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @freq: frequency to be programmed
+ *
+ * Returns: 0 on success
+ *          < 0 on write error
+ */
+int ve_spc_set_freq(u32 cluster, u32 freq)
+{
+=09int ret, perf, offset;
+
+=09if (!ve_spc_initialized() || (cluster >=3D MAX_CLUSTERS))
+=09=09return -EINVAL;
+
+=09offset =3D cluster_is_a15(cluster) ? PERF_LVL_A15 : PERF_LVL_A7;
+
+=09perf =3D ve_spc_find_perf_index(cluster, freq);
+
+=09if (perf < 0 || perf >=3D MAX_OPPS)
+=09=09return -EINVAL;
+
+=09ret =3D vexpress_config_write(info->perf_func, offset, perf);
+
+=09return ret;
+}
+EXPORT_SYMBOL_GPL(ve_spc_set_freq);
+
+static int ve_spc_populate_opps(u32 cluster)
+{
+=09u32 data =3D 0, ret, i, offset;
+
+=09if (cluster >=3D MAX_CLUSTERS)
+=09=09return -EINVAL;
+
+=09offset =3D cluster_is_a15(cluster) ? OPP_A15_OFFSET : OPP_A7_OFFSET;
+=09for (i =3D 0; i < MAX_OPPS; i++) {
+=09=09ret =3D vexpress_config_read(info->opp_func, offset + i, &data);
+=09=09if (!ret)
+=09=09=09info->freqs[cluster][i] =3D (data & 0xFFFFF) * PLL_MULT;
+=09=09else
+=09=09=09break;
+=09}
+
+=09info->freqs_cnt[cluster] =3D i;
+=09return ret;
+}
+
+/**
+ * ve_spc_get_freq_table() - Retrieve a pointer to OPP array for a cluster
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @fptr: pointer used to return array of operating points
+ * Returns: operating points count on success
+ *         -EINVAL on parameter error
+ */
+int ve_spc_get_freq_table(u32 cluster, const u32 **fptr)
+{
+=09int cnt;
+=09if (!fptr || cluster >=3D MAX_CLUSTERS)
+=09=09return -EINVAL;
+=09cnt =3D info->freqs_cnt[cluster];
+=09*fptr =3D info->freqs[cluster];
+=09return cnt;
+}
+EXPORT_SYMBOL_GPL(ve_spc_get_freq_table);
+
+/**
+ * ve_spc_global_wakeup_irq()
+ *
+ * Function to set/clear global wakeup IRQs. Not protected by locking sinc=
e
+ * it might be used in code paths where normal cacheable locks are not
+ * working. Locking must be provided by the caller to ensure atomicity.
+ *
+ * @set: if true, global wake-up IRQs are set, if false they are cleared
+ */
+void ve_spc_global_wakeup_irq(bool set)
+{
+=09u32 reg =3D 0;
+
+=09reg =3D readl_relaxed(info->baseaddr + WAKE_INT_MASK);
+=09if (set)
+=09=09reg |=3D GBL_WAKEUP_INT_MSK;
+=09else
+=09=09reg &=3D ~GBL_WAKEUP_INT_MSK;
+=09reg &=3D WAKEUP_IRQ_MASK;
+=09writel_relaxed(reg, info->baseaddr + WAKE_INT_MASK);
+}
+
+/**
+ * ve_spc_cpu_wakeup_irq()
+ *
+ * Function to set/clear per-CPU wake-up IRQs. Not protected by locking si=
nce
+ * it might be used in code paths where normal cacheable locks are not
+ * working. Locking must be provided by the caller to ensure atomicity.
+ *
+ * @cpu: mpidr[7:0] bitfield describing cpu affinity level
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @set: if true, wake-up IRQs are set, if false they are cleared
+ */
+void ve_spc_cpu_wakeup_irq(u32 cpu, u32 cluster, bool set)
+{
+=09u32 mask =3D 0;
+=09u32 reg =3D 0;
+
+=09mask =3D 1 << cpu;
+=09if (!cluster_is_a15(cluster))
+=09=09mask <<=3D 4;
+=09reg =3D readl_relaxed(info->baseaddr + WAKE_INT_MASK);
+=09if (set)
+=09=09reg |=3D mask;
+=09else
+=09=09reg &=3D ~mask;
+=09reg &=3D WAKEUP_IRQ_MASK;
+=09writel_relaxed(reg, info->baseaddr + WAKE_INT_MASK);
+}
+
+/**
+ * ve_spc_set_resume_addr() - set the jump address used for warm boot
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @cpu: mpidr[7:0] bitfield describing cpu affinity level
+ * @addr: physical resume address
+ */
+void ve_spc_set_resume_addr(u32 cluster, u32 cpu, u32 addr)
+{
+=09void __iomem *baseaddr;
+
+=09if (cluster >=3D MAX_CLUSTERS)
+=09=09return;
+
+=09if (cluster_is_a15(cluster))
+=09=09baseaddr =3D info->baseaddr + A15_BX_ADDR0 + (cpu << 2);
+=09else
+=09=09baseaddr =3D info->baseaddr + A7_BX_ADDR0 + (cpu << 2);
+
+=09writel_relaxed(addr, baseaddr);
+}
+
+/**
+ * ve_spc_get_nr_cpus() - get number of cpus in a cluster
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ *
+ * Return: > 0 number of cpus in the cluster
+ *         or 0 if cluster number invalid
+ */
+u32 ve_spc_get_nr_cpus(u32 cluster)
+{
+=09u32 val;
+
+=09if (cluster >=3D MAX_CLUSTERS)
+=09=09return 0;
+
+=09val =3D readl_relaxed(info->baseaddr + SYS_INFO);
+=09val =3D (cluster_is_a15(cluster)) ? (val >> 16) : (val >> 20);
+=09return val & 0xf;
+}
+EXPORT_SYMBOL_GPL(ve_spc_get_nr_cpus);
+
+/**
+ * ve_spc_powerdown()
+ *
+ * Function to enable/disable cluster powerdown. Not protected by locking
+ * since it might be used in code paths where normal cacheable locks are n=
ot
+ * working. Locking must be provided by the caller to ensure atomicity.
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @enable: if true enables powerdown, if false disables it
+ */
+void ve_spc_powerdown(u32 cluster, bool enable)
+{
+=09u32 pwdrn_reg =3D 0;
+
+=09if (cluster >=3D MAX_CLUSTERS)
+=09=09return;
+=09pwdrn_reg =3D cluster_is_a15(cluster) ? A15_PWRDN_EN : A7_PWRDN_EN;
+=09writel_relaxed(enable, info->baseaddr + pwdrn_reg);
+}
+
+static irqreturn_t ve_spc_irq_handler(int irq, void *data)
+{
+=09int ret;
+=09u32 status =3D readl_relaxed(info->baseaddr + PWC_STATUS);
+
+=09if (!(status & RESPONSE_MASK(info->pend_req_type)))
+=09=09return IRQ_NONE;
+
+=09if ((status =3D=3D STAT_COMPLETE(SYS_CFGCTRL_TYPE)) && info->config_dat=
a) {
+=09=09*info->config_data =3D
+=09=09=09=09readl_relaxed(info->baseaddr + SYS_CFG_RDATA);
+=09=09info->config_data =3D NULL;
+=09}
+
+=09ret =3D (status =3D=3D STAT_COMPLETE(info->pend_req_type)) ? 0 : -EIO;
+=09info->pend_req_type =3D INVALID_TYPE;
+=09vexpress_config_complete(info->config_bridge, ret);
+=09return IRQ_HANDLED;
+}
+
+/*
+ * ve_spc_func_get() -  Allocates an SPC function to be executed through t=
he
+ *=09=09=09vexpress config interface
+ *
+ * @dev: device to bind to the function
+ * @node: device tree node to bind to the function
+ * @id: special function identifiers - SPC requires "opp" for operating po=
ints
+ *=09setting and retrieval and "perf" to control operating points
+ */
+static void *ve_spc_func_get(struct device *dev, struct device_node *node,
+=09=09=09     const char *id)
+{
+=09struct ve_spc_func *spc_func;
+=09u32 func_device[2];
+=09int err =3D 0;
+
+=09spc_func =3D kzalloc(sizeof(*spc_func), GFP_KERNEL);
+=09if (!spc_func)
+=09=09return NULL;
+
+=09if (strcmp(id, "opp") =3D=3D 0) {
+=09=09spc_func->type =3D CONFIG_FUNC;
+=09=09spc_func->function =3D OPP_FUNCTION;
+=09=09spc_func->device =3D OPP_BASE_DEVICE;
+=09} else if (strcmp(id, "perf") =3D=3D 0) {
+=09=09spc_func->type =3D PERF_FUNC;
+=09} else if (node) {
+=09=09of_node_get(node);
+=09=09err =3D of_property_read_u32_array(node,
+=09=09=09=09"arm,vexpress-sysreg,func", func_device,
+=09=09=09=09ARRAY_SIZE(func_device));
+=09=09of_node_put(node);
+=09=09spc_func->type =3D CONFIG_FUNC;
+=09=09spc_func->function =3D func_device[0];
+=09=09spc_func->device =3D func_device[1];
+=09}
+
+=09if (WARN_ON(err)) {
+=09=09kfree(spc_func);
+=09=09return NULL;
+=09}
+
+=09pr_debug("func 0x%p =3D 0x%x, %d %d\n", spc_func,
+=09=09=09=09=09      spc_func->function,
+=09=09=09=09=09      spc_func->device,
+=09=09=09=09=09      spc_func->type);
+
+=09return spc_func;
+}
+
+static void ve_spc_func_put(void *func)
+{
+=09kfree(func);
+}
+
+/*
+ * ve_spc_func_exec() -  Function executing SPC transactions
+ *
+ *                       Performance levels programming and serial Versati=
le
+ *                       Express communication are made to go through the =
same
+ *                       interface so that requests are serialized; this i=
s
+ *                       strictly required since the Data Communication Ch=
annel
+ *                       (DCC) control interface can not control multiple
+ *                       pending requests at once. Performance level reads
+ *                       are non-blocking, performance level writes and sy=
s
+ *                       configuration reads and writes complete upon IRQ
+ *                       handling.
+ *
+ * @func: pointer to function to execute
+ * @offset:
+ *=09=09if function type is PERF_FUNC
+ *=09=09 - A15/A7 offset for performance level programming
+ *=09=09if function type is CONFIG_FUNC
+ *=09=09 - offset field of the serial configuration protocol
+ * @write: true for writes, false for reads
+ * @data: pointer to data to be read/written
+ */
+static int ve_spc_func_exec(void *func, int offset, bool write, u32 *data)
+{
+=09struct ve_spc_func *spc_func =3D func;
+=09u32 command;
+
+=09if (!data)
+=09=09return -EINVAL;
+=09/*
+=09 * Setting and retrieval of operating points is not part of
+=09 * DCC config interface. It was made to go through the same
+=09 * code path so that requests to the M3 can be serialized
+=09 * properly with config reads/writes through the common
+=09 * vexpress config interface
+=09 */
+=09switch (spc_func->type) {
+=09case PERF_FUNC:
+=09=09if (write) {
+=09=09=09info->pend_req_type =3D (offset =3D=3D PERF_LVL_A15) ?
+=09=09=09=09=09OPP_TYPE_A15 : OPP_TYPE_A7;
+=09=09=09writel_relaxed(*data, info->baseaddr + offset);
+=09=09=09return VEXPRESS_CONFIG_STATUS_WAIT;
+=09=09} else {
+=09=09=09*data =3D readl_relaxed(info->baseaddr + offset);
+=09=09=09return VEXPRESS_CONFIG_STATUS_DONE;
+=09=09}
+=09case CONFIG_FUNC:
+=09=09info->pend_req_type =3D SYS_CFGCTRL_TYPE;
+
+=09=09command =3D SYS_CFGCTRL_START;
+=09=09command |=3D write ? SYS_CFGCTRL_WRITE : 0;
+=09=09command |=3D SYS_CFGCTRL_FUNC(spc_func->function);
+=09=09command |=3D SYS_CFGCTRL_DEVICE(spc_func->device + offset);
+
+=09=09pr_debug("command %x\n", command);
+
+=09=09if (!write)
+=09=09=09info->config_data =3D data;
+=09=09else
+=09=09=09writel_relaxed(*data, info->baseaddr + SYS_CFG_WDATA);
+=09=09writel_relaxed(command, info->baseaddr + SYS_CFGCTRL);
+
+=09=09return VEXPRESS_CONFIG_STATUS_WAIT;
+=09default:
+=09=09return -EINVAL;
+=09}
+}
+
+struct vexpress_config_bridge_info ve_spc_config_bridge_info =3D {
+=09.name =3D "vexpress-spc",
+=09.func_get =3D ve_spc_func_get,
+=09.func_put =3D ve_spc_func_put,
+=09.func_exec =3D ve_spc_func_exec,
+};
+
+static const struct of_device_id ve_spc_ids[] __initconst =3D {
+=09{ .compatible =3D "arm,vexpress-spc,v2p-ca15_a7" },
+=09{ .compatible =3D "arm,vexpress-spc" },
+=09{},
+};
+
+static int __init ve_spc_setup(void)
+{
+=09int ret;
+=09struct device_node *node =3D of_find_matching_node(NULL, ve_spc_ids);
+
+=09if (!node)
+=09=09return -ENODEV;
+
+=09info =3D kzalloc(sizeof(*info), GFP_KERNEL);
+=09if (!info) {
+=09=09pr_err(SPCLOG "unable to allocate mem\n");
+=09=09return -ENOMEM;
+=09}
+=09info->pend_req_type =3D INVALID_TYPE;
+
+=09info->baseaddr =3D of_iomap(node, 0);
+=09if (!info->baseaddr) {
+=09=09pr_err(SPCLOG "unable to ioremap memory\n");
+=09=09ret =3D -ENXIO;
+=09=09goto mem_free;
+=09}
+
+=09info->irq =3D irq_of_parse_and_map(node, 0);
+
+=09if (!info->irq) {
+=09=09pr_err(SPCLOG "unable to retrieve irq\n");
+=09=09ret =3D -ENXIO;
+=09=09goto unmap;
+=09}
+
+=09readl_relaxed(info->baseaddr + PWC_STATUS);
+
+=09ret =3D request_irq(info->irq, ve_spc_irq_handler,
+=09=09=09  IRQF_DISABLED | IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+=09=09=09  "arm-spc", info);
+
+=09if (ret) {
+=09=09pr_err(SPCLOG "IRQ %d request failed\n", info->irq);
+=09=09ret =3D -ENODEV;
+=09=09goto dispose_irq;
+=09}
+
+=09info->a15_clusid =3D readl_relaxed(info->baseaddr + A15_CONF) & 0xf;
+
+=09info->config_bridge =3D vexpress_config_bridge_register(node,
+=09=09=09=09=09&ve_spc_config_bridge_info);
+
+=09if (!info->config_bridge) {
+=09=09pr_err(SPCLOG "failed to register config bridge\n");
+=09=09ret =3D -ENODEV;
+=09=09goto free_irq;
+=09}
+
+=09info->opp_func =3D vexpress_config_func_get(info->config_bridge, "opp")=
;
+
+=09if (!info->opp_func) {
+=09=09pr_err(SPCLOG "failed to init opp function\n");
+=09=09ret =3D -ENODEV;
+=09=09goto unregister_bridge;
+=09}
+
+=09info->perf_func =3D vexpress_config_func_get(info->config_bridge, "perf=
");
+=09if (!info->perf_func) {
+=09=09pr_err(SPCLOG "failed to init perf function\n");
+=09=09ret =3D -ENODEV;
+=09=09goto put_opp;
+=09}
+
+=09if (ve_spc_populate_opps(0) || ve_spc_populate_opps(1)) {
+=09=09pr_err(SPCLOG "failed to build OPP tables\n");
+=09=09ret =3D -EIO;
+=09=09goto put_perf;
+=09}
+=09/*
+=09 * Multi-cluster systems may need this data when non-coherent, during
+=09 * cluster power-up/power-down. Make sure it reaches main memory:
+=09 */
+=09sync_cache_w(info);
+=09sync_cache_w(&info);
+=09pr_info("vexpress-spc loaded at %p\n", info->baseaddr);
+=09return 0;
+
+put_perf:
+=09vexpress_config_func_put(info->perf_func);
+put_opp:
+=09vexpress_config_func_put(info->opp_func);
+unregister_bridge:
+=09vexpress_config_bridge_unregister(info->config_bridge);
+free_irq:
+=09free_irq(info->irq, info);
+dispose_irq:
+=09irq_dispose_mapping(info->irq);
+unmap:
+=09iounmap(info->baseaddr);
+mem_free:
+=09kfree(info);
+=09return ret;
+}
+
+static int __init ve_spc_init(void);
+/*
+ * Pointer spc_probe is swapped after init hence it is safe
+ * to initialize it to a function in the __init section
+ */
+static int (*spc_probe)(void) __refdata =3D &ve_spc_init;
+
+/*
+ * Function exported to manage early_initcall ordering.
+ * SPC code is needed very early in the boot process
+ * to bring CPUs out of reset and initialize power
+ * management back-end. After boot swap pointers to
+ * make the functionality check available to loadable
+ * modules, when early boot init functions have been
+ * already freed from kernel address space.
+ */
+int ve_spc_probe(void)
+{
+=09return spc_probe();
+}
+EXPORT_SYMBOL_GPL(ve_spc_probe);
+
+static int __init ve_spc_init(void)
+{
+=09if (ve_spc_load_result =3D=3D -EAGAIN) {
+=09=09ve_spc_load_result =3D ve_spc_setup();
+=09=09spc_probe =3D &ve_spc_late_probe;
+=09}
+=09return ve_spc_load_result;
+}
+early_initcall(ve_spc_init);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Versatile Express Serial Power Controller (SPC) suppor=
t");
diff --git a/include/linux/vexpress.h b/include/linux/vexpress.h
index 50368e0..af5f099 100644
--- a/include/linux/vexpress.h
+++ b/include/linux/vexpress.h
@@ -132,4 +132,37 @@ void vexpress_clk_of_register_spc(void);
 void vexpress_clk_init(void __iomem *sp810_base);
 void vexpress_clk_of_init(void);
=20
+/* SPC */
+
+#ifdef CONFIG_VEXPRESS_SPC
+int ve_spc_probe(void);
+int ve_spc_get_freq(u32 cluster);
+int ve_spc_set_freq(u32 cluster, u32 freq);
+int ve_spc_get_freq_table(u32 cluster, const u32 **fptr);
+void ve_spc_global_wakeup_irq(bool set);
+void ve_spc_cpu_wakeup_irq(u32 cpu, u32 cluster, bool set);
+void ve_spc_set_resume_addr(u32 cluster, u32 cpu, u32 addr);
+u32 ve_spc_get_nr_cpus(u32 cluster);
+void ve_spc_powerdown(u32 cluster, bool enable);
+#else
+static inline bool ve_spc_probe(void) { return -ENODEV; }
+static inline int ve_spc_get_freq(u32 cluster)
+{
+=09return -ENODEV;
+}
+static inline int ve_spc_set_freq(u32 cluster, u32 freq)
+{
+=09return -ENODEV;
+}
+static inline int ve_spc_get_freq_table(u32 cluster, const u32 **fptr)
+{
+=09return -ENODEV;
+}
+static inline void ve_spc_global_wakeup_irq(bool set) { }
+static inline void ve_spc_cpu_wakeup_irq(u32 cpu, u32 cluster, bool set) {=
 }
+static inline void ve_spc_set_resume_addr(u32 cluster, u32 cpu, u32 addr) =
{ }
+static inline u32 ve_spc_get_nr_cpus(u32 cluster) { return 0; }
+static inline void ve_spc_powerdown(u32 cluster, bool enable) { }
+#endif
+
 #endif
--=20
1.8.2.2

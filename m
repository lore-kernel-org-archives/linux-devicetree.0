From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [RFC PATCH 3/3] drivers: mfd: vexpress: add Serial Power Controller (SPC) support
Date: Fri, 24 May 2013 13:53:06 +0100
Message-ID: <1369399986-15649-4-git-send-email-lorenzo.pieralisi@arm.com>
References: <1369399986-15649-1-git-send-email-lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1369399986-15649-1-git-send-email-lorenzo.pieralisi@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Samuel Ortiz <sameo@linux.intel.com>, Pawel Moll <pawel.moll@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Jon Medhurst <tixy@linaro.org>, Achin Gupta <achin.gupta@arm.com>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
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

The driver also provides a bridge interface through the vexpress config
infrastructure. Operations allowing to read/write operating points are
made to go via the same interface as configuration transactions so that
all requests to M3 are serialized.

Device tree bindings documentation for the SPC component are provided with
the patchset.

Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Amit Kucheria <amit.kucheria@linaro.org>
Cc: Jon Medhurst <tixy@linaro.org>
Signed-off-by: Achin Gupta <achin.gupta@arm.com>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
---
 Documentation/devicetree/bindings/mfd/vexpress-spc.txt |  35 +
 drivers/mfd/Kconfig                                    |   7 +
 drivers/mfd/Makefile                                   |   1 +
 drivers/mfd/vexpress-spc.c                             | 626 ++++++++++
 include/linux/vexpress.h                               |  43 +
 5 files changed, 712 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/vexpress-spc.txt b/Docum=
entation/devicetree/bindings/mfd/vexpress-spc.txt
new file mode 100644
index 0000000..1d71dc2
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/vexpress-spc.txt
@@ -0,0 +1,35 @@
+* ARM Versatile Express Serial Power Controller device tree bindings
+
+Latest ARM development boards implement a power management interface (seri=
al
+power controller - SPC) that is capable of managing power/voltage and
+operating point transitions, through memory mapped registers interface.
+
+On testchips like TC2 it also provides a configuration interface that can
+be used to read/write values which cannot be read/written through simple
+memory mapped reads/writes.
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
+=09compatible =3D "arm,vexpress-spc,v2p-ca15_a7","arm,vexpress-spc";
+=09reg =3D <0 0x7FFF0000 0 0x1000>;
+=09interrupts =3D <0 95 4>;
+};
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index d9aed15..b5259af 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1147,3 +1147,10 @@ config VEXPRESS_CONFIG
 =09help
 =09  Platform configuration infrastructure for the ARM Ltd.
 =09  Versatile Express.
+
+config VEXPRESS_SPC
+=09bool "Versatile Express SPC driver support"
+=09depends on ARM
+=09depends on VEXPRESS_CONFIG
+=09help
+=09  Serial Power Controller driver for ARM Ltd. test chips.
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
index 0000000..f78257a
--- /dev/null
+++ b/drivers/mfd/vexpress-spc.c
@@ -0,0 +1,626 @@
+/*
+ * Versatile Express Serial Power Controller (SPC) support
+ *
+ * Copyright (C) 2013 ARM Ltd.
+ *
+ * Author(s): Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
+ *            Achin Gupta           <achin.gupta@arm.com>
+ *            Lorenzo Pieralisi     <lorenzo.pieralisi@arm.com>
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
+#define SCC_CFGREG19=09=090x120
+#define SCC_CFGREG20=09=090x124
+#define A15_CONF=09=090x400
+#define A7_CONF=09=09=090x500
+#define SYS_INFO=09=090x700
+#define PERF_LVL_A15=09=090xB00
+#define PERF_REQ_A15=09=090xB04
+#define PERF_LVL_A7=09=090xB08
+#define PERF_REQ_A7=09=090xB0c
+#define SYS_CFGCTRL=09=090xB10
+#define SYS_CFGCTRL_REQ=09=090xB14
+#define PWC_STATUS=09=090xB18
+#define PWC_FLAG=09=090xB1c
+#define WAKE_INT_MASK=09=090xB24
+#define WAKE_INT_RAW=09=090xB28
+#define WAKE_INT_STAT=09=090xB2c
+#define A15_PWRDN_EN=09=090xB30
+#define A7_PWRDN_EN=09=090xB34
+#define A7_PWRDNACK=09=090xB54
+#define A15_BX_ADDR0=09=090xB68
+#define SYS_CFG_WDATA=09=090xB70
+#define SYS_CFG_RDATA=09=090xB74
+#define A7_BX_ADDR0=09=090xB78
+
+#define GBL_WAKEUP_INT_MSK=09(0x3 << 10)
+
+#define CLKF_SHIFT=09=0916
+#define CLKF_MASK=09=090x1FFF
+#define CLKR_SHIFT=09=090
+#define CLKR_MASK=09=090x3F
+#define CLKOD_SHIFT=09=098
+#define CLKOD_MASK=09=090xF
+
+#define OPP_FUNCTION=09=096
+#define OPP_BASE_DEVICE=09=090x300
+#define OPP_A15_OFFSET=09=090x4
+#define OPP_A7_OFFSET=09=090xc
+
+#define SYS_CFGCTRL_START=09(1 << 31)
+#define SYS_CFGCTRL_WRITE=09(1 << 30)
+#define SYS_CFGCTRL_FUNC(n)=09(((n) & 0x3f) << 20)
+#define SYS_CFGCTRL_DEVICE(n)=09(((n) & 0xfff) << 0)
+/*
+ * Even though the SPC takes max 3-5 ms to complete any OPP/SYS_CFGCTRL
+ * operation, the operation could start just before jiffie is about
+ * to be incremented. So setting timeout value of 20ms =3D 2jiffies@100Hz
+ */
+#define TIME_OUT_US=0920000
+
+#define MAX_OPPS=098
+#define MAX_CLUSTERS=092
+
+enum {
+=09A15_OPP_STATUS=09=09=3D 0,
+=09A7_OPP_STATUS=09=09=3D 1,
+=09SYS_CFGCTRL_STATUS=09=3D 2
+};
+
+#define STAT_COMPLETE(type)=09((1 << 0) << (type << 2))
+#define STAT_ERR(type)=09=09((1 << 1) << (type << 2))
+#define RESPONSE_MASK(type)=09(STAT_COMPLETE(type) | STAT_ERR(type))
+
+struct vexpress_spc_drvdata {
+=09void __iomem *baseaddr;
+=09u32 a15_clusid;
+=09int irq;
+=09u32 cur_req_type;
+=09u32 freqs[MAX_CLUSTERS][MAX_OPPS];
+=09int freqs_cnt[MAX_CLUSTERS];
+};
+
+enum spc_func_type {
+=09CONFIG_FUNC =3D 0,
+=09PERF_FUNC   =3D 1,
+};
+
+struct vexpress_spc_func {
+=09enum spc_func_type type;
+=09u32 function;
+=09u32 device;
+};
+
+static struct vexpress_spc_drvdata *info;
+static u32 *vexpress_spc_config_data;
+static struct vexpress_config_bridge *vexpress_spc_config_bridge;
+static struct vexpress_config_func *opp_func, *perf_func;
+
+static int vexpress_spc_load_result =3D -EAGAIN;
+static DEFINE_MUTEX(vexpress_spc_loading);
+
+static inline bool vexpress_spc_initialized(void)
+{
+=09return vexpress_spc_load_result =3D=3D 0;
+}
+
+/**
+ * vexpress_spc_write_resume_reg() - set the jump address used for warm bo=
ot
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @cpu: mpidr[7:0] bitfield describing cpu affinity level
+ * @addr: physical resume address
+ */
+void vexpress_spc_write_resume_reg(u32 cluster, u32 cpu, u32 addr)
+{
+=09void __iomem *baseaddr;
+
+=09if (WARN_ON_ONCE(cluster >=3D MAX_CLUSTERS))
+=09=09return;
+
+=09if (cluster !=3D info->a15_clusid)
+=09=09baseaddr =3D info->baseaddr + A7_BX_ADDR0 + (cpu << 2);
+=09else
+=09=09baseaddr =3D info->baseaddr + A15_BX_ADDR0 + (cpu << 2);
+
+=09writel_relaxed(addr, baseaddr);
+}
+EXPORT_SYMBOL_GPL(vexpress_spc_write_resume_reg);
+
+/**
+ * vexpress_spc_get_nb_cpus() - get number of cpus in a cluster
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ *
+ * Return: number of cpus in the cluster
+ *         -EINVAL if cluster number invalid
+ */
+int vexpress_spc_get_nb_cpus(u32 cluster)
+{
+=09u32 val;
+
+=09if (WARN_ON_ONCE(cluster >=3D MAX_CLUSTERS))
+=09=09return -EINVAL;
+
+=09val =3D readl_relaxed(info->baseaddr + SYS_INFO);
+=09val =3D (cluster !=3D info->a15_clusid) ? (val >> 20) : (val >> 16);
+=09return val & 0xf;
+}
+EXPORT_SYMBOL_GPL(vexpress_spc_get_nb_cpus);
+
+/**
+ * vexpress_spc_get_performance - get current performance level of cluster
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @freq: pointer to the performance level to be assigned
+ *
+ * Return: 0 on success
+ *         < 0 on read error
+ */
+int vexpress_spc_get_performance(u32 cluster, u32 *freq)
+{
+=09u32 perf_cfg_reg;
+=09int perf, ret;
+
+=09if (!vexpress_spc_initialized() || (cluster >=3D MAX_CLUSTERS))
+=09=09return -EINVAL;
+
+=09perf_cfg_reg =3D cluster !=3D info->a15_clusid ? PERF_LVL_A7 : PERF_LVL=
_A15;
+=09ret =3D vexpress_config_read_timeout(perf_func, perf_cfg_reg,
+=09=09=09=09&perf, usecs_to_jiffies(TIME_OUT_US));
+
+=09if (!ret)
+=09=09*freq =3D info->freqs[cluster][perf];
+
+=09return ret;
+}
+EXPORT_SYMBOL_GPL(vexpress_spc_get_performance);
+
+/**
+ * vexpress_spc_get_perf_index - get performance level corresponding to
+ *=09=09=09=09 a frequency
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @freq: frequency to be looked-up
+ *
+ * Return: perf level index on success
+ *         -EINVAL on error
+ */
+static int vexpress_spc_find_perf_index(u32 cluster, u32 freq)
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
+ * vexpress_spc_set_performance - set current performance level of cluster
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @freq: performance level to be programmed
+ *
+ * Returns: 0 on success
+ *          < 0 on write error
+ */
+int vexpress_spc_set_performance(u32 cluster, u32 freq)
+{
+=09int ret, perf, offset;
+
+=09if (!vexpress_spc_initialized() || (cluster >=3D MAX_CLUSTERS))
+=09=09return -EINVAL;
+
+=09offset =3D (cluster !=3D info->a15_clusid) ? PERF_LVL_A7 : PERF_LVL_A15=
;
+
+=09perf =3D vexpress_spc_find_perf_index(cluster, freq);
+
+=09if (perf < 0 || perf >=3D MAX_OPPS)
+=09=09return -EINVAL;
+
+=09ret =3D vexpress_config_write_timeout(perf_func, offset,
+=09=09=09perf, usecs_to_jiffies(TIME_OUT_US));
+
+=09return ret;
+}
+EXPORT_SYMBOL_GPL(vexpress_spc_set_performance);
+
+static void vexpress_spc_set_wake_intr(u32 mask)
+{
+=09writel_relaxed(mask & VEXPRESS_SPC_WAKE_INTR_MASK,
+=09       info->baseaddr + WAKE_INT_MASK);
+}
+
+static inline void reg_bitmask(u32 *reg, u32 mask, bool set)
+{
+=09if (set)
+=09=09*reg |=3D mask;
+=09else
+=09=09*reg &=3D ~mask;
+}
+
+/**
+ * vexpress_spc_set_global_wakeup_intr()
+ *
+ * Function to set/clear global wakeup IRQs. Not protected by locking sinc=
e
+ * it might be used in code paths where normal cacheable locks are not
+ * working. Locking must be provided by the caller to ensure atomicity.
+ *
+ * @set: if true, global wake-up IRQs are set, if false they are cleared
+ *
+ */
+void vexpress_spc_set_global_wakeup_intr(bool set)
+{
+=09u32 wake_int_mask_reg =3D 0;
+
+=09wake_int_mask_reg =3D readl_relaxed(info->baseaddr + WAKE_INT_MASK);
+=09reg_bitmask(&wake_int_mask_reg, GBL_WAKEUP_INT_MSK, set);
+=09vexpress_spc_set_wake_intr(wake_int_mask_reg);
+}
+EXPORT_SYMBOL_GPL(vexpress_spc_set_global_wakeup_intr);
+
+/**
+ * vexpress_spc_set_cpu_wakeup_irq()
+ *
+ * Function to set/clear per-CPU wake-up IRQs. Not protected by locking si=
nce
+ * it might be used in code paths where normal cacheable locks are not
+ * working. Locking must be provided by the caller to ensure atomicity.
+ *
+ * @cpu: mpidr[7:0] bitfield describing cpu affinity level
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @set: if true, wake-up IRQs are set, if false they are cleared
+ *
+ */
+void vexpress_spc_set_cpu_wakeup_irq(u32 cpu, u32 cluster, bool set)
+{
+=09u32 mask =3D 0;
+=09u32 wake_int_mask_reg =3D 0;
+
+=09mask =3D 1 << cpu;
+=09if (info->a15_clusid !=3D cluster)
+=09=09mask <<=3D 4;
+
+=09wake_int_mask_reg =3D readl_relaxed(info->baseaddr + WAKE_INT_MASK);
+=09reg_bitmask(&wake_int_mask_reg, mask, set);
+=09vexpress_spc_set_wake_intr(wake_int_mask_reg);
+}
+EXPORT_SYMBOL_GPL(vexpress_spc_set_cpu_wakeup_irq);
+
+/**
+ * vexpress_spc_powerdown_enable()
+ *
+ * Function to enable/disable cluster powerdown. Not protected by locking
+ * since it might be used in code paths where normal cacheable locks are n=
ot
+ * working. Locking must be provided by the caller to ensure atomicity.
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @enable: if true enables powerdown, if false disables it
+ *
+ */
+void vexpress_spc_powerdown_enable(u32 cluster, bool enable)
+{
+=09u32 pwdrn_reg =3D 0;
+
+=09if (cluster >=3D MAX_CLUSTERS)
+=09=09return;
+=09pwdrn_reg =3D cluster !=3D info->a15_clusid ? A7_PWRDN_EN : A15_PWRDN_E=
N;
+=09writel_relaxed(enable, info->baseaddr + pwdrn_reg);
+}
+EXPORT_SYMBOL_GPL(vexpress_spc_powerdown_enable);
+
+irqreturn_t vexpress_spc_irq_handler(int irq, void *data)
+{
+=09int ret;
+=09u32 status =3D readl_relaxed(info->baseaddr + PWC_STATUS);
+
+=09if (!(status & RESPONSE_MASK(info->cur_req_type)))
+=09=09return IRQ_NONE;
+
+=09if ((status =3D=3D STAT_COMPLETE(SYS_CFGCTRL_STATUS))
+=09=09=09&& vexpress_spc_config_data) {
+=09=09*vexpress_spc_config_data =3D
+=09=09=09=09readl_relaxed(info->baseaddr + SYS_CFG_RDATA);
+=09=09vexpress_spc_config_data =3D NULL;
+=09}
+
+=09ret =3D STAT_COMPLETE(info->cur_req_type) ? 0 : -EIO;
+=09info->cur_req_type =3D 0;
+=09vexpress_config_complete(vexpress_spc_config_bridge, ret);
+=09return IRQ_HANDLED;
+}
+
+/**
+ * Based on the firmware documentation, this is always fixed to 20
+ * All the 4 OSC: A15 PLL0/1, A7 PLL0/1 must be programmed same
+ * values for both control and value registers.
+ * This function uses A15 PLL 0 registers to compute multiple factor
+ * F out =3D F in * (CLKF + 1) / ((CLKOD + 1) * (CLKR + 1))
+ */
+static inline int __get_mult_factor(void)
+{
+=09int i_div, o_div, f_div;
+=09u32 tmp;
+
+=09tmp =3D readl(info->baseaddr + SCC_CFGREG19);
+=09f_div =3D (tmp >> CLKF_SHIFT) & CLKF_MASK;
+
+=09tmp =3D readl(info->baseaddr + SCC_CFGREG20);
+=09o_div =3D (tmp >> CLKOD_SHIFT) & CLKOD_MASK;
+=09i_div =3D (tmp >> CLKR_SHIFT) & CLKR_MASK;
+
+=09return (f_div + 1) / ((o_div + 1) * (i_div + 1));
+}
+
+/**
+ * vexpress_spc_populate_opps() - initialize opp tables from microcontroll=
er
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ *
+ * Return: 0 on success
+ *         < 0 on error
+ */
+static int vexpress_spc_populate_opps(u32 cluster)
+{
+=09u32 data =3D 0, ret, i, offset;
+=09int mult_fact =3D __get_mult_factor();
+
+=09if (WARN_ON_ONCE(cluster >=3D MAX_CLUSTERS))
+=09=09return -EINVAL;
+
+=09offset =3D cluster !=3D info->a15_clusid ? OPP_A7_OFFSET : OPP_A15_OFFS=
ET;
+=09for (i =3D 0; i < MAX_OPPS; i++) {
+=09=09ret =3D vexpress_config_read_timeout(opp_func, i + offset,
+=09=09=09=09&data, usecs_to_jiffies(TIME_OUT_US));
+=09=09if (!ret)
+=09=09=09info->freqs[cluster][i] =3D (data & 0xFFFFF) * mult_fact;
+=09=09else
+=09=09=09break;
+=09}
+
+=09info->freqs_cnt[cluster] =3D i;
+=09return ret;
+}
+
+/**
+ * vexpress_spc_get_freq_table() - Retrieve a pointer to the frequency
+ *=09=09=09=09   table for a given cluster
+ *
+ * @cluster: mpidr[15:8] bitfield describing cluster affinity level
+ * @fptr: pointer to be initialized
+ * Return: operating points count on success
+ *         -EINVAL on pointer error
+ */
+int vexpress_spc_get_freq_table(u32 cluster, u32 **fptr)
+{
+=09if (WARN_ON_ONCE(!fptr || cluster >=3D MAX_CLUSTERS))
+=09=09return -EINVAL;
+=09*fptr =3D info->freqs[cluster];
+=09return info->freqs_cnt[cluster];
+}
+EXPORT_SYMBOL_GPL(vexpress_spc_get_freq_table);
+
+static void *vexpress_spc_func_get(struct device *dev,
+=09=09struct device_node *node, const char *id)
+{
+=09struct vexpress_spc_func *spc_func;
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
+=09=09=09=09=09     spc_func->function,
+=09=09=09=09=09     spc_func->device,
+=09=09=09=09=09     spc_func->type);
+
+=09return spc_func;
+}
+
+static void vexpress_spc_func_put(void *func)
+{
+=09kfree(func);
+}
+
+static int vexpress_spc_func_exec(void *func, int offset, bool write,
+=09=09=09=09  u32 *data)
+{
+=09struct vexpress_spc_func *spc_func =3D func;
+=09u32 command;
+
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
+=09=09=09info->cur_req_type =3D (offset =3D=3D PERF_LVL_A15) ?
+=09=09=09=09=09A15_OPP_STATUS : A7_OPP_STATUS;
+=09=09=09writel_relaxed(*data, info->baseaddr + offset);
+=09=09=09return VEXPRESS_CONFIG_STATUS_WAIT;
+=09=09} else {
+=09=09=09*data =3D readl_relaxed(info->baseaddr + offset);
+=09=09=09return VEXPRESS_CONFIG_STATUS_DONE;
+=09=09}
+=09case CONFIG_FUNC:
+=09=09info->cur_req_type =3D SYS_CFGCTRL_STATUS;
+
+=09=09command =3D SYS_CFGCTRL_START;
+=09=09command |=3D write ? SYS_CFGCTRL_WRITE : 0;
+=09=09command |=3D SYS_CFGCTRL_FUNC(spc_func->function);
+=09=09command |=3D SYS_CFGCTRL_DEVICE(spc_func->device + offset);
+
+=09=09pr_debug("command %x\n", command);
+
+=09=09if (!write)
+=09=09=09vexpress_spc_config_data =3D data;
+=09=09else
+=09=09=09writel_relaxed(command, info->baseaddr + SYS_CFG_WDATA);
+=09=09writel_relaxed(command, info->baseaddr + SYS_CFGCTRL);
+
+=09=09return VEXPRESS_CONFIG_STATUS_WAIT;
+=09default:
+=09=09return -EINVAL;
+=09}
+}
+
+struct vexpress_config_bridge_info vexpress_spc_config_bridge_info =3D {
+=09.name =3D "vexpress-spc",
+=09.func_get =3D vexpress_spc_func_get,
+=09.func_put =3D vexpress_spc_func_put,
+=09.func_exec =3D vexpress_spc_func_exec,
+};
+
+static const struct of_device_id vexpress_spc_ids[] __initconst =3D {
+=09{ .compatible =3D "arm,vexpress-spc,v2p-ca15_a7" },
+=09{ .compatible =3D "arm,vexpress-spc" },
+=09{},
+};
+
+static int vexpress_spc_init(void)
+{
+=09int ret;
+=09struct device_node *node =3D of_find_matching_node(NULL,
+=09=09=09=09=09=09=09 vexpress_spc_ids);
+
+=09info =3D kzalloc(sizeof(*info), GFP_KERNEL);
+=09if (!info) {
+=09=09pr_err("%s: unable to allocate mem\n", __func__);
+=09=09return -ENOMEM;
+=09}
+
+=09info->baseaddr =3D of_iomap(node, 0);
+=09if (WARN_ON(!info->baseaddr)) {
+=09=09ret =3D -ENXIO;
+=09=09goto mem_free;
+=09}
+
+=09info->irq =3D irq_of_parse_and_map(node, 0);
+
+=09if (WARN_ON(!info->irq)) {
+=09=09ret =3D -ENXIO;
+=09=09goto unmap;
+=09}
+
+=09readl_relaxed(info->baseaddr + PWC_STATUS);
+
+=09ret =3D request_irq(info->irq, vexpress_spc_irq_handler,
+=09=09IRQF_DISABLED | IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+=09=09"arm-spc", info);
+
+=09if (ret) {
+=09=09pr_err("IRQ %d request failed\n", info->irq);
+=09=09ret =3D -ENODEV;
+=09=09goto unmap;
+=09}
+
+=09info->a15_clusid =3D readl_relaxed(info->baseaddr + A15_CONF) & 0xf;
+
+=09vexpress_spc_config_bridge =3D vexpress_config_bridge_register(
+=09=09=09node, &vexpress_spc_config_bridge_info);
+
+=09if (WARN_ON(!vexpress_spc_config_bridge)) {
+=09=09ret =3D -ENODEV;
+=09=09goto unmap;
+=09}
+
+=09opp_func =3D vexpress_config_func_get(vexpress_spc_config_bridge, "opp"=
);
+=09perf_func =3D
+=09=09vexpress_config_func_get(vexpress_spc_config_bridge, "perf");
+
+=09if (!opp_func || !perf_func) {
+=09=09ret =3D -ENODEV;
+=09=09goto unmap;
+=09}
+
+=09if (vexpress_spc_populate_opps(0) || vexpress_spc_populate_opps(1)) {
+=09=09if (info->irq)
+=09=09=09free_irq(info->irq, info);
+=09=09pr_err("failed to build OPP table\n");
+=09=09ret =3D -ENODEV;
+=09=09goto unmap;
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
+unmap:
+=09iounmap(info->baseaddr);
+
+mem_free:
+=09kfree(info);
+=09return ret;
+}
+
+bool vexpress_spc_check_loaded(void)
+{
+=09if (vexpress_spc_load_result !=3D -EAGAIN)
+=09=09return vexpress_spc_initialized();
+
+=09mutex_lock(&vexpress_spc_loading);
+=09if (vexpress_spc_load_result =3D=3D -EAGAIN)
+=09=09vexpress_spc_load_result =3D vexpress_spc_init();
+=09mutex_unlock(&vexpress_spc_loading);
+=09return vexpress_spc_initialized();
+}
+EXPORT_SYMBOL_GPL(vexpress_spc_check_loaded);
+
+static int __init vexpress_spc_early_init(void)
+{
+=09vexpress_spc_check_loaded();
+=09return vexpress_spc_load_result;
+}
+early_initcall(vexpress_spc_early_init);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Serial Power Controller (SPC) support");
diff --git a/include/linux/vexpress.h b/include/linux/vexpress.h
index e5015d8..15cc123 100644
--- a/include/linux/vexpress.h
+++ b/include/linux/vexpress.h
@@ -147,4 +147,47 @@ void vexpress_clk_of_register_spc(void);
 void vexpress_clk_init(void __iomem *sp810_base);
 void vexpress_clk_of_init(void);
=20
+/* SPC */
+
+#define=09VEXPRESS_SPC_WAKE_INTR_IRQ(cluster, cpu) \
+=09=09=09(1 << (4 * (cluster) + (cpu)))
+#define=09VEXPRESS_SPC_WAKE_INTR_FIQ(cluster, cpu) \
+=09=09=09(1 << (7 * (cluster) + (cpu)))
+#define=09VEXPRESS_SPC_WAKE_INTR_SWDOG=09=09(1 << 10)
+#define=09VEXPRESS_SPC_WAKE_INTR_GTIMER=09=09(1 << 11)
+#define=09VEXPRESS_SPC_WAKE_INTR_MASK=09=090xFFF
+
+#ifdef CONFIG_VEXPRESS_SPC
+extern bool vexpress_spc_check_loaded(void);
+extern void vexpress_spc_set_cpu_wakeup_irq(u32 cpu, u32 cluster, bool set=
);
+extern void vexpress_spc_set_global_wakeup_intr(bool set);
+extern int vexpress_spc_get_freq_table(u32 cluster, u32 **fptr);
+extern int vexpress_spc_get_performance(u32 cluster, u32 *freq);
+extern int vexpress_spc_set_performance(u32 cluster, u32 freq);
+extern void vexpress_spc_write_resume_reg(u32 cluster, u32 cpu, u32 addr);
+extern int vexpress_spc_get_nb_cpus(u32 cluster);
+extern void vexpress_spc_powerdown_enable(u32 cluster, bool enable);
+#else
+static inline bool vexpress_spc_check_loaded(void) { return false; }
+static inline void vexpress_spc_set_cpu_wakeup_irq(u32 cpu, u32 cluster,
+=09=09=09=09=09=09   bool set) { }
+static inline void vexpress_spc_set_global_wakeup_intr(bool set) { }
+static inline int vexpress_spc_get_freq_table(u32 cluster, u32 **fptr)
+{
+=09return -ENODEV;
+}
+static inline int vexpress_spc_get_performance(u32 cluster, u32 *freq)
+{
+=09return -ENODEV;
+}
+static inline int vexpress_spc_set_performance(u32 cluster, u32 freq)
+{
+=09return -ENODEV;
+}
+static inline void vexpress_spc_write_resume_reg(u32 cluster,
+=09=09=09=09=09=09 u32 cpu, u32 addr) { }
+static inline int vexpress_spc_get_nb_cpus(u32 cluster) { return -ENODEV; =
}
+static inline void vexpress_spc_powerdown_enable(u32 cluster, bool enable)=
 { }
+#endif
+
 #endif
--=20
1.8.2.2

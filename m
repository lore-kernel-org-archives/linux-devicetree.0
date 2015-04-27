From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/4] mailbox: add support for System Control and Power Interface(SCPI) protocol
Date: Mon, 27 Apr 2015 12:40:43 +0100
Message-ID: <1430134846-24320-2-git-send-email-sudeep.holla@arm.com>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430134846-24320-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support for System Control and Power Interface (SCPI)
Message Protocol used between the Application Cores(AP) and the System
Control Processor(SCP). The MHU peripheral provides a mechanism for
inter-processor communication between SCP's M3 processor and AP.

SCP offers control and management of the core/cluster power states,
various power domain DVFS including the core/cluster, certain system
clocks configuration, thermal sensors and many others.

This protocol driver provides interface for all the client drivers using
SCPI to make use of the features offered by the SCP.

Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
CC: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Jon Medhurst (Tixy) <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 .../devicetree/bindings/mailbox/arm,scpi.txt       | 121 ++++
 drivers/mailbox/Kconfig                            |  19 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/scpi_protocol.c                    | 694 +++++++++++++++++++++
 include/linux/scpi_protocol.h                      |  57 ++
 5 files changed, 893 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/arm,scpi.txt
 create mode 100644 drivers/mailbox/scpi_protocol.c
 create mode 100644 include/linux/scpi_protocol.h

diff --git a/Documentation/devicetree/bindings/mailbox/arm,scpi.txt b/Documentation/devicetree/bindings/mailbox/arm,scpi.txt
new file mode 100644
index 000000000000..5db235f69e54
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/arm,scpi.txt
@@ -0,0 +1,121 @@
+System Control and Power Interface (SCPI) Message Protocol
+----------------------------------------------------------
+
+Required properties:
+
+- compatible : should be "arm,scpi"
+- mboxes: List of phandle and mailbox channel specifiers
+- shmem : List of phandle pointing to the shared memory(SHM) area between the
+	  processors using these mailboxes for IPC, one for each mailbox
+
+See Documentation/devicetree/bindings/mailbox/mailbox.txt
+for more details about the generic mailbox controller and
+client driver bindings.
+
+Clock bindings for the clocks based on SCPI Message Protocol
+------------------------------------------------------------
+
+This binding uses the common clock binding[1].
+
+Required properties:
+- compatible : shall be one of the following:
+	"arm,scpi-clocks" - for the container node with all the clocks
+		based on the SCPI protocol
+	"arm,scpi-dvfs" - all the clocks that are variable and index based.
+		These clocks don't provide the full range between the limits
+		but only discrete points within the range. The firmware
+		provides the mapping for each such operating frequency and the
+		index associated with it. The firmware also manages the
+		voltage scaling appropriately with the clock scaling.
+	"arm,scpi-clk" - all the clocks that are variable and provide full
+		range within the specified range. The firmware provides the
+		supported range for each clock.
+
+Required properties for all clocks(all from common clock binding):
+- #clock-cells : should be set to 1 as each of the SCPI clocks have multiple
+	outputs. The clock specifier will be the index to an entry in the list
+	of output clocks.
+- clock-output-names : shall be the corresponding names of the outputs.
+- clock-indices: The identifyng number for the clocks(clock_id) in the node as
+	expected by the firmware. It can be non linear and hence provide the
+	mapping	of identifiers into the clock-output-names array.
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Example:
+
+sram: sram@50000000 {
+	compatible = "arm,juno-sram-ns", "mmio-sram";
+	reg = <0x0 0x50000000 0x0 0x10000>;
+
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0 0x0 0x50000000 0x10000>;
+
+	cpu_scp_lpri: scp-shmem@0 {
+		compatible = "arm,juno-scp-shmem";
+		reg = <0x0 0x200>;
+	};
+
+	cpu_scp_hpri: scp-shmem@200 {
+		compatible = "arm,juno-scp-shmem";
+		reg = <0x200 0x200>;
+	};
+};
+
+mailbox: mailbox0@40000000 {
+	....
+	#mbox-cells = <1>;
+};
+
+scpi_protocol: scpi@2e000000 {
+	compatible = "arm,scpi";
+	mboxes = <&mailbox 0 &mailbox 1>;
+	shmem = <&cpu_scp_lpri &cpu_scp_hpri>;
+
+	clocks {
+		compatible = "arm,scpi-clocks";
+
+		scpi_dvfs: scpi_clocks@0 {
+			compatible = "arm,scpi-dvfs";
+			#clock-cells = <1>;
+			clock-indices = <0>, <1>, <2>;
+			clock-output-names = "vbig", "vlittle", "vgpu";
+		};
+		scpi_clk: scpi_clocks@3 {
+			compatible = "arm,scpi-clk";
+			#clock-cells = <1>;
+			clock-indices = <3>, <4>;
+			clock-output-names = "pxlclk0", "pxlclk1";
+		};
+	};
+};
+
+cpu@0 {
+	...
+	reg = <0 0>;
+	clocks = <&scpi_dvfs 0>;
+	clock-names = "big";
+};
+
+hdlcd@7ff60000 {
+	...
+	reg = <0 0x7ff60000 0 0x1000>;
+	clocks = <&scpi_clk 1>;
+	clock-names = "pxlclk";
+};
+
+In the above example, the #clock-cells is set to 1 as required.
+scpi_dvfs has 3 output clocks namely: vbig, vlittle and vgpu with 0, 1
+and 2 as clock-indices. scpi_clk has 2 output clocks namely: pxlclk0 and
+pxlclk1 with 3 and 4 as clock-indices.
+
+The first consumer in the example is cpu@0 and it has vbig as input clock.
+The index '0' in the clock specifier here points to the first entry in the
+output clocks of scpi_dvfs for which clock_id asrequired by the firmware
+is 0.
+
+Similarly the second example is hdlcd@7ff60000 and it has pxlclk0 as input
+clock. The index '1' in the clock specifier here points to the second entry
+in the output clocks of scpi_clocks for which clock_id as required by the
+firmware is 4.
diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 84b0a2d74d60..20373cf84320 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -15,6 +15,25 @@ config ARM_MHU
 	  The controller has 3 mailbox channels, the last of which can be
 	  used in Secure mode only.
 
+config ARM_SCPI_PROTOCOL
+	tristate "ARM System Control and Power Interface (SCPI) Message Protocol"
+	depends on ARM_MHU
+	help
+	  System Control and Power Interface (SCPI) Message Protocol is
+	  defined for the purpose of communication between the Application
+	  Cores(AP) and the System Control Processor(SCP). The MHU peripheral
+	  provides a mechanism for inter-processor communication between SCP
+	  and AP.
+
+	  SCP controls most of the power managament on the Application
+	  Processors. It offers control and management of: the core/cluster
+	  power states, various power domain DVFS including the core/cluster,
+	  certain system clocks configuration, thermal sensors and many
+	  others.
+
+	  This protocol library provides interface for all the client drivers
+	  making use of the features offered by the SCP.
+
 config PL320_MBOX
 	bool "ARM PL320 Mailbox"
 	depends on ARM_AMBA
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index b18201e97e29..762760e19d0f 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -11,3 +11,5 @@ obj-$(CONFIG_OMAP2PLUS_MBOX)	+= omap-mailbox.o
 obj-$(CONFIG_PCC)		+= pcc.o
 
 obj-$(CONFIG_ALTERA_MBOX)	+= mailbox-altera.o
+
+obj-$(CONFIG_ARM_SCPI_PROTOCOL)	+= scpi_protocol.o
diff --git a/drivers/mailbox/scpi_protocol.c b/drivers/mailbox/scpi_protocol.c
new file mode 100644
index 000000000000..c74575bca845
--- /dev/null
+++ b/drivers/mailbox/scpi_protocol.c
@@ -0,0 +1,694 @@
+/*
+ * System Control and Power Interface (SCPI) Message Protocol driver
+ *
+ * SCPI Message Protocol is used between the System Control Processor(SCP)
+ * and the Application Processors(AP). The Message Handling Unit(MHU)
+ * provides a mechanism for inter-processor communication between SCP's
+ * Cortex M3 and AP.
+ *
+ * SCP offers control and management of the core/cluster power states,
+ * various power domain DVFS including the core/cluster, certain system
+ * clocks configuration, thermal sensors and many others.
+ *
+ * Copyright (C) 2015 ARM Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/bitmap.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/printk.h>
+#include <linux/scpi_protocol.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#define CMD_ID_SHIFT		0
+#define CMD_ID_MASK		0x7f
+#define CMD_TOKEN_ID_SHIFT	8
+#define CMD_TOKEN_ID_MASK	0xff
+#define CMD_DATA_SIZE_SHIFT	16
+#define CMD_DATA_SIZE_MASK	0x1ff
+#define PACK_SCPI_CMD(cmd_id, token, tx_sz)			\
+	((((cmd_id) & CMD_ID_MASK) << CMD_ID_SHIFT) |		\
+	(((token) & CMD_TOKEN_ID_MASK) << CMD_TOKEN_ID_SHIFT) |	\
+	(((tx_sz) & CMD_DATA_SIZE_MASK) << CMD_DATA_SIZE_SHIFT))
+
+#define CMD_SIZE(cmd)	(((cmd) >> CMD_DATA_SIZE_SHIFT) & CMD_DATA_SIZE_MASK)
+#define CMD_UNIQ_MASK	(CMD_TOKEN_ID_MASK << CMD_TOKEN_ID_SHIFT | CMD_ID_MASK)
+#define CMD_XTRACT_UNIQ(cmd)	((cmd) & CMD_UNIQ_MASK)
+
+#define SCPI_SLOT		0
+
+#define MAX_DVFS_DOMAINS	8
+#define MAX_DVFS_OPPS		8
+#define DVFS_LATENCY(hdr)	(le32_to_cpu(hdr) >> 16)
+#define DVFS_OPP_COUNT(hdr)	((le32_to_cpu(hdr) >> 8) & 0xff)
+
+#define PROTOCOL_REV_MINOR_BITS	16
+#define PROTOCOL_REV_MINOR_MASK	((1U << PROTOCOL_REV_MINOR_BITS) - 1)
+#define PROTOCOL_REV_MAJOR(x)	((x) >> PROTOCOL_REV_MINOR_BITS)
+#define PROTOCOL_REV_MINOR(x)	((x) & PROTOCOL_REV_MINOR_MASK)
+
+#define FW_REV_MAJOR_BITS	24
+#define FW_REV_MINOR_BITS	16
+#define FW_REV_PATCH_MASK	((1U << FW_REV_MINOR_BITS) - 1)
+#define FW_REV_MINOR_MASK	((1U << FW_REV_MAJOR_BITS) - 1)
+#define FW_REV_MAJOR(x)		((x) >> FW_REV_MAJOR_BITS)
+#define FW_REV_MINOR(x)		(((x) & FW_REV_MINOR_MASK) >> FW_REV_MINOR_BITS)
+#define FW_REV_PATCH(x)		((x) & FW_REV_PATCH_MASK)
+
+#define MAX_RX_TIMEOUT		(msecs_to_jiffies(30))
+
+enum scpi_error_codes {
+	SCPI_SUCCESS = 0, /* Success */
+	SCPI_ERR_PARAM = 1, /* Invalid parameter(s) */
+	SCPI_ERR_ALIGN = 2, /* Invalid alignment */
+	SCPI_ERR_SIZE = 3, /* Invalid size */
+	SCPI_ERR_HANDLER = 4, /* Invalid handler/callback */
+	SCPI_ERR_ACCESS = 5, /* Invalid access/permission denied */
+	SCPI_ERR_RANGE = 6, /* Value out of range */
+	SCPI_ERR_TIMEOUT = 7, /* Timeout has occurred */
+	SCPI_ERR_NOMEM = 8, /* Invalid memory area or pointer */
+	SCPI_ERR_PWRSTATE = 9, /* Invalid power state */
+	SCPI_ERR_SUPPORT = 10, /* Not supported or disabled */
+	SCPI_ERR_DEVICE = 11, /* Device error */
+	SCPI_ERR_BUSY = 12, /* Device busy */
+	SCPI_ERR_MAX
+};
+
+enum scpi_std_cmd {
+	SCPI_CMD_INVALID		= 0x00,
+	SCPI_CMD_SCPI_READY		= 0x01,
+	SCPI_CMD_SCPI_CAPABILITIES	= 0x02,
+	SCPI_CMD_SET_CSS_PWR_STATE	= 0x03,
+	SCPI_CMD_GET_CSS_PWR_STATE	= 0x04,
+	SCPI_CMD_SET_SYS_PWR_STATE	= 0x05,
+	SCPI_CMD_SET_CPU_TIMER		= 0x06,
+	SCPI_CMD_CANCEL_CPU_TIMER	= 0x07,
+	SCPI_CMD_DVFS_CAPABILITIES	= 0x08,
+	SCPI_CMD_GET_DVFS_INFO		= 0x09,
+	SCPI_CMD_SET_DVFS		= 0x0a,
+	SCPI_CMD_GET_DVFS		= 0x0b,
+	SCPI_CMD_GET_DVFS_STAT		= 0x0c,
+	SCPI_CMD_CLOCK_CAPABILITIES	= 0x0d,
+	SCPI_CMD_GET_CLOCK_INFO		= 0x0e,
+	SCPI_CMD_SET_CLOCK_VALUE	= 0x0f,
+	SCPI_CMD_GET_CLOCK_VALUE	= 0x10,
+	SCPI_CMD_PSU_CAPABILITIES	= 0x11,
+	SCPI_CMD_GET_PSU_INFO		= 0x12,
+	SCPI_CMD_SET_PSU		= 0x13,
+	SCPI_CMD_GET_PSU		= 0x14,
+	SCPI_CMD_SENSOR_CAPABILITIES	= 0x15,
+	SCPI_CMD_SENSOR_INFO		= 0x16,
+	SCPI_CMD_SENSOR_VALUE		= 0x17,
+	SCPI_CMD_SENSOR_CFG_PERIODIC	= 0x18,
+	SCPI_CMD_SENSOR_CFG_BOUNDS	= 0x19,
+	SCPI_CMD_SENSOR_ASYNC_VALUE	= 0x1a,
+	SCPI_CMD_SET_DEVICE_PWR_STATE	= 0x1b,
+	SCPI_CMD_GET_DEVICE_PWR_STATE	= 0x1c,
+	SCPI_CMD_COUNT
+};
+
+struct scpi_xfer {
+	u32 slot; /* has to be first element */
+	u32 cmd;
+	u32 status;
+	const void *tx_buf;
+	void *rx_buf;
+	unsigned int tx_len;
+	struct list_head node;
+	struct completion done;
+};
+
+struct scpi_chan {
+	struct mbox_client cl;
+	struct mbox_chan *chan;
+	void __iomem *tx_payload;
+	void __iomem *rx_payload;
+	struct list_head rx_pending;
+	struct list_head xfers_list;
+	struct scpi_xfer *xfers;
+	spinlock_t rx_lock; /* locking for the rx pending list */
+	struct mutex xfers_lock;
+	atomic_t token;
+};
+
+struct scpi_drvinfo {
+	u32 protocol_version;
+	u32 firmware_version;
+	int num_chans;
+	atomic_t next_chan;
+	struct scpi_ops *scpi_ops;
+	struct scpi_chan *channels;
+	struct scpi_dvfs_info *dvfs[MAX_DVFS_DOMAINS];
+};
+
+/*
+ * The SCP firmware only executes in little-endian mode, so any buffers
+ * shared through SCPI should have their contents converted to little-endian
+ */
+struct scpi_shared_mem {
+	__le32 command;
+	__le32 status;
+	u8 payload[0];
+} __packed;
+
+struct scp_capabilities {
+	__le32 protocol_version;
+	__le32 event_version;
+	__le32 platform_version;
+	__le32 commands[4];
+} __packed;
+
+struct clk_get_info {
+	__le16 id;
+	__le16 flags;
+	__le32 min_rate;
+	__le32 max_rate;
+	u8 name[20];
+} __packed;
+
+struct clk_get_value {
+	__le32 rate;
+} __packed;
+
+struct clk_set_value {
+	__le16 id;
+	__le16 reserved;
+	__le32 rate;
+} __packed;
+
+struct dvfs_info {
+	__le32 header;
+	struct {
+		__le32 freq;
+		__le32 m_volt;
+	} opps[MAX_DVFS_OPPS];
+} __packed;
+
+struct dvfs_get {
+	u8 index;
+} __packed;
+
+struct dvfs_set {
+	u8 domain;
+	u8 index;
+} __packed;
+
+static struct scpi_drvinfo *scpi_info;
+
+static int scpi_linux_errmap[SCPI_ERR_MAX] = {
+	/* better than switch case as long as return value is continuous */
+	0, /* SCPI_SUCCESS */
+	-EINVAL, /* SCPI_ERR_PARAM */
+	-ENOEXEC, /* SCPI_ERR_ALIGN */
+	-EMSGSIZE, /* SCPI_ERR_SIZE */
+	-EINVAL, /* SCPI_ERR_HANDLER */
+	-EACCES, /* SCPI_ERR_ACCESS */
+	-ERANGE, /* SCPI_ERR_RANGE */
+	-ETIMEDOUT, /* SCPI_ERR_TIMEOUT */
+	-ENOMEM, /* SCPI_ERR_NOMEM */
+	-EINVAL, /* SCPI_ERR_PWRSTATE */
+	-EOPNOTSUPP, /* SCPI_ERR_SUPPORT */
+	-EIO, /* SCPI_ERR_DEVICE */
+	-EBUSY, /* SCPI_ERR_BUSY */
+};
+
+static inline int scpi_to_linux_errno(int errno)
+{
+	if (errno >= SCPI_SUCCESS && errno < SCPI_ERR_MAX)
+		return scpi_linux_errmap[errno];
+	return -EIO;
+}
+
+static void scpi_process_cmd(struct scpi_chan *ch, u32 cmd)
+{
+	unsigned long flags;
+	struct scpi_xfer *t, *match = NULL;
+
+	spin_lock_irqsave(&ch->rx_lock, flags);
+	if (list_empty(&ch->rx_pending)) {
+		spin_unlock_irqrestore(&ch->rx_lock, flags);
+		return;
+	}
+
+	list_for_each_entry(t, &ch->rx_pending, node)
+		if (CMD_XTRACT_UNIQ(t->cmd) == CMD_XTRACT_UNIQ(cmd)) {
+			list_del(&t->node);
+			match = t;
+			break;
+		}
+	/* check if wait_for_completion is in progress or timed-out */
+	if (match && !completion_done(&match->done)) {
+		struct scpi_shared_mem *mem = ch->rx_payload;
+
+		match->status = le32_to_cpu(mem->status);
+		memcpy_fromio(match->rx_buf, mem->payload, CMD_SIZE(cmd));
+		complete(&match->done);
+	}
+	spin_unlock_irqrestore(&ch->rx_lock, flags);
+}
+
+static void scpi_handle_remote_msg(struct mbox_client *c, void *msg)
+{
+	struct scpi_chan *ch = container_of(c, struct scpi_chan, cl);
+	struct scpi_shared_mem *mem = ch->rx_payload;
+	u32 cmd = le32_to_cpu(mem->command);
+
+	scpi_process_cmd(ch, cmd);
+}
+
+static void scpi_tx_prepare(struct mbox_client *c, void *msg)
+{
+	unsigned long flags;
+	struct scpi_xfer *t = msg;
+	struct scpi_chan *ch = container_of(c, struct scpi_chan, cl);
+	struct scpi_shared_mem *mem = (struct scpi_shared_mem *)ch->tx_payload;
+
+	mem->command = cpu_to_le32(t->cmd);
+	if (t->tx_buf)
+		memcpy_toio(mem->payload, t->tx_buf, t->tx_len);
+	if (t->rx_buf) {
+		spin_lock_irqsave(&ch->rx_lock, flags);
+		list_add_tail(&t->node, &ch->rx_pending);
+		spin_unlock_irqrestore(&ch->rx_lock, flags);
+	}
+}
+
+static struct scpi_xfer *get_scpi_xfer(struct scpi_chan *ch)
+{
+	struct scpi_xfer *t;
+
+	mutex_lock(&ch->xfers_lock);
+	if (list_empty(&ch->xfers_list)) {
+		mutex_unlock(&ch->xfers_lock);
+		return NULL;
+	}
+	t = list_first_entry(&ch->xfers_list, struct scpi_xfer, node);
+	list_del(&t->node);
+	mutex_unlock(&ch->xfers_lock);
+	return t;
+}
+
+static void put_scpi_xfer(struct scpi_xfer *t, struct scpi_chan *ch)
+{
+	mutex_lock(&ch->xfers_lock);
+	list_add_tail(&t->node, &ch->xfers_list);
+	mutex_unlock(&ch->xfers_lock);
+}
+
+static int
+scpi_send_message(u8 cmd, void *tx_buf, unsigned int len, void *rx_buf)
+{
+	int ret;
+	u8 token, chan;
+	struct scpi_xfer *msg;
+	struct scpi_chan *scpi_chan;
+
+	chan = atomic_inc_return(&scpi_info->next_chan) % scpi_info->num_chans;
+	scpi_chan = scpi_info->channels + chan;
+
+	msg = get_scpi_xfer(scpi_chan);
+	if (!msg)
+		return -ENOMEM;
+
+	token = atomic_inc_return(&scpi_chan->token) & CMD_TOKEN_ID_MASK;
+
+	msg->slot = BIT(SCPI_SLOT);
+	msg->cmd = PACK_SCPI_CMD(cmd, token, len);
+	msg->tx_buf = tx_buf;
+	msg->tx_len = len;
+	msg->rx_buf = rx_buf;
+	init_completion(&msg->done);
+
+	ret = mbox_send_message(scpi_chan->chan, msg);
+	if (ret < 0 || !rx_buf)
+		goto out;
+
+	if (!wait_for_completion_timeout(&msg->done, MAX_RX_TIMEOUT))
+		ret = -ETIMEDOUT;
+	else
+		/* first status word */
+		ret = le32_to_cpu(msg->status);
+out:
+	if (ret < 0 && rx_buf) /* remove entry from the list if timed-out */
+		scpi_process_cmd(scpi_chan, msg->cmd);
+
+	put_scpi_xfer(msg, scpi_chan);
+	/* SCPI error codes > 0, translate them to Linux scale*/
+	return ret > 0 ? scpi_to_linux_errno(ret) : ret;
+}
+
+static u32 scpi_get_version(void)
+{
+	return scpi_info->protocol_version;
+}
+
+static int
+scpi_clk_get_range(u16 clk_id, unsigned long *min, unsigned long *max)
+{
+	int ret;
+	struct clk_get_info clk;
+	__le16 le_clk_id = cpu_to_le16(clk_id);
+
+	ret = scpi_send_message(SCPI_CMD_GET_CLOCK_INFO,
+				&le_clk_id, sizeof(le_clk_id), &clk);
+	if (!ret) {
+		*min = le32_to_cpu(clk.min_rate);
+		*max = le32_to_cpu(clk.max_rate);
+	}
+	return ret;
+}
+
+static unsigned long scpi_clk_get_val(u16 clk_id)
+{
+	int ret;
+	struct clk_get_value clk;
+	__le16 le_clk_id = cpu_to_le16(clk_id);
+
+	ret = scpi_send_message(SCPI_CMD_GET_CLOCK_VALUE,
+				&le_clk_id, sizeof(le_clk_id), &clk);
+	return ret ? ret : le32_to_cpu(clk.rate);
+}
+
+static int scpi_clk_set_val(u16 clk_id, unsigned long rate)
+{
+	int stat;
+	struct clk_set_value clk = {
+		cpu_to_le16(clk_id), 0, cpu_to_le32(rate)
+	};
+
+	return scpi_send_message(SCPI_CMD_SET_CLOCK_VALUE,
+				 &clk, sizeof(clk), &stat);
+}
+
+static int scpi_dvfs_get_idx(u8 domain)
+{
+	int ret;
+	struct dvfs_get dvfs;
+
+	ret = scpi_send_message(SCPI_CMD_GET_DVFS,
+				&domain, sizeof(domain), &dvfs);
+	return ret ? ret : dvfs.index;
+}
+
+static int scpi_dvfs_set_idx(u8 domain, u8 index)
+{
+	int stat;
+	struct dvfs_set dvfs = {domain, index};
+
+	return scpi_send_message(SCPI_CMD_SET_DVFS,
+				 &dvfs, sizeof(dvfs), &stat);
+}
+
+static struct scpi_dvfs_info *scpi_dvfs_get_info(u8 domain)
+{
+	struct scpi_dvfs_info *info;
+	struct scpi_opp *opp;
+	struct dvfs_info buf;
+	int ret, i;
+
+	if (domain >= MAX_DVFS_DOMAINS)
+		return ERR_PTR(-EINVAL);
+
+	if (scpi_info->dvfs[domain])	/* data already populated */
+		return scpi_info->dvfs[domain];
+
+	ret = scpi_send_message(SCPI_CMD_GET_DVFS_INFO, &domain,
+				sizeof(domain), &buf);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	info = kmalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	info->count = DVFS_OPP_COUNT(buf.header);
+	info->latency = DVFS_LATENCY(buf.header) * 1000; /* uS to nS */
+
+	info->opps = kcalloc(info->count, sizeof(*opp), GFP_KERNEL);
+	if (!info->opps) {
+		kfree(info);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	for (i = 0, opp = info->opps; i < info->count; i++, opp++) {
+		opp->freq = le32_to_cpu(buf.opps[i].freq);
+		opp->m_volt = le32_to_cpu(buf.opps[i].m_volt);
+	}
+
+	scpi_info->dvfs[domain] = info;
+	return info;
+}
+
+static struct scpi_ops scpi_ops = {
+	.get_version = scpi_get_version,
+	.clk_get_range = scpi_clk_get_range,
+	.clk_get_val = scpi_clk_get_val,
+	.clk_set_val = scpi_clk_set_val,
+	.dvfs_get_idx = scpi_dvfs_get_idx,
+	.dvfs_set_idx = scpi_dvfs_set_idx,
+	.dvfs_get_info = scpi_dvfs_get_info,
+};
+
+struct scpi_ops *get_scpi_ops(void)
+{
+	return scpi_info ? scpi_info->scpi_ops : NULL;
+}
+EXPORT_SYMBOL_GPL(get_scpi_ops);
+
+static int scpi_init_versions(struct scpi_drvinfo *info)
+{
+	int ret;
+	struct scp_capabilities caps;
+
+	ret = scpi_send_message(SCPI_CMD_SCPI_CAPABILITIES, NULL, 0, &caps);
+	if (!ret) {
+		info->protocol_version = le32_to_cpu(caps.protocol_version);
+		info->firmware_version = le32_to_cpu(caps.platform_version);
+	}
+	return ret;
+}
+
+static ssize_t protocol_version_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct scpi_drvinfo *scpi_info = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d.%d\n",
+		       PROTOCOL_REV_MAJOR(scpi_info->protocol_version),
+		       PROTOCOL_REV_MINOR(scpi_info->protocol_version));
+}
+static DEVICE_ATTR_RO(protocol_version);
+
+static ssize_t firmware_version_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct scpi_drvinfo *scpi_info = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d.%d.%d\n",
+		       FW_REV_MAJOR(scpi_info->firmware_version),
+		       FW_REV_MINOR(scpi_info->firmware_version),
+		       FW_REV_PATCH(scpi_info->firmware_version));
+}
+static DEVICE_ATTR_RO(firmware_version);
+
+static struct attribute *versions_attrs[] = {
+	&dev_attr_firmware_version.attr,
+	&dev_attr_protocol_version.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(versions);
+
+static void
+scpi_free_channels(struct device *dev, struct scpi_chan *pchan, int count)
+{
+	int i;
+
+	for (i = 0; i < count && pchan->chan; i++, pchan++) {
+		mbox_free_channel(pchan->chan);
+		devm_kfree(dev, pchan->xfers);
+		devm_iounmap(dev, pchan->rx_payload);
+	}
+}
+
+static int scpi_remove(struct platform_device *pdev)
+{
+	int i;
+	struct device *dev = &pdev->dev;
+	struct scpi_drvinfo *info = platform_get_drvdata(pdev);
+
+	scpi_info = NULL; /* stop exporting SCPI ops through get_scpi_ops */
+
+	of_platform_depopulate(dev);
+	sysfs_remove_groups(&dev->kobj, versions_groups);
+	scpi_free_channels(dev, info->channels, info->num_chans);
+	platform_set_drvdata(pdev, NULL);
+
+	for (i = 0; i < MAX_DVFS_DOMAINS && info->dvfs[i]; i++) {
+		kfree(info->dvfs[i]->opps);
+		kfree(info->dvfs[i]);
+	}
+	devm_kfree(dev, info->channels);
+	devm_kfree(dev, info);
+
+	return 0;
+}
+
+#define MAX_SCPI_XFERS		10
+static int scpi_alloc_xfer_list(struct device *dev, struct scpi_chan *ch)
+{
+	int i;
+	struct scpi_xfer *xfers;
+
+	xfers = devm_kzalloc(dev, MAX_SCPI_XFERS * sizeof(*xfers), GFP_KERNEL);
+	if (!xfers)
+		return -ENOMEM;
+
+	ch->xfers = xfers;
+	for (i = 0; i < MAX_SCPI_XFERS; i++, xfers++)
+		list_add_tail(&xfers->node, &ch->xfers_list);
+	return 0;
+}
+
+static int scpi_probe(struct platform_device *pdev)
+{
+	int count, idx, ret;
+	struct resource res;
+	struct scpi_chan *scpi_chan;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+
+	scpi_info = devm_kzalloc(dev, sizeof(*scpi_info), GFP_KERNEL);
+	if (!scpi_info) {
+		dev_err(dev, "failed to allocate memory for scpi drvinfo\n");
+		return -ENOMEM;
+	}
+
+	count = of_count_phandle_with_args(np, "mboxes", "#mbox-cells");
+	if (count < 0) {
+		dev_err(dev, "no mboxes property in '%s'\n", np->full_name);
+		return -ENODEV;
+	}
+
+	scpi_chan = devm_kcalloc(dev, count, sizeof(*scpi_chan), GFP_KERNEL);
+	if (!scpi_chan) {
+		dev_err(dev, "failed to allocate memory scpi chaninfo\n");
+		return -ENOMEM;
+	}
+
+	for (idx = 0; idx < count; idx++) {
+		resource_size_t size;
+		struct scpi_chan *pchan = scpi_chan + idx;
+		struct mbox_client *cl = &pchan->cl;
+		struct device_node *shmem = of_parse_phandle(np, "shmem", idx);
+
+		if (of_address_to_resource(shmem, 0, &res)) {
+			dev_err(dev, "failed to get SCPI payload mem resource\n");
+			ret = -EINVAL;
+			goto err;
+		}
+
+		size = resource_size(&res);
+		pchan->rx_payload = devm_ioremap(dev, res.start, size);
+		if (!pchan->rx_payload) {
+			dev_err(dev, "failed to ioremap SCPI payload\n");
+			ret = -EADDRNOTAVAIL;
+			goto err;
+		}
+		pchan->tx_payload = pchan->rx_payload + (size >> 1);
+
+		cl->dev = dev;
+		cl->rx_callback = scpi_handle_remote_msg;
+		cl->tx_prepare = scpi_tx_prepare;
+		cl->tx_block = true;
+		cl->tx_tout = 50;
+		cl->knows_txdone = false; /* controller can ack */
+
+		INIT_LIST_HEAD(&pchan->rx_pending);
+		INIT_LIST_HEAD(&pchan->xfers_list);
+		spin_lock_init(&pchan->rx_lock);
+		mutex_init(&pchan->xfers_lock);
+
+		ret = scpi_alloc_xfer_list(dev, pchan);
+		if (!ret) {
+			pchan->chan = mbox_request_channel(cl, idx);
+			if (!IS_ERR(pchan->chan))
+				continue;
+			ret = -EPROBE_DEFER;
+			dev_err(dev, "failed to acquire channel#%d\n", idx);
+		}
+err:
+		scpi_free_channels(dev, scpi_chan, idx);
+		scpi_info = NULL;
+		return ret;
+	}
+
+	scpi_info->channels = scpi_chan;
+	scpi_info->num_chans = count;
+	platform_set_drvdata(pdev, scpi_info);
+
+	ret = scpi_init_versions(scpi_info);
+	if (ret) {
+		dev_err(dev, "incorrect or no SCP firmware found\n");
+		scpi_remove(pdev);
+		return ret;
+	}
+
+	_dev_info(dev, "SCP Protocol %d.%d Firmware %d.%d.%d version\n",
+		  PROTOCOL_REV_MAJOR(scpi_info->protocol_version),
+		  PROTOCOL_REV_MINOR(scpi_info->protocol_version),
+		  FW_REV_MAJOR(scpi_info->firmware_version),
+		  FW_REV_MINOR(scpi_info->firmware_version),
+		  FW_REV_PATCH(scpi_info->firmware_version));
+	scpi_info->scpi_ops = &scpi_ops;
+
+	ret = sysfs_create_groups(&dev->kobj, versions_groups);
+	if (ret)
+		dev_err(dev, "unable to create sysfs version group\n");
+
+	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+}
+
+static const struct of_device_id scpi_of_match[] = {
+	{.compatible = "arm,scpi"},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, scpi_of_match);
+
+static struct platform_driver scpi_driver = {
+	.driver = {
+		.name = "scpi_protocol",
+		.of_match_table = scpi_of_match,
+	},
+	.probe = scpi_probe,
+	.remove = scpi_remove,
+};
+module_platform_driver(scpi_driver);
+
+MODULE_AUTHOR("Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>");
+MODULE_DESCRIPTION("ARM SCPI mailbox protocol driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/scpi_protocol.h b/include/linux/scpi_protocol.h
new file mode 100644
index 000000000000..a33fb2937230
--- /dev/null
+++ b/include/linux/scpi_protocol.h
@@ -0,0 +1,57 @@
+/*
+ * SCPI Message Protocol driver header
+ *
+ * Copyright (C) 2014 ARM Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+#include <linux/types.h>
+
+struct scpi_opp {
+	u32 freq;
+	u32 m_volt;
+} __packed;
+
+struct scpi_dvfs_info {
+	unsigned int count;
+	unsigned int latency; /* in nanoseconds */
+	struct scpi_opp *opps;
+};
+
+/**
+ * struct scpi_ops - represents the various operations provided
+ *	by SCP through SCPI message protocol
+ * @get_version: returns the major and minor revision on the SCPI
+ *	message protocol
+ * @clk_get_range: gets clock range limit(min - max in Hz)
+ * @clk_get_val: gets clock value(in Hz)
+ * @clk_set_val: sets the clock value, setting to 0 will disable the
+ *	clock (if supported)
+ * @dvfs_get_idx: gets the Operating Point of the given power domain.
+ *	OPP is an index to the list return by @dvfs_get_info
+ * @dvfs_set_idx: sets the Operating Point of the given power domain.
+ *	OPP is an index to the list return by @dvfs_get_info
+ * @dvfs_get_info: returns the DVFS capabilities of the given power
+ *	domain. It includes the OPP list and the latency information
+ */
+struct scpi_ops {
+	u32 (*get_version)(void);
+	int (*clk_get_range)(u16, unsigned long *, unsigned long *);
+	unsigned long (*clk_get_val)(u16);
+	int (*clk_set_val)(u16, unsigned long);
+	int (*dvfs_get_idx)(u8);
+	int (*dvfs_set_idx)(u8, u8);
+	struct scpi_dvfs_info *(*dvfs_get_info)(u8);
+};
+
+struct scpi_ops *get_scpi_ops(void);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

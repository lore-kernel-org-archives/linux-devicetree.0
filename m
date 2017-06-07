From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [RFC PATCH 6/8] firmware: arm_scmi: add initial support for power protocol
Date: Wed,  7 Jun 2017 17:10:10 +0100
Message-ID: <1496851812-19623-7-git-send-email-sudeep.holla@arm.com>
References: <1496851812-19623-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496851812-19623-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Roy Franz <roy.franz@cavium.com>, Harb Abdulhamid <harba@codeaurora.org>, Nishanth Menon <nm@ti.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

The power protocol is intended for management of power states of various
power domains. The power domain management protocol provides commands to
describe the protocol version, discover the implementation specific
attributes, set and get the power state of a domain.

This patch adds support for the above mention features of the protocol.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/Makefile |   2 +-
 drivers/firmware/arm_scmi/power.c  | 237 +++++++++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h      |  17 +++
 3 files changed, 255 insertions(+), 1 deletion(-)
 create mode 100644 drivers/firmware/arm_scmi/power.c

diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index 6836b1f38f7f..52ecc08556a2 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -1,2 +1,2 @@
 obj-$(CONFIG_ARM_SCMI_PROTOCOL)	= arm_scmi.o
-arm_scmi-y = base.o clock.o driver.o perf.o
+arm_scmi-y = base.o clock.o driver.o perf.o power.o
diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
new file mode 100644
index 000000000000..37d5abfb9d87
--- /dev/null
+++ b/drivers/firmware/arm_scmi/power.c
@@ -0,0 +1,237 @@
+/*
+ * System Control and Management Interface (SCMI) Power Protocol
+ *
+ * Copyright (C) 2017 ARM Ltd.
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
+#include "common.h"
+
+enum scmi_power_protocol_cmd {
+	POWER_DOMAIN_ATTRIBUTES = 0x3,
+	POWER_STATE_SET = 0x4,
+	POWER_STATE_GET = 0x5,
+	POWER_STATE_NOTIFY = 0x6,
+};
+
+struct scmi_msg_resp_power_attributes {
+	__le16 num_domains;
+	__le16 reserved;
+	__le32 stats_addr_low;
+	__le32 stats_addr_high;
+	__le32 stats_size;
+} __packed;
+
+struct scmi_msg_resp_power_domain_attributes {
+	__le32 flags;
+#define SUPPORTS_STATE_SET_NOTIFY(x)	((x) & BIT(31))
+#define SUPPORTS_STATE_SET_ASYNC(x)	((x) & BIT(30))
+#define SUPPORTS_STATE_SET_SYNC(x)	((x) & BIT(29))
+	    u8 name[SCMI_MAX_STR_SIZE];
+} __packed;
+
+struct scmi_power_set_state {
+	__le32 flags;
+#define STATE_SET_ASYNC		BIT(0)
+	__le32 domain;
+	__le32 state;
+#define STATE_TYPE_SHIFT	30
+#define STATE_ID_MASK		(BIT(28) - 1)
+#define POWER_STATE_PARAM(type, id) \
+	((((type) & BIT(0)) << STATE_TYPE_SHIFT) | ((id) & STATE_ID_MASK))
+} __packed;
+
+struct scmi_power_state_notify {
+	__le32 domain;
+	__le32 notify_enable;
+} __packed;
+
+struct power_dom_info {
+	bool state_set_sync;
+	bool state_set_async;
+	bool state_set_notify;
+	char name[SCMI_MAX_STR_SIZE];
+};
+
+struct scmi_power_info {
+	int num_domains;
+	u64 stats_addr;
+	u32 stats_size;
+	struct power_dom_info *dom_info;
+};
+
+static struct scmi_power_info power_info;
+
+static int scmi_power_attributes_get(struct scmi_handle *handle,
+				     struct scmi_power_info *power_info)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_resp_power_attributes *attr;
+
+	ret = scmi_one_xfer_init(handle, PROTOCOL_ATTRIBUTES,
+				 SCMI_PROTOCOL_POWER, 0, sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = (struct scmi_msg_resp_power_attributes *)t->rx.buf;
+
+	ret = scmi_do_xfer(handle, t);
+	if (!ret) {
+		power_info->num_domains = le16_to_cpu(attr->num_domains);
+		power_info->stats_addr = le32_to_cpu(attr->stats_addr_low) |
+				(u64)le32_to_cpu(attr->stats_addr_high) << 32;
+		power_info->stats_size = le32_to_cpu(attr->stats_size);
+	}
+
+	scmi_put_one_xfer(handle, t);
+	return ret;
+}
+
+static int
+scmi_power_domain_attributes_get(struct scmi_handle *handle, u32 domain,
+				 struct power_dom_info *dom_info)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_resp_power_domain_attributes *attr;
+
+	ret = scmi_one_xfer_init(handle, POWER_DOMAIN_ATTRIBUTES,
+				 SCMI_PROTOCOL_POWER, sizeof(domain),
+				 sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	*(__le32 *)t->tx.buf = cpu_to_le32(domain);
+	attr = (struct scmi_msg_resp_power_domain_attributes *)t->rx.buf;
+
+	ret = scmi_do_xfer(handle, t);
+	if (!ret) {
+		u32 flags = le32_to_cpu(attr->flags);
+
+		dom_info->state_set_notify = SUPPORTS_STATE_SET_NOTIFY(flags);
+		dom_info->state_set_async = SUPPORTS_STATE_SET_ASYNC(flags);
+		dom_info->state_set_sync = SUPPORTS_STATE_SET_SYNC(flags);
+		memcpy(dom_info->name, attr->name, SCMI_MAX_STR_SIZE);
+	}
+
+	scmi_put_one_xfer(handle, t);
+	return ret;
+}
+
+static int
+scmi_power_state_set(struct scmi_handle *handle, u32 domain, u32 state)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_power_set_state *st;
+
+	ret = scmi_one_xfer_init(handle, POWER_STATE_SET, SCMI_PROTOCOL_POWER,
+				 sizeof(*st), 0, &t);
+	if (ret)
+		return ret;
+
+	st = (struct scmi_power_set_state *)t->tx.buf;
+	st->flags = cpu_to_le32(0);
+	st->domain = cpu_to_le32(domain);
+	st->state = cpu_to_le32(state);
+
+	ret = scmi_do_xfer(handle, t);
+
+	scmi_put_one_xfer(handle, t);
+	return ret;
+}
+
+static int
+scmi_power_state_get(struct scmi_handle *handle, u32 domain, u32 *state)
+{
+	int ret;
+	struct scmi_xfer *t;
+
+	ret = scmi_one_xfer_init(handle, POWER_STATE_GET, SCMI_PROTOCOL_POWER,
+				 sizeof(u32), sizeof(u32), &t);
+	if (ret)
+		return ret;
+
+	*(__le32 *)t->tx.buf = cpu_to_le32(domain);
+
+	ret = scmi_do_xfer(handle, t);
+	if (!ret)
+		*state = le32_to_cpu(*(__le32 *)t->rx.buf);
+
+	scmi_put_one_xfer(handle, t);
+	return ret;
+}
+
+static int scmi_power_state_notify_enable(struct scmi_handle *handle,
+					  u32 domain, bool enable)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_power_state_notify *notify;
+
+	ret = scmi_one_xfer_init(handle, POWER_STATE_NOTIFY,
+				 SCMI_PROTOCOL_POWER, sizeof(*notify), 0, &t);
+	if (ret)
+		return ret;
+
+	notify = (struct scmi_power_state_notify *)t->tx.buf;
+	notify->domain = cpu_to_le32(domain);
+	notify->notify_enable = cpu_to_le32(enable & BIT(0));
+
+	ret = scmi_do_xfer(handle, t);
+
+	scmi_put_one_xfer(handle, t);
+	return ret;
+}
+
+static struct scmi_power_ops power_ops = {
+	.state_set = scmi_power_state_set,
+	.state_get = scmi_power_state_get,
+	.state_notify_enable = scmi_power_state_notify_enable,
+};
+
+int scmi_power_protocol_init(struct scmi_handle *handle)
+{
+	u32 version;
+	int domain;
+
+	if (!scmi_is_protocol_implemented(handle, SCMI_PROTOCOL_POWER)) {
+		dev_err(handle->dev, "SCMI Power protocol not implemented\n");
+		return -EPROTONOSUPPORT;
+	}
+
+	scmi_version_get(handle, SCMI_PROTOCOL_POWER, &version);
+
+	dev_dbg(handle->dev, "Power Version %d.%d\n",
+		PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	scmi_power_attributes_get(handle, &power_info);
+
+	power_info.dom_info = devm_kcalloc(handle->dev, power_info.num_domains,
+					     sizeof(struct power_dom_info),
+					     GFP_KERNEL);
+	if (!power_info.dom_info)
+		return -ENOMEM;
+
+	for (domain = 0; domain < power_info.num_domains; domain++) {
+		struct power_dom_info *dom = power_info.dom_info + domain;
+
+		scmi_power_domain_attributes_get(handle, domain, dom);
+	}
+
+	handle->power_ops = &power_ops;
+
+	return 0;
+}
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 75ba10441f54..50a5816a295d 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -84,16 +84,33 @@ struct scmi_perf_ops {
 };
 
 /**
+ * struct scmi_power_ops - represents the various operations provided
+ *	by SCMI Power Protocol
+ *
+ * @state_set: sets the power state of a power domain
+ * @state_get: gets the power state of a power domain
+ * @state_notify_enable: request notifications from the platform for
+ *	state changes in a specific power domain
+ */
+struct scmi_power_ops {
+	int (*state_set)(struct scmi_handle *, u32, u32);
+	int (*state_get)(struct scmi_handle *, u32, u32 *);
+	int (*state_notify_enable)(struct scmi_handle *, u32, bool);
+};
+
+/**
  * struct scmi_handle - Handle returned to ARM SCMI clients for usage.
  *
  * @dev: pointer to the SCMI device
  * @version: pointer to the structure containing SCMI version information
+ * @power_ops: pointer to set of power protocol operations
  * @perf_ops: pointer to set of performance protocol operations
  * @clk_ops: pointer to set of clock protocol operations
  */
 struct scmi_handle {
 	struct device *dev;
 	struct scmi_revision_info *version;
+	struct scmi_power_ops *power_ops;
 	struct scmi_perf_ops *perf_ops;
 	struct scmi_clk_ops *clk_ops;
 };
-- 
2.7.4

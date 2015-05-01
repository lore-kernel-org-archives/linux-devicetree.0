From: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC v1 14/14] nfc: st-nci: Rename st21nfcb to st-nci to support ST NCI NFC controllers
Date: Fri,  1 May 2015 22:19:37 +0200
Message-ID: <1430511577-19678-15-git-send-email-christophe-h.ricard@st.com>
References: <1430511577-19678-1-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430511577-19678-1-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

STMicroelectronics NFC NCI chips family is extending with the new ST21N=
=46CC
using the AMS AS39230 RF booster.
The st21nfcb driver is relevant for this solution and might be with
future products.

Signed-off-by: Christophe Ricard <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/net/nfc/st-nci.txt         |  33 +
 .../devicetree/bindings/net/nfc/st21nfcb.txt       |  33 -
 drivers/nfc/Kconfig                                |   2 +-
 drivers/nfc/Makefile                               |   2 +-
 drivers/nfc/st-nci/Kconfig                         |  23 +
 drivers/nfc/st-nci/Makefile                        |   9 +
 drivers/nfc/st-nci/core.c                          | 245 +++++++
 drivers/nfc/st-nci/i2c.c                           | 385 +++++++++++
 drivers/nfc/st-nci/ndlc.c                          | 307 +++++++++
 drivers/nfc/st-nci/ndlc.h                          |  60 ++
 drivers/nfc/st-nci/st-nci.h                        |  39 ++
 drivers/nfc/st-nci/st-nci_se.c                     | 713 +++++++++++++=
++++++++
 drivers/nfc/st-nci/st-nci_se.h                     |  61 ++
 drivers/nfc/st21nfcb/Kconfig                       |  22 -
 drivers/nfc/st21nfcb/Makefile                      |   9 -
 drivers/nfc/st21nfcb/i2c.c                         | 384 -----------
 drivers/nfc/st21nfcb/ndlc.c                        | 307 ---------
 drivers/nfc/st21nfcb/ndlc.h                        |  60 --
 drivers/nfc/st21nfcb/st21nfcb.c                    | 245 -------
 drivers/nfc/st21nfcb/st21nfcb.h                    |  39 --
 drivers/nfc/st21nfcb/st21nfcb_se.c                 | 713 -------------=
--------
 drivers/nfc/st21nfcb/st21nfcb_se.h                 |  61 --
 include/linux/platform_data/st21nfcb.h             |  29 -
 include/linux/platform_data/st_nci.h               |  29 +
 24 files changed, 1906 insertions(+), 1904 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/st-nci.tx=
t
 delete mode 100644 Documentation/devicetree/bindings/net/nfc/st21nfcb.=
txt
 create mode 100644 drivers/nfc/st-nci/Kconfig
 create mode 100644 drivers/nfc/st-nci/Makefile
 create mode 100644 drivers/nfc/st-nci/core.c
 create mode 100644 drivers/nfc/st-nci/i2c.c
 create mode 100644 drivers/nfc/st-nci/ndlc.c
 create mode 100644 drivers/nfc/st-nci/ndlc.h
 create mode 100644 drivers/nfc/st-nci/st-nci.h
 create mode 100644 drivers/nfc/st-nci/st-nci_se.c
 create mode 100644 drivers/nfc/st-nci/st-nci_se.h
 delete mode 100644 drivers/nfc/st21nfcb/Kconfig
 delete mode 100644 drivers/nfc/st21nfcb/Makefile
 delete mode 100644 drivers/nfc/st21nfcb/i2c.c
 delete mode 100644 drivers/nfc/st21nfcb/ndlc.c
 delete mode 100644 drivers/nfc/st21nfcb/ndlc.h
 delete mode 100644 drivers/nfc/st21nfcb/st21nfcb.c
 delete mode 100644 drivers/nfc/st21nfcb/st21nfcb.h
 delete mode 100644 drivers/nfc/st21nfcb/st21nfcb_se.c
 delete mode 100644 drivers/nfc/st21nfcb/st21nfcb_se.h
 delete mode 100644 include/linux/platform_data/st21nfcb.h
 create mode 100644 include/linux/platform_data/st_nci.h

diff --git a/Documentation/devicetree/bindings/net/nfc/st-nci.txt b/Doc=
umentation/devicetree/bindings/net/nfc/st-nci.txt
new file mode 100644
index 0000000..d707588
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/nfc/st-nci.txt
@@ -0,0 +1,33 @@
+* STMicroelectronics SAS. ST NCI NFC Controller
+
+Required properties:
+- compatible: Should be "st,st21nfcb-i2c" or "st,st21nfcc-i2c".
+- clock-frequency: I=C2=B2C work frequency.
+- reg: address on the bus
+- interrupt-parent: phandle for the interrupt gpio controller
+- interrupts: GPIO interrupt to which the chip is connected
+- reset-gpios: Output GPIO pin used to reset the ST21NFCB
+
+Optional SoC Specific Properties:
+- pinctrl-names: Contains only one value - "default".
+- pintctrl-0: Specifies the pin control groups used for this controlle=
r.
+
+Example (for ARM-based BeagleBoard xM with ST21NFCB on I2C2):
+
+&i2c2 {
+
+	status =3D "okay";
+
+	st21nfcb: st21nfcb@8 {
+
+		compatible =3D "st,st21nfcb-i2c";
+
+		reg =3D <0x08>;
+		clock-frequency =3D <400000>;
+
+		interrupt-parent =3D <&gpio5>;
+		interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
+
+		reset-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
+	};
+};
diff --git a/Documentation/devicetree/bindings/net/nfc/st21nfcb.txt b/D=
ocumentation/devicetree/bindings/net/nfc/st21nfcb.txt
deleted file mode 100644
index bb23707..0000000
--- a/Documentation/devicetree/bindings/net/nfc/st21nfcb.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* STMicroelectronics SAS. ST21NFCB NFC Controller
-
-Required properties:
-- compatible: Should be "st,st21nfcb-i2c".
-- clock-frequency: I=C2=B2C work frequency.
-- reg: address on the bus
-- interrupt-parent: phandle for the interrupt gpio controller
-- interrupts: GPIO interrupt to which the chip is connected
-- reset-gpios: Output GPIO pin used to reset the ST21NFCB
-
-Optional SoC Specific Properties:
-- pinctrl-names: Contains only one value - "default".
-- pintctrl-0: Specifies the pin control groups used for this controlle=
r.
-
-Example (for ARM-based BeagleBoard xM with ST21NFCB on I2C2):
-
-&i2c2 {
-
-	status =3D "okay";
-
-	st21nfcb: st21nfcb@8 {
-
-		compatible =3D "st,st21nfcb-i2c";
-
-		reg =3D <0x08>;
-		clock-frequency =3D <400000>;
-
-		interrupt-parent =3D <&gpio5>;
-		interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>;
-
-		reset-gpios =3D <&gpio5 29 GPIO_ACTIVE_HIGH>;
-	};
-};
diff --git a/drivers/nfc/Kconfig b/drivers/nfc/Kconfig
index 107714e..722673c 100644
--- a/drivers/nfc/Kconfig
+++ b/drivers/nfc/Kconfig
@@ -72,6 +72,6 @@ source "drivers/nfc/pn544/Kconfig"
 source "drivers/nfc/microread/Kconfig"
 source "drivers/nfc/nfcmrvl/Kconfig"
 source "drivers/nfc/st21nfca/Kconfig"
-source "drivers/nfc/st21nfcb/Kconfig"
+source "drivers/nfc/st-nci/Kconfig"
 source "drivers/nfc/nxp-nci/Kconfig"
 endmenu
diff --git a/drivers/nfc/Makefile b/drivers/nfc/Makefile
index a4292d79..f53bdf2 100644
--- a/drivers/nfc/Makefile
+++ b/drivers/nfc/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_NFC_PORT100)	+=3D port100.o
 obj-$(CONFIG_NFC_MRVL)		+=3D nfcmrvl/
 obj-$(CONFIG_NFC_TRF7970A)	+=3D trf7970a.o
 obj-$(CONFIG_NFC_ST21NFCA)  	+=3D st21nfca/
-obj-$(CONFIG_NFC_ST21NFCB)	+=3D st21nfcb/
+obj-$(CONFIG_NFC_ST_NCI)	+=3D st-nci/
 obj-$(CONFIG_NFC_NXP_NCI)	+=3D nxp-nci/
=20
 ccflags-$(CONFIG_NFC_DEBUG) :=3D -DDEBUG
diff --git a/drivers/nfc/st-nci/Kconfig b/drivers/nfc/st-nci/Kconfig
new file mode 100644
index 0000000..fc3904c
--- /dev/null
+++ b/drivers/nfc/st-nci/Kconfig
@@ -0,0 +1,23 @@
+config NFC_ST_NCI
+	tristate "STMicroelectronics ST NCI NFC driver"
+	depends on NFC_NCI
+	default n
+	---help---
+	  STMicroelectronics NFC NCI chips core driver. It implements the chi=
pset
+	  NCI logic and hooks into the NFC kernel APIs. Physical layers will
+	  register against it.
+
+	  To compile this driver as a module, choose m here. The module will
+	  be called st-nci.
+	  Say N if unsure.
+
+config NFC_ST_NCI_I2C
+	tristate "NFC ST NCI i2c support"
+	depends on NFC_ST_NCI && I2C
+	---help---
+	  This module adds support for an I2C interface to the
+	  STMicroelectronics NFC NCI chips familly.
+	  Select this if your platform is using the i2c bus.
+
+	  If you choose to build a module, it'll be called st-nci_i2c.
+	  Say N if unsure.
diff --git a/drivers/nfc/st-nci/Makefile b/drivers/nfc/st-nci/Makefile
new file mode 100644
index 0000000..0df157d
--- /dev/null
+++ b/drivers/nfc/st-nci/Makefile
@@ -0,0 +1,9 @@
+#
+# Makefile for ST21NFCB NCI based NFC driver
+#
+
+st-nci-objs =3D ndlc.o core.o st-nci_se.o
+obj-$(CONFIG_NFC_ST_NCI)     +=3D st-nci.o
+
+st-nci_i2c-objs =3D i2c.o
+obj-$(CONFIG_NFC_ST_NCI_I2C) +=3D st-nci_i2c.o
diff --git a/drivers/nfc/st-nci/core.c b/drivers/nfc/st-nci/core.c
new file mode 100644
index 0000000..d353a63
--- /dev/null
+++ b/drivers/nfc/st-nci/core.c
@@ -0,0 +1,245 @@
+/*
+ * NCI based Driver for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014-2015 STMicroelectronics SAS. All rights reserved=
=2E
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
+ */
+
+#include <linux/module.h>
+#include <linux/nfc.h>
+#include <net/nfc/nci.h>
+#include <net/nfc/nci_core.h>
+#include <linux/gpio.h>
+#include <linux/delay.h>
+
+#include "st-nci.h"
+#include "st-nci_se.h"
+
+#define DRIVER_DESC "NCI NFC driver for ST_NCI"
+
+#define ST_NCI1_X_PROPRIETARY_ISO15693 0x83
+#define ST_NCI_SET_NFC_MODE		0x02
+
+#define NCI_OP_PROP_CMD nci_opcode_pack(NCI_GID_PROPRIETARY, 0x01)
+#define NCI_OP_PROP_RSP nci_opcode_pack(NCI_GID_PROPRIETARY, 0x01)
+
+struct nci_mode_set_cmd {
+	u8 cmd_type;
+	u8 mode;
+} __packed;
+
+struct nci_mode_set_rsp {
+	u8 status;
+} __packed;
+
+static int st_nci_prop_request(struct nci_dev *ndev,
+				     void (*req)(struct nci_dev *ndev,
+						 unsigned long opt),
+				     unsigned long opt, __u32 timeout)
+{
+	int r =3D 0;
+	long completion_r;
+
+	ndev->req_status =3D NCI_REQ_PEND;
+
+	reinit_completion(&ndev->req_completion);
+	req(ndev, opt);
+	completion_r =3D
+		wait_for_completion_interruptible_timeout(&ndev->req_completion,
+							  timeout);
+
+	pr_debug("wait_for_completion return %ld\n", completion_r);
+
+	if (completion_r > 0) {
+		switch (ndev->req_status) {
+		case NCI_REQ_DONE:
+			r =3D nci_to_errno(ndev->req_result);
+			break;
+
+		case NCI_REQ_CANCELED:
+			r =3D -ndev->req_result;
+			break;
+
+		default:
+			r =3D -ETIMEDOUT;
+			break;
+		}
+	} else {
+		pr_err("wait_for_completion_interruptible_timeout failed %ld\n",
+		       completion_r);
+
+		r =3D ((completion_r =3D=3D 0) ? (-ETIMEDOUT) : (completion_r));
+	}
+
+	ndev->req_status =3D ndev->req_result =3D 0;
+	return r;
+}
+
+static void st_nci_set_mode_req(struct nci_dev *ndev, unsigned long op=
t)
+{
+	struct nci_mode_set_cmd cmd;
+	__u8 mode =3D opt;
+
+	cmd.cmd_type  =3D ST_NCI_SET_NFC_MODE;
+	cmd.mode =3D mode;
+
+	nci_send_cmd(ndev, NCI_OP_PROP_CMD,
+		     sizeof(struct nci_mode_set_cmd), &cmd);
+}
+
+int st_nci_set_mode(struct nci_dev *ndev, u8 mode)
+{
+	atomic_set(&ndev->cmd_cnt, 1);
+	set_bit(NCI_INIT, &ndev->flags);
+	return st_nci_prop_request(ndev, st_nci_set_mode_req,
+				mode, msecs_to_jiffies(NCI_CMD_TIMEOUT));
+}
+
+static int st_nci_open(struct nci_dev *ndev)
+{
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+	int r;
+
+	if (test_and_set_bit(ST_NCI_RUNNING, &info->flags))
+		return 0;
+
+	r =3D ndlc_open(info->ndlc);
+	if (r)
+		clear_bit(ST_NCI_RUNNING, &info->flags);
+
+	return r;
+}
+
+static int st_nci_close(struct nci_dev *ndev)
+{
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+
+	if (!test_bit(ST_NCI_RUNNING, &info->flags))
+		return 0;
+
+	ndlc_close(info->ndlc);
+
+	clear_bit(ST_NCI_RUNNING, &info->flags);
+
+	return 0;
+}
+
+static int st_nci_send(struct nci_dev *ndev, struct sk_buff *skb)
+{
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+
+	skb->dev =3D (void *)ndev;
+
+	if (!test_bit(ST_NCI_RUNNING, &info->flags))
+		return -EBUSY;
+
+	return ndlc_send(info->ndlc, skb);
+}
+
+static __u32 st_nci_get_rfprotocol(struct nci_dev *ndev,
+					 __u8 rf_protocol)
+{
+	return rf_protocol =3D=3D ST_NCI1_X_PROPRIETARY_ISO15693 ?
+		NFC_PROTO_ISO15693_MASK : 0;
+}
+
+static void nci_core_prop_rsp_packet(struct nci_dev *ndev,
+				     struct sk_buff *skb)
+{
+	__u8 status =3D skb->data[0];
+
+	nci_req_complete(ndev, status);
+}
+
+static int st_nci_rsp_packet(struct nci_dev *ndev, __u16 rsp_opcode,
+				   struct sk_buff *skb)
+{
+	switch (rsp_opcode) {
+	case NCI_OP_PROP_RSP:
+		nci_core_prop_rsp_packet(ndev, skb);
+		return 0;
+	default:
+		return -EPROTO;
+	}
+}
+
+static struct nci_ops st_nci_ops =3D {
+	.open =3D st_nci_open,
+	.close =3D st_nci_close,
+	.send =3D st_nci_send,
+	.get_rfprotocol =3D st_nci_get_rfprotocol,
+	.discover_se =3D st_nci_discover_se,
+	.enable_se =3D st_nci_enable_se,
+	.disable_se =3D st_nci_disable_se,
+	.se_io =3D st_nci_se_io,
+	.hci_load_session =3D st_nci_hci_load_session,
+	.hci_event_received =3D st_nci_hci_event_received,
+	.hci_cmd_received =3D st_nci_hci_cmd_received,
+	.prop_rsp_packet =3D st_nci_rsp_packet,
+};
+
+int st_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
+		       int phy_tailroom)
+{
+	struct st_nci_info *info;
+	int r;
+	u32 protocols;
+
+	info =3D devm_kzalloc(ndlc->dev,
+			sizeof(struct st_nci_info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	protocols =3D NFC_PROTO_JEWEL_MASK
+		| NFC_PROTO_MIFARE_MASK
+		| NFC_PROTO_FELICA_MASK
+		| NFC_PROTO_ISO14443_MASK
+		| NFC_PROTO_ISO14443_B_MASK
+		| NFC_PROTO_ISO15693_MASK
+		| NFC_PROTO_NFC_DEP_MASK;
+
+	ndlc->ndev =3D nci_allocate_device(&st_nci_ops, protocols,
+					phy_headroom, phy_tailroom);
+	if (!ndlc->ndev) {
+		pr_err("Cannot allocate nfc ndev\n");
+		return -ENOMEM;
+	}
+	info->ndlc =3D ndlc;
+
+	nci_set_drvdata(ndlc->ndev, info);
+
+	r =3D nci_register_device(ndlc->ndev);
+	if (r) {
+		pr_err("Cannot register nfc device to nci core\n");
+		nci_free_device(ndlc->ndev);
+		return r;
+	}
+
+	return st_nci_se_init(ndlc->ndev);
+}
+EXPORT_SYMBOL_GPL(st_nci_probe);
+
+void st_nci_remove(struct nci_dev *ndev)
+{
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+
+	ndlc_close(info->ndlc);
+
+	nci_unregister_device(ndev);
+	nci_free_device(ndev);
+}
+EXPORT_SYMBOL_GPL(st_nci_remove);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/nfc/st-nci/i2c.c b/drivers/nfc/st-nci/i2c.c
new file mode 100644
index 0000000..06175ce
--- /dev/null
+++ b/drivers/nfc/st-nci/i2c.c
@@ -0,0 +1,385 @@
+/*
+ * I2C Link Layer for ST NCI NFC controller familly based Driver
+ * Copyright (C) 2014-2015 STMicroelectronics SAS. All rights reserved=
=2E
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/gpio.h>
+#include <linux/of_irq.h>
+#include <linux/of_gpio.h>
+#include <linux/interrupt.h>
+#include <linux/delay.h>
+#include <linux/nfc.h>
+#include <linux/platform_data/st_nci.h>
+
+#include "ndlc.h"
+
+#define DRIVER_DESC "NCI NFC driver for ST21NFCB"
+
+/* ndlc header */
+#define ST21NFCB_FRAME_HEADROOM	1
+#define ST21NFCB_FRAME_TAILROOM 0
+
+#define ST_NCI_I2C_MIN_SIZE 4   /* PCB(1) + NCI Packet header(3) */
+#define ST_NCI_I2C_MAX_SIZE 250 /* req 4.2.1 */
+
+#define ST_NCI_I2C_DRIVER_NAME "st_nci_i2c"
+
+static struct i2c_device_id st_nci_i2c_id_table[] =3D {
+	{ST_NCI_DRIVER_NAME, 0},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, st_nci_i2c_id_table);
+
+struct st_nci_i2c_phy {
+	struct i2c_client *i2c_dev;
+	struct llt_ndlc *ndlc;
+
+	unsigned int gpio_reset;
+	unsigned int irq_polarity;
+};
+
+#define I2C_DUMP_SKB(info, skb)					\
+do {								\
+	pr_debug("%s:\n", info);				\
+	print_hex_dump(KERN_DEBUG, "i2c: ", DUMP_PREFIX_OFFSET,	\
+		       16, 1, (skb)->data, (skb)->len, 0);	\
+} while (0)
+
+static int st_nci_i2c_enable(void *phy_id)
+{
+	struct st_nci_i2c_phy *phy =3D phy_id;
+
+	gpio_set_value(phy->gpio_reset, 0);
+	usleep_range(10000, 15000);
+	gpio_set_value(phy->gpio_reset, 1);
+	usleep_range(80000, 85000);
+
+	if (phy->ndlc->powered =3D=3D 0)
+		enable_irq(phy->i2c_dev->irq);
+
+	return 0;
+}
+
+static void st_nci_i2c_disable(void *phy_id)
+{
+	struct st_nci_i2c_phy *phy =3D phy_id;
+
+	disable_irq_nosync(phy->i2c_dev->irq);
+}
+
+/*
+ * Writing a frame must not return the number of written bytes.
+ * It must return either zero for success, or <0 for error.
+ * In addition, it must not alter the skb
+ */
+static int st_nci_i2c_write(void *phy_id, struct sk_buff *skb)
+{
+	int r =3D -1;
+	struct st_nci_i2c_phy *phy =3D phy_id;
+	struct i2c_client *client =3D phy->i2c_dev;
+
+	I2C_DUMP_SKB("st_nci_i2c_write", skb);
+
+	if (phy->ndlc->hard_fault !=3D 0)
+		return phy->ndlc->hard_fault;
+
+	r =3D i2c_master_send(client, skb->data, skb->len);
+	if (r < 0) {  /* Retry, chip was in standby */
+		usleep_range(1000, 4000);
+		r =3D i2c_master_send(client, skb->data, skb->len);
+	}
+
+	if (r >=3D 0) {
+		if (r !=3D skb->len)
+			r =3D -EREMOTEIO;
+		else
+			r =3D 0;
+	}
+
+	return r;
+}
+
+/*
+ * Reads an ndlc frame and returns it in a newly allocated sk_buff.
+ * returns:
+ * frame size : if received frame is complete (find ST21NFCB_SOF_EOF a=
t
+ * end of read)
+ * -EAGAIN : if received frame is incomplete (not find ST21NFCB_SOF_EO=
=46
+ * at end of read)
+ * -EREMOTEIO : i2c read error (fatal)
+ * -EBADMSG : frame was incorrect and discarded
+ * (value returned from st_nci_i2c_repack)
+ * -EIO : if no ST21NFCB_SOF_EOF is found after reaching
+ * the read length end sequence
+ */
+static int st_nci_i2c_read(struct st_nci_i2c_phy *phy,
+				 struct sk_buff **skb)
+{
+	int r;
+	u8 len;
+	u8 buf[ST_NCI_I2C_MAX_SIZE];
+	struct i2c_client *client =3D phy->i2c_dev;
+
+	r =3D i2c_master_recv(client, buf, ST_NCI_I2C_MIN_SIZE);
+	if (r < 0) {  /* Retry, chip was in standby */
+		usleep_range(1000, 4000);
+		r =3D i2c_master_recv(client, buf, ST_NCI_I2C_MIN_SIZE);
+	}
+
+	if (r !=3D ST_NCI_I2C_MIN_SIZE)
+		return -EREMOTEIO;
+
+	len =3D be16_to_cpu(*(__be16 *) (buf + 2));
+	if (len > ST_NCI_I2C_MAX_SIZE) {
+		nfc_err(&client->dev, "invalid frame len\n");
+		return -EBADMSG;
+	}
+
+	*skb =3D alloc_skb(ST_NCI_I2C_MIN_SIZE + len, GFP_KERNEL);
+	if (*skb =3D=3D NULL)
+		return -ENOMEM;
+
+	skb_reserve(*skb, ST_NCI_I2C_MIN_SIZE);
+	skb_put(*skb, ST_NCI_I2C_MIN_SIZE);
+	memcpy((*skb)->data, buf, ST_NCI_I2C_MIN_SIZE);
+
+	if (!len)
+		return 0;
+
+	r =3D i2c_master_recv(client, buf, len);
+	if (r !=3D len) {
+		kfree_skb(*skb);
+		return -EREMOTEIO;
+	}
+
+	skb_put(*skb, len);
+	memcpy((*skb)->data + ST_NCI_I2C_MIN_SIZE, buf, len);
+
+	I2C_DUMP_SKB("i2c frame read", *skb);
+
+	return 0;
+}
+
+/*
+ * Reads an ndlc frame from the chip.
+ *
+ * On ST21NFCB, IRQ goes in idle state when read starts.
+ */
+static irqreturn_t st_nci_irq_thread_fn(int irq, void *phy_id)
+{
+	struct st_nci_i2c_phy *phy =3D phy_id;
+	struct i2c_client *client;
+	struct sk_buff *skb =3D NULL;
+	int r;
+
+	if (!phy || !phy->ndlc || irq !=3D phy->i2c_dev->irq) {
+		WARN_ON_ONCE(1);
+		return IRQ_NONE;
+	}
+
+	client =3D phy->i2c_dev;
+	dev_dbg(&client->dev, "IRQ\n");
+
+	if (phy->ndlc->hard_fault)
+		return IRQ_HANDLED;
+
+	if (!phy->ndlc->powered) {
+		st_nci_i2c_disable(phy);
+		return IRQ_HANDLED;
+	}
+
+	r =3D st_nci_i2c_read(phy, &skb);
+	if (r =3D=3D -EREMOTEIO || r =3D=3D -ENOMEM || r =3D=3D -EBADMSG)
+		return IRQ_HANDLED;
+
+	ndlc_recv(phy->ndlc, skb);
+
+	return IRQ_HANDLED;
+}
+
+static struct nfc_phy_ops i2c_phy_ops =3D {
+	.write =3D st_nci_i2c_write,
+	.enable =3D st_nci_i2c_enable,
+	.disable =3D st_nci_i2c_disable,
+};
+
+#ifdef CONFIG_OF
+static int st_nci_i2c_of_request_resources(struct i2c_client *client)
+{
+	struct st_nci_i2c_phy *phy =3D i2c_get_clientdata(client);
+	struct device_node *pp;
+	int gpio;
+	int r;
+
+	pp =3D client->dev.of_node;
+	if (!pp)
+		return -ENODEV;
+
+	/* Get GPIO from device tree */
+	gpio =3D of_get_named_gpio(pp, "reset-gpios", 0);
+	if (gpio < 0) {
+		nfc_err(&client->dev,
+			"Failed to retrieve reset-gpios from device tree\n");
+		return gpio;
+	}
+
+	/* GPIO request and configuration */
+	r =3D devm_gpio_request_one(&client->dev, gpio,
+				GPIOF_OUT_INIT_HIGH, "clf_reset");
+	if (r) {
+		nfc_err(&client->dev, "Failed to request reset pin\n");
+		return r;
+	}
+	phy->gpio_reset =3D gpio;
+
+	phy->irq_polarity =3D irq_get_trigger_type(client->irq);
+
+	return 0;
+}
+#else
+static int st_nci_i2c_of_request_resources(struct i2c_client *client)
+{
+	return -ENODEV;
+}
+#endif
+
+static int st_nci_i2c_request_resources(struct i2c_client *client)
+{
+	struct st_nci_nfc_platform_data *pdata;
+	struct st_nci_i2c_phy *phy =3D i2c_get_clientdata(client);
+	int r;
+
+	pdata =3D client->dev.platform_data;
+	if (pdata =3D=3D NULL) {
+		nfc_err(&client->dev, "No platform data\n");
+		return -EINVAL;
+	}
+
+	/* store for later use */
+	phy->gpio_reset =3D pdata->gpio_reset;
+	phy->irq_polarity =3D pdata->irq_polarity;
+
+	r =3D devm_gpio_request_one(&client->dev,
+			phy->gpio_reset, GPIOF_OUT_INIT_HIGH, "clf_reset");
+	if (r) {
+		pr_err("%s : reset gpio_request failed\n", __FILE__);
+		return r;
+	}
+
+	return 0;
+}
+
+static int st_nci_i2c_probe(struct i2c_client *client,
+				  const struct i2c_device_id *id)
+{
+	struct st_nci_i2c_phy *phy;
+	struct st_nci_nfc_platform_data *pdata;
+	int r;
+
+	dev_dbg(&client->dev, "%s\n", __func__);
+	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
+		return -ENODEV;
+	}
+
+	phy =3D devm_kzalloc(&client->dev, sizeof(struct st_nci_i2c_phy),
+			   GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	phy->i2c_dev =3D client;
+
+	i2c_set_clientdata(client, phy);
+
+	pdata =3D client->dev.platform_data;
+	if (!pdata && client->dev.of_node) {
+		r =3D st_nci_i2c_of_request_resources(client);
+		if (r) {
+			nfc_err(&client->dev, "No platform data\n");
+			return r;
+		}
+	} else if (pdata) {
+		r =3D st_nci_i2c_request_resources(client);
+		if (r) {
+			nfc_err(&client->dev,
+				"Cannot get platform resources\n");
+			return r;
+		}
+	} else {
+		nfc_err(&client->dev,
+			"st21nfcb platform resources not available\n");
+		return -ENODEV;
+	}
+
+	r =3D ndlc_probe(phy, &i2c_phy_ops, &client->dev,
+			ST21NFCB_FRAME_HEADROOM, ST21NFCB_FRAME_TAILROOM,
+			&phy->ndlc);
+	if (r < 0) {
+		nfc_err(&client->dev, "Unable to register ndlc layer\n");
+		return r;
+	}
+
+	r =3D devm_request_threaded_irq(&client->dev, client->irq, NULL,
+				st_nci_irq_thread_fn,
+				phy->irq_polarity | IRQF_ONESHOT,
+				ST_NCI_DRIVER_NAME, phy);
+	if (r < 0)
+		nfc_err(&client->dev, "Unable to register IRQ handler\n");
+
+	return r;
+}
+
+static int st_nci_i2c_remove(struct i2c_client *client)
+{
+	struct st_nci_i2c_phy *phy =3D i2c_get_clientdata(client);
+
+	dev_dbg(&client->dev, "%s\n", __func__);
+
+	ndlc_remove(phy->ndlc);
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_st_nci_i2c_match[] =3D {
+	{ .compatible =3D "st,st21nfcb-i2c", },
+	{ .compatible =3D "st,st21nfcb_i2c", },
+	{ .compatible =3D "st,st21nfcc-i2c", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_st_nci_i2c_match);
+#endif
+
+static struct i2c_driver st_nci_i2c_driver =3D {
+	.driver =3D {
+		.owner =3D THIS_MODULE,
+		.name =3D ST_NCI_I2C_DRIVER_NAME,
+		.of_match_table =3D of_match_ptr(of_st_nci_i2c_match),
+	},
+	.probe =3D st_nci_i2c_probe,
+	.id_table =3D st_nci_i2c_id_table,
+	.remove =3D st_nci_i2c_remove,
+};
+
+module_i2c_driver(st_nci_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/nfc/st-nci/ndlc.c b/drivers/nfc/st-nci/ndlc.c
new file mode 100644
index 0000000..76306fb
--- /dev/null
+++ b/drivers/nfc/st-nci/ndlc.c
@@ -0,0 +1,307 @@
+/*
+ * Low Level Transport (NDLC) Driver for STMicroelectronics NFC NCI Ch=
ip
+ *
+ * Copyright (C) 2014-2015 STMicroelectronics SAS. All rights reserved=
=2E
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
+ */
+
+#include <linux/sched.h>
+#include <net/nfc/nci_core.h>
+
+#include "ndlc.h"
+#include "st-nci.h"
+
+#define NDLC_TIMER_T1		100
+#define NDLC_TIMER_T1_WAIT	400
+#define NDLC_TIMER_T2		1200
+
+#define PCB_TYPE_DATAFRAME		0x80
+#define PCB_TYPE_SUPERVISOR		0xc0
+#define PCB_TYPE_MASK			PCB_TYPE_SUPERVISOR
+
+#define PCB_SYNC_ACK			0x20
+#define PCB_SYNC_NACK			0x10
+#define PCB_SYNC_WAIT			0x30
+#define PCB_SYNC_NOINFO			0x00
+#define PCB_SYNC_MASK			PCB_SYNC_WAIT
+
+#define PCB_DATAFRAME_RETRANSMIT_YES	0x00
+#define PCB_DATAFRAME_RETRANSMIT_NO	0x04
+#define PCB_DATAFRAME_RETRANSMIT_MASK	PCB_DATAFRAME_RETRANSMIT_NO
+
+#define PCB_SUPERVISOR_RETRANSMIT_YES	0x00
+#define PCB_SUPERVISOR_RETRANSMIT_NO	0x02
+#define PCB_SUPERVISOR_RETRANSMIT_MASK	PCB_SUPERVISOR_RETRANSMIT_NO
+
+#define PCB_FRAME_CRC_INFO_PRESENT	0x08
+#define PCB_FRAME_CRC_INFO_NOTPRESENT	0x00
+#define PCB_FRAME_CRC_INFO_MASK		PCB_FRAME_CRC_INFO_PRESENT
+
+#define NDLC_DUMP_SKB(info, skb)                                 \
+do {                                                             \
+	pr_debug("%s:\n", info);                                 \
+	print_hex_dump(KERN_DEBUG, "ndlc: ", DUMP_PREFIX_OFFSET, \
+			16, 1, skb->data, skb->len, 0);          \
+} while (0)
+
+int ndlc_open(struct llt_ndlc *ndlc)
+{
+	/* toggle reset pin */
+	ndlc->ops->enable(ndlc->phy_id);
+	ndlc->powered =3D 1;
+	return st_nci_set_mode(ndlc->ndev, 1);
+}
+EXPORT_SYMBOL(ndlc_open);
+
+void ndlc_close(struct llt_ndlc *ndlc)
+{
+	/* toggle reset pin */
+	ndlc->ops->enable(ndlc->phy_id);
+
+	st_nci_set_mode(ndlc->ndev, 0);
+
+	ndlc->powered =3D 0;
+	ndlc->ops->disable(ndlc->phy_id);
+}
+EXPORT_SYMBOL(ndlc_close);
+
+int ndlc_send(struct llt_ndlc *ndlc, struct sk_buff *skb)
+{
+	/* add ndlc header */
+	u8 pcb =3D PCB_TYPE_DATAFRAME | PCB_DATAFRAME_RETRANSMIT_NO |
+		PCB_FRAME_CRC_INFO_NOTPRESENT;
+
+	*skb_push(skb, 1) =3D pcb;
+	skb_queue_tail(&ndlc->send_q, skb);
+
+	schedule_work(&ndlc->sm_work);
+
+	return 0;
+}
+EXPORT_SYMBOL(ndlc_send);
+
+static void llt_ndlc_send_queue(struct llt_ndlc *ndlc)
+{
+	struct sk_buff *skb;
+	int r;
+	unsigned long time_sent;
+
+	if (ndlc->send_q.qlen)
+		pr_debug("sendQlen=3D%d unackQlen=3D%d\n",
+			 ndlc->send_q.qlen, ndlc->ack_pending_q.qlen);
+
+	while (ndlc->send_q.qlen) {
+		skb =3D skb_dequeue(&ndlc->send_q);
+		NDLC_DUMP_SKB("ndlc frame written", skb);
+		r =3D ndlc->ops->write(ndlc->phy_id, skb);
+		if (r < 0) {
+			ndlc->hard_fault =3D r;
+			break;
+		}
+		time_sent =3D jiffies;
+		*(unsigned long *)skb->cb =3D time_sent;
+
+		skb_queue_tail(&ndlc->ack_pending_q, skb);
+
+		/* start timer t1 for ndlc aknowledge */
+		ndlc->t1_active =3D true;
+		mod_timer(&ndlc->t1_timer, time_sent +
+			msecs_to_jiffies(NDLC_TIMER_T1));
+		/* start timer t2 for chip availability */
+		ndlc->t2_active =3D true;
+		mod_timer(&ndlc->t2_timer, time_sent +
+			msecs_to_jiffies(NDLC_TIMER_T2));
+	}
+}
+
+static void llt_ndlc_requeue_data_pending(struct llt_ndlc *ndlc)
+{
+	struct sk_buff *skb;
+	u8 pcb;
+
+	while ((skb =3D skb_dequeue_tail(&ndlc->ack_pending_q))) {
+		pcb =3D skb->data[0];
+		switch (pcb & PCB_TYPE_MASK) {
+		case PCB_TYPE_SUPERVISOR:
+			skb->data[0] =3D (pcb & ~PCB_SUPERVISOR_RETRANSMIT_MASK) |
+				PCB_SUPERVISOR_RETRANSMIT_YES;
+			break;
+		case PCB_TYPE_DATAFRAME:
+			skb->data[0] =3D (pcb & ~PCB_DATAFRAME_RETRANSMIT_MASK) |
+				PCB_DATAFRAME_RETRANSMIT_YES;
+			break;
+		default:
+			pr_err("UNKNOWN Packet Control Byte=3D%d\n", pcb);
+			kfree_skb(skb);
+			continue;
+		}
+		skb_queue_head(&ndlc->send_q, skb);
+	}
+}
+
+static void llt_ndlc_rcv_queue(struct llt_ndlc *ndlc)
+{
+	struct sk_buff *skb;
+	u8 pcb;
+	unsigned long time_sent;
+
+	if (ndlc->rcv_q.qlen)
+		pr_debug("rcvQlen=3D%d\n", ndlc->rcv_q.qlen);
+
+	while ((skb =3D skb_dequeue(&ndlc->rcv_q)) !=3D NULL) {
+		pcb =3D skb->data[0];
+		skb_pull(skb, 1);
+		if ((pcb & PCB_TYPE_MASK) =3D=3D PCB_TYPE_SUPERVISOR) {
+			switch (pcb & PCB_SYNC_MASK) {
+			case PCB_SYNC_ACK:
+				del_timer_sync(&ndlc->t1_timer);
+				del_timer_sync(&ndlc->t2_timer);
+				ndlc->t2_active =3D false;
+				ndlc->t1_active =3D false;
+				break;
+			case PCB_SYNC_NACK:
+				llt_ndlc_requeue_data_pending(ndlc);
+				llt_ndlc_send_queue(ndlc);
+				/* start timer t1 for ndlc aknowledge */
+				time_sent =3D jiffies;
+				ndlc->t1_active =3D true;
+				mod_timer(&ndlc->t1_timer, time_sent +
+					msecs_to_jiffies(NDLC_TIMER_T1));
+				break;
+			case PCB_SYNC_WAIT:
+				time_sent =3D jiffies;
+				ndlc->t1_active =3D true;
+				mod_timer(&ndlc->t1_timer, time_sent +
+					  msecs_to_jiffies(NDLC_TIMER_T1_WAIT));
+				break;
+			default:
+				pr_err("UNKNOWN Packet Control Byte=3D%d\n", pcb);
+				kfree_skb(skb);
+				break;
+			}
+		} else {
+			nci_recv_frame(ndlc->ndev, skb);
+		}
+	}
+}
+
+static void llt_ndlc_sm_work(struct work_struct *work)
+{
+	struct llt_ndlc *ndlc =3D container_of(work, struct llt_ndlc, sm_work=
);
+
+	llt_ndlc_send_queue(ndlc);
+	llt_ndlc_rcv_queue(ndlc);
+
+	if (ndlc->t1_active && timer_pending(&ndlc->t1_timer) =3D=3D 0) {
+		pr_debug
+		    ("Handle T1(recv SUPERVISOR) elapsed (T1 now inactive)\n");
+		ndlc->t1_active =3D false;
+
+		llt_ndlc_requeue_data_pending(ndlc);
+		llt_ndlc_send_queue(ndlc);
+	}
+
+	if (ndlc->t2_active && timer_pending(&ndlc->t2_timer) =3D=3D 0) {
+		pr_debug("Handle T2(recv DATA) elapsed (T2 now inactive)\n");
+		ndlc->t2_active =3D false;
+		ndlc->t1_active =3D false;
+		del_timer_sync(&ndlc->t1_timer);
+		del_timer_sync(&ndlc->t2_timer);
+		ndlc_close(ndlc);
+		ndlc->hard_fault =3D -EREMOTEIO;
+	}
+}
+
+void ndlc_recv(struct llt_ndlc *ndlc, struct sk_buff *skb)
+{
+	if (skb =3D=3D NULL) {
+		pr_err("NULL Frame -> link is dead\n");
+		ndlc->hard_fault =3D -EREMOTEIO;
+		ndlc_close(ndlc);
+	} else {
+		NDLC_DUMP_SKB("incoming frame", skb);
+		skb_queue_tail(&ndlc->rcv_q, skb);
+	}
+
+	schedule_work(&ndlc->sm_work);
+}
+EXPORT_SYMBOL(ndlc_recv);
+
+static void ndlc_t1_timeout(unsigned long data)
+{
+	struct llt_ndlc *ndlc =3D (struct llt_ndlc *)data;
+
+	pr_debug("\n");
+
+	schedule_work(&ndlc->sm_work);
+}
+
+static void ndlc_t2_timeout(unsigned long data)
+{
+	struct llt_ndlc *ndlc =3D (struct llt_ndlc *)data;
+
+	pr_debug("\n");
+
+	schedule_work(&ndlc->sm_work);
+}
+
+int ndlc_probe(void *phy_id, struct nfc_phy_ops *phy_ops, struct devic=
e *dev,
+	       int phy_headroom, int phy_tailroom, struct llt_ndlc **ndlc_id)
+{
+	struct llt_ndlc *ndlc;
+
+	ndlc =3D devm_kzalloc(dev, sizeof(struct llt_ndlc), GFP_KERNEL);
+	if (!ndlc)
+		return -ENOMEM;
+
+	ndlc->ops =3D phy_ops;
+	ndlc->phy_id =3D phy_id;
+	ndlc->dev =3D dev;
+	ndlc->powered =3D 0;
+
+	*ndlc_id =3D ndlc;
+
+	/* initialize timers */
+	init_timer(&ndlc->t1_timer);
+	ndlc->t1_timer.data =3D (unsigned long)ndlc;
+	ndlc->t1_timer.function =3D ndlc_t1_timeout;
+
+	init_timer(&ndlc->t2_timer);
+	ndlc->t2_timer.data =3D (unsigned long)ndlc;
+	ndlc->t2_timer.function =3D ndlc_t2_timeout;
+
+	skb_queue_head_init(&ndlc->rcv_q);
+	skb_queue_head_init(&ndlc->send_q);
+	skb_queue_head_init(&ndlc->ack_pending_q);
+
+	INIT_WORK(&ndlc->sm_work, llt_ndlc_sm_work);
+
+	return st_nci_probe(ndlc, phy_headroom, phy_tailroom);
+}
+EXPORT_SYMBOL(ndlc_probe);
+
+void ndlc_remove(struct llt_ndlc *ndlc)
+{
+	st_nci_remove(ndlc->ndev);
+
+	/* cancel timers */
+	del_timer_sync(&ndlc->t1_timer);
+	del_timer_sync(&ndlc->t2_timer);
+	ndlc->t2_active =3D false;
+	ndlc->t1_active =3D false;
+
+	skb_queue_purge(&ndlc->rcv_q);
+	skb_queue_purge(&ndlc->send_q);
+}
+EXPORT_SYMBOL(ndlc_remove);
diff --git a/drivers/nfc/st-nci/ndlc.h b/drivers/nfc/st-nci/ndlc.h
new file mode 100644
index 0000000..6361005
--- /dev/null
+++ b/drivers/nfc/st-nci/ndlc.h
@@ -0,0 +1,60 @@
+/*
+ * NCI based Driver for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014-2015  STMicroelectronics SAS. All rights reserve=
d.
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
+ */
+
+#ifndef __LOCAL_NDLC_H_
+#define __LOCAL_NDLC_H_
+
+#include <linux/skbuff.h>
+#include <net/nfc/nfc.h>
+
+/* Low Level Transport description */
+struct llt_ndlc {
+	struct nci_dev *ndev;
+	struct nfc_phy_ops *ops;
+	void *phy_id;
+
+	struct timer_list t1_timer;
+	bool t1_active;
+
+	struct timer_list t2_timer;
+	bool t2_active;
+
+	struct sk_buff_head rcv_q;
+	struct sk_buff_head send_q;
+	struct sk_buff_head ack_pending_q;
+
+	struct work_struct sm_work;
+
+	struct device *dev;
+
+	/*
+	 * < 0 if hardware error occurred
+	 * and prevents normal operation.
+	 */
+	int hard_fault;
+	int powered;
+};
+
+int ndlc_open(struct llt_ndlc *ndlc);
+void ndlc_close(struct llt_ndlc *ndlc);
+int ndlc_send(struct llt_ndlc *ndlc, struct sk_buff *skb);
+void ndlc_recv(struct llt_ndlc *ndlc, struct sk_buff *skb);
+int ndlc_probe(void *phy_id, struct nfc_phy_ops *phy_ops, struct devic=
e *dev,
+	int phy_headroom, int phy_tailroom, struct llt_ndlc **ndlc_id);
+void ndlc_remove(struct llt_ndlc *ndlc);
+#endif /* __LOCAL_NDLC_H__ */
diff --git a/drivers/nfc/st-nci/st-nci.h b/drivers/nfc/st-nci/st-nci.h
new file mode 100644
index 0000000..0a9c6fd
--- /dev/null
+++ b/drivers/nfc/st-nci/st-nci.h
@@ -0,0 +1,39 @@
+/*
+ * NCI based Driver for STMicroelectronics NFC Chip
+ *
+ * Copyright (C) 2014-2015 STMicroelectronics SAS. All rights reserved=
=2E
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
+ */
+
+#ifndef __LOCAL_ST_NCI_H_
+#define __LOCAL_ST_NCI_H_
+
+#include "st-nci_se.h"
+#include "ndlc.h"
+
+/* Define private flags: */
+#define ST_NCI_RUNNING			1
+
+struct st_nci_info {
+	struct llt_ndlc *ndlc;
+	unsigned long flags;
+	struct st_nci_se_info se_info;
+};
+
+void st_nci_remove(struct nci_dev *ndev);
+int st_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
+		int phy_tailroom);
+int st_nci_set_mode(struct nci_dev *ndev, u8 mode);
+
+#endif /* __LOCAL_ST_NCI_H_ */
diff --git a/drivers/nfc/st-nci/st-nci_se.c b/drivers/nfc/st-nci/st-nci=
_se.c
new file mode 100644
index 0000000..bf09976
--- /dev/null
+++ b/drivers/nfc/st-nci/st-nci_se.c
@@ -0,0 +1,713 @@
+/*
+ * Secure Element driver for STMicroelectronics NFC NCI chip
+ *
+ * Copyright (C) 2014-2015 STMicroelectronics SAS. All rights reserved=
=2E
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
+ */
+
+#include <linux/module.h>
+#include <linux/nfc.h>
+#include <linux/delay.h>
+#include <net/nfc/nci.h>
+#include <net/nfc/nci_core.h>
+
+#include "st-nci.h"
+#include "st-nci_se.h"
+
+struct st_nci_pipe_info {
+	u8 pipe_state;
+	u8 src_host_id;
+	u8 src_gate_id;
+	u8 dst_host_id;
+	u8 dst_gate_id;
+} __packed;
+
+/* Hosts */
+#define ST_NCI_HOST_CONTROLLER_ID     0x00
+#define ST_NCI_TERMINAL_HOST_ID       0x01
+#define ST_NCI_UICC_HOST_ID           0x02
+#define ST_NCI_ESE_HOST_ID            0xc0
+
+/* Gates */
+#define ST_NCI_DEVICE_MGNT_GATE       0x01
+#define ST_NCI_APDU_READER_GATE       0xf0
+#define ST_NCI_CONNECTIVITY_GATE      0x41
+
+/* Pipes */
+#define ST_NCI_DEVICE_MGNT_PIPE               0x02
+
+/* Connectivity pipe only */
+#define ST_NCI_SE_COUNT_PIPE_UICC             0x01
+/* Connectivity + APDU Reader pipe */
+#define ST_NCI_SE_COUNT_PIPE_EMBEDDED         0x02
+
+#define ST_NCI_SE_TO_HOT_PLUG			1000 /* msecs */
+#define ST_NCI_SE_TO_PIPES			2000
+
+#define ST_NCI_EVT_HOT_PLUG_IS_INHIBITED(x)   (x->data[0] & 0x80)
+
+#define NCI_HCI_APDU_PARAM_ATR                     0x01
+#define NCI_HCI_ADMIN_PARAM_SESSION_IDENTITY       0x01
+#define NCI_HCI_ADMIN_PARAM_WHITELIST              0x03
+#define NCI_HCI_ADMIN_PARAM_HOST_LIST              0x04
+
+#define ST_NCI_EVT_SE_HARD_RESET		0x20
+#define ST_NCI_EVT_TRANSMIT_DATA		0x10
+#define ST_NCI_EVT_WTX_REQUEST		0x11
+#define ST_NCI_EVT_SE_SOFT_RESET		0x11
+#define ST_NCI_EVT_SE_END_OF_APDU_TRANSFER	0x21
+#define ST_NCI_EVT_HOT_PLUG			0x03
+
+#define ST_NCI_SE_MODE_OFF                    0x00
+#define ST_NCI_SE_MODE_ON                     0x01
+
+#define ST_NCI_EVT_CONNECTIVITY       0x10
+#define ST_NCI_EVT_TRANSACTION        0x12
+
+#define ST_NCI_DM_GETINFO             0x13
+#define ST_NCI_DM_GETINFO_PIPE_LIST   0x02
+#define ST_NCI_DM_GETINFO_PIPE_INFO   0x01
+#define ST_NCI_DM_PIPE_CREATED        0x02
+#define ST_NCI_DM_PIPE_OPEN           0x04
+#define ST_NCI_DM_RF_ACTIVE           0x80
+#define ST_NCI_DM_DISCONNECT          0x30
+
+#define ST_NCI_DM_IS_PIPE_OPEN(p) \
+	((p & 0x0f) =3D=3D (ST_NCI_DM_PIPE_CREATED | ST_NCI_DM_PIPE_OPEN))
+
+#define ST_NCI_ATR_DEFAULT_BWI        0x04
+
+/*
+ * WT =3D 2^BWI/10[s], convert into msecs and add a secure
+ * room by increasing by 2 this timeout
+ */
+#define ST_NCI_BWI_TO_TIMEOUT(x)      ((1 << x) * 200)
+#define ST_NCI_ATR_GET_Y_FROM_TD(x)   (x >> 4)
+
+/* If TA is present bit 0 is set */
+#define ST_NCI_ATR_TA_PRESENT(x) (x & 0x01)
+/* If TB is present bit 1 is set */
+#define ST_NCI_ATR_TB_PRESENT(x) (x & 0x02)
+
+#define ST_NCI_NUM_DEVICES           256
+
+static DECLARE_BITMAP(dev_mask, ST_NCI_NUM_DEVICES);
+
+/* Here are the mandatory pipe for st_nci */
+static struct nci_hci_gate st_nci_gates[] =3D {
+	{NCI_HCI_ADMIN_GATE, NCI_HCI_ADMIN_PIPE,
+					ST_NCI_HOST_CONTROLLER_ID},
+	{NCI_HCI_LINK_MGMT_GATE, NCI_HCI_LINK_MGMT_PIPE,
+					ST_NCI_HOST_CONTROLLER_ID},
+	{ST_NCI_DEVICE_MGNT_GATE, ST_NCI_DEVICE_MGNT_PIPE,
+					ST_NCI_HOST_CONTROLLER_ID},
+
+	/* Secure element pipes are created by secure element host */
+	{ST_NCI_CONNECTIVITY_GATE, NCI_HCI_DO_NOT_OPEN_PIPE,
+					ST_NCI_HOST_CONTROLLER_ID},
+	{ST_NCI_APDU_READER_GATE, NCI_HCI_DO_NOT_OPEN_PIPE,
+					ST_NCI_HOST_CONTROLLER_ID},
+};
+
+static u8 st_nci_se_get_bwi(struct nci_dev *ndev)
+{
+	int i;
+	u8 td;
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+
+	/* Bits 8 to 5 of the first TB for T=3D1 encode BWI from zero to nine=
 */
+	for (i =3D 1; i < ST_NCI_ESE_MAX_LENGTH; i++) {
+		td =3D ST_NCI_ATR_GET_Y_FROM_TD(info->se_info.atr[i]);
+		if (ST_NCI_ATR_TA_PRESENT(td))
+			i++;
+		if (ST_NCI_ATR_TB_PRESENT(td)) {
+			i++;
+			return info->se_info.atr[i] >> 4;
+		}
+	}
+	return ST_NCI_ATR_DEFAULT_BWI;
+}
+
+static void st_nci_se_get_atr(struct nci_dev *ndev)
+{
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+	int r;
+	struct sk_buff *skb;
+
+	r =3D nci_hci_get_param(ndev, ST_NCI_APDU_READER_GATE,
+				NCI_HCI_APDU_PARAM_ATR, &skb);
+	if (r < 0)
+		return;
+
+	if (skb->len <=3D ST_NCI_ESE_MAX_LENGTH) {
+		memcpy(info->se_info.atr, skb->data, skb->len);
+
+		info->se_info.wt_timeout =3D
+			ST_NCI_BWI_TO_TIMEOUT(st_nci_se_get_bwi(ndev));
+	}
+	kfree_skb(skb);
+}
+
+int st_nci_hci_load_session(struct nci_dev *ndev)
+{
+	int i, j, r;
+	struct sk_buff *skb_pipe_list, *skb_pipe_info;
+	struct st_nci_pipe_info *dm_pipe_info;
+	u8 pipe_list[] =3D { ST_NCI_DM_GETINFO_PIPE_LIST,
+			ST_NCI_TERMINAL_HOST_ID};
+	u8 pipe_info[] =3D { ST_NCI_DM_GETINFO_PIPE_INFO,
+			ST_NCI_TERMINAL_HOST_ID, 0};
+
+	/* On ST_NCI device pipes number are dynamics
+	 * If pipes are already created, hci_dev_up will fail.
+	 * Doing a clear all pipe is a bad idea because:
+	 * - It does useless EEPROM cycling
+	 * - It might cause issue for secure elements support
+	 * (such as removing connectivity or APDU reader pipe)
+	 * A better approach on ST_NCI is to:
+	 * - get a pipe list for each host.
+	 * (eg: ST_NCI_HOST_CONTROLLER_ID for now).
+	 * (TODO Later on UICC HOST and eSE HOST)
+	 * - get pipe information
+	 * - match retrieved pipe list in st_nci_gates
+	 * ST_NCI_DEVICE_MGNT_GATE is a proprietary gate
+	 * with ST_NCI_DEVICE_MGNT_PIPE.
+	 * Pipe can be closed and need to be open.
+	 */
+	r =3D nci_hci_connect_gate(ndev, ST_NCI_HOST_CONTROLLER_ID,
+				ST_NCI_DEVICE_MGNT_GATE,
+				ST_NCI_DEVICE_MGNT_PIPE);
+	if (r < 0)
+		goto free_info;
+
+	/* Get pipe list */
+	r =3D nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
+			ST_NCI_DM_GETINFO, pipe_list, sizeof(pipe_list),
+			&skb_pipe_list);
+	if (r < 0)
+		goto free_info;
+
+	/* Complete the existing gate_pipe table */
+	for (i =3D 0; i < skb_pipe_list->len; i++) {
+		pipe_info[2] =3D skb_pipe_list->data[i];
+		r =3D nci_hci_send_cmd(ndev, ST_NCI_DEVICE_MGNT_GATE,
+					ST_NCI_DM_GETINFO, pipe_info,
+					sizeof(pipe_info), &skb_pipe_info);
+
+		if (r)
+			continue;
+
+		/*
+		 * Match pipe ID and gate ID
+		 * Output format from ST21NFC_DM_GETINFO is:
+		 * - pipe state (1byte)
+		 * - source hid (1byte)
+		 * - source gid (1byte)
+		 * - destination hid (1byte)
+		 * - destination gid (1byte)
+		 */
+		dm_pipe_info =3D (struct st_nci_pipe_info *)skb_pipe_info->data;
+		if (dm_pipe_info->dst_gate_id =3D=3D ST_NCI_APDU_READER_GATE &&
+		    dm_pipe_info->src_host_id !=3D ST_NCI_ESE_HOST_ID) {
+			pr_err("Unexpected apdu_reader pipe on host %x\n",
+			       dm_pipe_info->src_host_id);
+			continue;
+		}
+
+		for (j =3D 0; (j < ARRAY_SIZE(st_nci_gates)) &&
+		     (st_nci_gates[j].gate !=3D dm_pipe_info->dst_gate_id); j++)
+			;
+
+		if (j < ARRAY_SIZE(st_nci_gates) &&
+		    st_nci_gates[j].gate =3D=3D dm_pipe_info->dst_gate_id &&
+		    ST_NCI_DM_IS_PIPE_OPEN(dm_pipe_info->pipe_state)) {
+			st_nci_gates[j].pipe =3D pipe_info[2];
+
+			ndev->hci_dev->gate2pipe[st_nci_gates[j].gate] =3D
+						st_nci_gates[j].pipe;
+			ndev->hci_dev->pipes[st_nci_gates[j].pipe].gate =3D
+						st_nci_gates[j].gate;
+			ndev->hci_dev->pipes[st_nci_gates[j].pipe].host =3D
+						dm_pipe_info->src_host_id;
+		}
+	}
+
+	memcpy(ndev->hci_dev->init_data.gates, st_nci_gates,
+	       sizeof(st_nci_gates));
+
+free_info:
+	kfree_skb(skb_pipe_info);
+	kfree_skb(skb_pipe_list);
+	return r;
+}
+EXPORT_SYMBOL_GPL(st_nci_hci_load_session);
+
+static void st_nci_hci_admin_event_received(struct nci_dev *ndev,
+					      u8 event, struct sk_buff *skb)
+{
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+
+	switch (event) {
+	case ST_NCI_EVT_HOT_PLUG:
+		if (info->se_info.se_active) {
+			if (!ST_NCI_EVT_HOT_PLUG_IS_INHIBITED(skb)) {
+				del_timer_sync(&info->se_info.se_active_timer);
+				info->se_info.se_active =3D false;
+				complete(&info->se_info.req_completion);
+			} else {
+				mod_timer(&info->se_info.se_active_timer,
+				      jiffies +
+				      msecs_to_jiffies(ST_NCI_SE_TO_PIPES));
+			}
+		}
+	break;
+	}
+}
+
+static int st_nci_hci_apdu_reader_event_received(struct nci_dev *ndev,
+						   u8 event,
+						   struct sk_buff *skb)
+{
+	int r =3D 0;
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+
+	pr_debug("apdu reader gate event: %x\n", event);
+
+	switch (event) {
+	case ST_NCI_EVT_TRANSMIT_DATA:
+		del_timer_sync(&info->se_info.bwi_timer);
+		info->se_info.bwi_active =3D false;
+		info->se_info.cb(info->se_info.cb_context,
+				 skb->data, skb->len, 0);
+	break;
+	case ST_NCI_EVT_WTX_REQUEST:
+		mod_timer(&info->se_info.bwi_timer, jiffies +
+			  msecs_to_jiffies(info->se_info.wt_timeout));
+	break;
+	}
+
+	kfree_skb(skb);
+	return r;
+}
+
+/*
+ * Returns:
+ * <=3D 0: driver handled the event, skb consumed
+ *    1: driver does not handle the event, please do standard processi=
ng
+ */
+static int st_nci_hci_connectivity_event_received(struct nci_dev *ndev=
,
+						u8 host, u8 event,
+						struct sk_buff *skb)
+{
+	int r =3D 0;
+	struct device *dev =3D &ndev->nfc_dev->dev;
+	struct nfc_evt_transaction *transaction;
+
+	pr_debug("connectivity gate event: %x\n", event);
+
+	switch (event) {
+	case ST_NCI_EVT_CONNECTIVITY:
+
+	break;
+	case ST_NCI_EVT_TRANSACTION:
+		/* According to specification etsi 102 622
+		 * 11.2.2.4 EVT_TRANSACTION Table 52
+		 * Description  Tag     Length
+		 * AID          81      5 to 16
+		 * PARAMETERS   82      0 to 255
+		 */
+		if (skb->len < NFC_MIN_AID_LENGTH + 2 &&
+		    skb->data[0] !=3D NFC_EVT_TRANSACTION_AID_TAG)
+			return -EPROTO;
+
+		transaction =3D (struct nfc_evt_transaction *)devm_kzalloc(dev,
+					    skb->len - 2, GFP_KERNEL);
+
+		transaction->aid_len =3D skb->data[1];
+		memcpy(transaction->aid, &skb->data[2], transaction->aid_len);
+
+		/* Check next byte is PARAMETERS tag (82) */
+		if (skb->data[transaction->aid_len + 2] !=3D
+		    NFC_EVT_TRANSACTION_PARAMS_TAG)
+			return -EPROTO;
+
+		transaction->params_len =3D skb->data[transaction->aid_len + 3];
+		memcpy(transaction->params, skb->data +
+		       transaction->aid_len + 4, transaction->params_len);
+
+		r =3D nfc_se_transaction(ndev->nfc_dev, host, transaction);
+		break;
+	default:
+		return 1;
+	}
+	kfree_skb(skb);
+	return r;
+}
+
+void st_nci_hci_event_received(struct nci_dev *ndev, u8 pipe,
+				 u8 event, struct sk_buff *skb)
+{
+	u8 gate =3D ndev->hci_dev->pipes[pipe].gate;
+	u8 host =3D ndev->hci_dev->pipes[pipe].host;
+
+	switch (gate) {
+	case NCI_HCI_ADMIN_GATE:
+		st_nci_hci_admin_event_received(ndev, event, skb);
+	break;
+	case ST_NCI_APDU_READER_GATE:
+		st_nci_hci_apdu_reader_event_received(ndev, event, skb);
+	break;
+	case ST_NCI_CONNECTIVITY_GATE:
+		st_nci_hci_connectivity_event_received(ndev, host, event,
+							 skb);
+	break;
+	}
+}
+EXPORT_SYMBOL_GPL(st_nci_hci_event_received);
+
+
+void st_nci_hci_cmd_received(struct nci_dev *ndev, u8 pipe, u8 cmd,
+			       struct sk_buff *skb)
+{
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+	u8 gate =3D ndev->hci_dev->pipes[pipe].gate;
+
+	pr_debug("cmd: %x\n", cmd);
+
+	switch (cmd) {
+	case NCI_HCI_ANY_OPEN_PIPE:
+		if (gate !=3D ST_NCI_APDU_READER_GATE &&
+		    ndev->hci_dev->pipes[pipe].host !=3D ST_NCI_UICC_HOST_ID)
+			ndev->hci_dev->count_pipes++;
+
+		if (ndev->hci_dev->count_pipes =3D=3D
+		    ndev->hci_dev->expected_pipes) {
+			del_timer_sync(&info->se_info.se_active_timer);
+			info->se_info.se_active =3D false;
+			ndev->hci_dev->count_pipes =3D 0;
+			complete(&info->se_info.req_completion);
+		}
+	break;
+	}
+}
+EXPORT_SYMBOL_GPL(st_nci_hci_cmd_received);
+
+/*
+ * Remarks: On some early st_nci firmware, nci_nfcee_mode_set(0)
+ * is rejected
+ */
+static int st_nci_control_se(struct nci_dev *ndev, u8 se_idx,
+				   u8 state)
+{
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+	int r;
+	struct sk_buff *sk_host_list;
+	u8 host_id;
+
+	switch (se_idx) {
+	case ST_NCI_UICC_HOST_ID:
+		ndev->hci_dev->count_pipes =3D 0;
+		ndev->hci_dev->expected_pipes =3D ST_NCI_SE_COUNT_PIPE_UICC;
+		break;
+	case ST_NCI_ESE_HOST_ID:
+		ndev->hci_dev->count_pipes =3D 0;
+		ndev->hci_dev->expected_pipes =3D ST_NCI_SE_COUNT_PIPE_EMBEDDED;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * Wait for an EVT_HOT_PLUG in order to
+	 * retrieve a relevant host list.
+	 */
+	reinit_completion(&info->se_info.req_completion);
+	r =3D nci_nfcee_mode_set(ndev, se_idx, NCI_NFCEE_ENABLE);
+	if (r !=3D NCI_STATUS_OK)
+		return r;
+
+	mod_timer(&info->se_info.se_active_timer, jiffies +
+		msecs_to_jiffies(ST_NCI_SE_TO_HOT_PLUG));
+	info->se_info.se_active =3D true;
+
+	/* Ignore return value and check in any case the host_list */
+	wait_for_completion_interruptible(&info->se_info.req_completion);
+
+	/* There might be some "collision" after receiving a HOT_PLUG event
+	 * This may cause the CLF to not answer to the next hci command.
+	 * There is no possible synchronization to prevent this.
+	 * Adding a small delay is the only way to solve the issue.
+	 */
+	usleep_range(3000, 5000);
+
+	r =3D nci_hci_get_param(ndev, NCI_HCI_ADMIN_GATE,
+			NCI_HCI_ADMIN_PARAM_HOST_LIST, &sk_host_list);
+	if (r !=3D NCI_HCI_ANY_OK)
+		return r;
+
+	host_id =3D sk_host_list->data[sk_host_list->len - 1];
+	kfree_skb(sk_host_list);
+	if (state =3D=3D ST_NCI_SE_MODE_ON && host_id =3D=3D se_idx)
+		return se_idx;
+	else if (state =3D=3D ST_NCI_SE_MODE_OFF && host_id !=3D se_idx)
+		return se_idx;
+
+	return -1;
+}
+
+int st_nci_disable_se(struct nci_dev *ndev, u32 se_idx)
+{
+	int r;
+
+	pr_debug("st_nci_disable_se\n");
+
+	if (se_idx =3D=3D NFC_SE_EMBEDDED) {
+		r =3D nci_hci_send_event(ndev, ST_NCI_APDU_READER_GATE,
+				ST_NCI_EVT_SE_END_OF_APDU_TRANSFER, NULL, 0);
+		if (r < 0)
+			return r;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(st_nci_disable_se);
+
+int st_nci_enable_se(struct nci_dev *ndev, u32 se_idx)
+{
+	int r;
+
+	pr_debug("st_nci_enable_se\n");
+
+	if (se_idx =3D=3D ST_NCI_HCI_HOST_ID_ESE) {
+		r =3D nci_hci_send_event(ndev, ST_NCI_APDU_READER_GATE,
+				ST_NCI_EVT_SE_SOFT_RESET, NULL, 0);
+		if (r < 0)
+			return r;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(st_nci_enable_se);
+
+static int st_nci_hci_network_init(struct nci_dev *ndev)
+{
+	struct core_conn_create_dest_spec_params *dest_params;
+	struct dest_spec_params spec_params;
+	struct nci_conn_info    *conn_info;
+	int r, dev_num;
+
+	dest_params =3D
+		kzalloc(sizeof(struct core_conn_create_dest_spec_params) +
+			sizeof(struct dest_spec_params), GFP_KERNEL);
+	if (dest_params =3D=3D NULL) {
+		r =3D -ENOMEM;
+		goto exit;
+	}
+
+	dest_params->type =3D NCI_DESTINATION_SPECIFIC_PARAM_NFCEE_TYPE;
+	dest_params->length =3D sizeof(struct dest_spec_params);
+	spec_params.id =3D ndev->hci_dev->nfcee_id;
+	spec_params.protocol =3D NCI_NFCEE_INTERFACE_HCI_ACCESS;
+	memcpy(dest_params->value, &spec_params, sizeof(struct dest_spec_para=
ms));
+	r =3D nci_core_conn_create(ndev, NCI_DESTINATION_NFCEE, 1,
+				 sizeof(struct core_conn_create_dest_spec_params) +
+				 sizeof(struct dest_spec_params),
+				 dest_params);
+	if (r !=3D NCI_STATUS_OK)
+		goto free_dest_params;
+
+	conn_info =3D ndev->hci_dev->conn_info;
+	if (!conn_info)
+		goto free_dest_params;
+
+	memcpy(ndev->hci_dev->init_data.gates, st_nci_gates,
+	       sizeof(st_nci_gates));
+
+	/*
+	 * Session id must include the driver name + i2c bus addr
+	 * persistent info to discriminate 2 identical chips
+	 */
+	dev_num =3D find_first_zero_bit(dev_mask, ST_NCI_NUM_DEVICES);
+	if (dev_num >=3D ST_NCI_NUM_DEVICES) {
+		r =3D -ENODEV;
+		goto free_dest_params;
+	}
+
+	scnprintf(ndev->hci_dev->init_data.session_id,
+		  sizeof(ndev->hci_dev->init_data.session_id),
+		  "%s%2x", "ST21BH", dev_num);
+
+	r =3D nci_hci_dev_session_init(ndev);
+	if (r !=3D NCI_HCI_ANY_OK)
+		goto free_dest_params;
+
+	r =3D nci_nfcee_mode_set(ndev, ndev->hci_dev->conn_info->id,
+			       NCI_NFCEE_ENABLE);
+	if (r !=3D NCI_STATUS_OK)
+		goto free_dest_params;
+
+free_dest_params:
+	kfree(dest_params);
+
+exit:
+	return r;
+}
+
+int st_nci_discover_se(struct nci_dev *ndev)
+{
+	u8 param[2];
+	int r;
+	int se_count =3D 0;
+
+	pr_debug("st_nci_discover_se\n");
+
+	r =3D st_nci_hci_network_init(ndev);
+	if (r !=3D 0)
+		return r;
+
+	param[0] =3D ST_NCI_UICC_HOST_ID;
+	param[1] =3D ST_NCI_HCI_HOST_ID_ESE;
+	r =3D nci_hci_set_param(ndev, NCI_HCI_ADMIN_GATE,
+				NCI_HCI_ADMIN_PARAM_WHITELIST,
+				param, sizeof(param));
+	if (r !=3D NCI_HCI_ANY_OK)
+		return r;
+
+	r =3D st_nci_control_se(ndev, ST_NCI_UICC_HOST_ID,
+				ST_NCI_SE_MODE_ON);
+	if (r =3D=3D ST_NCI_UICC_HOST_ID) {
+		nfc_add_se(ndev->nfc_dev, ST_NCI_UICC_HOST_ID, NFC_SE_UICC);
+		se_count++;
+	}
+
+	/* Try to enable eSE in order to check availability */
+	r =3D st_nci_control_se(ndev, ST_NCI_HCI_HOST_ID_ESE,
+				ST_NCI_SE_MODE_ON);
+	if (r =3D=3D ST_NCI_HCI_HOST_ID_ESE) {
+		nfc_add_se(ndev->nfc_dev, ST_NCI_HCI_HOST_ID_ESE,
+			   NFC_SE_EMBEDDED);
+		se_count++;
+		st_nci_se_get_atr(ndev);
+	}
+
+	return !se_count;
+}
+EXPORT_SYMBOL_GPL(st_nci_discover_se);
+
+int st_nci_se_io(struct nci_dev *ndev, u32 se_idx,
+		       u8 *apdu, size_t apdu_length,
+		       se_io_cb_t cb, void *cb_context)
+{
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+
+	pr_debug("\n");
+
+	switch (se_idx) {
+	case ST_NCI_HCI_HOST_ID_ESE:
+		info->se_info.cb =3D cb;
+		info->se_info.cb_context =3D cb_context;
+		mod_timer(&info->se_info.bwi_timer, jiffies +
+			  msecs_to_jiffies(info->se_info.wt_timeout));
+		info->se_info.bwi_active =3D true;
+		return nci_hci_send_event(ndev, ST_NCI_APDU_READER_GATE,
+					ST_NCI_EVT_TRANSMIT_DATA, apdu,
+					apdu_length);
+	default:
+		return -ENODEV;
+	}
+}
+EXPORT_SYMBOL(st_nci_se_io);
+
+static void st_nci_se_wt_timeout(unsigned long data)
+{
+	/*
+	 * No answer from the secure element
+	 * within the defined timeout.
+	 * Let's send a reset request as recovery procedure.
+	 * According to the situation, we first try to send a software reset
+	 * to the secure element. If the next command is still not
+	 * answering in time, we send to the CLF a secure element hardware
+	 * reset request.
+	 */
+	/* hardware reset managed through VCC_UICC_OUT power supply */
+	u8 param =3D 0x01;
+	struct st_nci_info *info =3D (struct st_nci_info *) data;
+
+	pr_debug("\n");
+
+	info->se_info.bwi_active =3D false;
+
+	if (!info->se_info.xch_error) {
+		info->se_info.xch_error =3D true;
+		nci_hci_send_event(info->ndlc->ndev, ST_NCI_APDU_READER_GATE,
+				ST_NCI_EVT_SE_SOFT_RESET, NULL, 0);
+	} else {
+		info->se_info.xch_error =3D false;
+		nci_hci_send_event(info->ndlc->ndev, ST_NCI_DEVICE_MGNT_GATE,
+				ST_NCI_EVT_SE_HARD_RESET, &param, 1);
+	}
+	info->se_info.cb(info->se_info.cb_context, NULL, 0, -ETIME);
+}
+
+static void st_nci_se_activation_timeout(unsigned long data)
+{
+	struct st_nci_info *info =3D (struct st_nci_info *) data;
+
+	pr_debug("\n");
+
+	info->se_info.se_active =3D false;
+
+	complete(&info->se_info.req_completion);
+}
+
+int st_nci_se_init(struct nci_dev *ndev)
+{
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+
+	init_completion(&info->se_info.req_completion);
+	/* initialize timers */
+	init_timer(&info->se_info.bwi_timer);
+	info->se_info.bwi_timer.data =3D (unsigned long)info;
+	info->se_info.bwi_timer.function =3D st_nci_se_wt_timeout;
+	info->se_info.bwi_active =3D false;
+
+	init_timer(&info->se_info.se_active_timer);
+	info->se_info.se_active_timer.data =3D (unsigned long)info;
+	info->se_info.se_active_timer.function =3D
+			st_nci_se_activation_timeout;
+	info->se_info.se_active =3D false;
+
+	info->se_info.xch_error =3D false;
+
+	info->se_info.wt_timeout =3D
+		ST_NCI_BWI_TO_TIMEOUT(ST_NCI_ATR_DEFAULT_BWI);
+
+	return 0;
+}
+EXPORT_SYMBOL(st_nci_se_init);
+
+void st_nci_se_deinit(struct nci_dev *ndev)
+{
+	struct st_nci_info *info =3D nci_get_drvdata(ndev);
+
+	if (info->se_info.bwi_active)
+		del_timer_sync(&info->se_info.bwi_timer);
+	if (info->se_info.se_active)
+		del_timer_sync(&info->se_info.se_active_timer);
+
+	info->se_info.se_active =3D false;
+	info->se_info.bwi_active =3D false;
+}
+EXPORT_SYMBOL(st_nci_se_deinit);
+
diff --git a/drivers/nfc/st-nci/st-nci_se.h b/drivers/nfc/st-nci/st-nci=
_se.h
new file mode 100644
index 0000000..ea66e87
--- /dev/null
+++ b/drivers/nfc/st-nci/st-nci_se.h
@@ -0,0 +1,61 @@
+/*
+ * Secure Element Driver for STMicroelectronics NFC NCI Chip
+ *
+ * Copyright (C) 2014-2015 STMicroelectronics SAS. All rights reserved=
=2E
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
+ */
+#ifndef __LOCAL_ST_NCI_SE_H_
+#define __LOCAL_ST_NCI_SE_H_
+
+/*
+ * ref ISO7816-3 chap 8.1. the initial character TS is followed by a
+ * sequence of at most 32 characters.
+ */
+#define ST_NCI_ESE_MAX_LENGTH	33
+#define ST_NCI_HCI_HOST_ID_ESE	0xc0
+
+struct st_nci_se_info {
+	u8 atr[ST_NCI_ESE_MAX_LENGTH];
+	struct completion req_completion;
+
+	struct timer_list bwi_timer;
+	int wt_timeout; /* in msecs */
+	bool bwi_active;
+
+	struct timer_list se_active_timer;
+	bool se_active;
+
+	bool xch_error;
+
+	se_io_cb_t cb;
+	void *cb_context;
+};
+
+int st_nci_se_init(struct nci_dev *ndev);
+void st_nci_se_deinit(struct nci_dev *ndev);
+
+int st_nci_discover_se(struct nci_dev *ndev);
+int st_nci_enable_se(struct nci_dev *ndev, u32 se_idx);
+int st_nci_disable_se(struct nci_dev *ndev, u32 se_idx);
+int st_nci_se_io(struct nci_dev *ndev, u32 se_idx,
+		u8 *apdu, size_t apdu_length,
+		se_io_cb_t cb, void *cb_context);
+int st_nci_hci_load_session(struct nci_dev *ndev);
+void st_nci_hci_event_received(struct nci_dev *ndev, u8 pipe,
+			u8 event, struct sk_buff *skb);
+void st_nci_hci_cmd_received(struct nci_dev *ndev, u8 pipe, u8 cmd,
+			struct sk_buff *skb);
+
+
+#endif /* __LOCAL_ST_NCI_SE_H_ */
diff --git a/drivers/nfc/st21nfcb/Kconfig b/drivers/nfc/st21nfcb/Kconfi=
g
deleted file mode 100644
index e0322dd..0000000
--- a/drivers/nfc/st21nfcb/Kconfig
+++ /dev/null
@@ -1,22 +0,0 @@
-config NFC_ST21NFCB
-	tristate "STMicroelectronics ST21NFCB NFC driver"
-	depends on NFC_NCI
-	default n
-	---help---
-	  STMicroelectronics ST21NFCB core driver. It implements the chipset
-	  NCI logic and hooks into the NFC kernel APIs. Physical layers will
-	  register against it.
-
-	  To compile this driver as a module, choose m here. The module will
-	  be called st21nfcb.
-	  Say N if unsure.
-
-config NFC_ST21NFCB_I2C
-	tristate "NFC ST21NFCB i2c support"
-	depends on NFC_ST21NFCB && I2C
-	---help---
-	  This module adds support for the STMicroelectronics st21nfcb i2c in=
terface.
-	  Select this if your platform is using the i2c bus.
-
-	  If you choose to build a module, it'll be called st21nfcb_i2c.
-	  Say N if unsure.
diff --git a/drivers/nfc/st21nfcb/Makefile b/drivers/nfc/st21nfcb/Makef=
ile
deleted file mode 100644
index ce659a9..0000000
--- a/drivers/nfc/st21nfcb/Makefile
+++ /dev/null
@@ -1,9 +0,0 @@
-#
-# Makefile for ST21NFCB NCI based NFC driver
-#
-
-st21nfcb_nci-objs =3D ndlc.o st21nfcb.o st21nfcb_se.o
-obj-$(CONFIG_NFC_ST21NFCB)     +=3D st21nfcb_nci.o
-
-st21nfcb_i2c-objs =3D i2c.o
-obj-$(CONFIG_NFC_ST21NFCB_I2C) +=3D st21nfcb_i2c.o
diff --git a/drivers/nfc/st21nfcb/i2c.c b/drivers/nfc/st21nfcb/i2c.c
deleted file mode 100644
index dbc0dfd..0000000
--- a/drivers/nfc/st21nfcb/i2c.c
+++ /dev/null
@@ -1,384 +0,0 @@
-/*
- * I2C Link Layer for ST21NFCB NCI based Driver
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/module.h>
-#include <linux/i2c.h>
-#include <linux/gpio.h>
-#include <linux/of_irq.h>
-#include <linux/of_gpio.h>
-#include <linux/interrupt.h>
-#include <linux/delay.h>
-#include <linux/nfc.h>
-#include <linux/platform_data/st21nfcb.h>
-
-#include "ndlc.h"
-
-#define DRIVER_DESC "NCI NFC driver for ST21NFCB"
-
-/* ndlc header */
-#define ST21NFCB_FRAME_HEADROOM	1
-#define ST21NFCB_FRAME_TAILROOM 0
-
-#define ST21NFCB_NCI_I2C_MIN_SIZE 4   /* PCB(1) + NCI Packet header(3)=
 */
-#define ST21NFCB_NCI_I2C_MAX_SIZE 250 /* req 4.2.1 */
-
-#define ST21NFCB_NCI_I2C_DRIVER_NAME "st21nfcb_nci_i2c"
-
-static struct i2c_device_id st21nfcb_nci_i2c_id_table[] =3D {
-	{ST21NFCB_NCI_DRIVER_NAME, 0},
-	{}
-};
-MODULE_DEVICE_TABLE(i2c, st21nfcb_nci_i2c_id_table);
-
-struct st21nfcb_i2c_phy {
-	struct i2c_client *i2c_dev;
-	struct llt_ndlc *ndlc;
-
-	unsigned int gpio_reset;
-	unsigned int irq_polarity;
-};
-
-#define I2C_DUMP_SKB(info, skb)					\
-do {								\
-	pr_debug("%s:\n", info);				\
-	print_hex_dump(KERN_DEBUG, "i2c: ", DUMP_PREFIX_OFFSET,	\
-		       16, 1, (skb)->data, (skb)->len, 0);	\
-} while (0)
-
-static int st21nfcb_nci_i2c_enable(void *phy_id)
-{
-	struct st21nfcb_i2c_phy *phy =3D phy_id;
-
-	gpio_set_value(phy->gpio_reset, 0);
-	usleep_range(10000, 15000);
-	gpio_set_value(phy->gpio_reset, 1);
-	usleep_range(80000, 85000);
-
-	if (phy->ndlc->powered =3D=3D 0)
-		enable_irq(phy->i2c_dev->irq);
-
-	return 0;
-}
-
-static void st21nfcb_nci_i2c_disable(void *phy_id)
-{
-	struct st21nfcb_i2c_phy *phy =3D phy_id;
-
-	disable_irq_nosync(phy->i2c_dev->irq);
-}
-
-/*
- * Writing a frame must not return the number of written bytes.
- * It must return either zero for success, or <0 for error.
- * In addition, it must not alter the skb
- */
-static int st21nfcb_nci_i2c_write(void *phy_id, struct sk_buff *skb)
-{
-	int r =3D -1;
-	struct st21nfcb_i2c_phy *phy =3D phy_id;
-	struct i2c_client *client =3D phy->i2c_dev;
-
-	I2C_DUMP_SKB("st21nfcb_nci_i2c_write", skb);
-
-	if (phy->ndlc->hard_fault !=3D 0)
-		return phy->ndlc->hard_fault;
-
-	r =3D i2c_master_send(client, skb->data, skb->len);
-	if (r < 0) {  /* Retry, chip was in standby */
-		usleep_range(1000, 4000);
-		r =3D i2c_master_send(client, skb->data, skb->len);
-	}
-
-	if (r >=3D 0) {
-		if (r !=3D skb->len)
-			r =3D -EREMOTEIO;
-		else
-			r =3D 0;
-	}
-
-	return r;
-}
-
-/*
- * Reads an ndlc frame and returns it in a newly allocated sk_buff.
- * returns:
- * frame size : if received frame is complete (find ST21NFCB_SOF_EOF a=
t
- * end of read)
- * -EAGAIN : if received frame is incomplete (not find ST21NFCB_SOF_EO=
=46
- * at end of read)
- * -EREMOTEIO : i2c read error (fatal)
- * -EBADMSG : frame was incorrect and discarded
- * (value returned from st21nfcb_nci_i2c_repack)
- * -EIO : if no ST21NFCB_SOF_EOF is found after reaching
- * the read length end sequence
- */
-static int st21nfcb_nci_i2c_read(struct st21nfcb_i2c_phy *phy,
-				 struct sk_buff **skb)
-{
-	int r;
-	u8 len;
-	u8 buf[ST21NFCB_NCI_I2C_MAX_SIZE];
-	struct i2c_client *client =3D phy->i2c_dev;
-
-	r =3D i2c_master_recv(client, buf, ST21NFCB_NCI_I2C_MIN_SIZE);
-	if (r < 0) {  /* Retry, chip was in standby */
-		usleep_range(1000, 4000);
-		r =3D i2c_master_recv(client, buf, ST21NFCB_NCI_I2C_MIN_SIZE);
-	}
-
-	if (r !=3D ST21NFCB_NCI_I2C_MIN_SIZE)
-		return -EREMOTEIO;
-
-	len =3D be16_to_cpu(*(__be16 *) (buf + 2));
-	if (len > ST21NFCB_NCI_I2C_MAX_SIZE) {
-		nfc_err(&client->dev, "invalid frame len\n");
-		return -EBADMSG;
-	}
-
-	*skb =3D alloc_skb(ST21NFCB_NCI_I2C_MIN_SIZE + len, GFP_KERNEL);
-	if (*skb =3D=3D NULL)
-		return -ENOMEM;
-
-	skb_reserve(*skb, ST21NFCB_NCI_I2C_MIN_SIZE);
-	skb_put(*skb, ST21NFCB_NCI_I2C_MIN_SIZE);
-	memcpy((*skb)->data, buf, ST21NFCB_NCI_I2C_MIN_SIZE);
-
-	if (!len)
-		return 0;
-
-	r =3D i2c_master_recv(client, buf, len);
-	if (r !=3D len) {
-		kfree_skb(*skb);
-		return -EREMOTEIO;
-	}
-
-	skb_put(*skb, len);
-	memcpy((*skb)->data + ST21NFCB_NCI_I2C_MIN_SIZE, buf, len);
-
-	I2C_DUMP_SKB("i2c frame read", *skb);
-
-	return 0;
-}
-
-/*
- * Reads an ndlc frame from the chip.
- *
- * On ST21NFCB, IRQ goes in idle state when read starts.
- */
-static irqreturn_t st21nfcb_nci_irq_thread_fn(int irq, void *phy_id)
-{
-	struct st21nfcb_i2c_phy *phy =3D phy_id;
-	struct i2c_client *client;
-	struct sk_buff *skb =3D NULL;
-	int r;
-
-	if (!phy || !phy->ndlc || irq !=3D phy->i2c_dev->irq) {
-		WARN_ON_ONCE(1);
-		return IRQ_NONE;
-	}
-
-	client =3D phy->i2c_dev;
-	dev_dbg(&client->dev, "IRQ\n");
-
-	if (phy->ndlc->hard_fault)
-		return IRQ_HANDLED;
-
-	if (!phy->ndlc->powered) {
-		st21nfcb_nci_i2c_disable(phy);
-		return IRQ_HANDLED;
-	}
-
-	r =3D st21nfcb_nci_i2c_read(phy, &skb);
-	if (r =3D=3D -EREMOTEIO || r =3D=3D -ENOMEM || r =3D=3D -EBADMSG)
-		return IRQ_HANDLED;
-
-	ndlc_recv(phy->ndlc, skb);
-
-	return IRQ_HANDLED;
-}
-
-static struct nfc_phy_ops i2c_phy_ops =3D {
-	.write =3D st21nfcb_nci_i2c_write,
-	.enable =3D st21nfcb_nci_i2c_enable,
-	.disable =3D st21nfcb_nci_i2c_disable,
-};
-
-#ifdef CONFIG_OF
-static int st21nfcb_nci_i2c_of_request_resources(struct i2c_client *cl=
ient)
-{
-	struct st21nfcb_i2c_phy *phy =3D i2c_get_clientdata(client);
-	struct device_node *pp;
-	int gpio;
-	int r;
-
-	pp =3D client->dev.of_node;
-	if (!pp)
-		return -ENODEV;
-
-	/* Get GPIO from device tree */
-	gpio =3D of_get_named_gpio(pp, "reset-gpios", 0);
-	if (gpio < 0) {
-		nfc_err(&client->dev,
-			"Failed to retrieve reset-gpios from device tree\n");
-		return gpio;
-	}
-
-	/* GPIO request and configuration */
-	r =3D devm_gpio_request_one(&client->dev, gpio,
-				GPIOF_OUT_INIT_HIGH, "clf_reset");
-	if (r) {
-		nfc_err(&client->dev, "Failed to request reset pin\n");
-		return r;
-	}
-	phy->gpio_reset =3D gpio;
-
-	phy->irq_polarity =3D irq_get_trigger_type(client->irq);
-
-	return 0;
-}
-#else
-static int st21nfcb_nci_i2c_of_request_resources(struct i2c_client *cl=
ient)
-{
-	return -ENODEV;
-}
-#endif
-
-static int st21nfcb_nci_i2c_request_resources(struct i2c_client *clien=
t)
-{
-	struct st21nfcb_nfc_platform_data *pdata;
-	struct st21nfcb_i2c_phy *phy =3D i2c_get_clientdata(client);
-	int r;
-
-	pdata =3D client->dev.platform_data;
-	if (pdata =3D=3D NULL) {
-		nfc_err(&client->dev, "No platform data\n");
-		return -EINVAL;
-	}
-
-	/* store for later use */
-	phy->gpio_reset =3D pdata->gpio_reset;
-	phy->irq_polarity =3D pdata->irq_polarity;
-
-	r =3D devm_gpio_request_one(&client->dev,
-			phy->gpio_reset, GPIOF_OUT_INIT_HIGH, "clf_reset");
-	if (r) {
-		pr_err("%s : reset gpio_request failed\n", __FILE__);
-		return r;
-	}
-
-	return 0;
-}
-
-static int st21nfcb_nci_i2c_probe(struct i2c_client *client,
-				  const struct i2c_device_id *id)
-{
-	struct st21nfcb_i2c_phy *phy;
-	struct st21nfcb_nfc_platform_data *pdata;
-	int r;
-
-	dev_dbg(&client->dev, "%s\n", __func__);
-	dev_dbg(&client->dev, "IRQ: %d\n", client->irq);
-
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-		nfc_err(&client->dev, "Need I2C_FUNC_I2C\n");
-		return -ENODEV;
-	}
-
-	phy =3D devm_kzalloc(&client->dev, sizeof(struct st21nfcb_i2c_phy),
-			   GFP_KERNEL);
-	if (!phy)
-		return -ENOMEM;
-
-	phy->i2c_dev =3D client;
-
-	i2c_set_clientdata(client, phy);
-
-	pdata =3D client->dev.platform_data;
-	if (!pdata && client->dev.of_node) {
-		r =3D st21nfcb_nci_i2c_of_request_resources(client);
-		if (r) {
-			nfc_err(&client->dev, "No platform data\n");
-			return r;
-		}
-	} else if (pdata) {
-		r =3D st21nfcb_nci_i2c_request_resources(client);
-		if (r) {
-			nfc_err(&client->dev,
-				"Cannot get platform resources\n");
-			return r;
-		}
-	} else {
-		nfc_err(&client->dev,
-			"st21nfcb platform resources not available\n");
-		return -ENODEV;
-	}
-
-	r =3D ndlc_probe(phy, &i2c_phy_ops, &client->dev,
-			ST21NFCB_FRAME_HEADROOM, ST21NFCB_FRAME_TAILROOM,
-			&phy->ndlc);
-	if (r < 0) {
-		nfc_err(&client->dev, "Unable to register ndlc layer\n");
-		return r;
-	}
-
-	r =3D devm_request_threaded_irq(&client->dev, client->irq, NULL,
-				st21nfcb_nci_irq_thread_fn,
-				phy->irq_polarity | IRQF_ONESHOT,
-				ST21NFCB_NCI_DRIVER_NAME, phy);
-	if (r < 0)
-		nfc_err(&client->dev, "Unable to register IRQ handler\n");
-
-	return r;
-}
-
-static int st21nfcb_nci_i2c_remove(struct i2c_client *client)
-{
-	struct st21nfcb_i2c_phy *phy =3D i2c_get_clientdata(client);
-
-	dev_dbg(&client->dev, "%s\n", __func__);
-
-	ndlc_remove(phy->ndlc);
-
-	return 0;
-}
-
-#ifdef CONFIG_OF
-static const struct of_device_id of_st21nfcb_i2c_match[] =3D {
-	{ .compatible =3D "st,st21nfcb-i2c", },
-	{ .compatible =3D "st,st21nfcb_i2c", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, of_st21nfcb_i2c_match);
-#endif
-
-static struct i2c_driver st21nfcb_nci_i2c_driver =3D {
-	.driver =3D {
-		.owner =3D THIS_MODULE,
-		.name =3D ST21NFCB_NCI_I2C_DRIVER_NAME,
-		.of_match_table =3D of_match_ptr(of_st21nfcb_i2c_match),
-	},
-	.probe =3D st21nfcb_nci_i2c_probe,
-	.id_table =3D st21nfcb_nci_i2c_id_table,
-	.remove =3D st21nfcb_nci_i2c_remove,
-};
-
-module_i2c_driver(st21nfcb_nci_i2c_driver);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/nfc/st21nfcb/ndlc.c b/drivers/nfc/st21nfcb/ndlc.c
deleted file mode 100644
index aa1a5fc..0000000
--- a/drivers/nfc/st21nfcb/ndlc.c
+++ /dev/null
@@ -1,307 +0,0 @@
-/*
- * Low Level Transport (NDLC) Driver for STMicroelectronics NFC Chip
- *
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#include <linux/sched.h>
-#include <net/nfc/nci_core.h>
-
-#include "ndlc.h"
-#include "st21nfcb.h"
-
-#define NDLC_TIMER_T1		100
-#define NDLC_TIMER_T1_WAIT	400
-#define NDLC_TIMER_T2		1200
-
-#define PCB_TYPE_DATAFRAME		0x80
-#define PCB_TYPE_SUPERVISOR		0xc0
-#define PCB_TYPE_MASK			PCB_TYPE_SUPERVISOR
-
-#define PCB_SYNC_ACK			0x20
-#define PCB_SYNC_NACK			0x10
-#define PCB_SYNC_WAIT			0x30
-#define PCB_SYNC_NOINFO			0x00
-#define PCB_SYNC_MASK			PCB_SYNC_WAIT
-
-#define PCB_DATAFRAME_RETRANSMIT_YES	0x00
-#define PCB_DATAFRAME_RETRANSMIT_NO	0x04
-#define PCB_DATAFRAME_RETRANSMIT_MASK	PCB_DATAFRAME_RETRANSMIT_NO
-
-#define PCB_SUPERVISOR_RETRANSMIT_YES	0x00
-#define PCB_SUPERVISOR_RETRANSMIT_NO	0x02
-#define PCB_SUPERVISOR_RETRANSMIT_MASK	PCB_SUPERVISOR_RETRANSMIT_NO
-
-#define PCB_FRAME_CRC_INFO_PRESENT	0x08
-#define PCB_FRAME_CRC_INFO_NOTPRESENT	0x00
-#define PCB_FRAME_CRC_INFO_MASK		PCB_FRAME_CRC_INFO_PRESENT
-
-#define NDLC_DUMP_SKB(info, skb)                                 \
-do {                                                             \
-	pr_debug("%s:\n", info);                                 \
-	print_hex_dump(KERN_DEBUG, "ndlc: ", DUMP_PREFIX_OFFSET, \
-			16, 1, skb->data, skb->len, 0);          \
-} while (0)
-
-int ndlc_open(struct llt_ndlc *ndlc)
-{
-	/* toggle reset pin */
-	ndlc->ops->enable(ndlc->phy_id);
-	ndlc->powered =3D 1;
-	return st21nfcb_nci_set_mode(ndlc->ndev, 1);
-}
-EXPORT_SYMBOL(ndlc_open);
-
-void ndlc_close(struct llt_ndlc *ndlc)
-{
-	/* toggle reset pin */
-	ndlc->ops->enable(ndlc->phy_id);
-
-	st21nfcb_nci_set_mode(ndlc->ndev, 0);
-
-	ndlc->powered =3D 0;
-	ndlc->ops->disable(ndlc->phy_id);
-}
-EXPORT_SYMBOL(ndlc_close);
-
-int ndlc_send(struct llt_ndlc *ndlc, struct sk_buff *skb)
-{
-	/* add ndlc header */
-	u8 pcb =3D PCB_TYPE_DATAFRAME | PCB_DATAFRAME_RETRANSMIT_NO |
-		PCB_FRAME_CRC_INFO_NOTPRESENT;
-
-	*skb_push(skb, 1) =3D pcb;
-	skb_queue_tail(&ndlc->send_q, skb);
-
-	schedule_work(&ndlc->sm_work);
-
-	return 0;
-}
-EXPORT_SYMBOL(ndlc_send);
-
-static void llt_ndlc_send_queue(struct llt_ndlc *ndlc)
-{
-	struct sk_buff *skb;
-	int r;
-	unsigned long time_sent;
-
-	if (ndlc->send_q.qlen)
-		pr_debug("sendQlen=3D%d unackQlen=3D%d\n",
-			 ndlc->send_q.qlen, ndlc->ack_pending_q.qlen);
-
-	while (ndlc->send_q.qlen) {
-		skb =3D skb_dequeue(&ndlc->send_q);
-		NDLC_DUMP_SKB("ndlc frame written", skb);
-		r =3D ndlc->ops->write(ndlc->phy_id, skb);
-		if (r < 0) {
-			ndlc->hard_fault =3D r;
-			break;
-		}
-		time_sent =3D jiffies;
-		*(unsigned long *)skb->cb =3D time_sent;
-
-		skb_queue_tail(&ndlc->ack_pending_q, skb);
-
-		/* start timer t1 for ndlc aknowledge */
-		ndlc->t1_active =3D true;
-		mod_timer(&ndlc->t1_timer, time_sent +
-			msecs_to_jiffies(NDLC_TIMER_T1));
-		/* start timer t2 for chip availability */
-		ndlc->t2_active =3D true;
-		mod_timer(&ndlc->t2_timer, time_sent +
-			msecs_to_jiffies(NDLC_TIMER_T2));
-	}
-}
-
-static void llt_ndlc_requeue_data_pending(struct llt_ndlc *ndlc)
-{
-	struct sk_buff *skb;
-	u8 pcb;
-
-	while ((skb =3D skb_dequeue_tail(&ndlc->ack_pending_q))) {
-		pcb =3D skb->data[0];
-		switch (pcb & PCB_TYPE_MASK) {
-		case PCB_TYPE_SUPERVISOR:
-			skb->data[0] =3D (pcb & ~PCB_SUPERVISOR_RETRANSMIT_MASK) |
-				PCB_SUPERVISOR_RETRANSMIT_YES;
-			break;
-		case PCB_TYPE_DATAFRAME:
-			skb->data[0] =3D (pcb & ~PCB_DATAFRAME_RETRANSMIT_MASK) |
-				PCB_DATAFRAME_RETRANSMIT_YES;
-			break;
-		default:
-			pr_err("UNKNOWN Packet Control Byte=3D%d\n", pcb);
-			kfree_skb(skb);
-			continue;
-		}
-		skb_queue_head(&ndlc->send_q, skb);
-	}
-}
-
-static void llt_ndlc_rcv_queue(struct llt_ndlc *ndlc)
-{
-	struct sk_buff *skb;
-	u8 pcb;
-	unsigned long time_sent;
-
-	if (ndlc->rcv_q.qlen)
-		pr_debug("rcvQlen=3D%d\n", ndlc->rcv_q.qlen);
-
-	while ((skb =3D skb_dequeue(&ndlc->rcv_q)) !=3D NULL) {
-		pcb =3D skb->data[0];
-		skb_pull(skb, 1);
-		if ((pcb & PCB_TYPE_MASK) =3D=3D PCB_TYPE_SUPERVISOR) {
-			switch (pcb & PCB_SYNC_MASK) {
-			case PCB_SYNC_ACK:
-				del_timer_sync(&ndlc->t1_timer);
-				del_timer_sync(&ndlc->t2_timer);
-				ndlc->t2_active =3D false;
-				ndlc->t1_active =3D false;
-				break;
-			case PCB_SYNC_NACK:
-				llt_ndlc_requeue_data_pending(ndlc);
-				llt_ndlc_send_queue(ndlc);
-				/* start timer t1 for ndlc aknowledge */
-				time_sent =3D jiffies;
-				ndlc->t1_active =3D true;
-				mod_timer(&ndlc->t1_timer, time_sent +
-					msecs_to_jiffies(NDLC_TIMER_T1));
-				break;
-			case PCB_SYNC_WAIT:
-				time_sent =3D jiffies;
-				ndlc->t1_active =3D true;
-				mod_timer(&ndlc->t1_timer, time_sent +
-					  msecs_to_jiffies(NDLC_TIMER_T1_WAIT));
-				break;
-			default:
-				pr_err("UNKNOWN Packet Control Byte=3D%d\n", pcb);
-				kfree_skb(skb);
-				break;
-			}
-		} else {
-			nci_recv_frame(ndlc->ndev, skb);
-		}
-	}
-}
-
-static void llt_ndlc_sm_work(struct work_struct *work)
-{
-	struct llt_ndlc *ndlc =3D container_of(work, struct llt_ndlc, sm_work=
);
-
-	llt_ndlc_send_queue(ndlc);
-	llt_ndlc_rcv_queue(ndlc);
-
-	if (ndlc->t1_active && timer_pending(&ndlc->t1_timer) =3D=3D 0) {
-		pr_debug
-		    ("Handle T1(recv SUPERVISOR) elapsed (T1 now inactive)\n");
-		ndlc->t1_active =3D false;
-
-		llt_ndlc_requeue_data_pending(ndlc);
-		llt_ndlc_send_queue(ndlc);
-	}
-
-	if (ndlc->t2_active && timer_pending(&ndlc->t2_timer) =3D=3D 0) {
-		pr_debug("Handle T2(recv DATA) elapsed (T2 now inactive)\n");
-		ndlc->t2_active =3D false;
-		ndlc->t1_active =3D false;
-		del_timer_sync(&ndlc->t1_timer);
-		del_timer_sync(&ndlc->t2_timer);
-		ndlc_close(ndlc);
-		ndlc->hard_fault =3D -EREMOTEIO;
-	}
-}
-
-void ndlc_recv(struct llt_ndlc *ndlc, struct sk_buff *skb)
-{
-	if (skb =3D=3D NULL) {
-		pr_err("NULL Frame -> link is dead\n");
-		ndlc->hard_fault =3D -EREMOTEIO;
-		ndlc_close(ndlc);
-	} else {
-		NDLC_DUMP_SKB("incoming frame", skb);
-		skb_queue_tail(&ndlc->rcv_q, skb);
-	}
-
-	schedule_work(&ndlc->sm_work);
-}
-EXPORT_SYMBOL(ndlc_recv);
-
-static void ndlc_t1_timeout(unsigned long data)
-{
-	struct llt_ndlc *ndlc =3D (struct llt_ndlc *)data;
-
-	pr_debug("\n");
-
-	schedule_work(&ndlc->sm_work);
-}
-
-static void ndlc_t2_timeout(unsigned long data)
-{
-	struct llt_ndlc *ndlc =3D (struct llt_ndlc *)data;
-
-	pr_debug("\n");
-
-	schedule_work(&ndlc->sm_work);
-}
-
-int ndlc_probe(void *phy_id, struct nfc_phy_ops *phy_ops, struct devic=
e *dev,
-	       int phy_headroom, int phy_tailroom, struct llt_ndlc **ndlc_id)
-{
-	struct llt_ndlc *ndlc;
-
-	ndlc =3D devm_kzalloc(dev, sizeof(struct llt_ndlc), GFP_KERNEL);
-	if (!ndlc)
-		return -ENOMEM;
-
-	ndlc->ops =3D phy_ops;
-	ndlc->phy_id =3D phy_id;
-	ndlc->dev =3D dev;
-	ndlc->powered =3D 0;
-
-	*ndlc_id =3D ndlc;
-
-	/* initialize timers */
-	init_timer(&ndlc->t1_timer);
-	ndlc->t1_timer.data =3D (unsigned long)ndlc;
-	ndlc->t1_timer.function =3D ndlc_t1_timeout;
-
-	init_timer(&ndlc->t2_timer);
-	ndlc->t2_timer.data =3D (unsigned long)ndlc;
-	ndlc->t2_timer.function =3D ndlc_t2_timeout;
-
-	skb_queue_head_init(&ndlc->rcv_q);
-	skb_queue_head_init(&ndlc->send_q);
-	skb_queue_head_init(&ndlc->ack_pending_q);
-
-	INIT_WORK(&ndlc->sm_work, llt_ndlc_sm_work);
-
-	return st21nfcb_nci_probe(ndlc, phy_headroom, phy_tailroom);
-}
-EXPORT_SYMBOL(ndlc_probe);
-
-void ndlc_remove(struct llt_ndlc *ndlc)
-{
-	st21nfcb_nci_remove(ndlc->ndev);
-
-	/* cancel timers */
-	del_timer_sync(&ndlc->t1_timer);
-	del_timer_sync(&ndlc->t2_timer);
-	ndlc->t2_active =3D false;
-	ndlc->t1_active =3D false;
-
-	skb_queue_purge(&ndlc->rcv_q);
-	skb_queue_purge(&ndlc->send_q);
-}
-EXPORT_SYMBOL(ndlc_remove);
diff --git a/drivers/nfc/st21nfcb/ndlc.h b/drivers/nfc/st21nfcb/ndlc.h
deleted file mode 100644
index cf6a9d9..0000000
--- a/drivers/nfc/st21nfcb/ndlc.h
+++ /dev/null
@@ -1,60 +0,0 @@
-/*
- * NCI based Driver for STMicroelectronics NFC Chip
- *
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#ifndef __LOCAL_NDLC_H_
-#define __LOCAL_NDLC_H_
-
-#include <linux/skbuff.h>
-#include <net/nfc/nfc.h>
-
-/* Low Level Transport description */
-struct llt_ndlc {
-	struct nci_dev *ndev;
-	struct nfc_phy_ops *ops;
-	void *phy_id;
-
-	struct timer_list t1_timer;
-	bool t1_active;
-
-	struct timer_list t2_timer;
-	bool t2_active;
-
-	struct sk_buff_head rcv_q;
-	struct sk_buff_head send_q;
-	struct sk_buff_head ack_pending_q;
-
-	struct work_struct sm_work;
-
-	struct device *dev;
-
-	/*
-	 * < 0 if hardware error occured
-	 * and prevents normal operation.
-	 */
-	int hard_fault;
-	int powered;
-};
-
-int ndlc_open(struct llt_ndlc *ndlc);
-void ndlc_close(struct llt_ndlc *ndlc);
-int ndlc_send(struct llt_ndlc *ndlc, struct sk_buff *skb);
-void ndlc_recv(struct llt_ndlc *ndlc, struct sk_buff *skb);
-int ndlc_probe(void *phy_id, struct nfc_phy_ops *phy_ops, struct devic=
e *dev,
-	int phy_headroom, int phy_tailroom, struct llt_ndlc **ndlc_id);
-void ndlc_remove(struct llt_ndlc *ndlc);
-#endif /* __LOCAL_NDLC_H__ */
diff --git a/drivers/nfc/st21nfcb/st21nfcb.c b/drivers/nfc/st21nfcb/st2=
1nfcb.c
deleted file mode 100644
index defc056..0000000
--- a/drivers/nfc/st21nfcb/st21nfcb.c
+++ /dev/null
@@ -1,245 +0,0 @@
-/*
- * NCI based Driver for STMicroelectronics NFC Chip
- *
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#include <linux/module.h>
-#include <linux/nfc.h>
-#include <net/nfc/nci.h>
-#include <net/nfc/nci_core.h>
-#include <linux/gpio.h>
-#include <linux/delay.h>
-
-#include "st21nfcb.h"
-#include "st21nfcb_se.h"
-
-#define DRIVER_DESC "NCI NFC driver for ST21NFCB"
-
-#define ST21NFCB_NCI1_X_PROPRIETARY_ISO15693 0x83
-#define ST21NFCB_SET_NFC_MODE		0x02
-
-#define NCI_OP_PROP_CMD nci_opcode_pack(NCI_GID_PROPRIETARY, 0x01)
-#define NCI_OP_PROP_RSP nci_opcode_pack(NCI_GID_PROPRIETARY, 0x01)
-
-struct nci_mode_set_cmd {
-	u8 cmd_type;
-	u8 mode;
-} __packed;
-
-struct nci_mode_set_rsp {
-	u8 status;
-} __packed;
-
-static int st21nfcb_nci_prop_request(struct nci_dev *ndev,
-				     void (*req)(struct nci_dev *ndev,
-						 unsigned long opt),
-				     unsigned long opt, __u32 timeout)
-{
-	int r =3D 0;
-	long completion_r;
-
-	ndev->req_status =3D NCI_REQ_PEND;
-
-	reinit_completion(&ndev->req_completion);
-	req(ndev, opt);
-	completion_r =3D
-		wait_for_completion_interruptible_timeout(&ndev->req_completion,
-							  timeout);
-
-	pr_debug("wait_for_completion return %ld\n", completion_r);
-
-	if (completion_r > 0) {
-		switch (ndev->req_status) {
-		case NCI_REQ_DONE:
-			r =3D nci_to_errno(ndev->req_result);
-			break;
-
-		case NCI_REQ_CANCELED:
-			r =3D -ndev->req_result;
-			break;
-
-		default:
-			r =3D -ETIMEDOUT;
-			break;
-		}
-	} else {
-		pr_err("wait_for_completion_interruptible_timeout failed %ld\n",
-		       completion_r);
-
-		r =3D ((completion_r =3D=3D 0) ? (-ETIMEDOUT) : (completion_r));
-	}
-
-	ndev->req_status =3D ndev->req_result =3D 0;
-	return r;
-}
-
-static void st21nfcb_nci_set_mode_req(struct nci_dev *ndev, unsigned l=
ong opt)
-{
-	struct nci_mode_set_cmd cmd;
-	__u8 mode =3D opt;
-
-	cmd.cmd_type  =3D ST21NFCB_SET_NFC_MODE;
-	cmd.mode =3D mode;
-
-	nci_send_cmd(ndev, NCI_OP_PROP_CMD,
-		     sizeof(struct nci_mode_set_cmd), &cmd);
-}
-
-int st21nfcb_nci_set_mode(struct nci_dev *ndev, u8 mode)
-{
-	atomic_set(&ndev->cmd_cnt, 1);
-	set_bit(NCI_INIT, &ndev->flags);
-	return st21nfcb_nci_prop_request(ndev, st21nfcb_nci_set_mode_req,
-				mode, msecs_to_jiffies(NCI_CMD_TIMEOUT));
-}
-
-static int st21nfcb_nci_open(struct nci_dev *ndev)
-{
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-	int r;
-
-	if (test_and_set_bit(ST21NFCB_NCI_RUNNING, &info->flags))
-		return 0;
-
-	r =3D ndlc_open(info->ndlc);
-	if (r)
-		clear_bit(ST21NFCB_NCI_RUNNING, &info->flags);
-
-	return r;
-}
-
-static int st21nfcb_nci_close(struct nci_dev *ndev)
-{
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-
-	if (!test_bit(ST21NFCB_NCI_RUNNING, &info->flags))
-		return 0;
-
-	ndlc_close(info->ndlc);
-
-	clear_bit(ST21NFCB_NCI_RUNNING, &info->flags);
-
-	return 0;
-}
-
-static int st21nfcb_nci_send(struct nci_dev *ndev, struct sk_buff *skb=
)
-{
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-
-	skb->dev =3D (void *)ndev;
-
-	if (!test_bit(ST21NFCB_NCI_RUNNING, &info->flags))
-		return -EBUSY;
-
-	return ndlc_send(info->ndlc, skb);
-}
-
-static __u32 st21nfcb_nci_get_rfprotocol(struct nci_dev *ndev,
-					 __u8 rf_protocol)
-{
-	return rf_protocol =3D=3D ST21NFCB_NCI1_X_PROPRIETARY_ISO15693 ?
-		NFC_PROTO_ISO15693_MASK : 0;
-}
-
-static void nci_core_prop_rsp_packet(struct nci_dev *ndev,
-				     struct sk_buff *skb)
-{
-	__u8 status =3D skb->data[0];
-
-	nci_req_complete(ndev, status);
-}
-
-static int st21nfcb_nci_rsp_packet(struct nci_dev *ndev, __u16 rsp_opc=
ode,
-				   struct sk_buff *skb)
-{
-	switch (rsp_opcode) {
-	case NCI_OP_PROP_RSP:
-		nci_core_prop_rsp_packet(ndev, skb);
-		return 0;
-	default:
-		return -EPROTO;
-	}
-}
-
-static struct nci_ops st21nfcb_nci_ops =3D {
-	.open =3D st21nfcb_nci_open,
-	.close =3D st21nfcb_nci_close,
-	.send =3D st21nfcb_nci_send,
-	.get_rfprotocol =3D st21nfcb_nci_get_rfprotocol,
-	.discover_se =3D st21nfcb_nci_discover_se,
-	.enable_se =3D st21nfcb_nci_enable_se,
-	.disable_se =3D st21nfcb_nci_disable_se,
-	.se_io =3D st21nfcb_nci_se_io,
-	.hci_load_session =3D st21nfcb_hci_load_session,
-	.hci_event_received =3D st21nfcb_hci_event_received,
-	.hci_cmd_received =3D st21nfcb_hci_cmd_received,
-	.prop_rsp_packet =3D st21nfcb_nci_rsp_packet,
-};
-
-int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
-		       int phy_tailroom)
-{
-	struct st21nfcb_nci_info *info;
-	int r;
-	u32 protocols;
-
-	info =3D devm_kzalloc(ndlc->dev,
-			sizeof(struct st21nfcb_nci_info), GFP_KERNEL);
-	if (!info)
-		return -ENOMEM;
-
-	protocols =3D NFC_PROTO_JEWEL_MASK
-		| NFC_PROTO_MIFARE_MASK
-		| NFC_PROTO_FELICA_MASK
-		| NFC_PROTO_ISO14443_MASK
-		| NFC_PROTO_ISO14443_B_MASK
-		| NFC_PROTO_ISO15693_MASK
-		| NFC_PROTO_NFC_DEP_MASK;
-
-	ndlc->ndev =3D nci_allocate_device(&st21nfcb_nci_ops, protocols,
-					phy_headroom, phy_tailroom);
-	if (!ndlc->ndev) {
-		pr_err("Cannot allocate nfc ndev\n");
-		return -ENOMEM;
-	}
-	info->ndlc =3D ndlc;
-
-	nci_set_drvdata(ndlc->ndev, info);
-
-	r =3D nci_register_device(ndlc->ndev);
-	if (r) {
-		pr_err("Cannot register nfc device to nci core\n");
-		nci_free_device(ndlc->ndev);
-		return r;
-	}
-
-	return st21nfcb_se_init(ndlc->ndev);
-}
-EXPORT_SYMBOL_GPL(st21nfcb_nci_probe);
-
-void st21nfcb_nci_remove(struct nci_dev *ndev)
-{
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-
-	ndlc_close(info->ndlc);
-
-	nci_unregister_device(ndev);
-	nci_free_device(ndev);
-}
-EXPORT_SYMBOL_GPL(st21nfcb_nci_remove);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/nfc/st21nfcb/st21nfcb.h b/drivers/nfc/st21nfcb/st2=
1nfcb.h
deleted file mode 100644
index e3cfc0c..0000000
--- a/drivers/nfc/st21nfcb/st21nfcb.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/*
- * NCI based Driver for STMicroelectronics NFC Chip
- *
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#ifndef __LOCAL_ST21NFCB_H_
-#define __LOCAL_ST21NFCB_H_
-
-#include "st21nfcb_se.h"
-#include "ndlc.h"
-
-/* Define private flags: */
-#define ST21NFCB_NCI_RUNNING			1
-
-struct st21nfcb_nci_info {
-	struct llt_ndlc *ndlc;
-	unsigned long flags;
-	struct st21nfcb_se_info se_info;
-};
-
-void st21nfcb_nci_remove(struct nci_dev *ndev);
-int st21nfcb_nci_probe(struct llt_ndlc *ndlc, int phy_headroom,
-		int phy_tailroom);
-int st21nfcb_nci_set_mode(struct nci_dev *ndev, u8 mode);
-
-#endif /* __LOCAL_ST21NFCB_H_ */
diff --git a/drivers/nfc/st21nfcb/st21nfcb_se.c b/drivers/nfc/st21nfcb/=
st21nfcb_se.c
deleted file mode 100644
index 24862a5..0000000
--- a/drivers/nfc/st21nfcb/st21nfcb_se.c
+++ /dev/null
@@ -1,713 +0,0 @@
-/*
- * NCI based Driver for STMicroelectronics NFC Chip
- *
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#include <linux/module.h>
-#include <linux/nfc.h>
-#include <linux/delay.h>
-#include <net/nfc/nci.h>
-#include <net/nfc/nci_core.h>
-
-#include "st21nfcb.h"
-#include "st21nfcb_se.h"
-
-struct st21nfcb_pipe_info {
-	u8 pipe_state;
-	u8 src_host_id;
-	u8 src_gate_id;
-	u8 dst_host_id;
-	u8 dst_gate_id;
-} __packed;
-
-/* Hosts */
-#define ST21NFCB_HOST_CONTROLLER_ID     0x00
-#define ST21NFCB_TERMINAL_HOST_ID       0x01
-#define ST21NFCB_UICC_HOST_ID           0x02
-#define ST21NFCB_ESE_HOST_ID            0xc0
-
-/* Gates */
-#define ST21NFCB_DEVICE_MGNT_GATE       0x01
-#define ST21NFCB_APDU_READER_GATE       0xf0
-#define ST21NFCB_CONNECTIVITY_GATE      0x41
-
-/* Pipes */
-#define ST21NFCB_DEVICE_MGNT_PIPE               0x02
-
-/* Connectivity pipe only */
-#define ST21NFCB_SE_COUNT_PIPE_UICC             0x01
-/* Connectivity + APDU Reader pipe */
-#define ST21NFCB_SE_COUNT_PIPE_EMBEDDED         0x02
-
-#define ST21NFCB_SE_TO_HOT_PLUG			1000 /* msecs */
-#define ST21NFCB_SE_TO_PIPES			2000
-
-#define ST21NFCB_EVT_HOT_PLUG_IS_INHIBITED(x)   (x->data[0] & 0x80)
-
-#define NCI_HCI_APDU_PARAM_ATR                     0x01
-#define NCI_HCI_ADMIN_PARAM_SESSION_IDENTITY       0x01
-#define NCI_HCI_ADMIN_PARAM_WHITELIST              0x03
-#define NCI_HCI_ADMIN_PARAM_HOST_LIST              0x04
-
-#define ST21NFCB_EVT_SE_HARD_RESET		0x20
-#define ST21NFCB_EVT_TRANSMIT_DATA		0x10
-#define ST21NFCB_EVT_WTX_REQUEST		0x11
-#define ST21NFCB_EVT_SE_SOFT_RESET		0x11
-#define ST21NFCB_EVT_SE_END_OF_APDU_TRANSFER	0x21
-#define ST21NFCB_EVT_HOT_PLUG			0x03
-
-#define ST21NFCB_SE_MODE_OFF                    0x00
-#define ST21NFCB_SE_MODE_ON                     0x01
-
-#define ST21NFCB_EVT_CONNECTIVITY       0x10
-#define ST21NFCB_EVT_TRANSACTION        0x12
-
-#define ST21NFCB_DM_GETINFO             0x13
-#define ST21NFCB_DM_GETINFO_PIPE_LIST   0x02
-#define ST21NFCB_DM_GETINFO_PIPE_INFO   0x01
-#define ST21NFCB_DM_PIPE_CREATED        0x02
-#define ST21NFCB_DM_PIPE_OPEN           0x04
-#define ST21NFCB_DM_RF_ACTIVE           0x80
-#define ST21NFCB_DM_DISCONNECT          0x30
-
-#define ST21NFCB_DM_IS_PIPE_OPEN(p) \
-	((p & 0x0f) =3D=3D (ST21NFCB_DM_PIPE_CREATED | ST21NFCB_DM_PIPE_OPEN)=
)
-
-#define ST21NFCB_ATR_DEFAULT_BWI        0x04
-
-/*
- * WT =3D 2^BWI/10[s], convert into msecs and add a secure
- * room by increasing by 2 this timeout
- */
-#define ST21NFCB_BWI_TO_TIMEOUT(x)      ((1 << x) * 200)
-#define ST21NFCB_ATR_GET_Y_FROM_TD(x)   (x >> 4)
-
-/* If TA is present bit 0 is set */
-#define ST21NFCB_ATR_TA_PRESENT(x) (x & 0x01)
-/* If TB is present bit 1 is set */
-#define ST21NFCB_ATR_TB_PRESENT(x) (x & 0x02)
-
-#define ST21NFCB_NUM_DEVICES           256
-
-static DECLARE_BITMAP(dev_mask, ST21NFCB_NUM_DEVICES);
-
-/* Here are the mandatory pipe for st21nfcb */
-static struct nci_hci_gate st21nfcb_gates[] =3D {
-	{NCI_HCI_ADMIN_GATE, NCI_HCI_ADMIN_PIPE,
-					ST21NFCB_HOST_CONTROLLER_ID},
-	{NCI_HCI_LINK_MGMT_GATE, NCI_HCI_LINK_MGMT_PIPE,
-					ST21NFCB_HOST_CONTROLLER_ID},
-	{ST21NFCB_DEVICE_MGNT_GATE, ST21NFCB_DEVICE_MGNT_PIPE,
-					ST21NFCB_HOST_CONTROLLER_ID},
-
-	/* Secure element pipes are created by secure element host */
-	{ST21NFCB_CONNECTIVITY_GATE, NCI_HCI_DO_NOT_OPEN_PIPE,
-					ST21NFCB_HOST_CONTROLLER_ID},
-	{ST21NFCB_APDU_READER_GATE, NCI_HCI_DO_NOT_OPEN_PIPE,
-					ST21NFCB_HOST_CONTROLLER_ID},
-};
-
-static u8 st21nfcb_se_get_bwi(struct nci_dev *ndev)
-{
-	int i;
-	u8 td;
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-
-	/* Bits 8 to 5 of the first TB for T=3D1 encode BWI from zero to nine=
 */
-	for (i =3D 1; i < ST21NFCB_ESE_MAX_LENGTH; i++) {
-		td =3D ST21NFCB_ATR_GET_Y_FROM_TD(info->se_info.atr[i]);
-		if (ST21NFCB_ATR_TA_PRESENT(td))
-			i++;
-		if (ST21NFCB_ATR_TB_PRESENT(td)) {
-			i++;
-			return info->se_info.atr[i] >> 4;
-		}
-	}
-	return ST21NFCB_ATR_DEFAULT_BWI;
-}
-
-static void st21nfcb_se_get_atr(struct nci_dev *ndev)
-{
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-	int r;
-	struct sk_buff *skb;
-
-	r =3D nci_hci_get_param(ndev, ST21NFCB_APDU_READER_GATE,
-				NCI_HCI_APDU_PARAM_ATR, &skb);
-	if (r < 0)
-		return;
-
-	if (skb->len <=3D ST21NFCB_ESE_MAX_LENGTH) {
-		memcpy(info->se_info.atr, skb->data, skb->len);
-
-		info->se_info.wt_timeout =3D
-			ST21NFCB_BWI_TO_TIMEOUT(st21nfcb_se_get_bwi(ndev));
-	}
-	kfree_skb(skb);
-}
-
-int st21nfcb_hci_load_session(struct nci_dev *ndev)
-{
-	int i, j, r;
-	struct sk_buff *skb_pipe_list, *skb_pipe_info;
-	struct st21nfcb_pipe_info *dm_pipe_info;
-	u8 pipe_list[] =3D { ST21NFCB_DM_GETINFO_PIPE_LIST,
-			ST21NFCB_TERMINAL_HOST_ID};
-	u8 pipe_info[] =3D { ST21NFCB_DM_GETINFO_PIPE_INFO,
-			ST21NFCB_TERMINAL_HOST_ID, 0};
-
-	/* On ST21NFCB device pipes number are dynamics
-	 * If pipes are already created, hci_dev_up will fail.
-	 * Doing a clear all pipe is a bad idea because:
-	 * - It does useless EEPROM cycling
-	 * - It might cause issue for secure elements support
-	 * (such as removing connectivity or APDU reader pipe)
-	 * A better approach on ST21NFCB is to:
-	 * - get a pipe list for each host.
-	 * (eg: ST21NFCB_HOST_CONTROLLER_ID for now).
-	 * (TODO Later on UICC HOST and eSE HOST)
-	 * - get pipe information
-	 * - match retrieved pipe list in st21nfcb_gates
-	 * ST21NFCB_DEVICE_MGNT_GATE is a proprietary gate
-	 * with ST21NFCB_DEVICE_MGNT_PIPE.
-	 * Pipe can be closed and need to be open.
-	 */
-	r =3D nci_hci_connect_gate(ndev, ST21NFCB_HOST_CONTROLLER_ID,
-				ST21NFCB_DEVICE_MGNT_GATE,
-				ST21NFCB_DEVICE_MGNT_PIPE);
-	if (r < 0)
-		goto free_info;
-
-	/* Get pipe list */
-	r =3D nci_hci_send_cmd(ndev, ST21NFCB_DEVICE_MGNT_GATE,
-			ST21NFCB_DM_GETINFO, pipe_list, sizeof(pipe_list),
-			&skb_pipe_list);
-	if (r < 0)
-		goto free_info;
-
-	/* Complete the existing gate_pipe table */
-	for (i =3D 0; i < skb_pipe_list->len; i++) {
-		pipe_info[2] =3D skb_pipe_list->data[i];
-		r =3D nci_hci_send_cmd(ndev, ST21NFCB_DEVICE_MGNT_GATE,
-					ST21NFCB_DM_GETINFO, pipe_info,
-					sizeof(pipe_info), &skb_pipe_info);
-
-		if (r)
-			continue;
-
-		/*
-		 * Match pipe ID and gate ID
-		 * Output format from ST21NFC_DM_GETINFO is:
-		 * - pipe state (1byte)
-		 * - source hid (1byte)
-		 * - source gid (1byte)
-		 * - destination hid (1byte)
-		 * - destination gid (1byte)
-		 */
-		dm_pipe_info =3D (struct st21nfcb_pipe_info *)skb_pipe_info->data;
-		if (dm_pipe_info->dst_gate_id =3D=3D ST21NFCB_APDU_READER_GATE &&
-		    dm_pipe_info->src_host_id !=3D ST21NFCB_ESE_HOST_ID) {
-			pr_err("Unexpected apdu_reader pipe on host %x\n",
-			       dm_pipe_info->src_host_id);
-			continue;
-		}
-
-		for (j =3D 0; (j < ARRAY_SIZE(st21nfcb_gates)) &&
-		     (st21nfcb_gates[j].gate !=3D dm_pipe_info->dst_gate_id); j++)
-			;
-
-		if (j < ARRAY_SIZE(st21nfcb_gates) &&
-		    st21nfcb_gates[j].gate =3D=3D dm_pipe_info->dst_gate_id &&
-		    ST21NFCB_DM_IS_PIPE_OPEN(dm_pipe_info->pipe_state)) {
-			st21nfcb_gates[j].pipe =3D pipe_info[2];
-
-			ndev->hci_dev->gate2pipe[st21nfcb_gates[j].gate] =3D
-						st21nfcb_gates[j].pipe;
-			ndev->hci_dev->pipes[st21nfcb_gates[j].pipe].gate =3D
-						st21nfcb_gates[j].gate;
-			ndev->hci_dev->pipes[st21nfcb_gates[j].pipe].host =3D
-						dm_pipe_info->src_host_id;
-		}
-	}
-
-	memcpy(ndev->hci_dev->init_data.gates, st21nfcb_gates,
-	       sizeof(st21nfcb_gates));
-
-free_info:
-	kfree_skb(skb_pipe_info);
-	kfree_skb(skb_pipe_list);
-	return r;
-}
-EXPORT_SYMBOL_GPL(st21nfcb_hci_load_session);
-
-static void st21nfcb_hci_admin_event_received(struct nci_dev *ndev,
-					      u8 event, struct sk_buff *skb)
-{
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-
-	switch (event) {
-	case ST21NFCB_EVT_HOT_PLUG:
-		if (info->se_info.se_active) {
-			if (!ST21NFCB_EVT_HOT_PLUG_IS_INHIBITED(skb)) {
-				del_timer_sync(&info->se_info.se_active_timer);
-				info->se_info.se_active =3D false;
-				complete(&info->se_info.req_completion);
-			} else {
-				mod_timer(&info->se_info.se_active_timer,
-				      jiffies +
-				      msecs_to_jiffies(ST21NFCB_SE_TO_PIPES));
-			}
-		}
-	break;
-	}
-}
-
-static int st21nfcb_hci_apdu_reader_event_received(struct nci_dev *nde=
v,
-						   u8 event,
-						   struct sk_buff *skb)
-{
-	int r =3D 0;
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-
-	pr_debug("apdu reader gate event: %x\n", event);
-
-	switch (event) {
-	case ST21NFCB_EVT_TRANSMIT_DATA:
-		del_timer_sync(&info->se_info.bwi_timer);
-		info->se_info.bwi_active =3D false;
-		info->se_info.cb(info->se_info.cb_context,
-				 skb->data, skb->len, 0);
-	break;
-	case ST21NFCB_EVT_WTX_REQUEST:
-		mod_timer(&info->se_info.bwi_timer, jiffies +
-			  msecs_to_jiffies(info->se_info.wt_timeout));
-	break;
-	}
-
-	kfree_skb(skb);
-	return r;
-}
-
-/*
- * Returns:
- * <=3D 0: driver handled the event, skb consumed
- *    1: driver does not handle the event, please do standard processi=
ng
- */
-static int st21nfcb_hci_connectivity_event_received(struct nci_dev *nd=
ev,
-						u8 host, u8 event,
-						struct sk_buff *skb)
-{
-	int r =3D 0;
-	struct device *dev =3D &ndev->nfc_dev->dev;
-	struct nfc_evt_transaction *transaction;
-
-	pr_debug("connectivity gate event: %x\n", event);
-
-	switch (event) {
-	case ST21NFCB_EVT_CONNECTIVITY:
-
-	break;
-	case ST21NFCB_EVT_TRANSACTION:
-		/* According to specification etsi 102 622
-		 * 11.2.2.4 EVT_TRANSACTION Table 52
-		 * Description  Tag     Length
-		 * AID          81      5 to 16
-		 * PARAMETERS   82      0 to 255
-		 */
-		if (skb->len < NFC_MIN_AID_LENGTH + 2 &&
-		    skb->data[0] !=3D NFC_EVT_TRANSACTION_AID_TAG)
-			return -EPROTO;
-
-		transaction =3D (struct nfc_evt_transaction *)devm_kzalloc(dev,
-					    skb->len - 2, GFP_KERNEL);
-
-		transaction->aid_len =3D skb->data[1];
-		memcpy(transaction->aid, &skb->data[2], transaction->aid_len);
-
-		/* Check next byte is PARAMETERS tag (82) */
-		if (skb->data[transaction->aid_len + 2] !=3D
-		    NFC_EVT_TRANSACTION_PARAMS_TAG)
-			return -EPROTO;
-
-		transaction->params_len =3D skb->data[transaction->aid_len + 3];
-		memcpy(transaction->params, skb->data +
-		       transaction->aid_len + 4, transaction->params_len);
-
-		r =3D nfc_se_transaction(ndev->nfc_dev, host, transaction);
-		break;
-	default:
-		return 1;
-	}
-	kfree_skb(skb);
-	return r;
-}
-
-void st21nfcb_hci_event_received(struct nci_dev *ndev, u8 pipe,
-				 u8 event, struct sk_buff *skb)
-{
-	u8 gate =3D ndev->hci_dev->pipes[pipe].gate;
-	u8 host =3D ndev->hci_dev->pipes[pipe].host;
-
-	switch (gate) {
-	case NCI_HCI_ADMIN_GATE:
-		st21nfcb_hci_admin_event_received(ndev, event, skb);
-	break;
-	case ST21NFCB_APDU_READER_GATE:
-		st21nfcb_hci_apdu_reader_event_received(ndev, event, skb);
-	break;
-	case ST21NFCB_CONNECTIVITY_GATE:
-		st21nfcb_hci_connectivity_event_received(ndev, host, event,
-							 skb);
-	break;
-	}
-}
-EXPORT_SYMBOL_GPL(st21nfcb_hci_event_received);
-
-
-void st21nfcb_hci_cmd_received(struct nci_dev *ndev, u8 pipe, u8 cmd,
-			       struct sk_buff *skb)
-{
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-	u8 gate =3D ndev->hci_dev->pipes[pipe].gate;
-
-	pr_debug("cmd: %x\n", cmd);
-
-	switch (cmd) {
-	case NCI_HCI_ANY_OPEN_PIPE:
-		if (gate !=3D ST21NFCB_APDU_READER_GATE &&
-		    ndev->hci_dev->pipes[pipe].host !=3D ST21NFCB_UICC_HOST_ID)
-			ndev->hci_dev->count_pipes++;
-
-		if (ndev->hci_dev->count_pipes =3D=3D
-		    ndev->hci_dev->expected_pipes) {
-			del_timer_sync(&info->se_info.se_active_timer);
-			info->se_info.se_active =3D false;
-			ndev->hci_dev->count_pipes =3D 0;
-			complete(&info->se_info.req_completion);
-		}
-	break;
-	}
-}
-EXPORT_SYMBOL_GPL(st21nfcb_hci_cmd_received);
-
-/*
- * Remarks: On some early st21nfcb firmware, nci_nfcee_mode_set(0)
- * is rejected
- */
-static int st21nfcb_nci_control_se(struct nci_dev *ndev, u8 se_idx,
-				   u8 state)
-{
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-	int r;
-	struct sk_buff *sk_host_list;
-	u8 host_id;
-
-	switch (se_idx) {
-	case ST21NFCB_UICC_HOST_ID:
-		ndev->hci_dev->count_pipes =3D 0;
-		ndev->hci_dev->expected_pipes =3D ST21NFCB_SE_COUNT_PIPE_UICC;
-		break;
-	case ST21NFCB_ESE_HOST_ID:
-		ndev->hci_dev->count_pipes =3D 0;
-		ndev->hci_dev->expected_pipes =3D ST21NFCB_SE_COUNT_PIPE_EMBEDDED;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/*
-	 * Wait for an EVT_HOT_PLUG in order to
-	 * retrieve a relevant host list.
-	 */
-	reinit_completion(&info->se_info.req_completion);
-	r =3D nci_nfcee_mode_set(ndev, se_idx, NCI_NFCEE_ENABLE);
-	if (r !=3D NCI_STATUS_OK)
-		return r;
-
-	mod_timer(&info->se_info.se_active_timer, jiffies +
-		msecs_to_jiffies(ST21NFCB_SE_TO_HOT_PLUG));
-	info->se_info.se_active =3D true;
-
-	/* Ignore return value and check in any case the host_list */
-	wait_for_completion_interruptible(&info->se_info.req_completion);
-
-	/* There might be some "collision" after receiving a HOT_PLUG event
-	 * This may cause the CLF to not answer to the next hci command.
-	 * There is no possible synchronization to prevent this.
-	 * Adding a small delay is the only way to solve the issue.
-	 */
-	usleep_range(3000, 5000);
-
-	r =3D nci_hci_get_param(ndev, NCI_HCI_ADMIN_GATE,
-			NCI_HCI_ADMIN_PARAM_HOST_LIST, &sk_host_list);
-	if (r !=3D NCI_HCI_ANY_OK)
-		return r;
-
-	host_id =3D sk_host_list->data[sk_host_list->len - 1];
-	kfree_skb(sk_host_list);
-	if (state =3D=3D ST21NFCB_SE_MODE_ON && host_id =3D=3D se_idx)
-		return se_idx;
-	else if (state =3D=3D ST21NFCB_SE_MODE_OFF && host_id !=3D se_idx)
-		return se_idx;
-
-	return -1;
-}
-
-int st21nfcb_nci_disable_se(struct nci_dev *ndev, u32 se_idx)
-{
-	int r;
-
-	pr_debug("st21nfcb_nci_disable_se\n");
-
-	if (se_idx =3D=3D NFC_SE_EMBEDDED) {
-		r =3D nci_hci_send_event(ndev, ST21NFCB_APDU_READER_GATE,
-				ST21NFCB_EVT_SE_END_OF_APDU_TRANSFER, NULL, 0);
-		if (r < 0)
-			return r;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(st21nfcb_nci_disable_se);
-
-int st21nfcb_nci_enable_se(struct nci_dev *ndev, u32 se_idx)
-{
-	int r;
-
-	pr_debug("st21nfcb_nci_enable_se\n");
-
-	if (se_idx =3D=3D ST21NFCB_HCI_HOST_ID_ESE) {
-		r =3D nci_hci_send_event(ndev, ST21NFCB_APDU_READER_GATE,
-				ST21NFCB_EVT_SE_SOFT_RESET, NULL, 0);
-		if (r < 0)
-			return r;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(st21nfcb_nci_enable_se);
-
-static int st21nfcb_hci_network_init(struct nci_dev *ndev)
-{
-	struct core_conn_create_dest_spec_params *dest_params;
-	struct dest_spec_params spec_params;
-	struct nci_conn_info    *conn_info;
-	int r, dev_num;
-
-	dest_params =3D
-		kzalloc(sizeof(struct core_conn_create_dest_spec_params) +
-			sizeof(struct dest_spec_params), GFP_KERNEL);
-	if (dest_params =3D=3D NULL) {
-		r =3D -ENOMEM;
-		goto exit;
-	}
-
-	dest_params->type =3D NCI_DESTINATION_SPECIFIC_PARAM_NFCEE_TYPE;
-	dest_params->length =3D sizeof(struct dest_spec_params);
-	spec_params.id =3D ndev->hci_dev->nfcee_id;
-	spec_params.protocol =3D NCI_NFCEE_INTERFACE_HCI_ACCESS;
-	memcpy(dest_params->value, &spec_params, sizeof(struct dest_spec_para=
ms));
-	r =3D nci_core_conn_create(ndev, NCI_DESTINATION_NFCEE, 1,
-				 sizeof(struct core_conn_create_dest_spec_params) +
-				 sizeof(struct dest_spec_params),
-				 dest_params);
-	if (r !=3D NCI_STATUS_OK)
-		goto free_dest_params;
-
-	conn_info =3D ndev->hci_dev->conn_info;
-	if (!conn_info)
-		goto free_dest_params;
-
-	memcpy(ndev->hci_dev->init_data.gates, st21nfcb_gates,
-	       sizeof(st21nfcb_gates));
-
-	/*
-	 * Session id must include the driver name + i2c bus addr
-	 * persistent info to discriminate 2 identical chips
-	 */
-	dev_num =3D find_first_zero_bit(dev_mask, ST21NFCB_NUM_DEVICES);
-	if (dev_num >=3D ST21NFCB_NUM_DEVICES) {
-		r =3D -ENODEV;
-		goto free_dest_params;
-	}
-
-	scnprintf(ndev->hci_dev->init_data.session_id,
-		  sizeof(ndev->hci_dev->init_data.session_id),
-		  "%s%2x", "ST21BH", dev_num);
-
-	r =3D nci_hci_dev_session_init(ndev);
-	if (r !=3D NCI_HCI_ANY_OK)
-		goto free_dest_params;
-
-	r =3D nci_nfcee_mode_set(ndev, ndev->hci_dev->conn_info->id,
-			       NCI_NFCEE_ENABLE);
-	if (r !=3D NCI_STATUS_OK)
-		goto free_dest_params;
-
-free_dest_params:
-	kfree(dest_params);
-
-exit:
-	return r;
-}
-
-int st21nfcb_nci_discover_se(struct nci_dev *ndev)
-{
-	u8 param[2];
-	int r;
-	int se_count =3D 0;
-
-	pr_debug("st21nfcb_nci_discover_se\n");
-
-	r =3D st21nfcb_hci_network_init(ndev);
-	if (r !=3D 0)
-		return r;
-
-	param[0] =3D ST21NFCB_UICC_HOST_ID;
-	param[1] =3D ST21NFCB_HCI_HOST_ID_ESE;
-	r =3D nci_hci_set_param(ndev, NCI_HCI_ADMIN_GATE,
-				NCI_HCI_ADMIN_PARAM_WHITELIST,
-				param, sizeof(param));
-	if (r !=3D NCI_HCI_ANY_OK)
-		return r;
-
-	r =3D st21nfcb_nci_control_se(ndev, ST21NFCB_UICC_HOST_ID,
-				ST21NFCB_SE_MODE_ON);
-	if (r =3D=3D ST21NFCB_UICC_HOST_ID) {
-		nfc_add_se(ndev->nfc_dev, ST21NFCB_UICC_HOST_ID, NFC_SE_UICC);
-		se_count++;
-	}
-
-	/* Try to enable eSE in order to check availability */
-	r =3D st21nfcb_nci_control_se(ndev, ST21NFCB_HCI_HOST_ID_ESE,
-				ST21NFCB_SE_MODE_ON);
-	if (r =3D=3D ST21NFCB_HCI_HOST_ID_ESE) {
-		nfc_add_se(ndev->nfc_dev, ST21NFCB_HCI_HOST_ID_ESE,
-			   NFC_SE_EMBEDDED);
-		se_count++;
-		st21nfcb_se_get_atr(ndev);
-	}
-
-	return !se_count;
-}
-EXPORT_SYMBOL_GPL(st21nfcb_nci_discover_se);
-
-int st21nfcb_nci_se_io(struct nci_dev *ndev, u32 se_idx,
-		       u8 *apdu, size_t apdu_length,
-		       se_io_cb_t cb, void *cb_context)
-{
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-
-	pr_debug("\n");
-
-	switch (se_idx) {
-	case ST21NFCB_HCI_HOST_ID_ESE:
-		info->se_info.cb =3D cb;
-		info->se_info.cb_context =3D cb_context;
-		mod_timer(&info->se_info.bwi_timer, jiffies +
-			  msecs_to_jiffies(info->se_info.wt_timeout));
-		info->se_info.bwi_active =3D true;
-		return nci_hci_send_event(ndev, ST21NFCB_APDU_READER_GATE,
-					ST21NFCB_EVT_TRANSMIT_DATA, apdu,
-					apdu_length);
-	default:
-		return -ENODEV;
-	}
-}
-EXPORT_SYMBOL(st21nfcb_nci_se_io);
-
-static void st21nfcb_se_wt_timeout(unsigned long data)
-{
-	/*
-	 * No answer from the secure element
-	 * within the defined timeout.
-	 * Let's send a reset request as recovery procedure.
-	 * According to the situation, we first try to send a software reset
-	 * to the secure element. If the next command is still not
-	 * answering in time, we send to the CLF a secure element hardware
-	 * reset request.
-	 */
-	/* hardware reset managed through VCC_UICC_OUT power supply */
-	u8 param =3D 0x01;
-	struct st21nfcb_nci_info *info =3D (struct st21nfcb_nci_info *) data;
-
-	pr_debug("\n");
-
-	info->se_info.bwi_active =3D false;
-
-	if (!info->se_info.xch_error) {
-		info->se_info.xch_error =3D true;
-		nci_hci_send_event(info->ndlc->ndev, ST21NFCB_APDU_READER_GATE,
-				ST21NFCB_EVT_SE_SOFT_RESET, NULL, 0);
-	} else {
-		info->se_info.xch_error =3D false;
-		nci_hci_send_event(info->ndlc->ndev, ST21NFCB_DEVICE_MGNT_GATE,
-				ST21NFCB_EVT_SE_HARD_RESET, &param, 1);
-	}
-	info->se_info.cb(info->se_info.cb_context, NULL, 0, -ETIME);
-}
-
-static void st21nfcb_se_activation_timeout(unsigned long data)
-{
-	struct st21nfcb_nci_info *info =3D (struct st21nfcb_nci_info *) data;
-
-	pr_debug("\n");
-
-	info->se_info.se_active =3D false;
-
-	complete(&info->se_info.req_completion);
-}
-
-int st21nfcb_se_init(struct nci_dev *ndev)
-{
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-
-	init_completion(&info->se_info.req_completion);
-	/* initialize timers */
-	init_timer(&info->se_info.bwi_timer);
-	info->se_info.bwi_timer.data =3D (unsigned long)info;
-	info->se_info.bwi_timer.function =3D st21nfcb_se_wt_timeout;
-	info->se_info.bwi_active =3D false;
-
-	init_timer(&info->se_info.se_active_timer);
-	info->se_info.se_active_timer.data =3D (unsigned long)info;
-	info->se_info.se_active_timer.function =3D
-			st21nfcb_se_activation_timeout;
-	info->se_info.se_active =3D false;
-
-	info->se_info.xch_error =3D false;
-
-	info->se_info.wt_timeout =3D
-		ST21NFCB_BWI_TO_TIMEOUT(ST21NFCB_ATR_DEFAULT_BWI);
-
-	return 0;
-}
-EXPORT_SYMBOL(st21nfcb_se_init);
-
-void st21nfcb_se_deinit(struct nci_dev *ndev)
-{
-	struct st21nfcb_nci_info *info =3D nci_get_drvdata(ndev);
-
-	if (info->se_info.bwi_active)
-		del_timer_sync(&info->se_info.bwi_timer);
-	if (info->se_info.se_active)
-		del_timer_sync(&info->se_info.se_active_timer);
-
-	info->se_info.se_active =3D false;
-	info->se_info.bwi_active =3D false;
-}
-EXPORT_SYMBOL(st21nfcb_se_deinit);
-
diff --git a/drivers/nfc/st21nfcb/st21nfcb_se.h b/drivers/nfc/st21nfcb/=
st21nfcb_se.h
deleted file mode 100644
index 52a3238..0000000
--- a/drivers/nfc/st21nfcb/st21nfcb_se.h
+++ /dev/null
@@ -1,61 +0,0 @@
-/*
- * NCI based Driver for STMicroelectronics NFC Chip
- *
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-#ifndef __LOCAL_ST21NFCB_SE_H_
-#define __LOCAL_ST21NFCB_SE_H_
-
-/*
- * ref ISO7816-3 chap 8.1. the initial character TS is followed by a
- * sequence of at most 32 characters.
- */
-#define ST21NFCB_ESE_MAX_LENGTH		33
-#define ST21NFCB_HCI_HOST_ID_ESE	0xc0
-
-struct st21nfcb_se_info {
-	u8 atr[ST21NFCB_ESE_MAX_LENGTH];
-	struct completion req_completion;
-
-	struct timer_list bwi_timer;
-	int wt_timeout; /* in msecs */
-	bool bwi_active;
-
-	struct timer_list se_active_timer;
-	bool se_active;
-
-	bool xch_error;
-
-	se_io_cb_t cb;
-	void *cb_context;
-};
-
-int st21nfcb_se_init(struct nci_dev *ndev);
-void st21nfcb_se_deinit(struct nci_dev *ndev);
-
-int st21nfcb_nci_discover_se(struct nci_dev *ndev);
-int st21nfcb_nci_enable_se(struct nci_dev *ndev, u32 se_idx);
-int st21nfcb_nci_disable_se(struct nci_dev *ndev, u32 se_idx);
-int st21nfcb_nci_se_io(struct nci_dev *ndev, u32 se_idx,
-					u8 *apdu, size_t apdu_length,
-					se_io_cb_t cb, void *cb_context);
-int st21nfcb_hci_load_session(struct nci_dev *ndev);
-void st21nfcb_hci_event_received(struct nci_dev *ndev, u8 pipe,
-				 u8 event, struct sk_buff *skb);
-void st21nfcb_hci_cmd_received(struct nci_dev *ndev, u8 pipe, u8 cmd,
-			       struct sk_buff *skb);
-
-
-#endif /* __LOCAL_ST21NFCB_NCI_H_ */
diff --git a/include/linux/platform_data/st21nfcb.h b/include/linux/pla=
tform_data/st21nfcb.h
deleted file mode 100644
index b023373..0000000
--- a/include/linux/platform_data/st21nfcb.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * Driver include for the ST21NFCB NFC chip.
- *
- * Copyright (C) 2014  STMicroelectronics SAS. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modif=
y it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
- */
-
-#ifndef _ST21NFCB_NCI_H_
-#define _ST21NFCB_NCI_H_
-
-#define ST21NFCB_NCI_DRIVER_NAME "st21nfcb_nci"
-
-struct st21nfcb_nfc_platform_data {
-	unsigned int gpio_reset;
-	unsigned int irq_polarity;
-};
-
-#endif /* _ST21NFCB_NCI_H_ */
diff --git a/include/linux/platform_data/st_nci.h b/include/linux/platf=
orm_data/st_nci.h
new file mode 100644
index 0000000..d9d400a
--- /dev/null
+++ b/include/linux/platform_data/st_nci.h
@@ -0,0 +1,29 @@
+/*
+ * Driver include for ST NCI NFC chip family.
+ *
+ * Copyright (C) 2014-2015  STMicroelectronics SAS. All rights reserve=
d.
+ *
+ * This program is free software; you can redistribute it and/or modif=
y it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>=
=2E
+ */
+
+#ifndef _ST_NCI_H_
+#define _ST_NCI_H_
+
+#define ST_NCI_DRIVER_NAME "st_nci"
+
+struct st_nci_nfc_platform_data {
+	unsigned int gpio_reset;
+	unsigned int irq_polarity;
+};
+
+#endif /* _ST_NCI_H_ */
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

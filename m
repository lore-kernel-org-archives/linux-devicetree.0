Return-Path: <SRS0=/1Tz=BY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7300BC433E3
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Aug 2020 03:49:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2324320716
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Aug 2020 03:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="Mt96oqLE";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="KhAICDt3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgHNDtg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Aug 2020 23:49:36 -0400
Received: from pb-smtp21.pobox.com ([173.228.157.53]:62818 "EHLO
        pb-smtp21.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgHNDtf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 13 Aug 2020 23:49:35 -0400
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 3BD47E0CA3;
        Thu, 13 Aug 2020 23:49:22 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=sasl; bh=R7Fo/GdkRmUF
        YctBOy7xq6aqcNA=; b=Mt96oqLEdyejdz/4xlhtZ2BwJwws3bYMBTujVVa/sD0V
        7C+4vz7obiPwQw8POJaG4fNT7GWSfVOGWddUYzcdY4FlPkfDwvWne6GVML3zr8Gc
        WP+p0lNW2+HkZShFi8FsusCm+oIkbERgEJQSUGu2z+cMmpGN8SecHxSL0ufiY4A=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp21.pobox.com (Postfix) with ESMTP id 1CDA7E0CA2;
        Thu, 13 Aug 2020 23:49:22 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=2016-12.pbsmtp; bh=Sz9Pifa9ldlZUQTCrtpHOfEnw/ekZ8KUDEfmkXB2zTI=; b=KhAICDt3+Uv0oZvZhVlerpMLqE/axUxfuYERJtgTb4gsAYM7mNVqa2TFGYTnfCY7c2k9pffyhwdWYA3PNGDDpfXQnrax4qtoUGYMhdAKJGUq+cSGQtDxUIKhJifkDpv3y5HxIb57Isjja3smb7OPXDpTuSDsdpWvg8ttaIIbdA4=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 88384E0CA1;
        Thu, 13 Aug 2020 23:49:18 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTP id 94A672DA0E8D;
        Thu, 13 Aug 2020 23:49:16 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Pitre <npitre@baylibre.com>,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Matthew Schnoor <matthew.schnoor@intel.com>
Subject: [PATCH 2/2] i3c/master: add the mipi-i3c-hci driver
Date:   Thu, 13 Aug 2020 23:48:54 -0400
Message-Id: <20200814034854.460830-3-nico@fluxnic.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200814034854.460830-1-nico@fluxnic.net>
References: <20200814034854.460830-1-nico@fluxnic.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Pobox-Relay-ID: 2162C66E-DDE1-11EA-87B8-843F439F7C89-78420484!pb-smtp21.pobox.com
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Nicolas Pitre <npitre@baylibre.com>

This adds basic support for hardware implementing the MIPI I3C HCI
specification. This driver is currently limited by the capabilities
of the I3C subsystem, meaning things like scheduled commands,
auto-commands and NCM are not yet supported.

This supports version 1.0 of the MIPI I3C HCI spec, as well as the
imminent release of version 1.1. Support for draft version 2.0 of the
spec is also partially included but is guaranteed to change as the spec
is still a work in progress.

This is also lightly tested as actual hardware is still very scarse,
even for HCI v1.0. Further contributions to this driver are expected
once vendor implementations and new I3C devices become available.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---
 drivers/i3c/master/Kconfig                 |  13 +
 drivers/i3c/master/Makefile                |   1 +
 drivers/i3c/master/mipi-i3c-hci/Makefile   |   9 +
 drivers/i3c/master/mipi-i3c-hci/cmd.h      | 106 +++
 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c   | 362 ++++++++
 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c   | 280 ++++++
 drivers/i3c/master/mipi-i3c-hci/core.c     | 801 +++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/dat.h      |  28 +
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c   | 170 ++++
 drivers/i3c/master/mipi-i3c-hci/dct.h      |  16 +
 drivers/i3c/master/mipi-i3c-hci/dct_v1.c   |  36 +
 drivers/i3c/master/mipi-i3c-hci/debug.c    |  79 ++
 drivers/i3c/master/mipi-i3c-hci/debug.h    |  17 +
 drivers/i3c/master/mipi-i3c-hci/dma.c      | 767 ++++++++++++++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 249 ++++++
 drivers/i3c/master/mipi-i3c-hci/ext_caps.h |  19 +
 drivers/i3c/master/mipi-i3c-hci/hci.h      | 150 ++++
 drivers/i3c/master/mipi-i3c-hci/ibi.h      |  42 +
 drivers/i3c/master/mipi-i3c-hci/pio.c      | 961 +++++++++++++++++++++
 19 files changed, 4106 insertions(+)
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/Makefile
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/core.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dat.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dat_v1.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dct.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dct_v1.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/debug.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/debug.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/dma.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/ext_caps.c
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/ext_caps.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/ibi.h
 create mode 100644 drivers/i3c/master/mipi-i3c-hci/pio.c

diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 4e80a1fcbf..eb5830923f 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -21,3 +21,16 @@ config DW_I3C_MASTER
=20
 	  This driver can also be built as a module.  If so, the module
 	  will be called dw-i3c-master.
+
+config MIPI_I3C_HCI
+	tristate "MIPI I3C Host Controller Interface driver"
+	depends on I3C
+	help
+	  Support for hardware following the MIPI Aliance's I3C Host Controller
+	  Interface specification.
+
+	  For details please see:
+	  https://www.mipi.org/specifications/i3c-hci
+
+	  This driver can also be built as a module.  If so, the module will be
+	  called mipi-i3c-hci.
diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
index 7eea9e0861..b892fd4caf 100644
--- a/drivers/i3c/master/Makefile
+++ b/drivers/i3c/master/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CDNS_I3C_MASTER)		+=3D i3c-master-cdns.o
 obj-$(CONFIG_DW_I3C_MASTER)		+=3D dw-i3c-master.o
+obj-$(CONFIG_MIPI_I3C_HCI)		+=3D mipi-i3c-hci/
diff --git a/drivers/i3c/master/mipi-i3c-hci/Makefile b/drivers/i3c/maste=
r/mipi-i3c-hci/Makefile
new file mode 100644
index 0000000000..8349960c5b
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: BSD-3-Clause
+
+#ccflags-y :=3D -DDEBUG
+
+obj-$(CONFIG_MIPI_I3C_HCI)		+=3D mipi-i3c-hci.o
+mipi-i3c-hci-y				:=3D core.o ext_caps.o pio.o dma.o \
+					   cmd_v1.o cmd_v2.o \
+					   dat_v1.o dct_v1.o \
+					   debug.o
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/m=
ipi-i3c-hci/cmd.h
new file mode 100644
index 0000000000..839f565fb3
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Common command/response related stuff
+ */
+
+#ifndef CMD_H
+#define CMD_H
+
+/*
+ * Those bits are common to all descriptor formats and
+ * may be manipulated by the core code.
+ */
+#define CMD_0_TOC			W0_BIT_(31)
+#define CMD_0_ROC			W0_BIT_(30)
+#define CMD_0_ATTR			W0_MASK(2, 0)
+
+/* Data Transfer Speed and Mode */
+enum hci_cmd_mode {
+	MODE_I3C_SDR0		=3D 0x0,
+	MODE_I3C_SDR1		=3D 0x1,
+	MODE_I3C_SDR2		=3D 0x2,
+	MODE_I3C_SDR3		=3D 0x3,
+	MODE_I3C_SDR4		=3D 0x4,
+	MODE_I3C_HDR_TSx	=3D 0x5,
+	MODE_I3C_HDR_DDR	=3D 0x6,
+	MODE_I3C_HDR_BT		=3D 0x7,
+	MODE_I3C_Fm_FmP		=3D 0x8,
+	MODE_I2C_Fm		=3D 0x0,
+	MODE_I2C_FmP		=3D 0x1,
+	MODE_I2C_UD1		=3D 0x2,
+	MODE_I2C_UD2		=3D 0x3,
+	MODE_I2C_UD3		=3D 0x4,
+};
+
+static inline enum hci_cmd_mode hci_get_i3c_mode(struct i3c_hci *hci)
+{
+	struct i3c_bus *bus =3D i3c_master_get_bus(&hci->master);
+
+	if (bus->scl_rate.i3c >=3D 12500000)
+		return MODE_I3C_SDR0;
+	if (bus->scl_rate.i3c > 8000000)
+		return MODE_I3C_SDR1;
+	if (bus->scl_rate.i3c > 6000000)
+		return MODE_I3C_SDR2;
+	if (bus->scl_rate.i3c > 4000000)
+		return MODE_I3C_SDR3;
+	if (bus->scl_rate.i3c > 2000000)
+		return MODE_I3C_SDR4;
+	return MODE_I3C_Fm_FmP;
+}
+
+static inline enum hci_cmd_mode hci_get_i2c_mode(struct i3c_hci *hci)
+{
+	struct i3c_bus *bus =3D i3c_master_get_bus(&hci->master);
+
+	if (bus->scl_rate.i2c >=3D 1000000)
+		return MODE_I2C_FmP;
+	return MODE_I2C_Fm;
+}
+
+/*
+ * Response Descriptor Structure
+ */
+#define RESP_STATUS(resp)		FIELD_GET(GENMASK(31, 28), resp)
+#define RESP_TID(resp)			FIELD_GET(GENMASK(27, 24), resp)
+#define RESP_DATA_LENGTH(resp)		FIELD_GET(GENMASK(21,  0), resp)
+
+#define RESP_ERR_FIELD			GENMASK(31, 28)
+
+enum hci_resp_err {
+	RESP_SUCCESS		=3D 0x0,
+	RESP_ERR_CRC		=3D 0x1,
+	RESP_ERR_PARITY		=3D 0x2,
+	RESP_ERR_FRAME		=3D 0x3,
+	RESP_ERR_ADDR_HEADER	=3D 0x4,
+	RESP_ERR_NACK		=3D 0x5,
+	RESP_ERR_OVL		=3D 0x6,
+	RESP_ERR_ABORTED	=3D 0x8,
+	RESP_ERR_I2C_WR_DATA_NACK =3D 0x9,
+	RESP_ERR_NOT_SUPPORTED	=3D 0xa,
+};
+
+/* TID generation */
+#define hci_get_tid(bits) \
+	(atomic_inc_return_relaxed(&hci->next_cmd_tid) % (1 << (bits)))
+
+/* This abstracts operations with our command descriptor formats */
+struct hci_cmd_ops {
+	int (*prep_ccc)(struct i3c_hci *hci, struct hci_xfer *xfer,
+			u8 ccc_addr, u8 ccc_cmd, bool raw);
+	void (*prep_i3c_xfer)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
+			      struct hci_xfer *xfer);
+	void (*prep_i2c_xfer)(struct i3c_hci *hci, struct i2c_dev_desc *dev,
+			      struct hci_xfer *xfer);
+	int (*perform_daa)(struct i3c_hci *hci);
+};
+
+/* Our various instances */
+extern const struct hci_cmd_ops i3c_hci_cmd_v1;
+extern const struct hci_cmd_ops i3c_hci_cmd_v2;
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/maste=
r/mipi-i3c-hci/cmd_v1.c
new file mode 100644
index 0000000000..d8dbec1431
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * I3C HCI v1.0/v1.1 Command Descriptor Handling
+ */
+
+#include <linux/bitfield.h>
+#include <linux/i3c/master.h>
+
+#include "hci.h"
+#include "cmd.h"
+#include "dat.h"
+#include "dct.h"
+
+
+/*
+ * Address Assignment Command
+ */
+
+#define CMD_0_ATTR_A			FIELD_PREP(CMD_0_ATTR, 0x2)
+
+#define CMD_A0_TOC			           W0_BIT_(31)
+#define CMD_A0_ROC			           W0_BIT_(30)
+#define CMD_A0_DEV_COUNT(v)		FIELD_PREP(W0_MASK(29, 26), v)
+#define CMD_A0_DEV_INDEX(v)		FIELD_PREP(W0_MASK(20, 16), v)
+#define CMD_A0_CMD(v)			FIELD_PREP(W0_MASK(14, 7), v)
+#define CMD_A0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
+
+/*
+ * Immediate Data Transfer Command
+ */
+
+#define CMD_0_ATTR_I			FIELD_PREP(CMD_0_ATTR, 0x1)
+
+#define CMD_I1_DATA_BYTE_4(v)		FIELD_PREP(W1_MASK(63, 56), v)
+#define CMD_I1_DATA_BYTE_3(v)		FIELD_PREP(W1_MASK(55, 48), v)
+#define CMD_I1_DATA_BYTE_2(v)		FIELD_PREP(W1_MASK(47, 40), v)
+#define CMD_I1_DATA_BYTE_1(v)		FIELD_PREP(W1_MASK(39, 32), v)
+#define CMD_I1_DEF_BYTE(v)		FIELD_PREP(W1_MASK(39, 32), v)
+#define CMD_I0_TOC			           W0_BIT_(31)
+#define CMD_I0_ROC			           W0_BIT_(30)
+#define CMD_I0_RNW			           W0_BIT_(29)
+#define CMD_I0_MODE(v)			FIELD_PREP(W0_MASK(28, 26), v)
+#define CMD_I0_DTT(v)			FIELD_PREP(W0_MASK(25, 23), v)
+#define CMD_I0_DEV_INDEX(v)		FIELD_PREP(W0_MASK(20, 16), v)
+#define CMD_I0_CP			           W0_BIT_(15)
+#define CMD_I0_CMD(v)			FIELD_PREP(W0_MASK(14, 7), v)
+#define CMD_I0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
+
+/*
+ * Regular Data Transfer Command
+ */
+
+#define CMD_0_ATTR_R			FIELD_PREP(CMD_0_ATTR, 0x0)
+
+#define CMD_R1_DATA_LENGTH(v)		FIELD_PREP(W1_MASK(63, 48), v)
+#define CMD_R1_DEF_BYTE(v)		FIELD_PREP(W1_MASK(39, 32), v)
+#define CMD_R0_TOC			           W0_BIT_(31)
+#define CMD_R0_ROC			           W0_BIT_(30)
+#define CMD_R0_RNW			           W0_BIT_(29)
+#define CMD_R0_MODE(v)			FIELD_PREP(W0_MASK(28, 26), v)
+#define CMD_R0_DBP			           W0_BIT_(25)
+#define CMD_R0_DEV_INDEX(v)		FIELD_PREP(W0_MASK(20, 16), v)
+#define CMD_R0_CP			           W0_BIT_(15)
+#define CMD_R0_CMD(v)			FIELD_PREP(W0_MASK(14, 7), v)
+#define CMD_R0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
+
+/*
+ * Combo Transfer (Write + Write/Read) Command
+ */
+
+#define CMD_0_ATTR_C			FIELD_PREP(CMD_0_ATTR, 0x3)
+
+#define CMD_C1_DATA_LENGTH(v)		FIELD_PREP(W1_MASK(63, 48), v)
+#define CMD_C1_OFFSET(v)		FIELD_PREP(W1_MASK(47, 32), v)
+#define CMD_C0_TOC			           W0_BIT_(31)
+#define CMD_C0_ROC			           W0_BIT_(30)
+#define CMD_C0_RNW			           W0_BIT_(29)
+#define CMD_C0_MODE(v)			FIELD_PREP(W0_MASK(28, 26), v)
+#define CMD_C0_16_BIT_SUBOFFSET		W0_bit(25)
+#define CMD_C0_FIRST_PHASE_MODE		           W0_BIT_(24)
+#define CMD_C0_DATA_LENGTH_POSITION(v)	FIELD_PREP(W0_MASK(23, 22), v)
+#define CMD_C0_DEV_INDEX(v)		FIELD_PREP(W0_MASK(20, 16), v)
+#define CMD_C0_CP			           W0_BIT_(15)
+#define CMD_C0_CMD(v)			FIELD_PREP(W0_MASK(14, 7), v)
+#define CMD_C0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
+
+/*
+ * Internal Control Command
+ */
+
+#define CMD_0_ATTR_M			FIELD_PREP(CMD_0_ATTR, 0x7)
+
+#define CMD_M1_VENDOR_SPECIFIC		           W1_MASK(63, 32)
+#define CMD_M0_MIPI_RESERVED		           W0_MASK(31, 12)
+#define CMD_M0_MIPI_CMD			           W0_MASK(11, 8)
+#define CMD_M0_VENDOR_INFO_PRESENT	           W0_BIT_(7)
+#define CMD_M0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
+
+
+static int hci_cmd_v1_prep_ccc(struct i3c_hci *hci,
+			       struct hci_xfer *xfer,
+			       u8 ccc_addr, u8 ccc_cmd, bool raw)
+{
+	u_int dat_idx =3D 0;
+	int mode =3D hci_get_i3c_mode(hci);
+	u8 *data =3D xfer->data;
+	u_int data_len =3D xfer->data_len;
+	bool rnw =3D xfer->rnw;
+	int ret;
+
+	BUG_ON(raw);
+
+	if (ccc_addr !=3D I3C_BROADCAST_ADDR) {
+		ret =3D i3c_hci_dat_get_index(hci, ccc_addr);
+		if (ret < 0)
+			return -ENODEV;
+		dat_idx =3D ret;
+	}
+
+	xfer->cmd_tid =3D hci_get_tid(4);
+
+	if (!rnw && data_len <=3D 4) {
+		/* we use an Immediate Data Transfer Command */
+		xfer->cmd_desc[0] =3D
+			CMD_0_ATTR_I |
+			CMD_I0_TID(xfer->cmd_tid) |
+			CMD_I0_CMD(ccc_cmd) | CMD_I0_CP |
+			CMD_I0_DEV_INDEX(dat_idx) |
+			CMD_I0_DTT(data_len) |
+			CMD_I0_MODE(mode);
+		xfer->cmd_desc[1] =3D 0;
+		switch (data_len) {
+		case 4:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_4(data[3]);
+			fallthrough;
+		case 3:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_3(data[2]);
+			fallthrough;
+		case 2:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_2(data[1]);
+			fallthrough;
+		case 1:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_1(data[0]);
+			fallthrough;
+		case 0:
+			break;
+		}
+		/* we consumed all the data in the cmd descriptor */
+		xfer->data =3D NULL;
+	} else {
+		/* we use a Regular Data Transfer Command */
+		xfer->cmd_desc[0] =3D
+			CMD_0_ATTR_R |
+			CMD_R0_TID(xfer->cmd_tid) |
+			CMD_R0_CMD(ccc_cmd) | CMD_R0_CP |
+			CMD_R0_DEV_INDEX(dat_idx) |
+			CMD_R0_MODE(mode) |
+			(rnw ? CMD_R0_RNW : 0);
+		xfer->cmd_desc[1] =3D
+			CMD_R1_DATA_LENGTH(data_len);
+	}
+
+	return 0;
+}
+
+static void hci_cmd_v1_prep_i3c_xfer(struct i3c_hci *hci,
+				     struct i3c_dev_desc *dev,
+				     struct hci_xfer *xfer)
+{
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+	u_int dat_idx =3D dev_data->dat_idx;
+	int mode =3D hci_get_i3c_mode(hci);
+	u8 *data =3D xfer->data;
+	u_int data_len =3D xfer->data_len;
+	bool rnw =3D xfer->rnw;
+
+	xfer->cmd_tid =3D hci_get_tid(4);
+
+	if (!rnw && data_len <=3D 4) {
+		/* we use an Immediate Data Transfer Command */
+		xfer->cmd_desc[0] =3D
+			CMD_0_ATTR_I |
+			CMD_I0_TID(xfer->cmd_tid) |
+			CMD_I0_DEV_INDEX(dat_idx) |
+			CMD_I0_DTT(data_len) |
+			CMD_I0_MODE(mode);
+		xfer->cmd_desc[1] =3D 0;
+		switch (data_len) {
+		case 4:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_4(data[3]);
+			fallthrough;
+		case 3:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_3(data[2]);
+			fallthrough;
+		case 2:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_2(data[1]);
+			fallthrough;
+		case 1:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_1(data[0]);
+			fallthrough;
+		case 0:
+			break;
+		}
+		/* we consumed all the data in the cmd descriptor */
+		xfer->data =3D NULL;
+	} else {
+		/* we use a Regular Data Transfer Command */
+		xfer->cmd_desc[0] =3D
+			CMD_0_ATTR_R |
+			CMD_R0_TID(xfer->cmd_tid) |
+			CMD_R0_DEV_INDEX(dat_idx) |
+			CMD_R0_MODE(mode) |
+			(rnw ? CMD_R0_RNW : 0);
+		xfer->cmd_desc[1] =3D
+			CMD_R1_DATA_LENGTH(data_len);
+	}
+}
+
+static void hci_cmd_v1_prep_i2c_xfer(struct i3c_hci *hci,
+				     struct i2c_dev_desc *dev,
+				     struct hci_xfer *xfer)
+{
+	struct i3c_hci_dev_data *dev_data =3D i2c_dev_get_master_data(dev);
+	u_int dat_idx =3D dev_data->dat_idx;
+	int mode =3D hci_get_i2c_mode(hci);
+	u8 *data =3D xfer->data;
+	u_int data_len =3D xfer->data_len;
+	bool rnw =3D xfer->rnw;
+
+	xfer->cmd_tid =3D hci_get_tid(4);
+
+	if (!rnw && data_len <=3D 4) {
+		/* we use an Immediate Data Transfer Command */
+		xfer->cmd_desc[0] =3D
+			CMD_0_ATTR_I |
+			CMD_I0_TID(xfer->cmd_tid) |
+			CMD_I0_DEV_INDEX(dat_idx) |
+			CMD_I0_DTT(data_len) |
+			CMD_I0_MODE(mode);
+		xfer->cmd_desc[1] =3D 0;
+		switch (data_len) {
+		case 4:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_4(data[3]);
+			fallthrough;
+		case 3:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_3(data[2]);
+			fallthrough;
+		case 2:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_2(data[1]);
+			fallthrough;
+		case 1:
+			xfer->cmd_desc[1] |=3D CMD_I1_DATA_BYTE_1(data[0]);
+			fallthrough;
+		case 0:
+			break;
+		}
+		/* we consumed all the data in the cmd descriptor */
+		xfer->data =3D NULL;
+	} else {
+		/* we use a Regular Data Transfer Command */
+		xfer->cmd_desc[0] =3D
+			CMD_0_ATTR_R |
+			CMD_R0_TID(xfer->cmd_tid) |
+			CMD_R0_DEV_INDEX(dat_idx) |
+			CMD_R0_MODE(mode) |
+			(rnw ? CMD_R0_RNW : 0);
+		xfer->cmd_desc[1] =3D
+			CMD_R1_DATA_LENGTH(data_len);
+	}
+}
+
+static int hci_cmd_v1_daa(struct i3c_hci *hci)
+{
+	struct hci_xfer *xfer;
+	int ret, dat_idx =3D -1;
+	u8 next_addr;
+	u64 pid;
+	u_int dcr, bcr;
+	DECLARE_COMPLETION_ONSTACK(done);
+
+	xfer =3D hci_alloc_xfer(2);
+	if (!xfer)
+		return -ENOMEM;
+
+	/*
+	 * Simple for now: we allocate a temporary DAT entry, do a single
+	 * DAA, register the device which will allocate its own DAT entry
+	 * via the core callback, then free the temporary DAT entry.
+	 * Loop until there is no more devices to assign an address to.
+	 * Yes, there is room for improvements.
+	 */
+	for (;;) {
+		ret =3D i3c_hci_dat_alloc_entry(hci);
+		if (ret < 0)
+			break;
+		dat_idx =3D ret;
+		ret =3D i3c_master_get_free_addr(&hci->master, next_addr);
+		if (ret < 0)
+			break;
+		next_addr =3D ret;
+
+		DBG("next_addr =3D 0x%02x, DAA using DAT %d", next_addr, dat_idx);
+		i3c_hci_dat_set_dynamic_addr(hci, dat_idx, next_addr);
+		i3c_hci_dct_index_reset(hci);
+
+		xfer->cmd_tid =3D hci_get_tid(4);
+		xfer->cmd_desc[0] =3D
+			CMD_0_ATTR_A |
+			CMD_A0_TID(xfer->cmd_tid) |
+			CMD_A0_CMD(I3C_CCC_ENTDAA) |
+			CMD_A0_DEV_INDEX(dat_idx) |
+			CMD_A0_DEV_COUNT(1) |
+			CMD_A0_ROC | CMD_A0_TOC;
+		xfer->cmd_desc[1] =3D 0;
+		hci->io->queue_xfer(hci, xfer, 1);
+		if (!wait_for_completion_timeout(&done, HZ) &&
+		    hci->io->dequeue_xfer(hci, xfer, 1)) {
+			ret =3D -ETIME;
+			break;
+		}
+		if (RESP_STATUS(xfer[0].response) =3D=3D RESP_ERR_NACK &&
+		    RESP_STATUS(xfer[0].response) =3D=3D 1) {
+			ret =3D 0;  /* no more devices to be assigned */
+			break;
+		}
+		if (RESP_STATUS(xfer[0].response) !=3D RESP_SUCCESS) {
+			ret =3D -EIO;
+			break;
+		}
+
+		i3c_hci_dct_get_val(hci, 0, &pid, &dcr, &bcr);
+		DBG("assigned address %#x to device PID=3D0x%llx DCR=3D%#x BCR=3D%#x",
+		    next_addr, pid, dcr, bcr);
+
+		i3c_hci_dat_free_entry(hci, dat_idx);
+		dat_idx =3D -1;
+
+		/*
+		 * TODO: Extend the subsystem layer to allow for registering
+		 * new device and provide BCR/DCR/PID at the same time.
+		 */
+		ret =3D i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
+		if (ret)
+			break;
+	}
+
+	if (dat_idx >=3D 0)
+		i3c_hci_dat_free_entry(hci, dat_idx);
+	hci_free_xfer(xfer, 1);
+	return ret;
+}
+
+const struct hci_cmd_ops i3c_hci_cmd_v1 =3D {
+	.prep_ccc		=3D hci_cmd_v1_prep_ccc,
+	.prep_i3c_xfer		=3D hci_cmd_v1_prep_i3c_xfer,
+	.prep_i2c_xfer		=3D hci_cmd_v1_prep_i2c_xfer,
+	.perform_daa		=3D hci_cmd_v1_daa,
+};
diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c b/drivers/i3c/maste=
r/mipi-i3c-hci/cmd_v2.c
new file mode 100644
index 0000000000..2fde01fcb5
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v2.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * I3C HCI v2.0 Command Descriptor Handling
+ *
+ * Note: The I3C HCI v2.0 spec is still in flux. The code here will chan=
ge.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/i3c/master.h>
+
+#include "hci.h"
+#include "cmd.h"
+
+
+/*
+ * Universal Data Transfer Command
+ */
+
+#define CMD_0_ATTR_U			FIELD_PREP(CMD_0_ATTR, 0x4)
+
+#define CMD_U3_HDR_TSP_ML_CTRL(v)	FIELD_PREP(W3_MASK(115, 112), v)
+#define CMD_U3_CTRL_BYTE(v)		FIELD_PREP(W3_MASK(111, 104), v)
+#define CMD_U3_MOD_BYTE_4(v)		FIELD_PREP(W3_MASK(103, 96), v)
+#define CMD_U2_MOD_BYTE_3(v)		FIELD_PREP(W2_MASK(95, 88), v)
+#define CMD_U2_MOD_BYTE_2(v)		FIELD_PREP(W2_MASK(87, 80), v)
+#define CMD_U2_MOD_BYTE_1(v)		FIELD_PREP(W2_MASK(79, 72), v)
+#define CMD_U2_MOD_BYTE_0(v)		FIELD_PREP(W2_MASK(71, 64), v)
+#define CMD_U1_MLANE(v)			FIELD_PREP(W1_MASK(63, 56), v)
+#define CMD_U1_DATA_LENGTH(v)		FIELD_PREP(W1_MASK(53, 32), v)
+#define CMD_U0_TOC			           W0_BIT_(31)
+#define CMD_U0_ROC			           W0_BIT_(30)
+#define CMD_U0_XFER_MOD			           W0_BIT_(29)
+#define CMD_U0_MOD_BYTE_COUNT(v)	FIELD_PREP(W0_MASK(28, 26), v)
+#define CMD_U0_XFER_TYPE(v)		FIELD_PREP(W0_MASK(25, 24), v)
+#define CMD_U0_MODE(v)			FIELD_PREP(W0_MASK(23, 20), v)
+#define CMD_U0_DEV_ADDRESS(v)		FIELD_PREP(W0_MASK(15, 9), v)
+#define CMD_U0_RnW			           W0_BIT_(8)
+#define CMD_U0_I2C			           W0_BIT_(7)
+#define CMD_U0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
+
+/*
+ * Address Assignment Command
+ */
+
+#define CMD_0_ATTR_A			FIELD_PREP(CMD_0_ATTR, 0x2)
+
+#define CMD_A1_DATA_LENGTH(v)		FIELD_PREP(W1_MASK(53, 32), v)
+#define CMD_A0_TOC			           W0_BIT_(31)
+#define CMD_A0_ROC			           W0_BIT_(30)
+#define CMD_A0_DEV_ADDRESS(v)		FIELD_PREP(W0_MASK(15, 9), v)
+#define CMD_A0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
+
+
+enum hci_cmd_xfer_type {
+	XFER_TYPE_PRIVATE		=3D 0x0,
+	XFER_TYPE_CCC_NO_DEFBYTE	=3D 0x1,
+	XFER_TYPE_CCC_W_DEFBYTE		=3D 0x2,
+};
+
+
+static void hci_cmd_v2_prep_private_xfer(struct i3c_hci *hci,
+					 struct hci_xfer *xfer,
+					 u8 addr, u_int mode)
+{
+	u8 *data =3D xfer->data;
+	u_int data_len =3D xfer->data_len;
+	bool rnw =3D xfer->rnw;
+
+	xfer->cmd_tid =3D hci_get_tid(4);
+
+	if (!rnw && data_len <=3D 5) {
+		xfer->cmd_desc[0] =3D
+			CMD_0_ATTR_U |
+			CMD_U0_TID(xfer->cmd_tid) |
+			CMD_U0_DEV_ADDRESS(addr) |
+			CMD_U0_MODE(mode) |
+			CMD_U0_XFER_TYPE(XFER_TYPE_PRIVATE) |
+			CMD_U0_MOD_BYTE_COUNT(data_len);
+		xfer->cmd_desc[1] =3D
+			CMD_U1_DATA_LENGTH(0);
+		xfer->cmd_desc[2] =3D 0;
+		xfer->cmd_desc[3] =3D 0;
+		switch (data_len) {
+		case 5:
+			xfer->cmd_desc[3] |=3D CMD_U3_MOD_BYTE_4(data[4]);
+			fallthrough;
+		case 4:
+			xfer->cmd_desc[2] |=3D CMD_U2_MOD_BYTE_3(data[3]);
+			fallthrough;
+		case 3:
+			xfer->cmd_desc[2] |=3D CMD_U2_MOD_BYTE_2(data[2]);
+			fallthrough;
+		case 2:
+			xfer->cmd_desc[2] |=3D CMD_U2_MOD_BYTE_1(data[1]);
+			fallthrough;
+		case 1:
+			xfer->cmd_desc[2] |=3D CMD_U2_MOD_BYTE_0(data[0]);
+			fallthrough;
+		case 0:
+			break;
+		}
+		/* we consumed all the data in the cmd descriptor */
+		xfer->data =3D NULL;
+	} else {
+		xfer->cmd_desc[0] =3D
+			CMD_0_ATTR_U |
+			CMD_U0_TID(xfer->cmd_tid) |
+			(rnw ? CMD_U0_RnW : 0) |
+			CMD_U0_DEV_ADDRESS(addr) |
+			CMD_U0_MODE(mode) |
+			CMD_U0_XFER_TYPE(XFER_TYPE_PRIVATE);
+		xfer->cmd_desc[1] =3D
+			CMD_U1_DATA_LENGTH(data_len);
+		xfer->cmd_desc[2] =3D 0;
+		xfer->cmd_desc[3] =3D 0;
+	}
+}
+
+static int hci_cmd_v2_prep_ccc(struct i3c_hci *hci, struct hci_xfer *xfe=
r,
+			       u8 ccc_addr, u8 ccc_cmd, bool raw)
+{
+	u_int mode =3D hci_get_i3c_mode(hci);
+	u_int type =3D !raw ? XFER_TYPE_CCC_NO_DEFBYTE : XFER_TYPE_PRIVATE;
+	u8 *data =3D xfer->data;
+	u_int data_len =3D xfer->data_len;
+	bool rnw =3D xfer->rnw;
+
+	if (raw && ccc_addr !=3D I3C_BROADCAST_ADDR) {
+		hci_cmd_v2_prep_private_xfer(hci, xfer, ccc_addr, mode);
+		return 0;
+	}
+
+	xfer->cmd_tid =3D hci_get_tid(4);
+
+	if (!rnw && data_len <=3D 4) {
+		xfer->cmd_desc[0] =3D
+			CMD_0_ATTR_U |
+			CMD_U0_TID(xfer->cmd_tid) |
+			CMD_U0_DEV_ADDRESS(ccc_addr) |
+			CMD_U0_MODE(mode) |
+			CMD_U0_XFER_TYPE(type) |
+			CMD_U0_MOD_BYTE_COUNT(data_len + (!raw ? 0 : 1));
+		xfer->cmd_desc[1] =3D
+			CMD_U1_DATA_LENGTH(0);
+		xfer->cmd_desc[2] =3D
+			CMD_U2_MOD_BYTE_0(ccc_cmd);
+		xfer->cmd_desc[3] =3D 0;
+		switch (data_len) {
+		case 4:
+			xfer->cmd_desc[3] |=3D CMD_U3_MOD_BYTE_4(data[3]);
+			fallthrough;
+		case 3:
+			xfer->cmd_desc[2] |=3D CMD_U2_MOD_BYTE_3(data[2]);
+			fallthrough;
+		case 2:
+			xfer->cmd_desc[2] |=3D CMD_U2_MOD_BYTE_2(data[1]);
+			fallthrough;
+		case 1:
+			xfer->cmd_desc[2] |=3D CMD_U2_MOD_BYTE_1(data[0]);
+			fallthrough;
+		case 0:
+			break;
+		}
+		/* we consumed all the data in the cmd descriptor */
+		xfer->data =3D NULL;
+	} else {
+		xfer->cmd_desc[0] =3D
+			CMD_0_ATTR_U |
+			CMD_U0_TID(xfer->cmd_tid) |
+			(rnw ? CMD_U0_RnW : 0) |
+			CMD_U0_DEV_ADDRESS(ccc_addr) |
+			CMD_U0_MODE(mode) |
+			CMD_U0_XFER_TYPE(type) |
+			CMD_U0_MOD_BYTE_COUNT(!raw ? 0 : 1);
+		xfer->cmd_desc[1] =3D
+			CMD_U1_DATA_LENGTH(data_len);
+		xfer->cmd_desc[2] =3D
+			CMD_U2_MOD_BYTE_0(ccc_cmd);
+		xfer->cmd_desc[3] =3D 0;
+	}
+
+	return 0;
+}
+
+static void hci_cmd_v2_prep_i3c_xfer(struct i3c_hci *hci,
+				     struct i3c_dev_desc *dev,
+				     struct hci_xfer *xfer)
+{
+	int mode =3D hci_get_i3c_mode(hci);
+	u8 addr =3D dev->info.dyn_addr;
+
+	hci_cmd_v2_prep_private_xfer(hci, xfer, addr, mode);
+}
+
+static void hci_cmd_v2_prep_i2c_xfer(struct i3c_hci *hci,
+				     struct i2c_dev_desc *dev,
+				     struct hci_xfer *xfer)
+{
+	int mode =3D hci_get_i2c_mode(hci);
+	u8 addr =3D dev->addr;
+
+	hci_cmd_v2_prep_private_xfer(hci, xfer, addr, mode);
+	xfer->cmd_desc[0] |=3D CMD_U0_I2C;
+}
+
+static int hci_cmd_v2_daa(struct i3c_hci *hci)
+{
+	struct hci_xfer *xfer;
+	int ret;
+	u8 next_addr;
+	u32 device_id[2];
+	DECLARE_COMPLETION_ONSTACK(done);
+
+	xfer =3D hci_alloc_xfer(2);
+	if (!xfer)
+		return -ENOMEM;
+
+	xfer[0].data =3D &device_id;
+	xfer[0].data_len =3D 8;
+	xfer[0].rnw =3D true;
+	xfer[0].cmd_desc[1] =3D CMD_A1_DATA_LENGTH(8);
+	xfer[1].completion =3D &done;
+
+	for (;;) {
+		ret =3D i3c_master_get_free_addr(&hci->master, next_addr);
+		if (ret < 0)
+			break;
+		next_addr =3D ret;
+		DBG("next_addr =3D 0x%02x", next_addr);
+		xfer[0].cmd_tid =3D hci_get_tid(4);
+		xfer[0].cmd_desc[0] =3D
+			CMD_0_ATTR_A |
+			CMD_A0_TID(xfer[0].cmd_tid) |
+			CMD_A0_ROC;
+		xfer[1].cmd_tid =3D hci_get_tid(4);
+		xfer[1].cmd_desc[0] =3D
+			CMD_0_ATTR_A |
+			CMD_A0_TID(xfer[1].cmd_tid) |
+			CMD_A0_DEV_ADDRESS(next_addr) |
+			CMD_A0_ROC |
+			CMD_A0_TOC;
+		hci->io->queue_xfer(hci, xfer, 2);
+		if (!wait_for_completion_timeout(&done, HZ) &&
+		    hci->io->dequeue_xfer(hci, xfer, 2)) {
+			ret =3D -ETIME;
+			break;
+		}
+		if (RESP_STATUS(xfer[0].response) !=3D RESP_SUCCESS) {
+			ret =3D 0;  /* no more devices to be assigned */
+			break;
+		}
+		if (RESP_STATUS(xfer[1].response) !=3D RESP_SUCCESS) {
+			ret =3D -EIO;
+			break;
+		}
+		DBG("assigned address %#x to device %08x %08x",
+		    next_addr, device_id[0], device_id[1]);
+		/*
+		 * TODO: Extend the subsystem layer to allow for registering
+		 * new device and provide BCR/DCR/PID at the same time.
+		 */
+		ret =3D i3c_master_add_i3c_dev_locked(&hci->master, next_addr);
+		if (ret)
+			break;
+	}
+
+	hci_free_xfer(xfer, 2);
+	return ret;
+}
+
+const struct hci_cmd_ops i3c_hci_cmd_v2 =3D {
+	.prep_ccc		=3D hci_cmd_v2_prep_ccc,
+	.prep_i3c_xfer		=3D hci_cmd_v2_prep_i3c_xfer,
+	.prep_i2c_xfer		=3D hci_cmd_v2_prep_i2c_xfer,
+	.perform_daa		=3D hci_cmd_v2_daa,
+};
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/=
mipi-i3c-hci/core.c
new file mode 100644
index 0000000000..d9c7ee163b
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -0,0 +1,801 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Core driver code with main interface to the I3C subsystem.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "hci.h"
+#include "ext_caps.h"
+#include "cmd.h"
+#include "dat.h"
+
+
+/*
+ * Host Controller Capabilities and Operation Registers
+ */
+
+#define reg_read(r)		readl(hci->base_regs + (r))
+#define reg_write(r, v)		writel(v, hci->base_regs + (r))
+#define reg_set(r, v)		reg_write(r, reg_read(r) | (v))
+#define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
+
+#define HCI_VERSION			0x00	/* HCI Version (in BCD) */
+
+#define HC_CONTROL			0x04
+#define HC_CONTROL_BUS_ENABLE		BIT(31)
+#define HC_CONTROL_RESUME		BIT(30)
+#define HC_CONTROL_ABORT		BIT(29)
+#define HC_CONTROL_HALT_ON_CMD_TIMEOUT	BIT(12)
+#define HC_CONTROL_HOT_JOIN_CTRL	BIT(8)	/* Hot-Join ACK/NACK Control */
+#define HC_CONTROL_I2C_SLAVE_PRESENT	BIT(7)
+#define HC_CONTROL_PIO_MODE		BIT(6)	/* DMA/PIO Mode Selector */
+#define HC_CONTROL_DATA_BIG_ENDIAN	BIT(4)
+#define HC_CONTROL_IBA_INCLUDE		BIT(0)	/* Include I3C Broadcast Address =
*/
+
+#define MASTER_DEVICE_ADDR		0x08	/* Master Device Address */
+#define MASTER_DYNAMIC_ADDR_VALID	BIT(31)	/* Dynamic Address is Valid */
+#define MASTER_DYNAMIC_ADDR(v)		FIELD_PREP(GENMASK(22, 16), v)
+
+#define HC_CAPABILITIES			0x0c	/* Host Controller Capabilities */
+#define HC_CAP_SG_DC_EN			BIT(30)
+#define HC_CAP_SG_IBI_EN		BIT(29)
+#define HC_CAP_SG_CR_EN			BIT(28)
+#define HC_CAP_MAX_DATA_LENGTH		GENMASK(24, 22)
+#define HC_CAP_CMD_SIZE			GENMASK(21, 20)
+#define HC_CAP_DIRECT_COMMANDS_EN	BIT(18)
+#define HC_CAP_MULTI_LANE_EN		BIT(15)
+#define HC_CAP_CMD_CCC_DEFBYTE		BIT(10)
+#define HC_CAP_HDR_BT_EN		BIT(8)
+#define HC_CAP_HDR_TS_EN		BIT(7)
+#define HC_CAP_HDR_DDR_EN		BIT(6)
+#define HC_CAP_NON_CURRENT_MASTER_CAP	BIT(5)	/* master handoff capable *=
/
+#define HC_CAP_DATA_BYTE_CFG_EN		BIT(4)	/* endian selection possible */
+#define HC_CAP_AUTO_COMMAND		BIT(3)
+#define HC_CAP_COMBO_COMMAND		BIT(2)
+
+#define RESET_CONTROL			0x10
+#define BUS_RESET			BIT(31)
+#define BUS_RESET_TYPE			GENMASK(30, 29)
+#define IBI_QUEUE_RST			BIT(5)
+#define RX_FIFO_RST			BIT(4)
+#define TX_FIFO_RST			BIT(3)
+#define RESP_QUEUE_RST			BIT(2)
+#define CMD_QUEUE_RST			BIT(1)
+#define SOFT_RST			BIT(0)	/* Core Reset */
+
+#define PRESENT_STATE			0x14	/* HC=E2=80=99s current state */
+#define STATE_CURRENT_MASTER		BIT(2)
+
+#define INTR_STATUS			0x20
+#define INTR_STATUS_ENABLE		0x24
+#define INTR_SIGNAL_ENABLE		0x28
+#define INTR_FORCE			0x2c
+#define INTR_HC_CMD_SEQ_UFLOW_STAT	BIT(12)	/* Cmd Sequence Underflow */
+#define INTR_HC_RESET_CANCEL		BIT(11)	/* HC Cancelled Reset */
+#define INTR_HC_INTERNAL_ERR		BIT(10)	/* HC Internal Error */
+#define INTR_HC_PIO			BIT(8)	/* cascaded PIO interrupt */
+#define INTR_HC_RINGS			GENMASK(7, 0)
+
+#define DAT_SECTION_OFFSET		0x30	/* Device Address Table */
+#define DAT_ENTRY_SIZE			GENMASK(31, 28)
+#define DAT_TABLE_SIZE			GENMASK(18, 12)
+#define DAT_TABLE_OFFSET		GENMASK(11, 0)
+
+#define DCT_SECTION_OFFSET		0x34	/* Device Characteristics Table */
+#define DCT_ENTRY_SIZE			GENMASK(31, 28)
+#define DCT_TABLE_INDEX			GENMASK(23, 19)
+#define DCT_TABLE_SIZE			GENMASK(18, 12)
+#define DCT_TABLE_OFFSET		GENMASK(11, 0)
+
+#define RING_HEADERS_SECTION_OFFSET	0x38
+#define RING_HEADERS_OFFSET		GENMASK(15, 0)
+
+#define PIO_SECTION_OFFSET		0x3c
+#define PIO_OFFSET			GENMASK(15, 0)	/* PIO Offset */
+
+#define EXT_CAPS_SECTION_OFFSET		0x40
+#define EXT_CAPS_OFFSET			GENMASK(15, 0)
+
+#define IBI_NOTIFY_CTRL			0x58	/* IBI Notify Control */
+#define IBI_NOTIFY_SIR_REJECTED		BIT(3)	/* Rejected Slave Interrupt Requ=
est */
+#define IBI_NOTIFY_MR_REJECTED		BIT(1)	/* Rejected Master Request Contro=
l */
+#define IBI_NOTIFY_HJ_REJECTED		BIT(0)	/* Rejected Hot-Join Control */
+
+#define DEV_CTX_BASE_LO			0x60
+#define DEV_CTX_BASE_HI			0x64
+
+
+static inline struct i3c_hci *to_i3c_hci(struct i3c_master_controller *m=
)
+{
+	return container_of(m, struct i3c_hci, master);
+}
+
+static int i3c_hci_bus_init(struct i3c_master_controller *m)
+{
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct i3c_device_info info;
+	int ret;
+
+	DBG("");
+
+	if (hci->cmd =3D=3D &i3c_hci_cmd_v1) {
+		ret =3D i3c_hci_dat_init(hci);
+		if (ret)
+			return ret;
+	}
+
+	ret =3D i3c_master_get_free_addr(m, 0);
+	if (ret < 0)
+		return ret;
+	reg_write(MASTER_DEVICE_ADDR,
+		  MASTER_DYNAMIC_ADDR(ret) | MASTER_DYNAMIC_ADDR_VALID);
+	memset(&info, 0, sizeof(info));
+	info.dyn_addr =3D ret;
+	ret =3D i3c_master_set_info(m, &info);
+	if (ret)
+		return ret;
+
+	ret =3D hci->io->init(hci);
+	if (ret)
+		return ret;
+
+	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
+	DBG("HC_CONTROL =3D %#x", reg_read(HC_CONTROL));
+
+	return 0;
+}
+
+static void i3c_hci_bus_cleanup(struct i3c_master_controller *m)
+{
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+
+	DBG("");
+
+	reg_clear(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
+	hci->io->cleanup(hci);
+	if (hci->cmd =3D=3D &i3c_hci_cmd_v1)
+		i3c_hci_dat_cleanup(hci);
+}
+
+void i3c_hci_resume(struct i3c_hci *hci)
+{
+	/* the HC_CONTROL_RESUME bit is R/W1C so just read and write back */
+	reg_write(HC_CONTROL, reg_read(HC_CONTROL));
+}
+
+/* located here rather than pio.c because needed bits are in core reg sp=
ace */
+void i3c_hci_pio_reset(struct i3c_hci *hci)
+{
+	reg_write(RESET_CONTROL, RX_FIFO_RST|TX_FIFO_RST|RESP_QUEUE_RST);
+}
+
+/* located here rather than dct.c because needed bits are in core reg sp=
ace */
+void i3c_hci_dct_index_reset(struct i3c_hci *hci)
+{
+	reg_write(DCT_SECTION_OFFSET, FIELD_PREP(DCT_TABLE_INDEX, 0));
+}
+
+static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
+				struct i3c_ccc_cmd *ccc)
+{
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct hci_xfer *xfer;
+	bool raw =3D !!(hci->quirks & HCI_QUIRK_RAW_CCC);
+	bool prefixed =3D raw && !!(ccc->id & I3C_CCC_DIRECT);
+	u_int nxfers =3D ccc->ndests + prefixed;
+	DECLARE_COMPLETION_ONSTACK(done);
+	int i, last, ret =3D 0;
+
+	DBG("cmd=3D%#x rnw=3D%d ndests=3D%d data[0].len=3D%d",
+	    ccc->id, ccc->rnw, ccc->ndests, ccc->dests[0].payload.len);
+
+	xfer =3D hci_alloc_xfer(nxfers);
+	if (!xfer)
+		return -ENOMEM;
+
+	if (prefixed) {
+		xfer->data =3D NULL;
+		xfer->data_len =3D 0;
+		xfer->rnw =3D false;
+		hci->cmd->prep_ccc(hci, xfer, I3C_BROADCAST_ADDR,
+				   ccc->id, true);
+		xfer++;
+	}
+
+	for (i =3D 0; i < nxfers - prefixed; i++) {
+		xfer[i].data =3D ccc->dests[i].payload.data;
+		xfer[i].data_len =3D ccc->dests[i].payload.len;
+		xfer[i].rnw =3D ccc->rnw;
+		ret =3D hci->cmd->prep_ccc(hci, &xfer[i], ccc->dests[i].addr,
+					 ccc->id, raw);
+		if (ret)
+			goto out;
+		xfer[i].cmd_desc[0] |=3D CMD_0_ROC;
+	}
+	last =3D i - 1;
+	xfer[last].cmd_desc[0] |=3D CMD_0_TOC;
+	xfer[last].completion =3D &done;
+
+	if (prefixed)
+		xfer--;
+
+	ret =3D hci->io->queue_xfer(hci, xfer, nxfers);
+	if (ret)
+		goto out;
+	if (!wait_for_completion_timeout(&done, HZ) &&
+	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
+		ret =3D -ETIME;
+		goto out;
+	}
+	for (i =3D prefixed; i < nxfers; i++) {
+		if (ccc->rnw)
+			ccc->dests[i - prefixed].payload.len =3D
+				RESP_DATA_LENGTH(xfer[i].response);
+		if (RESP_STATUS(xfer[i].response) !=3D RESP_SUCCESS) {
+			ret =3D -EIO;
+			goto out;
+		}
+	}
+
+#if 0
+	if (ccc->rnw) {
+		HEXDUMP("got: ", ccc->dests[0].payload.data,
+				 ccc->dests[0].payload.len);
+	}
+#endif
+
+out:
+	hci_free_xfer(xfer, nxfers);
+	return ret;
+}
+
+static int i3c_hci_daa(struct i3c_master_controller *m)
+{
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+
+	DBG("");
+
+	return hci->cmd->perform_daa(hci);
+}
+
+static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
+			      struct i3c_priv_xfer *i3c_xfers,
+			      int nxfers)
+{
+	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct hci_xfer *xfer;
+	DECLARE_COMPLETION_ONSTACK(done);
+	u_int size_limit;
+	int i, last, ret =3D 0;
+
+	DBG("nxfers =3D %d", nxfers);
+
+	xfer =3D hci_alloc_xfer(nxfers);
+	if (!xfer)
+		return -ENOMEM;
+
+	size_limit =3D 1 << (16 + FIELD_GET(HC_CAP_MAX_DATA_LENGTH, hci->caps))=
;
+
+	for (i =3D 0; i < nxfers; i++) {
+		xfer[i].data_len =3D i3c_xfers[i].len;
+		ret =3D -EFBIG;
+		if (xfer[i].data_len >=3D size_limit)
+			goto out;
+		xfer[i].rnw =3D i3c_xfers[i].rnw;
+		if (i3c_xfers[i].rnw) {
+			xfer[i].data =3D i3c_xfers[i].data.in;
+		} else {
+			/* silence the const qualifier warning with a cast */
+			xfer[i].data =3D (void *) i3c_xfers[i].data.out;
+		}
+		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i]);
+		xfer[i].cmd_desc[0] |=3D CMD_0_ROC;
+	}
+	last =3D i - 1;
+	xfer[last].cmd_desc[0] |=3D CMD_0_TOC;
+	xfer[last].completion =3D &done;
+
+	ret =3D hci->io->queue_xfer(hci, xfer, nxfers);
+	if (ret)
+		goto out;
+	if (!wait_for_completion_timeout(&done, HZ) &&
+	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
+		ret =3D -ETIME;
+		goto out;
+	}
+	for (i =3D 0; i < nxfers; i++) {
+		if (i3c_xfers[i].rnw)
+			i3c_xfers[i].len =3D RESP_DATA_LENGTH(xfer[i].response);
+		if (RESP_STATUS(xfer[i].response) !=3D RESP_SUCCESS) {
+			ret =3D -EIO;
+			goto out;
+		}
+	}
+
+out:
+	hci_free_xfer(xfer, nxfers);
+	return ret;
+}
+
+static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
+			     const struct i2c_msg *i2c_xfers, int nxfers)
+{
+	struct i3c_master_controller *m =3D i2c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct hci_xfer *xfer;
+	DECLARE_COMPLETION_ONSTACK(done);
+	int i, last, ret =3D 0;
+
+	DBG("nxfers =3D %d", nxfers);
+
+	xfer =3D hci_alloc_xfer(nxfers);
+	if (!xfer)
+		return -ENOMEM;
+
+	for (i =3D 0; i < nxfers; i++) {
+		xfer[i].data =3D i2c_xfers[i].buf;
+		xfer[i].data_len =3D i2c_xfers[i].len;
+		xfer[i].rnw =3D (i2c_xfers[i].flags & I2C_M_RD);
+		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);
+		xfer[i].cmd_desc[0] |=3D CMD_0_ROC;
+	}
+	last =3D i - 1;
+	xfer[last].cmd_desc[0] |=3D CMD_0_TOC;
+	xfer[last].completion =3D &done;
+
+	ret =3D hci->io->queue_xfer(hci, xfer, nxfers);
+	if (ret)
+		goto out;
+	if (!wait_for_completion_timeout(&done, HZ) &&
+	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
+		ret =3D -ETIME;
+		goto out;
+	}
+	for (i =3D 0; i < nxfers; i++) {
+		if (RESP_STATUS(xfer[i].response) !=3D RESP_SUCCESS) {
+			ret =3D -EIO;
+			goto out;
+		}
+	}
+
+out:
+	hci_free_xfer(xfer, nxfers);
+	return ret;
+}
+
+static int i3c_hci_attach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data;
+	int ret;
+
+	DBG("");
+
+	dev_data =3D kzalloc(sizeof(*dev_data), GFP_KERNEL);
+	if (!dev_data)
+		return -ENOMEM;
+	if (hci->cmd =3D=3D &i3c_hci_cmd_v1) {
+		ret =3D i3c_hci_dat_alloc_entry(hci);
+		if (ret < 0) {
+			kfree(dev_data);
+			return ret;
+		}
+		i3c_hci_dat_set_dynamic_addr(hci, ret, dev->info.dyn_addr);
+		dev_data->dat_idx =3D ret;
+	}
+	i3c_dev_set_master_data(dev, dev_data);
+	return 0;
+}
+
+static int i3c_hci_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 old_dyn=
_addr)
+{
+	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+
+	DBG("");
+
+	if (hci->cmd =3D=3D &i3c_hci_cmd_v1)
+		i3c_hci_dat_set_dynamic_addr(hci, dev_data->dat_idx,
+					     dev->info.dyn_addr);
+	return 0;
+}
+
+static void i3c_hci_detach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+
+	DBG("");
+
+	i3c_dev_set_master_data(dev, NULL);
+	if (hci->cmd =3D=3D &i3c_hci_cmd_v1)
+		i3c_hci_dat_free_entry(hci, dev_data->dat_idx);
+	kfree(dev_data);
+}
+
+static int i3c_hci_attach_i2c_dev(struct i2c_dev_desc *dev)
+{
+	struct i3c_master_controller *m =3D i2c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data;
+	int ret;
+
+	DBG("");
+
+	if (hci->cmd !=3D &i3c_hci_cmd_v1)
+		return 0;
+	dev_data =3D kzalloc(sizeof(*dev_data), GFP_KERNEL);
+	if (!dev_data)
+		return -ENOMEM;
+	ret =3D i3c_hci_dat_alloc_entry(hci);
+	if (ret < 0) {
+		kfree(dev_data);
+		return ret;
+	}
+	i3c_hci_dat_set_static_addr(hci, ret, dev->addr);
+	i3c_hci_dat_set_flags(hci, ret, DAT_0_I2C_DEVICE, 0);
+	dev_data->dat_idx =3D ret;
+	i2c_dev_set_master_data(dev, dev_data);
+	return 0;
+}
+
+static void i3c_hci_detach_i2c_dev(struct i2c_dev_desc *dev)
+{
+	struct i3c_master_controller *m =3D i2c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data =3D i2c_dev_get_master_data(dev);
+
+	DBG("");
+
+	if (dev_data) {
+		i2c_dev_set_master_data(dev, NULL);
+		if (hci->cmd =3D=3D &i3c_hci_cmd_v1)
+			i3c_hci_dat_free_entry(hci, dev_data->dat_idx);
+		kfree(dev_data);
+	}
+}
+
+static int i3c_hci_request_ibi(struct i3c_dev_desc *dev,
+			       const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+	u_int dat_idx =3D dev_data->dat_idx;
+
+	if (req->max_payload_len !=3D 0)
+		i3c_hci_dat_set_flags(hci, dat_idx, DAT_0_IBI_PAYLOAD, 0);
+	else
+		i3c_hci_dat_clear_flags(hci, dat_idx, DAT_0_IBI_PAYLOAD, 0);
+	return hci->io->request_ibi(hci, dev, req);
+}
+
+static void i3c_hci_free_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+
+	hci->io->free_ibi(hci, dev);
+}
+
+static int i3c_hci_enable_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+
+	i3c_hci_dat_clear_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
+	return i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR)=
;
+}
+
+static int i3c_hci_disable_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+
+	i3c_hci_dat_set_flags(hci, dev_data->dat_idx, DAT_0_SIR_REJECT, 0);
+	return i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR=
);
+}
+
+static void i3c_hci_recycle_ibi_slot(struct i3c_dev_desc *dev,
+				     struct i3c_ibi_slot *slot)
+{
+	struct i3c_master_controller *m =3D i3c_dev_get_master(dev);
+	struct i3c_hci *hci =3D to_i3c_hci(m);
+
+	hci->io->recycle_ibi_slot(hci, dev, slot);
+}
+
+static const struct i3c_master_controller_ops i3c_hci_ops =3D {
+	.bus_init		=3D i3c_hci_bus_init,
+	.bus_cleanup		=3D i3c_hci_bus_cleanup,
+	.do_daa			=3D i3c_hci_daa,
+	.send_ccc_cmd		=3D i3c_hci_send_ccc_cmd,
+	.priv_xfers		=3D i3c_hci_priv_xfers,
+	.i2c_xfers		=3D i3c_hci_i2c_xfers,
+	.attach_i3c_dev		=3D i3c_hci_attach_i3c_dev,
+	.reattach_i3c_dev	=3D i3c_hci_reattach_i3c_dev,
+	.detach_i3c_dev		=3D i3c_hci_detach_i3c_dev,
+	.attach_i2c_dev		=3D i3c_hci_attach_i2c_dev,
+	.detach_i2c_dev		=3D i3c_hci_detach_i2c_dev,
+	.request_ibi		=3D i3c_hci_request_ibi,
+	.free_ibi		=3D i3c_hci_free_ibi,
+	.enable_ibi		=3D i3c_hci_enable_ibi,
+	.disable_ibi		=3D i3c_hci_disable_ibi,
+	.recycle_ibi_slot	=3D i3c_hci_recycle_ibi_slot,
+};
+
+static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
+{
+	struct i3c_hci *hci =3D dev_id;
+	irqreturn_t result =3D IRQ_NONE;
+	u32 val;
+
+	val =3D reg_read(INTR_STATUS);
+	DBG("INTR_STATUS =3D %#x", val);
+
+	if (val) {
+		reg_write(INTR_STATUS, val);
+	} else {
+		/* v1.0 does not have PIO cascaded notification bits */
+		val |=3D INTR_HC_PIO;
+	}
+
+	if (val & INTR_HC_RESET_CANCEL) {
+		DBG("cancelled reset");
+		val &=3D ~INTR_HC_RESET_CANCEL;
+	}
+	if (val & INTR_HC_INTERNAL_ERR) {
+		ERR("Host Controller Internal Error");
+		val &=3D ~INTR_HC_INTERNAL_ERR;
+	}
+	if (val & INTR_HC_PIO) {
+		hci->io->irq_handler(hci, 0);
+		val &=3D ~INTR_HC_PIO;
+	}
+	if (val & INTR_HC_RINGS) {
+		hci->io->irq_handler(hci, val & INTR_HC_RINGS);
+		val &=3D ~INTR_HC_RINGS;
+	}
+	if (val)
+		ERR("unexpected INTR_STATUS %#x", val);
+	else
+		result =3D IRQ_HANDLED;
+
+	return result;
+}
+
+static int i3c_hci_init(struct i3c_hci *hci)
+{
+	u32 regval, offset;
+	int ret;
+
+	/* Validate HCI hardware version */
+	regval =3D reg_read(HCI_VERSION);
+	hci->version_major =3D (regval >> 8) & 0xf;
+	hci->version_minor =3D (regval >> 4) & 0xf;
+	hci->revision =3D regval & 0xf;
+	NOTE("HCI v%u.%u r%02u",
+	     hci->version_major, hci->version_minor, hci->revision);
+	/* known versions */
+	switch (regval & ~0xf) {
+	case 0x100:	/* version 1.0 */
+	case 0x110:	/* version 1.1 */
+	case 0x200:	/* version 2.0 */
+		break;
+	default:
+		ERR("unsupported HCI version");
+		return -EPROTONOSUPPORT;
+	}
+
+	hci->caps =3D reg_read(HC_CAPABILITIES);
+	DBG("caps =3D %#x", hci->caps);
+
+	regval =3D reg_read(DAT_SECTION_OFFSET);
+	offset =3D FIELD_GET(DAT_TABLE_OFFSET, regval);
+	hci->DAT_regs =3D offset ? hci->base_regs + offset : 0;
+	hci->DAT_entries =3D FIELD_GET(DAT_TABLE_SIZE, regval);
+	hci->DAT_entry_size =3D FIELD_GET(DAT_ENTRY_SIZE, regval);
+	INFO("DAT: %u %u-bytes entries at offset %#x",
+	     hci->DAT_entries, hci->DAT_entry_size * 4, offset);
+
+	regval =3D reg_read(DCT_SECTION_OFFSET);
+	offset =3D FIELD_GET(DCT_TABLE_OFFSET, regval);
+	hci->DCT_regs =3D offset ? hci->base_regs + offset : 0;
+	hci->DCT_entries =3D FIELD_GET(DCT_TABLE_SIZE, regval);
+	hci->DCT_entry_size =3D FIELD_GET(DCT_ENTRY_SIZE, regval);
+	INFO("DCT: %u %u-bytes entries at offset %#x",
+	     hci->DCT_entries, hci->DCT_entry_size * 4, offset);
+
+	regval =3D reg_read(RING_HEADERS_SECTION_OFFSET);
+	offset =3D FIELD_GET(RING_HEADERS_OFFSET, regval);
+	hci->RHS_regs =3D offset ? hci->base_regs + offset : 0;
+	INFO("Ring Headers at offset %#x", offset);
+
+	regval =3D reg_read(PIO_SECTION_OFFSET);
+	offset =3D FIELD_GET(PIO_OFFSET, regval);
+	hci->PIO_regs =3D offset ? hci->base_regs + offset : 0;
+	INFO("PIO section at offset %#x", offset);
+
+	regval =3D reg_read(EXT_CAPS_SECTION_OFFSET);
+	offset =3D FIELD_GET(EXT_CAPS_OFFSET, regval);
+	hci->EXTCAPS_regs =3D offset ? hci->base_regs + offset : 0;
+	INFO("Extended Caps at offset %#x", offset);
+
+	ret =3D i3c_hci_parse_ext_caps(hci);
+	if (ret)
+		return ret;
+
+	/*
+	 * Now let's reset the hardware.
+	 * SOFT_RST must be clear before we write to it.
+	 * Then we must wait until it clears again.
+	 */
+	ret =3D readx_poll_timeout(reg_read, RESET_CONTROL, regval,
+				 !(regval & SOFT_RST), 1, 10000);
+	if (ret)
+		return -ENXIO;
+	reg_write(RESET_CONTROL, SOFT_RST);
+	ret =3D readx_poll_timeout(reg_read, RESET_CONTROL, regval,
+				 !(regval & SOFT_RST), 1, 10000);
+	if (ret)
+		return -ENXIO;
+
+	/* Disable all interrupts and allow all signal updates */
+	reg_write(INTR_SIGNAL_ENABLE, 0x0);
+	reg_write(INTR_STATUS_ENABLE, 0xffffffff);
+
+	/* Make sure our data ordering fits the host's */
+	regval =3D reg_read(HC_CONTROL);
+	if (IS_ENABLED(CONFIG_BIG_ENDIAN)) {
+		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
+			regval |=3D HC_CONTROL_DATA_BIG_ENDIAN;
+			reg_write(HC_CONTROL, regval);
+			regval =3D reg_read(HC_CONTROL);
+			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
+				ERR("cannot set BE mode");
+				return -ENOTSUPP;
+			}
+		}
+	} else {
+		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
+			regval &=3D ~HC_CONTROL_DATA_BIG_ENDIAN;
+			reg_write(HC_CONTROL, regval);
+			regval =3D reg_read(HC_CONTROL);
+			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
+				ERR("cannot clear BE mode");
+				return -ENOTSUPP;
+			}
+		}
+	}
+
+	/* Select our command descriptor model */
+	switch (FIELD_GET(HC_CAP_CMD_SIZE, hci->caps)) {
+	case 0:
+		hci->cmd =3D &i3c_hci_cmd_v1;
+		break;
+	case 1:
+		hci->cmd =3D &i3c_hci_cmd_v2;
+		break;
+	default:
+		ERR("wrong CMD_SIZE capability value");
+		return -EINVAL;
+	}
+
+	/* Try activating DMA operations first */
+	if (hci->RHS_regs) {
+		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
+		if (reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE) {
+			ERR("PIO mode is stuck");
+			ret =3D -EIO;
+		} else {
+			hci->io =3D &i3c_hci_dma;
+			INFO("Using DMA");
+		}
+	}
+
+	/* If no DMA, try PIO */
+	if (!hci->io && hci->PIO_regs) {
+		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
+		if (!(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
+			ERR("DMA mode is stuck");
+			ret =3D -EIO;
+		} else {
+			hci->io =3D &i3c_hci_pio;
+			INFO("Using PIO");
+		}
+	}
+
+	if (!hci->io) {
+		ERR("neither DMA nor PIO can be used");
+		if (!ret)
+			ret =3D -EINVAL;
+		return ret;
+	}
+
+	return 0;
+}
+
+static int i3c_hci_probe(struct platform_device *pdev)
+{
+	struct i3c_hci *hci;
+	int irq, ret;
+
+	hci =3D devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
+	if (!hci)
+		return -ENOMEM;
+	hci->base_regs =3D devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hci->base_regs))
+		return PTR_ERR(hci->base_regs);
+
+	platform_set_drvdata(pdev, hci);
+	/* temporary for dev_printk's, to be replaced in i3c_master_register */
+	hci->master.dev.init_name =3D dev_name(&pdev->dev);
+
+	ret =3D i3c_hci_init(hci);
+	if (ret)
+		return ret;
+
+	irq =3D platform_get_irq(pdev, 0);
+	ret =3D devm_request_irq(&pdev->dev, irq, i3c_hci_irq_handler,
+			       0, NULL, hci);
+	if (ret)
+		return ret;
+
+	ret =3D i3c_master_register(&hci->master, &pdev->dev,
+				  &i3c_hci_ops, false);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int i3c_hci_remove(struct platform_device *pdev)
+{
+	struct i3c_hci *hci =3D platform_get_drvdata(pdev);
+	int ret;
+
+	ret =3D i3c_master_unregister(&hci->master);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id i3c_hci_of_match[] =3D {
+	{ .compatible =3D "mipi-i3c-hci", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, i3c_hci_of_match);
+
+static struct platform_driver i3c_hci_driver =3D {
+	.probe =3D i3c_hci_probe,
+	.remove =3D i3c_hci_remove,
+	.driver =3D {
+		.name =3D "mipi-i3c-hci",
+		.of_match_table =3D of_match_ptr(i3c_hci_of_match),
+	},
+};
+module_platform_driver(i3c_hci_driver);
+
+MODULE_AUTHOR("Nicolas Pitre <npitre@baylibre.com>");
+MODULE_DESCRIPTION("MIPI I3C HCI driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/m=
ipi-i3c-hci/dat.h
new file mode 100644
index 0000000000..81159f5649
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Common DAT related stuff
+ */
+
+#ifndef DAT_H
+#define DAT_H
+
+/* Global DAT flags */
+#define DAT_0_I2C_DEVICE		W0_BIT_(31)
+#define DAT_0_SIR_REJECT		W0_BIT_(13)
+#define DAT_0_IBI_PAYLOAD		W0_BIT_(12)
+
+int i3c_hci_dat_init(struct i3c_hci *hci);
+void i3c_hci_dat_cleanup(struct i3c_hci *hci);
+int i3c_hci_dat_alloc_entry(struct i3c_hci *hci);
+void i3c_hci_dat_set_dynamic_addr(struct i3c_hci *hci, u_int dat_idx, u8=
 addr);
+void i3c_hci_dat_set_static_addr(struct i3c_hci *hci, u_int dat_idx, u8 =
addr);
+void i3c_hci_dat_set_flags(struct i3c_hci *hci, u_int dat_idx, u32 w0, u=
32 w1);
+void i3c_hci_dat_clear_flags(struct i3c_hci *hci, u_int dat_idx, u32 w0,=
 u32 w1);
+int i3c_hci_dat_get_index(struct i3c_hci *hci, u8 address);
+void i3c_hci_dat_free_entry(struct i3c_hci *hci, u_int dat_idx);
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/maste=
r/mipi-i3c-hci/dat_v1.c
new file mode 100644
index 0000000000..bc2a056689
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitmap.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/io.h>
+
+#include "hci.h"
+#include "dat.h"
+
+
+/*
+ * Device Address Table Structure
+ */
+
+#define DAT_1_AUTOCMD_HDR_CODE		W1_MASK(58, 51)
+#define DAT_1_AUTOCMD_MODE		W1_MASK(50, 48)
+#define DAT_1_AUTOCMD_VALUE		W1_MASK(47, 40)
+#define DAT_1_AUTOCMD_MASK		W1_MASK(39, 32)
+/*	DAT_0_I2C_DEVICE		W0_BIT_(31) */
+#define DAT_0_DEV_NACK_RETRY_CNT	W0_MASK(30, 29)
+#define DAT_0_RING_ID			W0_MASK(28, 26)
+#define DAT_0_DYNADDR_PARITY		W0_BIT_(23)
+#define DAT_0_DYNAMIC_ADDRESS		W0_MASK(22, 16)
+#define DAT_0_TS			W0_BIT_(15)
+#define DAT_0_MR_REJECT			W0_BIT_(14)
+/*	DAT_0_SIR_REJECT		W0_BIT_(13) */
+/*	DAT_0_IBI_PAYLOAD		W0_BIT_(12) */
+#define DAT_0_STATIC_ADDRESS		W0_MASK(6, 0)
+
+#define dat_w0_read(i)		readl(hci->DAT_regs + (i) * 8)
+#define dat_w1_read(i)		readl(hci->DAT_regs + (i) * 8 + 4)
+#define dat_w0_write(i, v)	writel(v, hci->DAT_regs + (i) * 8)
+#define dat_w1_write(i, v)	writel(v, hci->DAT_regs + (i) * 8 + 4)
+
+static inline bool dynaddr_parity(u_int addr)
+{
+	addr |=3D 1 << 7;
+	addr +=3D addr >> 4;
+	addr +=3D addr >> 2;
+	addr +=3D addr >> 1;
+	return (addr & 1);
+}
+
+int i3c_hci_dat_init(struct i3c_hci *hci)
+{
+	u_int dat_idx;
+
+	if (!hci->DAT_regs) {
+		ERR("only DAT in register space is supported at the moment");
+		return -ENOTSUPP;
+	}
+	if (hci->DAT_entry_size !=3D 8) {
+		ERR("only 8-bytes DAT entries are supported at the moment");
+		return -ENOTSUPP;
+	}
+
+	/* use a bitmap for faster free slot search */
+	hci->DAT_data =3D bitmap_zalloc(hci->DAT_entries, GFP_KERNEL);
+	if (!hci->DAT_data)
+		return -ENOMEM;
+
+	/* clear them */
+	for (dat_idx =3D 0; dat_idx < hci->DAT_entries; dat_idx++) {
+		dat_w0_write(dat_idx, 0);
+		dat_w1_write(dat_idx, 0);
+	}
+
+	return 0;
+}
+
+void i3c_hci_dat_cleanup(struct i3c_hci *hci)
+{
+	bitmap_free(hci->DAT_data);
+	hci->DAT_data =3D NULL;
+}
+
+int i3c_hci_dat_alloc_entry(struct i3c_hci *hci)
+{
+	u_int dat_idx;
+
+	dat_idx =3D find_first_zero_bit(hci->DAT_data, hci->DAT_entries);
+	if (dat_idx >=3D hci->DAT_entries)
+		return -ENOENT;
+	__set_bit(dat_idx, hci->DAT_data);
+
+	/* default flags */
+	dat_w0_write(dat_idx, DAT_0_SIR_REJECT | DAT_0_MR_REJECT);
+
+	return dat_idx;
+}
+
+void i3c_hci_dat_set_dynamic_addr(struct i3c_hci *hci,
+				  u_int dat_idx, u8 address)
+{
+	u32 dat_w0;
+
+	dat_w0 =3D dat_w0_read(dat_idx);
+	dat_w0 &=3D ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
+	dat_w0 |=3D FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
+		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
+	dat_w0_write(dat_idx, dat_w0);
+}
+
+void i3c_hci_dat_set_static_addr(struct i3c_hci *hci,
+				 u_int dat_idx, u8 address)
+{
+	u32 dat_w0;
+
+	dat_w0 =3D dat_w0_read(dat_idx);
+	dat_w0 &=3D ~DAT_0_STATIC_ADDRESS;
+	dat_w0 |=3D FIELD_PREP(DAT_0_STATIC_ADDRESS, address);
+	dat_w0_write(dat_idx, dat_w0);
+}
+
+void i3c_hci_dat_set_flags(struct i3c_hci *hci, u_int dat_idx,
+			   u32 w0_flags, u32 w1_flags)
+{
+	u32 dat_w0, dat_w1;
+
+	dat_w0 =3D dat_w0_read(dat_idx);
+	dat_w1 =3D dat_w1_read(dat_idx);
+	dat_w0 |=3D w0_flags;
+	dat_w1 |=3D w1_flags;
+	dat_w0_write(dat_idx, dat_w0);
+	dat_w1_write(dat_idx, dat_w1);
+}
+
+void i3c_hci_dat_clear_flags(struct i3c_hci *hci, u_int dat_idx,
+			     u32 w0_flags, u32 w1_flags)
+{
+	u32 dat_w0, dat_w1;
+
+	dat_w0 =3D dat_w0_read(dat_idx);
+	dat_w1 =3D dat_w1_read(dat_idx);
+	dat_w0 &=3D ~w0_flags;
+	dat_w1 &=3D ~w1_flags;
+	dat_w0_write(dat_idx, dat_w0);
+	dat_w1_write(dat_idx, dat_w1);
+}
+
+int i3c_hci_dat_get_index(struct i3c_hci *hci, u8 dev_addr)
+{
+	u_int dat_idx;
+	u32 dat_w0;
+
+	for (dat_idx =3D find_first_bit(hci->DAT_data, hci->DAT_entries);
+	     dat_idx < hci->DAT_entries;
+	     dat_idx =3D find_next_bit(hci->DAT_data, hci->DAT_entries, dat_idx=
)) {
+		dat_w0 =3D dat_w0_read(dat_idx);
+		if (FIELD_GET(DAT_0_DYNAMIC_ADDRESS, dat_w0) =3D=3D dev_addr)
+			return dat_idx;
+	}
+	/* what to do here? */
+	BUG();
+}
+
+void i3c_hci_dat_free_entry(struct i3c_hci *hci, u_int dat_idx)
+{
+	dat_w0_write(dat_idx, 0);
+	dat_w1_write(dat_idx, 0);
+	__clear_bit(dat_idx, hci->DAT_data);
+}
diff --git a/drivers/i3c/master/mipi-i3c-hci/dct.h b/drivers/i3c/master/m=
ipi-i3c-hci/dct.h
new file mode 100644
index 0000000000..1c6714195e
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/dct.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Common DCT related stuff
+ */
+
+#ifndef DCT_H
+#define DCT_H
+
+void i3c_hci_dct_get_val(struct i3c_hci *hci, u_int dct_idx,
+			 u64 *pid, u_int *dcr, u_int *bcr);
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/dct_v1.c b/drivers/i3c/maste=
r/mipi-i3c-hci/dct_v1.c
new file mode 100644
index 0000000000..bbe1346ced
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/dct_v1.c
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ */
+
+#include <linux/device.h>
+#include <linux/bitfield.h>
+#include <linux/i3c/master.h>
+#include <linux/io.h>
+
+#include "hci.h"
+#include "dct.h"
+
+/*
+ * Device Characteristic Table
+ */
+
+void i3c_hci_dct_get_val(struct i3c_hci *hci, u_int dct_idx,
+			 u64 *pid, u_int *dcr, u_int *bcr)
+{
+	void __iomem *reg =3D hci->DCT_regs + dct_idx * 4 * 4;
+	u32 dct_entry_data[4];
+	u_int i;
+
+	for (i =3D 0; i < 4; i++) {
+		dct_entry_data[i] =3D readl(reg);
+		reg +=3D 4;
+	}
+
+	*pid =3D ((u64)dct_entry_data[0]) << (47 - 32 + 1) |
+	       FIELD_GET(W1_MASK(47, 32), dct_entry_data[1]);
+	*dcr =3D FIELD_GET(W2_MASK(71, 64), dct_entry_data[2]);
+	*bcr =3D FIELD_GET(W2_MASK(79, 72), dct_entry_data[2]);
+}
diff --git a/drivers/i3c/master/mipi-i3c-hci/debug.c b/drivers/i3c/master=
/mipi-i3c-hci/debug.c
new file mode 100644
index 0000000000..3885499119
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/debug.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ */
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/i3c/master.h>
+#include <linux/printk.h>
+
+#include "hci.h"
+#include "debug.h"
+
+/*
+ * Paul Kimelman's debug trace log facility.
+ * This is completely vendor and hardware specific.
+ */
+void __PK_debug_trace(struct i3c_hci *hci, const char *func)
+{
+	void __iomem *trcp =3D (void __iomem *)hci->vendor_data + 7*4;
+	uint32_t idx, cycles, match;
+	uint32_t trace_full =3D 1;
+
+	if (!hci->vendor_data)
+		return;
+
+	idx =3D readl(trcp + 0*4);
+	cycles =3D idx>>16;
+	idx &=3D 0xFFFF;
+	if (idx > 0xFFF) {
+		pr_info("Trace count=3D%d, stored=3D%d; cycles=3D%d\n", idx, 0xFFF, cy=
cles);
+		match =3D (idx-1) & 0xFFF;
+	} else {
+		pr_info("Trace count=3D%d; cycles=3D%d\n", idx, cycles);
+		match =3D idx;
+		idx =3D 0;
+	}
+
+	writel(idx | (trace_full << 31), trcp + 1*4); // 1st to read
+	for (; idx !=3D match; idx =3D (idx+1)&0xFFF) { // ring through it
+		uint32_t v =3D readl(trcp + 1*4); // get trace word
+		uint32_t up =3D trace_full ? readl(trcp + 1*4) : 0;
+		char *e2 =3D (v&(1<<9))?"/NACK":"";
+		char *e3 =3D (v&(1<<10))?"/WRABT":"";
+		char *e4 =3D (v&(1<<11))?"/TERM":"";
+		char *e5 =3D (v & (1<<7)) ? "/INVREQ" : "";
+		char *e6 =3D (v & (1<<8)) ? "/TIMEOUT" : "";
+		if (trace_full) {
+			uint32_t cmd =3D up >> 16;
+			pr_info("%-5d: ", up & 0xFFFF);
+			if (cmd)
+				pr_info("cmd=3D%s tid=3D%02X, TOC=3D%d, ROC=3D%d, %s %s addr=3D%X\n-=
--",
+					(cmd & (1<<2)) ? "Cmd" : "DAA",
+					(cmd >> 3) & 0xF, cmd >> 31, (cmd >> 30) & 1,
+					((cmd >> 7) & 1) ? "I2C" : "I3C",
+					(cmd & (1<<8))?"Read ":"Write",
+					(cmd >> 9) & 0x7F);
+			else
+				pr_cont("\n----");
+		} else
+			pr_info("%08X: ", v);
+		pr_cont("#%3X: st=3D%03X,status=3D%02X%s%s%s%s%s%s%s%s%s%s%s%s\n", idx=
,
+			v & 0x7F, (v >> 12) & 0xFFF, ((v >> 24) & 1) ? ", clrs" : "",
+			((v >> 25) & 1) ? ", ERROR" : "", e2, e3, e4, e5, e6,
+			((v >> 26) & 1) ? ",clre" : "", ((v >> 27) & 1) ? ", NACK" : "",
+			((v >> 28) & 1) ? ", IN_DAA" : "",
+			((v >> 29) & 1) ? ", IRQ" : "", ((v >> 30) & 1) ? ", cRSP" : "");
+	}
+	// clear trace index so can tell when we have new ones
+	writel(0, trcp + 0*4);
+}
+
+void __PK_debug_trace_reset(struct i3c_hci *hci)
+{
+	void __iomem *trcp      =3D (void __iomem *)hci->vendor_data + 7*4;
+	writel(0, trcp + 0*4);
+}
diff --git a/drivers/i3c/master/mipi-i3c-hci/debug.h b/drivers/i3c/master=
/mipi-i3c-hci/debug.h
new file mode 100644
index 0000000000..daa9277a56
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/debug.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ */
+
+#ifndef DEBUG_H
+#define DEBUG_H
+
+void __PK_debug_trace(struct i3c_hci *hci, const char *func);
+#define PK_debug_trace() __PK_debug_trace(hci, __func__)
+
+void __PK_debug_trace_reset(struct i3c_hci *hci);
+#define PK_debug_trace_reset() __PK_debug_trace_reset(hci)
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/m=
ipi-i3c-hci/dma.c
new file mode 100644
index 0000000000..bcccde3c11
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -0,0 +1,767 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Note: The I3C HCI v2.0 spec is still in flux. The IBI support is base=
d on
+ * v1.x of the spec and v2.0 will likely be split out.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/io.h>
+
+#include "hci.h"
+#include "cmd.h"
+#include "ibi.h"
+
+
+/*
+ * Software Parameter Values (somewhat arb itrary for now).
+ * Some of them could be determined at run time eventually.
+ */
+
+#define XFER_RINGS			1	/* max: 8 */
+#define XFER_RING_ENTRIES		16	/* max: 255 */
+
+#define IBI_RINGS			1	/* max: 8 */
+#define IBI_STATUS_RING_ENTRIES		32	/* max: 255 */
+#define IBI_CHUNK_CACHELINES		1	/* max: 256 bytes equivalent */
+#define IBI_CHUNK_POOL_SIZE		128	/* max: 1023 */
+
+/*
+ * Ring Header Preamble
+ */
+
+#define rhs_reg_read(r)		readl(hci->RHS_regs + (RHS_##r))
+#define rhs_reg_write(r, v)	writel(v, hci->RHS_regs + (RHS_##r))
+
+#define RHS_CONTROL			0x00
+#define PREAMBLE_SIZE			GENMASK(31, 24)	/* Preamble Section Size */
+#define HEADER_SIZE			GENMASK(23, 16)	/* Ring Header Size */
+#define MAX_HEADER_COUNT_CAP		GENMASK(7, 4) /* HC Max Header Count */
+#define MAX_HEADER_COUNT		GENMASK(3, 0) /* Driver Max Header Count */
+
+#define RHS_RHn_OFFSET(n)		(0x04 + (n)*4)
+
+/*
+ * Ring Header (Per-Ring Bundle)
+ */
+
+#define rh_reg_read(r)		readl(rh->regs + (RH_##r))
+#define rh_reg_write(r, v)	writel(v, rh->regs + (RH_##r))
+
+#define RH_CR_SETUP			0x00	/* Command/Response Ring */
+#define CR_XFER_STRUCT_SIZE		GENMASK(31, 24)
+#define CR_RESP_STRUCT_SIZE		GENMASK(23, 16)
+#define CR_RING_SIZE			GENMASK(8, 0)
+
+#define RH_IBI_SETUP			0x04
+#define IBI_STATUS_STRUCT_SIZE		GENMASK(31, 24)
+#define IBI_STATUS_RING_SIZE		GENMASK(23, 16)
+#define IBI_DATA_CHUNK_SIZE		GENMASK(12, 10)
+#define IBI_DATA_CHUNK_COUNT		GENMASK(9, 0)
+
+#define RH_CHUNK_CONTROL			0x08
+
+#define RH_INTR_STATUS			0x10
+#define RH_INTR_STATUS_ENABLE		0x14
+#define RH_INTR_SIGNAL_ENABLE		0x18
+#define RH_INTR_FORCE			0x1c
+#define INTR_IBI_READY			BIT(12)
+#define INTR_TRANSFER_COMPLETION	BIT(11)
+#define INTR_RING_OP			BIT(10)
+#define INTR_TRANSFER_ERR		BIT(9)
+#define INTR_WARN_INS_STOP_MODE		BIT(7)
+#define INTR_IBI_RING_FULL		BIT(6)
+#define INTR_TRANSFER_ABORT		BIT(5)
+
+#define RH_RING_STATUS			0x20
+#define RING_STATUS_LOCKED		BIT(3)
+#define RING_STATUS_ABORTED		BIT(2)
+#define RING_STATUS_RUNNING		BIT(1)
+#define RING_STATUS_ENABLED		BIT(0)
+
+#define RH_RING_CONTROL			0x24
+#define RING_CTRL_ABORT			BIT(2)
+#define RING_CTRL_RUN_STOP		BIT(1)
+#define RING_CTRL_ENABLE		BIT(0)
+
+#define RH_RING_OPERATION1		0x28
+#define RING_OP1_IBI_DEQ_PTR		GENMASK(23, 16)
+#define RING_OP1_CR_SW_DEQ_PTR		GENMASK(15, 8)
+#define RING_OP1_CR_ENQ_PTR		GENMASK(7, 0)
+
+#define RH_RING_OPERATION2		0x2c
+#define RING_OP2_IBI_ENQ_PTR		GENMASK(23, 16)
+#define RING_OP2_CR_DEQ_PTR		GENMASK(7, 0)
+
+#define RH_CMD_RING_BASE_LO		0x30
+#define RH_CMD_RING_BASE_HI		0x34
+#define RH_RESP_RING_BASE_LO		0x38
+#define RH_RESP_RING_BASE_HI		0x3c
+#define RH_IBI_STATUS_RING_BASE_LO	0x40
+#define RH_IBI_STATUS_RING_BASE_HI	0x44
+#define RH_IBI_DATA_RING_BASE_LO	0x48
+#define RH_IBI_DATA_RING_BASE_HI	0x4c
+
+#define RH_CMD_RING_SG			0x50	/* Ring Scatter Gather Support */
+#define RH_RESP_RING_SG			0x54
+#define RH_IBI_STATUS_RING_SG		0x58
+#define RH_IBI_DATA_RING_SG		0x5c
+#define RING_SG_BLP			BIT(31)	/* Buffer Vs. List Pointer */
+#define RING_SG_LIST_SIZE		GENMASK(15, 0)
+
+/*
+ * Data Buffer Descriptor (in memory)
+ */
+
+#define DATA_BUF_BLP			BIT(31)	/* Buffer Vs. List Pointer */
+#define DATA_BUF_IOC			BIT(30)	/* Interrupt on Completion */
+#define DATA_BUF_BLOCK_SIZE		GENMASK(15, 0)
+
+
+struct hci_rh_data {
+	void __iomem *regs;
+	void *xfer, *resp, *ibi_status, *ibi_data;
+	dma_addr_t xfer_phys, resp_phys, ibi_status_phys, ibi_data_phys;
+	u_int xfer_entries, ibi_status_entries, ibi_chunks_total;
+	u_int xfer_struct_sz, resp_struct_sz, ibi_status_sz, ibi_chunk_sz;
+	u_int done_ptr, ibi_chunk_ptr;
+	struct hci_xfer **src_xfers;
+	spinlock_t lock;
+	struct completion op_done;
+};
+
+struct hci_rings_data {
+	u_int total;
+	struct hci_rh_data headers[];
+};
+
+struct hci_dma_dev_ibi_data {
+	struct i3c_generic_ibi_pool *pool;
+	u_int max_len;
+};
+
+
+static void hci_dma_cleanup(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings =3D hci->io_data;
+	struct hci_rh_data *rh;
+	u_int i;
+
+	if (!rings)
+		return;
+
+	for (i =3D 0; i < rings->total; i++) {
+		rh =3D &rings->headers[i];
+
+		rh_reg_write(RING_CONTROL, 0);
+		rh_reg_write(CR_SETUP, 0);
+		rh_reg_write(IBI_SETUP, 0);
+		rh_reg_write(INTR_SIGNAL_ENABLE, 0);
+
+		if (rh->xfer)
+			dma_free_coherent(&hci->master.dev,
+					  rh->xfer_struct_sz * rh->xfer_entries,
+					  rh->xfer, rh->xfer_phys);
+		if (rh->resp)
+			dma_free_coherent(&hci->master.dev,
+					  rh->resp_struct_sz * rh->xfer_entries,
+					  rh->resp, rh->resp_phys);
+		kfree(rh->src_xfers);
+		if (rh->ibi_status)
+			dma_free_coherent(&hci->master.dev,
+					  rh->ibi_status_sz * rh->ibi_status_entries,
+					  rh->ibi_status, rh->ibi_status_phys);
+		if (rh->ibi_data_phys)
+			dma_unmap_single(&hci->master.dev, rh->ibi_data_phys,
+					 rh->ibi_chunk_sz * rh->ibi_chunks_total,
+					 DMA_FROM_DEVICE);
+		kfree(rh->ibi_data);
+	}
+
+	rhs_reg_write(CONTROL, 0);
+
+	kfree(rings);
+	hci->io_data =3D NULL;
+}
+
+static int hci_dma_init(struct i3c_hci *hci)
+{
+	struct hci_rings_data *rings;
+	struct hci_rh_data *rh;
+	u32 regval;
+	u_int i, nr_rings, xfers_sz, resps_sz;
+	u_int ibi_status_ring_sz, ibi_data_ring_sz;
+	int ret;
+
+	regval =3D rhs_reg_read(CONTROL);
+	nr_rings =3D FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
+	INFO("%d DMA rings available", nr_rings);
+	if (unlikely(nr_rings > 8)) {
+		ERR("number of rings should be <=3D 8");
+		nr_rings =3D 8;
+	}
+	if (nr_rings > XFER_RINGS)
+		nr_rings =3D XFER_RINGS;
+	rings =3D kzalloc(sizeof(*rings) + nr_rings * sizeof(*rh), GFP_KERNEL);
+	if (!rings)
+		return -ENOMEM;
+	hci->io_data =3D rings;
+	rings->total =3D nr_rings;
+
+	for (i =3D 0; i < rings->total; i++) {
+		u32 offset =3D rhs_reg_read(RHn_OFFSET(i));
+
+		INFO("Ring %d at offset %#x", i, offset);
+		ret =3D -EINVAL;
+		if (!offset)
+			goto err_out;
+		rh =3D &rings->headers[i];
+		rh->regs =3D hci->base_regs + offset;
+		spin_lock_init(&rh->lock);
+		init_completion(&rh->op_done);
+
+		rh->xfer_entries =3D XFER_RING_ENTRIES;
+
+		regval =3D rh_reg_read(CR_SETUP);
+		rh->xfer_struct_sz =3D FIELD_GET(CR_XFER_STRUCT_SIZE, regval);
+		rh->resp_struct_sz =3D FIELD_GET(CR_RESP_STRUCT_SIZE, regval);
+		DBG("xfer_struct_sz =3D %d, resp_struct_sz =3D %d",
+		    rh->xfer_struct_sz, rh->resp_struct_sz);
+		xfers_sz =3D rh->xfer_struct_sz * rh->xfer_entries;
+		resps_sz =3D rh->resp_struct_sz * rh->xfer_entries;
+
+		rh->xfer =3D dma_alloc_coherent(&hci->master.dev, xfers_sz,
+					      &rh->xfer_phys, GFP_KERNEL);
+		rh->resp =3D dma_alloc_coherent(&hci->master.dev, resps_sz,
+					      &rh->resp_phys, GFP_KERNEL);
+		rh->src_xfers =3D
+			kmalloc_array(rh->xfer_entries, sizeof(*rh->src_xfers),
+				      GFP_KERNEL);
+		ret =3D -ENOMEM;
+		if (!rh->xfer || !rh->resp || !rh->src_xfers)
+			goto err_out;
+
+		rh_reg_write(CMD_RING_BASE_LO, rh->xfer_phys);
+		rh_reg_write(CMD_RING_BASE_HI, rh->xfer_phys >> 32);
+		rh_reg_write(RESP_RING_BASE_LO, rh->resp_phys);
+		rh_reg_write(RESP_RING_BASE_HI, rh->resp_phys >> 32);
+
+		regval =3D FIELD_PREP(CR_RING_SIZE, rh->xfer_entries);
+		rh_reg_write(CR_SETUP, regval);
+
+		rh_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
+		rh_reg_write(INTR_SIGNAL_ENABLE, INTR_IBI_READY |
+						 INTR_TRANSFER_COMPLETION |
+						 INTR_RING_OP |
+						 INTR_TRANSFER_ERR |
+						 INTR_WARN_INS_STOP_MODE |
+						 INTR_IBI_RING_FULL |
+						 INTR_TRANSFER_ABORT);
+
+		/* IBIs */
+
+		if (i >=3D IBI_RINGS)
+			goto ring_ready;
+
+		regval =3D rh_reg_read(IBI_SETUP);
+		rh->ibi_status_sz =3D FIELD_GET(IBI_STATUS_STRUCT_SIZE, regval);
+		rh->ibi_status_entries =3D IBI_STATUS_RING_ENTRIES;
+		rh->ibi_chunks_total =3D IBI_CHUNK_POOL_SIZE;
+
+		rh->ibi_chunk_sz =3D dma_get_cache_alignment();
+		rh->ibi_chunk_sz *=3D IBI_CHUNK_CACHELINES;
+		BUG_ON(rh->ibi_chunk_sz > 256);
+
+		ibi_status_ring_sz =3D rh->ibi_status_sz * rh->ibi_status_entries;
+		ibi_data_ring_sz =3D rh->ibi_chunk_sz * rh->ibi_chunks_total;
+
+		rh->ibi_status =3D
+			dma_alloc_coherent(&hci->master.dev, ibi_status_ring_sz,
+					   &rh->ibi_status_phys, GFP_KERNEL);
+		rh->ibi_data =3D kmalloc(ibi_data_ring_sz, GFP_KERNEL);
+		ret =3D -ENOMEM;
+		if (!rh->ibi_status || !rh->ibi_data)
+			goto err_out;
+		rh->ibi_data_phys =3D
+			dma_map_single(&hci->master.dev, rh->ibi_data,
+				       ibi_data_ring_sz, DMA_FROM_DEVICE);
+		if (dma_mapping_error(&hci->master.dev, rh->ibi_data_phys)) {
+			rh->ibi_data_phys =3D 0;
+			ret =3D -ENOMEM;
+			goto err_out;
+		}
+
+		regval =3D FIELD_PREP(IBI_STATUS_RING_SIZE,
+				    rh->ibi_status_entries) |
+			 FIELD_PREP(IBI_DATA_CHUNK_SIZE,
+				    ilog2(rh->ibi_chunk_sz) - 2) |
+			 FIELD_PREP(IBI_DATA_CHUNK_COUNT,
+				    rh->ibi_chunks_total);
+		rh_reg_write(IBI_SETUP, regval);
+
+		regval =3D rh_reg_read(INTR_SIGNAL_ENABLE);
+		regval |=3D INTR_IBI_READY;
+		rh_reg_write(INTR_SIGNAL_ENABLE, regval);
+
+ring_ready:
+		rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
+	}
+
+	regval =3D FIELD_PREP(MAX_HEADER_COUNT, rings->total);
+	rhs_reg_write(CONTROL, regval);
+	return 0;
+
+err_out:
+	hci_dma_cleanup(hci);
+	return ret;
+}
+
+static void hci_dma_unmap_xfer(struct i3c_hci *hci,
+			       struct hci_xfer *xfer_list, u_int n)
+{
+	struct hci_xfer *xfer;
+	u_int i;
+
+	for (i =3D 0; i < n; i++) {
+		xfer =3D xfer_list + i;
+		dma_unmap_single(&hci->master.dev,
+				 xfer->data_phys, xfer->data_len,
+				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
+	}
+}
+
+static int hci_dma_queue_xfer(struct i3c_hci *hci,
+			      struct hci_xfer *xfer_list, int n)
+{
+	struct hci_rings_data *rings =3D hci->io_data;
+	struct hci_rh_data *rh;
+	u_int i, ring, enqueue_ptr;
+	u32 op1_val, op2_val;
+
+	/* For now we only use ring 0 */
+	ring =3D 0;
+	rh =3D &rings->headers[ring];
+
+	op1_val =3D rh_reg_read(RING_OPERATION1);
+	enqueue_ptr =3D FIELD_GET(RING_OP1_CR_ENQ_PTR, op1_val);
+	for (i =3D 0; i < n; i++) {
+		struct hci_xfer *xfer =3D xfer_list + i;
+		u32 *ring_data =3D rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
+
+		/* store cmd descriptor */
+		*ring_data++ =3D xfer->cmd_desc[0];
+		*ring_data++ =3D xfer->cmd_desc[1];
+		if (hci->cmd =3D=3D &i3c_hci_cmd_v2) {
+			*ring_data++ =3D xfer->cmd_desc[2];
+			*ring_data++ =3D xfer->cmd_desc[3];
+		}
+
+		/* first word of Data Buffer Descriptor Structure */
+		if (!xfer->data)
+			xfer->data_len =3D 0;
+		*ring_data++ =3D
+			FIELD_PREP(DATA_BUF_BLOCK_SIZE, xfer->data_len) |
+			((i =3D=3D n - 1) ? DATA_BUF_IOC : 0);
+
+		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
+		if (xfer->data) {
+			xfer->data_phys =3D
+				dma_map_single(&hci->master.dev,
+					       xfer->data,
+					       xfer->data_len,
+					       xfer->rnw ?
+						  DMA_FROM_DEVICE :
+						  DMA_TO_DEVICE);
+			if (dma_mapping_error(&hci->master.dev,
+					      xfer->data_phys)) {
+				hci_dma_unmap_xfer(hci, xfer_list, i);
+				return -ENOMEM;
+			}
+			*ring_data++ =3D xfer->data_phys;
+			*ring_data++ =3D xfer->data_phys >> 32;
+		} else {
+			*ring_data++ =3D 0;
+			*ring_data++ =3D 0;
+		}
+
+		/* remember corresponding xfer struct */
+		rh->src_xfers[enqueue_ptr] =3D xfer;
+		/* remember corresponding ring/entry for this xfer structure */
+		xfer->ring =3D ring;
+		xfer->ring_entry =3D enqueue_ptr;
+
+		enqueue_ptr =3D (enqueue_ptr + 1) % rh->xfer_entries;
+
+		/*
+		 * We may update the hardware view of the enqueue pointer
+		 * only if we didn't reach its dequeue pointer.
+		 */
+		op2_val =3D rh_reg_read(RING_OPERATION2);
+		if (enqueue_ptr =3D=3D FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val)) {
+			/* the ring is full */
+			hci_dma_unmap_xfer(hci, xfer_list, i + 1);
+			return -EBUSY;
+		}
+	}
+
+	/* take care to update the hardware enqueue pointer atomically */
+	spin_lock_irq(&rh->lock);
+	op1_val =3D rh_reg_read(RING_OPERATION1);
+	op1_val &=3D ~RING_OP1_CR_ENQ_PTR;
+	op1_val |=3D FIELD_PREP(RING_OP1_CR_ENQ_PTR, enqueue_ptr);
+	rh_reg_write(RING_OPERATION1, op1_val);
+	spin_unlock_irq(&rh->lock);
+
+	return 0;
+}
+
+static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
+				 struct hci_xfer *xfer_list, int n)
+{
+	struct hci_rings_data *rings =3D hci->io_data;
+	struct hci_rh_data *rh =3D &rings->headers[xfer_list[0].ring];
+	u_int i;
+	bool did_unqueue =3D false;
+
+	/* stop the ring */
+	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
+	if (wait_for_completion_timeout(&rh->op_done, HZ) =3D=3D 0) {
+		/*
+		 * We're deep in it if ever this condition is ever met.
+		 * Hardware might still be writing to memory, etc.
+		 */
+		ERR("unable to abort the ring");
+		BUG();
+	}
+
+	for (i =3D 0; i < n; i++) {
+		struct hci_xfer *xfer =3D xfer_list + i;
+		int idx =3D xfer->ring_entry;
+
+		/*
+		 * At the time the abort happened, the xfer might have
+		 * completed already. If not then replace corresponding
+		 * descriptor entries with a no-op.
+		 */
+		if (idx >=3D 0) {
+			u32 *ring_data =3D rh->xfer + rh->xfer_struct_sz * idx;
+
+			/* store no-op cmd descriptor */
+			*ring_data++ =3D FIELD_PREP(CMD_0_ATTR, 0x7);
+			*ring_data++ =3D 0;
+			if (hci->cmd =3D=3D &i3c_hci_cmd_v2) {
+				*ring_data++ =3D 0;
+				*ring_data++ =3D 0;
+			}
+
+			/* disassociate this xfer struct */
+			rh->src_xfers[idx] =3D NULL;
+
+			/* and unmap it */
+			hci_dma_unmap_xfer(hci, xfer, 1);
+
+			did_unqueue =3D true;
+		}
+	}
+
+	/* restart the ring */
+	rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
+
+	return did_unqueue;
+}
+
+static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *r=
h)
+{
+	u32 op1_val, op2_val, resp, *ring_resp;
+	u_int tid, done_ptr =3D rh->done_ptr;
+	struct hci_xfer *xfer;
+
+	for (;;) {
+		op2_val =3D rh_reg_read(RING_OPERATION2);
+		if (done_ptr =3D=3D FIELD_GET(RING_OP2_CR_DEQ_PTR, op2_val))
+			break;
+
+		ring_resp =3D rh->resp + rh->resp_struct_sz * done_ptr;
+		resp =3D *ring_resp;
+		tid =3D RESP_TID(resp);
+		DBG("resp =3D 0x%08x", resp);
+
+		xfer =3D rh->src_xfers[done_ptr];
+		if (!xfer) {
+			DBG("orphaned ring entry");
+		} else {
+			hci_dma_unmap_xfer(hci, xfer, 1);
+			xfer->ring_entry =3D -1;
+			xfer->response =3D resp;
+			if (tid !=3D xfer->cmd_tid) {
+				ERR("response tid=3D%d when expecting %d",
+				    tid, xfer->cmd_tid);
+				/* TODO: do something about it? */
+			}
+			if (xfer->completion)
+				complete(xfer->completion);
+		}
+
+		done_ptr =3D (done_ptr + 1) % rh->xfer_entries;
+		rh->done_ptr =3D done_ptr;
+	}
+
+	/* take care to update the software dequeue pointer atomically */
+	spin_lock(&rh->lock);
+	op1_val =3D rh_reg_read(RING_OPERATION1);
+	op1_val &=3D ~RING_OP1_CR_SW_DEQ_PTR;
+	op1_val |=3D FIELD_PREP(RING_OP1_CR_SW_DEQ_PTR, done_ptr);
+	rh_reg_write(RING_OPERATION1, op1_val);
+	spin_unlock(&rh->lock);
+}
+
+static int hci_dma_request_ibi(struct i3c_hci *hci, struct i3c_dev_desc =
*dev,
+			       const struct i3c_ibi_setup *req)
+{
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+	struct i3c_generic_ibi_pool *pool;
+	struct hci_dma_dev_ibi_data *dev_ibi;
+
+	dev_ibi =3D kmalloc(sizeof(*dev_ibi), GFP_KERNEL);
+	if (!dev_ibi)
+		return -ENOMEM;
+	pool =3D i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(pool)) {
+		kfree(dev_ibi);
+		return PTR_ERR(pool);
+	}
+	dev_ibi->pool =3D pool;
+	dev_ibi->max_len =3D req->max_payload_len;
+	dev_data->ibi_data =3D dev_ibi;
+	return 0;
+}
+
+static void hci_dma_free_ibi(struct i3c_hci *hci, struct i3c_dev_desc *d=
ev)
+{
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+	struct hci_dma_dev_ibi_data *dev_ibi =3D dev_data->ibi_data;
+
+	dev_data->ibi_data =3D NULL;
+	i3c_generic_ibi_free_pool(dev_ibi->pool);
+	kfree(dev_ibi);
+}
+
+static void hci_dma_recycle_ibi_slot(struct i3c_hci *hci,
+				     struct i3c_dev_desc *dev,
+				     struct i3c_ibi_slot *slot)
+{
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+	struct hci_dma_dev_ibi_data *dev_ibi =3D dev_data->ibi_data;
+
+	i3c_generic_ibi_recycle_slot(dev_ibi->pool, slot);
+}
+
+static void hci_dma_process_ibi(struct i3c_hci *hci, struct hci_rh_data =
*rh)
+{
+	struct i3c_dev_desc *dev;
+	struct i3c_hci_dev_data *dev_data;
+	struct hci_dma_dev_ibi_data *dev_ibi;
+	struct i3c_ibi_slot *slot;
+	u32 op1_val, op2_val, ibi_status_error;
+	u_int ptr, enq_ptr, deq_ptr;
+	u_int ibi_size, ibi_chunks, ibi_data_offset, first_part;
+	int ibi_addr, last_ptr;
+	void *ring_ibi_data;
+	dma_addr_t ring_ibi_data_phys;
+
+	op1_val =3D rh_reg_read(RING_OPERATION1);
+	deq_ptr =3D FIELD_GET(RING_OP1_IBI_DEQ_PTR, op1_val);
+
+	op2_val =3D rh_reg_read(RING_OPERATION2);
+	enq_ptr =3D FIELD_GET(RING_OP2_IBI_ENQ_PTR, op2_val);
+
+	ibi_status_error =3D 0;
+	ibi_addr =3D -1;
+	ibi_chunks =3D 0;
+	ibi_size =3D 0;
+	last_ptr =3D -1;
+
+	/* let's find all we can about this IBI */
+	for (ptr =3D deq_ptr; ptr !=3D enq_ptr;
+	     ptr =3D (ptr + 1) % rh->ibi_status_entries) {
+		u32 ibi_status, *ring_ibi_status;
+		u_int chunks;
+
+		ring_ibi_status =3D rh->ibi_status + rh->ibi_status_sz * ptr;
+		ibi_status =3D *ring_ibi_status;
+		DBG("status =3D %#x", ibi_status);
+
+		if (ibi_status_error) {
+			/* we no longer care */
+		} else if (ibi_status & IBI_ERROR) {
+			ibi_status_error =3D ibi_status;
+		} else if (ibi_addr =3D=3D  -1) {
+			ibi_addr =3D FIELD_GET(IBI_SLAVE_ADDR, ibi_status);
+		} else if (ibi_addr !=3D FIELD_GET(IBI_SLAVE_ADDR, ibi_status)) {
+			/* the address changed unexpectedly */
+			ibi_status_error =3D ibi_status;
+		}
+
+		chunks =3D FIELD_GET(IBI_CHUNKS, ibi_status);
+		ibi_chunks +=3D chunks;
+		if (!(ibi_status & IBI_LAST_STATUS)) {
+			ibi_size +=3D chunks * rh->ibi_chunk_sz;
+		} else {
+			ibi_size +=3D FIELD_GET(IBI_DATA_LENGTH, ibi_status);
+			last_ptr =3D ptr;
+			break;
+		}
+	}
+
+	/* validate what we've got */
+
+	if (last_ptr =3D=3D -1) {
+		/* this IBI sequence is not yet complete */
+		DBG("no LAST_STATUS available (e=3D%d d=3D%d)", enq_ptr, deq_ptr);
+		return;
+	}
+	deq_ptr =3D last_ptr + 1;
+	deq_ptr %=3D rh->ibi_status_entries;
+
+	if (ibi_status_error) {
+		ERR("IBI error from %#x", ibi_addr);
+		goto done;
+	}
+
+	/* determine who this is for */
+	dev =3D i3c_hci_addr_to_dev(hci, ibi_addr);
+	if (!dev) {
+		ERR("IBI for unknown device %#x", ibi_addr);
+		goto done;
+	}
+
+	dev_data =3D i3c_dev_get_master_data(dev);
+	dev_ibi =3D dev_data->ibi_data;
+	if (ibi_size > dev_ibi->max_len) {
+		ERR("IBI payload too big (%d > %d)",
+		    ibi_size, dev_ibi->max_len);
+		goto done;
+	}
+
+	/*
+	 * This ring model is not suitable for zero-copy processing of IBIs.
+	 * We have the data chunk ring wrap-around to deal with, meaning
+	 * that the payload might span multiple chunks beginning at the
+	 * end of the ring and wrap to the start of the ring. Furthermore
+	 * there is no guarantee that those chunks will be released in order
+	 * and in a timely manner by the upper driver. So let's just copy
+	 * them to a discrete buffer. In practice they're supposed to be
+	 * small anyway.
+	 */
+	slot =3D i3c_generic_ibi_get_free_slot(dev_ibi->pool);
+	if (!slot) {
+		ERR("no free slot for IBI");
+		goto done;
+	}
+
+	/* copy first part of the payload */
+	ibi_data_offset =3D rh->ibi_chunk_sz * rh->ibi_chunk_ptr;
+	ring_ibi_data =3D rh->ibi_data + ibi_data_offset;
+	ring_ibi_data_phys =3D rh->ibi_data_phys + ibi_data_offset;
+	first_part =3D (rh->ibi_chunks_total - rh->ibi_chunk_ptr)
+			* rh->ibi_chunk_sz;
+	if (first_part > ibi_size)
+		first_part =3D ibi_size;
+	dma_sync_single_for_cpu(&hci->master.dev, ring_ibi_data_phys,
+				first_part, DMA_FROM_DEVICE);
+	memcpy(slot->data, ring_ibi_data, first_part);
+
+	/* copy second part if any */
+	if (ibi_size > first_part) {
+		/* we wrap back to the start and copy remaining data */
+		ring_ibi_data =3D rh->ibi_data;
+		ring_ibi_data_phys =3D rh->ibi_data_phys;
+		dma_sync_single_for_cpu(&hci->master.dev, ring_ibi_data_phys,
+					ibi_size - first_part, DMA_FROM_DEVICE);
+		memcpy(slot->data + first_part, ring_ibi_data,
+		       ibi_size - first_part);
+	}
+
+	/* submit it */
+	slot->dev =3D dev;
+	slot->len =3D ibi_size;
+	i3c_master_queue_ibi(dev, slot);
+
+done:
+	/* take care to update the ibi dequeue pointer atomically */
+	spin_lock(&rh->lock);
+	op1_val =3D rh_reg_read(RING_OPERATION1);
+	op1_val &=3D ~RING_OP1_IBI_DEQ_PTR;
+	op1_val |=3D FIELD_PREP(RING_OP1_IBI_DEQ_PTR, deq_ptr);
+	rh_reg_write(RING_OPERATION1, op1_val);
+	spin_unlock(&rh->lock);
+
+	/* update the chunk pointer */
+	rh->ibi_chunk_ptr +=3D ibi_chunks;
+	rh->ibi_chunk_ptr %=3D rh->ibi_chunks_total;
+
+	/* and tell the hardware about freed chunks */
+	rh_reg_write(CHUNK_CONTROL, rh_reg_read(CHUNK_CONTROL) + ibi_chunks);
+}
+
+static bool hci_dma_irq_handler(struct i3c_hci *hci, u_int mask)
+{
+	struct hci_rings_data *rings =3D hci->io_data;
+	int i;
+	bool handled =3D false;
+
+	for (i =3D 0; mask && i < 8; i++) {
+		struct hci_rh_data *rh;
+		u32 status;
+
+		if (!(mask & (1 << i)))
+			continue;
+		mask &=3D ~(1 << i);
+
+		rh =3D &rings->headers[i];
+		status =3D rh_reg_read(INTR_STATUS);
+		DBG("rh%d status: %#x", i, status);
+		if (!status)
+			continue;
+		rh_reg_write(INTR_STATUS, status);
+
+		if (status & INTR_IBI_READY)
+			hci_dma_process_ibi(hci, rh);
+		if (status & (INTR_TRANSFER_COMPLETION|INTR_TRANSFER_ERR))
+			hci_dma_xfer_done(hci, rh);
+		if (status & INTR_RING_OP)
+			complete(&rh->op_done);
+
+		if (status & INTR_TRANSFER_ABORT)
+			dev_notice_ratelimited(&hci->master.dev,
+				"ring %d: Transfer Aborted\n", i);
+		if (status & INTR_WARN_INS_STOP_MODE)
+			dev_warn_ratelimited(&hci->master.dev,
+				"ring %d: Inserted Stop on Mode Change\n", i);
+		if (status & INTR_IBI_RING_FULL)
+			dev_err_ratelimited(&hci->master.dev,
+				"ring %d: IBI Ring Full Condition\n", i);
+
+		handled =3D true;
+	}
+
+	return handled;
+}
+
+const struct hci_io_ops i3c_hci_dma =3D {
+	.init			=3D hci_dma_init,
+	.cleanup		=3D hci_dma_cleanup,
+	.queue_xfer		=3D hci_dma_queue_xfer,
+	.dequeue_xfer		=3D hci_dma_dequeue_xfer,
+	.irq_handler		=3D hci_dma_irq_handler,
+	.request_ibi		=3D hci_dma_request_ibi,
+	.free_ibi		=3D hci_dma_free_ibi,
+	.recycle_ibi_slot	=3D hci_dma_recycle_ibi_slot,
+};
diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.c b/drivers/i3c/mas=
ter/mipi-i3c-hci/ext_caps.c
new file mode 100644
index 0000000000..01a18c4f64
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/kernel.h>
+#include <linux/io.h>
+
+#include "hci.h"
+#include "ext_caps.h"
+
+
+/* Extended Capability Header */
+#define CAP_HEADER_LENGTH		GENMASK(23, 8)
+#define CAP_HEADER_ID			GENMASK(7, 0)
+
+static int hci_extcap_hardware_id(struct i3c_hci *hci, void __iomem *bas=
e)
+{
+	hci->vendor_mipi_id	=3D readl(base + 0x04);
+	hci->vendor_version_id	=3D readl(base + 0x08);
+	hci->vendor_product_id	=3D readl(base + 0x0c);
+
+	INFO("vendor MIPI ID: %#x", hci->vendor_mipi_id);
+	INFO("vendor version ID: %#x", hci->vendor_version_id);
+	INFO("vendor product ID: %#x", hci->vendor_product_id);
+
+	/* ought to go in a table if this grows too much */
+	switch (hci->vendor_mipi_id) {
+	case MIPI_VENDOR_NXP:
+		hci->quirks |=3D HCI_QUIRK_RAW_CCC;
+		DBG("raw CCC quirks set");
+		break;
+	}
+
+	return 0;
+}
+
+static int hci_extcap_master_config(struct i3c_hci *hci, void __iomem *b=
ase)
+{
+	u32 master_config =3D readl(base + 0x04);
+	u_int operation_mode =3D FIELD_GET(GENMASK(5, 4), master_config);
+	static const char * const functionality[] =3D {
+		"(unknown)", "master only", "slave only",
+		"master or secondary" };
+	INFO("operation mode: %s", functionality[operation_mode]);
+	if (operation_mode & 0x1)
+		return 0;
+	ERR("only master mode is currently supported");
+	return -ENOTSUPP;
+}
+
+static int hci_extcap_multi_bus(struct i3c_hci *hci, void __iomem *base)
+{
+	u32 bus_instance =3D readl(base + 0x04);
+	u_int count =3D FIELD_GET(GENMASK(3, 0), bus_instance);
+
+	INFO("%d bus instances", count);
+	return 0;
+}
+
+static int hci_extcap_auto_command(struct i3c_hci *hci, void __iomem *ba=
se)
+{
+	u32 autocmd_ext_caps =3D readl(base + 0x04);
+	u_int max_count =3D FIELD_GET(GENMASK(3, 0), autocmd_ext_caps);
+	u32 autocmd_ext_config =3D readl(base + 0x08);
+	u_int count =3D FIELD_GET(GENMASK(3, 0), autocmd_ext_config);
+
+	INFO("%d/%d active auto-command entries", count, max_count);
+	/* remember auto-command register location for later use */
+	hci->AUTOCMD_regs =3D base;
+	return 0;
+}
+
+static int hci_extcap_debug(struct i3c_hci *hci, void __iomem *base)
+{
+	INFO("debug registers present");
+	hci->DEBUG_regs =3D base;
+	return 0;
+}
+
+static int hci_extcap_scheduled_cmd(struct i3c_hci *hci, void __iomem *b=
ase)
+{
+	INFO("scheduled commands available");
+	//hci->schedcmd_regs =3D base;
+	return 0;
+}
+
+static int hci_extcap_non_curr_master(struct i3c_hci *hci, void __iomem =
*base)
+{
+	INFO("Non-Current Master support available");
+	//hci->NCM_regs =3D base;
+	return 0;
+}
+
+static int hci_extcap_ccc_resp_conf(struct i3c_hci *hci, void __iomem *b=
ase)
+{
+	INFO("CCC Response Configuration available");
+	return 0;
+}
+
+static int hci_extcap_global_DAT(struct i3c_hci *hci, void __iomem *base=
)
+{
+	INFO("Global DAT available");
+	return 0;
+}
+
+static int hci_extcap_multilane(struct i3c_hci *hci, void __iomem *base)
+{
+	INFO("Master Multi-Lane support available");
+	return 0;
+}
+
+static int hci_extcap_ncm_multilane(struct i3c_hci *hci, void __iomem *b=
ase)
+{
+	INFO("NCM Multi-Lane support available");
+	return 0;
+}
+
+struct hci_ext_caps {
+	u8  id;
+	u16 min_length;
+	int (*parser)(struct i3c_hci *hci, void __iomem *base);
+};
+
+#define EXT_CAP(_id, _highest_mandatory_reg_offset, _parser) \
+	{ .id =3D (_id), .parser =3D (_parser), \
+	  .min_length =3D (_highest_mandatory_reg_offset)/4 + 1 }
+
+static const struct hci_ext_caps ext_capabilities[] =3D {
+	EXT_CAP(0x01, 0x0c, hci_extcap_hardware_id),
+	EXT_CAP(0x02, 0x04, hci_extcap_master_config),
+	EXT_CAP(0x03, 0x04, hci_extcap_multi_bus),
+	EXT_CAP(0x04, 0x08, hci_extcap_auto_command),
+	EXT_CAP(0x0c, 0x10, hci_extcap_debug),
+	EXT_CAP(0x0d, 0x0c, hci_extcap_scheduled_cmd),
+	EXT_CAP(0x0e, 0x80, hci_extcap_non_curr_master), /* TODO confirm size *=
/
+	EXT_CAP(0x0f, 0x04, hci_extcap_ccc_resp_conf),
+	EXT_CAP(0x10, 0x08, hci_extcap_global_DAT),
+	EXT_CAP(0x9d, 0x04,	hci_extcap_multilane),
+	EXT_CAP(0x9e, 0x04, hci_extcap_ncm_multilane),
+};
+
+#define CAP_ENTRIES ARRAY_SIZE(ext_capabilities)
+
+static int hci_extcap_vendor_NXP(struct i3c_hci *hci, void __iomem *base=
)
+{
+	hci->vendor_data =3D base;
+	INFO("Build Date Info =3D %#x", readl(base + 1*4));
+	/* reset the FPGA */
+	writel(0xdeadbeef, base + 1*4);
+	return 0;
+}
+
+struct hci_ext_cap_vendor_specific {
+	u32 vendor;
+	u8  cap;
+	u16 min_length;
+	int (*parser)(struct i3c_hci *hci, void __iomem *base);
+};
+
+#define EXT_CAP_VENDOR(_vendor, _cap, _highest_mandatory_reg_offset) \
+	{ .vendor =3D (MIPI_VENDOR_##_vendor), .cap =3D (_cap), \
+	  .parser =3D (hci_extcap_vendor_##_vendor), \
+	  .min_length =3D (_highest_mandatory_reg_offset)/4 + 1 }
+
+static const struct hci_ext_cap_vendor_specific vendor_ext_caps[] =3D {
+	EXT_CAP_VENDOR(NXP, 0xc0, 0x20),
+};
+
+#define VENDOR_CAP_ENTRIES ARRAY_SIZE(vendor_ext_caps)
+
+static int hci_extcap_vendor_specific(struct i3c_hci *hci, void __iomem =
*base,
+				      u32 cap_id, u32 cap_length)
+{
+	const struct hci_ext_cap_vendor_specific *vendor_cap_entry;
+	int i;
+
+	vendor_cap_entry =3D NULL;
+	for (i =3D 0; i < VENDOR_CAP_ENTRIES; i++) {
+		if (vendor_ext_caps[i].vendor =3D=3D hci->vendor_mipi_id &&
+		    vendor_ext_caps[i].cap =3D=3D cap_id) {
+			vendor_cap_entry =3D &vendor_ext_caps[i];
+			break;
+		}
+	}
+
+	if (!vendor_cap_entry) {
+		NOTE("unknown ext_cap 0x%02x for vendor 0x%02x",
+		     cap_id, hci->vendor_mipi_id);
+		return 0;
+	}
+	if (cap_length < vendor_cap_entry->min_length) {
+		ERR("ext_cap 0x%02x has size %d (expecting >=3D %d)",
+		    cap_id, cap_length, vendor_cap_entry->min_length);
+		return -EINVAL;
+	}
+	return vendor_cap_entry->parser(hci, base);
+}
+
+int i3c_hci_parse_ext_caps(struct i3c_hci *hci)
+{
+	void __iomem *curr_cap =3D hci->EXTCAPS_regs;
+	void __iomem *end =3D curr_cap + 0x1000; /* some arbitrary limit */
+	u32 cap_header, cap_id, cap_length;
+	const struct hci_ext_caps *cap_entry;
+	int i, err =3D 0;
+
+	if (!curr_cap)
+		return 0;
+
+	for (; !err && curr_cap < end; curr_cap +=3D cap_length * 4) {
+		cap_header =3D readl(curr_cap);
+		cap_id =3D FIELD_GET(CAP_HEADER_ID, cap_header);
+		cap_length =3D FIELD_GET(CAP_HEADER_LENGTH, cap_header);
+		DBG("id=3D0x%02x length=3D%d", cap_id, cap_length);
+		if (!cap_length)
+			break;
+
+		if (cap_id >=3D 0xc0 && cap_id <=3D 0xcf) {
+			err =3D hci_extcap_vendor_specific(hci, curr_cap,
+							 cap_id, cap_length);
+			continue;
+		}
+
+		cap_entry =3D NULL;
+		for (i =3D 0; i < CAP_ENTRIES; i++) {
+			if (ext_capabilities[i].id =3D=3D cap_id) {
+				cap_entry =3D &ext_capabilities[i];
+				break;
+			}
+		}
+		if (!cap_entry) {
+			NOTE("unknown ext_cap 0x%02x", cap_id);
+		} else if (cap_length < cap_entry->min_length) {
+			ERR("ext_cap 0x%02x has size %d (expecting >=3D %d)",
+			    cap_id, cap_length, cap_entry->min_length);
+			err =3D -EINVAL;
+		} else {
+			err =3D cap_entry->parser(hci, curr_cap);
+		}
+	}
+	return err;
+}
diff --git a/drivers/i3c/master/mipi-i3c-hci/ext_caps.h b/drivers/i3c/mas=
ter/mipi-i3c-hci/ext_caps.h
new file mode 100644
index 0000000000..9df17822fd
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/ext_caps.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Extended Capability Definitions
+ */
+
+#ifndef EXTCAPS_H
+#define EXTCAPS_H
+
+/* MIPI vendor IDs */
+#define MIPI_VENDOR_NXP			0x11b
+
+
+int i3c_hci_parse_ext_caps(struct i3c_hci *hci);
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/m=
ipi-i3c-hci/hci.h
new file mode 100644
index 0000000000..c86a00a423
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
@@ -0,0 +1,150 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Common HCI stuff
+ */
+
+#ifndef HCI_H
+#define HCI_H
+
+/* Handy logging macros */
+#define DBG(x, ...) pr_devel("%s: " x "\n", __func__, ##__VA_ARGS__)
+#define INFO(x, ...) dev_info(&hci->master.dev, x "\n", ##__VA_ARGS__)
+#define NOTE(x, ...) dev_notice(&hci->master.dev, x "\n", ##__VA_ARGS__)
+#define ERR(x, ...) dev_err(&hci->master.dev, x "\n", ##__VA_ARGS__)
+
+#define HEXDUMP(prefix, buf, len) \
+print_hex_dump(KERN_INFO, prefix, DUMP_PREFIX_NONE, 16, 1, buf, len, fal=
se)
+
+
+/* 32-bit word aware bit and mask macros */
+#define W0_MASK(h, l)  GENMASK((h) - 0,  (l) - 0)
+#define W1_MASK(h, l)  GENMASK((h) - 32, (l) - 32)
+#define W2_MASK(h, l)  GENMASK((h) - 64, (l) - 64)
+#define W3_MASK(h, l)  GENMASK((h) - 96, (l) - 96)
+
+/* Same for single bit macros (trailing _ to align with W*_MASK width) *=
/
+#define W0_BIT_(x)  BIT((x) - 0)
+#define W1_BIT_(x)  BIT((x) - 32)
+#define W2_BIT_(x)  BIT((x) - 64)
+#define W3_BIT_(x)  BIT((x) - 96)
+
+
+struct hci_cmd_ops;
+
+/* Our main structure */
+struct i3c_hci {
+	struct i3c_master_controller master;
+	void __iomem *base_regs;
+	void __iomem *DAT_regs;
+	void __iomem *DCT_regs;
+	void __iomem *RHS_regs;
+	void __iomem *PIO_regs;
+	void __iomem *EXTCAPS_regs;
+	void __iomem *AUTOCMD_regs;
+	void __iomem *DEBUG_regs;
+	const struct hci_io_ops *io;
+	void *io_data;
+	const struct hci_cmd_ops *cmd;
+	atomic_t next_cmd_tid;
+	u32 caps;
+	u_int quirks;
+	u_int DAT_entries;
+	u_int DAT_entry_size;
+	void *DAT_data;
+	u_int DCT_entries;
+	u_int DCT_entry_size;
+	u8 version_major;
+	u8 version_minor;
+	u8 revision;
+	u32 vendor_mipi_id;
+	u32 vendor_version_id;
+	u32 vendor_product_id;
+	void *vendor_data;
+};
+
+
+/*
+ * Structure to represent a master initiated transfer.
+ * The rnw, data and data_len fields must be initialized before calling =
any
+ * hci->cmd->*() method. The cmd method will initialize cmd_desc[] and
+ * possibly modify (clear) the data field. Then xfer->cmd_desc[0] can
+ * be augmented with CMD_0_ROC and/or CMD_0_TOC.
+ * The completion field needs to be initialized before queueing with
+ * hci->io->queue_xfer(), and requires CMD_0_ROC to be set.
+ */
+struct hci_xfer {
+	u32 cmd_desc[4];
+	u32 response;
+	bool rnw;
+	void *data;
+	u_int data_len;
+	u_int cmd_tid;
+	struct completion *completion;
+	union {
+		struct {
+			/* PIO specific */
+			struct hci_xfer *next_xfer;
+			struct hci_xfer *next_data;
+			struct hci_xfer *next_resp;
+			u_int data_left;
+			u32 data_word_before_partial;
+		};
+		struct {
+			/* DMA specific */
+			dma_addr_t data_phys;
+			u_int ring;
+			int ring_entry;
+		};
+	};
+};
+
+static inline struct hci_xfer *hci_alloc_xfer(u_int n)
+{
+	return kzalloc(sizeof(struct hci_xfer) * n, GFP_KERNEL);
+}
+
+static inline void hci_free_xfer(struct hci_xfer *xfer, u_int n)
+{
+	kfree(xfer);
+}
+
+
+/* This abstracts PIO vs DMA operations */
+struct hci_io_ops {
+	bool (*irq_handler)(struct i3c_hci *hci, u_int mask);
+	int (*queue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
+	bool (*dequeue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n)=
;
+	int (*request_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
+			   const struct i3c_ibi_setup *req);
+	void (*free_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev);
+	void (*recycle_ibi_slot)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
+				struct i3c_ibi_slot *slot);
+	int (*init)(struct i3c_hci *hci);
+	void (*cleanup)(struct i3c_hci *hci);
+};
+
+extern const struct hci_io_ops i3c_hci_pio;
+extern const struct hci_io_ops i3c_hci_dma;
+
+
+/* Our per device master private data */
+struct i3c_hci_dev_data {
+	int dat_idx;
+	void *ibi_data;
+};
+
+
+/* list of quirks */
+#define HCI_QUIRK_RAW_CCC	BIT(1)	/* CCC framing must be explicit */
+
+
+/* global functions */
+void i3c_hci_resume(struct i3c_hci *hci);
+void i3c_hci_pio_reset(struct i3c_hci *hci);
+void i3c_hci_dct_index_reset(struct i3c_hci *hci);
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/ibi.h b/drivers/i3c/master/m=
ipi-i3c-hci/ibi.h
new file mode 100644
index 0000000000..a55c1f7685
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/ibi.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ *
+ * Common IBI related stuff
+ */
+
+#ifndef IBI_H
+#define IBI_H
+
+/*
+ * IBI Status Descriptor bits
+ */
+#define IBI_STS				BIT(31)
+#define IBI_ERROR			BIT(30)
+#define IBI_STATUS_TYPE			BIT(29)
+#define IBI_HW_CONTEXT			GENMASK(28, 26)
+#define IBI_TS				BIT(25)
+#define IBI_LAST_STATUS			BIT(24)
+#define IBI_CHUNKS			GENMASK(23, 16)
+#define IBI_ID				GENMASK(15, 8)
+#define IBI_SLAVE_ADDR			GENMASK(15, 9)
+#define IBI_SLAVE_RNW			BIT(8)
+#define IBI_DATA_LENGTH			GENMASK(7, 0)
+
+/*  handy helpers */
+static inline struct i3c_dev_desc *
+i3c_hci_addr_to_dev(struct i3c_hci *hci, u_int addr)
+{
+	struct i3c_bus *bus =3D i3c_master_get_bus(&hci->master);
+	struct i3c_dev_desc *dev;
+
+	i3c_bus_for_each_i3cdev(bus, dev) {
+		if (dev->info.dyn_addr =3D=3D addr)
+			return dev;
+	}
+	return NULL;
+}
+
+#endif
diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/m=
ipi-i3c-hci/pio.c
new file mode 100644
index 0000000000..20e44eaed4
--- /dev/null
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -0,0 +1,961 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, MIPI Alliance, Inc.
+ *
+ * Author: Nicolas Pitre <npitre@baylibre.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/i3c/master.h>
+#include <linux/io.h>
+
+#include "hci.h"
+#include "cmd.h"
+#include "ibi.h"
+#include "debug.h"
+
+
+/*
+ * PIO Access Area
+ */
+
+#define pio_reg_read(r)		readl(hci->PIO_regs + (PIO_##r))
+#define pio_reg_write(r, v)	writel(v, hci->PIO_regs + (PIO_##r))
+
+#define PIO_COMMAND_QUEUE_PORT		0x00
+#define PIO_RESPONSE_QUEUE_PORT		0x04
+#define PIO_XFER_DATA_PORT		0x08
+#define PIO_IBI_PORT			0x0c
+
+#define PIO_QUEUE_THLD_CTRL		0x10
+#define QUEUE_IBI_STATUS_THLD		GENMASK(31, 24)
+#define QUEUE_IBI_DATA_THLD		GENMASK(23, 16)
+#define QUEUE_RESP_BUF_THLD		GENMASK(15, 8)
+#define QUEUE_CMD_EMPTY_BUF_THLD	GENMASK(7, 0)
+
+#define PIO_DATA_BUFFER_THLD_CTRL	0x14
+#define DATA_RX_START_THLD		GENMASK(26, 24)
+#define DATA_TX_START_THLD		GENMASK(18, 16)
+#define DATA_RX_BUF_THLD		GENMASK(10, 8)
+#define DATA_TX_BUF_THLD		GENMASK(2, 0)
+
+#define PIO_QUEUE_SIZE			0x18
+#define TX_DATA_BUFFER_SIZE		GENMASK(31, 24)
+#define RX_DATA_BUFFER_SIZE		GENMASK(23, 16)
+#define IBI_STATUS_SIZE			GENMASK(15, 8)
+#define CR_QUEUE_SIZE			GENMASK(7, 0)
+
+#define PIO_INTR_STATUS			0x20
+#define PIO_INTR_STATUS_ENABLE		0x24
+#define PIO_INTR_SIGNAL_ENABLE		0x28
+#define PIO_INTR_FORCE			0x2c
+#define STAT_TRANSFER_ERR		BIT(9)
+#define STAT_TRANSFER_ABORT		BIT(5)
+#define STAT_RESP_READY			BIT(4)
+#define STAT_CMD_QUEUE_READY		BIT(3)
+#define STAT_IBI_STATUS_THLD		BIT(2)
+#define STAT_RX_THLD			BIT(1)
+#define STAT_TX_THLD			BIT(0)
+
+
+struct hci_pio_dev_ibi_data {
+	struct i3c_generic_ibi_pool *pool;
+	u_int max_len;
+};
+
+struct hci_pio_ibi_data {
+	struct i3c_ibi_slot *slot;
+	void *data_ptr;
+	u_int addr;
+	u_int seg_len, seg_cnt;
+	u_int max_len;
+	bool last_seg;
+};
+
+struct hci_pio_data {
+	spinlock_t lock;
+	struct hci_xfer *curr_xfer, *xfer_queue;
+	struct hci_xfer *curr_rx, *rx_queue;
+	struct hci_xfer *curr_tx, *tx_queue;
+	struct hci_xfer *curr_resp, *resp_queue;
+	struct hci_pio_ibi_data ibi;
+	u_int rx_thresh_size, tx_thresh_size;
+	u_int max_ibi_thresh;
+	u32 reg_queue_thresh;
+	u32 enabled_irqs;
+};
+
+static int hci_pio_init(struct i3c_hci *hci)
+{
+	struct hci_pio_data *pio;
+	u32 val, size_val, rx_thresh, tx_thresh, ibi_val;
+
+	pio =3D kzalloc(sizeof(*pio), GFP_KERNEL);
+	if (!pio)
+		return -ENOMEM;
+
+	hci->io_data =3D pio;
+	spin_lock_init(&pio->lock);
+
+	size_val =3D pio_reg_read(QUEUE_SIZE);
+	INFO("CMD/RESP FIFO =3D %ld entries", FIELD_GET(CR_QUEUE_SIZE, size_val=
));
+	INFO("IBI FIFO =3D %ld bytes", 4 * FIELD_GET(IBI_STATUS_SIZE, size_val)=
);
+	INFO("RX data FIFO =3D %d bytes",
+	     4 * (2 << FIELD_GET(RX_DATA_BUFFER_SIZE, size_val)));
+	INFO("TX data FIFO =3D %d bytes",
+	     4 * (2 << FIELD_GET(TX_DATA_BUFFER_SIZE, size_val)));
+
+	/*
+	 * Let's initialize data thresholds to half of the actual FIFO size.
+	 * The start thresholds aren't used (set to 0) as the FIFO is always
+	 * serviced before the corresponding command is queued.
+	 */
+	rx_thresh =3D FIELD_GET(RX_DATA_BUFFER_SIZE, size_val);
+	tx_thresh =3D FIELD_GET(TX_DATA_BUFFER_SIZE, size_val);
+	if (hci->version_major =3D=3D 1) {
+		/* those are expressed as 2^[n+1), so just sub 1 if not 0 */
+		if (rx_thresh)
+			rx_thresh -=3D 1;
+		if (tx_thresh)
+			tx_thresh -=3D 1;
+		pio->rx_thresh_size =3D 2 << rx_thresh;
+		pio->tx_thresh_size =3D 2 << tx_thresh;
+	} else {
+		/* size is 2^(n+1) and threshold is 2^n i.e. already halved */
+		pio->rx_thresh_size =3D 1 << rx_thresh;
+		pio->tx_thresh_size =3D 1 << tx_thresh;
+	}
+	val =3D FIELD_PREP(DATA_RX_BUF_THLD,   rx_thresh) |
+	      FIELD_PREP(DATA_TX_BUF_THLD,   tx_thresh);
+	pio_reg_write(DATA_BUFFER_THLD_CTRL, val);
+
+	/*
+	 * Let's raise an interrupt as soon as there is one free cmd slot
+	 * or one available response or IBI. For IBI data let's use half the
+	 * IBI queue size within allowed bounds.
+	 */
+	ibi_val =3D FIELD_GET(IBI_STATUS_SIZE, size_val);
+	pio->max_ibi_thresh =3D clamp_val(ibi_val/2, 1, 63);
+	val =3D FIELD_PREP(QUEUE_IBI_STATUS_THLD, 1) |
+	      FIELD_PREP(QUEUE_IBI_DATA_THLD, pio->max_ibi_thresh) |
+	      FIELD_PREP(QUEUE_RESP_BUF_THLD, 1) |
+	      FIELD_PREP(QUEUE_CMD_EMPTY_BUF_THLD, 1);
+	pio_reg_write(QUEUE_THLD_CTRL, val);
+	pio->reg_queue_thresh =3D val;
+
+	/* Disable all IRQs but allow all status bits */
+	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
+	pio_reg_write(INTR_STATUS_ENABLE, 0xffffffff);
+
+	/* Always accept error interrupts (will be active on first xfer) */
+	pio->enabled_irqs =3D STAT_TRANSFER_ERR;
+
+	return 0;
+}
+
+static void hci_pio_cleanup(struct i3c_hci *hci)
+{
+	struct hci_pio_data *pio =3D hci->io_data;
+
+	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
+
+	if (pio) {
+		DBG("status =3D %#x/%#x",
+		    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+		BUG_ON(pio->curr_xfer);
+		BUG_ON(pio->curr_rx);
+		BUG_ON(pio->curr_tx);
+		BUG_ON(pio->curr_resp);
+		kfree(pio);
+		hci->io_data =3D NULL;
+	}
+}
+
+static void hci_pio_write_cmd(struct i3c_hci *hci, struct hci_xfer *xfer=
)
+{
+	DBG("cmd_desc[%d] =3D 0x%08x", 0, xfer->cmd_desc[0]);
+	DBG("cmd_desc[%d] =3D 0x%08x", 1, xfer->cmd_desc[1]);
+	pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[0]);
+	pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[1]);
+	if (hci->cmd =3D=3D &i3c_hci_cmd_v2) {
+		DBG("cmd_desc[%d] =3D 0x%08x", 2, xfer->cmd_desc[2]);
+		DBG("cmd_desc[%d] =3D 0x%08x", 3, xfer->cmd_desc[3]);
+		pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[2]);
+		pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[3]);
+	}
+}
+
+static bool hci_pio_do_rx(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	struct hci_xfer *xfer =3D pio->curr_rx;
+	u_int nr_words;
+	u32 *p;
+
+	p =3D xfer->data;
+	p +=3D (xfer->data_len - xfer->data_left) / 4;
+
+	while (xfer->data_left >=3D 4) {
+		/* bail out if FIFO hasn't reached the threshold value yet */
+		if (!(pio_reg_read(INTR_STATUS) & STAT_RX_THLD))
+			return false;
+		nr_words =3D min(xfer->data_left / 4, pio->rx_thresh_size);
+		/* extract data from FIFO */
+		xfer->data_left -=3D nr_words * 4;
+		DBG("now %d left %d", nr_words * 4, xfer->data_left);
+		while (nr_words--)
+			*p++ =3D pio_reg_read(XFER_DATA_PORT);
+	}
+
+	/* trailing data is retrieved upon responce reception */
+	return !xfer->data_left;
+}
+
+static void hci_pio_do_trailing_rx(struct i3c_hci *hci,
+				   struct hci_pio_data *pio, u_int count)
+{
+	struct hci_xfer *xfer =3D pio->curr_rx;
+	u32 *p;
+
+	DBG("%d remaining", count);
+
+	p =3D xfer->data;
+	p +=3D (xfer->data_len - xfer->data_left) / 4;
+
+	if (count >=3D 4) {
+		u_int nr_words =3D count / 4;
+		/* extract data from FIFO */
+		xfer->data_left -=3D nr_words * 4;
+		DBG("now %d left %d", nr_words * 4, xfer->data_left);
+		while (nr_words--)
+			*p++ =3D pio_reg_read(XFER_DATA_PORT);
+	}
+
+	count &=3D 3;
+	if (count) {
+		/*
+		 * There are trailing bytes in the last word.
+		 * Fetch it and extract bytes in an endian independent way.
+		 * Unlike the TX case, we must not write memory past the
+		 * end of the destination buffer.
+		 */
+		u8 *p_byte =3D (u8 *)p;
+		u32 data =3D pio_reg_read(XFER_DATA_PORT);
+
+		xfer->data_word_before_partial =3D data;
+		xfer->data_left -=3D count;
+		data =3D cpu_to_le32(data);
+		while (count--) {
+			*p_byte++ =3D data;
+			data >>=3D 8;
+		}
+	}
+}
+
+static bool hci_pio_do_tx(struct i3c_hci *hci, struct hci_pio_data *pio)
+{
+	struct hci_xfer *xfer =3D pio->curr_tx;
+	u_int nr_words;
+	u32 *p;
+
+	p =3D xfer->data;
+	p +=3D (xfer->data_len - xfer->data_left) / 4;
+
+	while (xfer->data_left >=3D 4) {
+		/* bail out if FIFO free space is below set threshold */
+		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
+			return false;
+		/* we can fill up to that TX threshold */
+		nr_words =3D min(xfer->data_left / 4, pio->tx_thresh_size);
+		/* push data into the FIFO */
+		xfer->data_left -=3D nr_words * 4;
+		DBG("now %d left %d", nr_words * 4, xfer->data_left);
+		while (nr_words--)
+			pio_reg_write(XFER_DATA_PORT, *p++);
+	}
+
+	if (xfer->data_left) {
+		/*
+		 * There are trailing bytes to send. We can simply load
+		 * them from memory as a word which will keep those bytes
+		 * in their proper place even on a BE system. This will
+		 * also get some bytes past the actual buffer but no one
+		 * should care as they won't be sent out.
+		 */
+		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
+			return false;
+		DBG("trailing %d", xfer->data_left);
+		pio_reg_write(XFER_DATA_PORT, *p);
+		xfer->data_left =3D 0;
+	}
+
+	return true;
+}
+
+static bool hci_pio_process_rx(struct i3c_hci *hci, struct hci_pio_data =
*pio)
+{
+	while (pio->curr_rx && hci_pio_do_rx(hci, pio))
+		pio->curr_rx =3D pio->curr_rx->next_data;
+	return !pio->curr_rx;
+}
+
+static bool hci_pio_process_tx(struct i3c_hci *hci, struct hci_pio_data =
*pio)
+{
+	while (pio->curr_tx && hci_pio_do_tx(hci, pio))
+		pio->curr_tx =3D pio->curr_tx->next_data;
+	return !pio->curr_tx;
+}
+
+static void hci_pio_queue_data(struct i3c_hci *hci, struct hci_pio_data =
*pio)
+{
+	struct hci_xfer *xfer =3D pio->curr_xfer;
+	struct hci_xfer *prev_queue_tail;
+
+	if (!xfer->data) {
+		xfer->data_len =3D xfer->data_left =3D 0;
+		return;
+	}
+
+	if (xfer->rnw) {
+		prev_queue_tail =3D pio->rx_queue;
+		pio->rx_queue =3D xfer;
+		if (pio->curr_rx) {
+			prev_queue_tail->next_data =3D xfer;
+		} else {
+			pio->curr_rx =3D xfer;
+			if (!hci_pio_process_rx(hci, pio))
+				pio->enabled_irqs |=3D STAT_RX_THLD;
+		}
+	} else {
+		prev_queue_tail =3D pio->tx_queue;
+		pio->tx_queue =3D xfer;
+		if (pio->curr_tx) {
+			prev_queue_tail->next_data =3D xfer;
+		} else {
+			pio->curr_tx =3D xfer;
+			if (!hci_pio_process_tx(hci, pio))
+				pio->enabled_irqs |=3D STAT_TX_THLD;
+		}
+	}
+}
+
+static void hci_pio_push_to_next_rx(struct i3c_hci *hci, struct hci_xfer=
 *xfer,
+				    u_int words_to_keep)
+{
+	u32 *from =3D xfer->data;
+	u32 from_last;
+	u_int received, count;
+
+	received =3D (xfer->data_len - xfer->data_left) / 4;
+	if ((xfer->data_len - xfer->data_left) & 3) {
+		from_last =3D xfer->data_word_before_partial;
+		received +=3D 1;
+	} else {
+		from_last =3D from[received];
+	}
+	from +=3D words_to_keep;
+	count =3D received - words_to_keep;
+
+	while (count) {
+		u_int room, left, chunk, bytes_to_move;
+		u32 last_word;
+
+		xfer =3D xfer->next_data;
+		if (!xfer) {
+			ERR("pushing RX data to unexistent xfer");
+			return;
+		}
+
+		room =3D DIV_ROUND_UP(xfer->data_len, 4);
+		left =3D DIV_ROUND_UP(xfer->data_left, 4);
+		chunk =3D min(count, room);
+		if (chunk > left) {
+			hci_pio_push_to_next_rx(hci, xfer, chunk - left);
+			left =3D chunk;
+			xfer->data_left =3D left * 4;
+		}
+
+		bytes_to_move =3D xfer->data_len - xfer->data_left;
+		if (bytes_to_move & 3) {
+			/* preserve word  to become partial */
+			u32 *p =3D xfer->data;
+
+			xfer->data_word_before_partial =3D p[bytes_to_move / 4];
+		}
+		memmove(xfer->data + chunk, xfer->data, bytes_to_move);
+
+		/* treat last word specially because of partial word issues */
+		chunk -=3D 1;
+
+		memcpy(xfer->data, from, chunk * 4);
+		xfer->data_left -=3D chunk * 4;
+		from +=3D chunk;
+		count -=3D chunk;
+
+		last_word =3D (count =3D=3D 1) ? from_last : *from++;
+		if (xfer->data_left < 4) {
+			/*
+			 * Like in hci_pio_do_trailing_rx(), preserve original
+			 * word to be stored partially then store bytes it
+			 * in an endian independent way.
+			 */
+			u8 *p_byte =3D xfer->data;
+
+			p_byte +=3D chunk * 4;
+			xfer->data_word_before_partial =3D last_word;
+			last_word =3D cpu_to_le32(last_word);
+			while (xfer->data_left--) {
+				*p_byte++ =3D last_word;
+				last_word >>=3D 8;
+			}
+		} else {
+			u32 *p =3D xfer->data;
+
+			p[chunk] =3D last_word;
+			xfer->data_left -=3D 4;
+		}
+		count--;
+	}
+}
+
+static bool hci_pio_process_resp(struct i3c_hci *hci, struct hci_pio_dat=
a *pio)
+{
+	while (pio->curr_resp &&
+	       (pio_reg_read(INTR_STATUS) & STAT_RESP_READY)) {
+		struct hci_xfer *xfer =3D pio->curr_resp;
+		u32 resp =3D pio_reg_read(RESPONSE_QUEUE_PORT);
+		u_int tid =3D RESP_TID(resp);
+
+		DBG("resp =3D 0x%08x", resp);
+		if (tid !=3D xfer->cmd_tid) {
+			ERR("response tid=3D%d when expecting %d",
+			    tid, xfer->cmd_tid);
+			/* TODO: do something about it? */
+			return false;
+		}
+		xfer->response =3D resp;
+
+		if (pio->curr_rx =3D=3D xfer) {
+			/*
+			 * Response availability implies RX completion.
+			 * Retrieve trailing RX data if any.
+			 * Note that short reads are possible.
+			 */
+			u_int received =3D xfer->data_len - xfer->data_left;
+			u_int expected =3D RESP_DATA_LENGTH(xfer->response);
+
+			if (expected > received) {
+				hci_pio_do_trailing_rx(hci, pio,
+						       expected - received);
+			} else if (received > expected) {
+				/* we consumed data meant for next xfer */
+				u_int to_keep =3D DIV_ROUND_UP(expected, 4);
+
+				hci_pio_push_to_next_rx(hci, xfer, to_keep);
+			}
+			/* then process the RX list pointer */
+			if (hci_pio_process_rx(hci, pio))
+				pio->enabled_irqs &=3D ~STAT_RX_THLD;
+		}
+
+		/*
+		 * We're about to give back ownership of the xfer structure
+		 * to the waiting instance. Make sure no reference to it
+		 * still exists.
+		 */
+		if (pio->curr_rx =3D=3D xfer) {
+			DBG("short RX ?");
+			pio->curr_rx =3D pio->curr_rx->next_data;
+		} else if (pio->curr_tx =3D=3D xfer) {
+			DBG("short TX ?");
+			pio->curr_tx =3D pio->curr_tx->next_data;
+		} else if (xfer->data_left) {
+			DBG("PIO xfer count =3D %d after response",
+			    xfer->data_left);
+		}
+
+		pio->curr_resp =3D xfer->next_resp;
+		if (xfer->completion)
+			complete(xfer->completion);
+	}
+	return !pio->curr_resp;
+}
+
+static void hci_pio_queue_resp(struct i3c_hci *hci, struct hci_pio_data =
*pio)
+{
+	struct hci_xfer *xfer =3D pio->curr_xfer;
+	struct hci_xfer *prev_queue_tail;
+
+	if (!(xfer->cmd_desc[0] & CMD_0_ROC))
+		return;
+
+	prev_queue_tail =3D pio->resp_queue;
+	pio->resp_queue =3D xfer;
+	if (pio->curr_resp) {
+		prev_queue_tail->next_resp =3D xfer;
+	} else {
+		pio->curr_resp =3D xfer;
+		if (!hci_pio_process_resp(hci, pio))
+			pio->enabled_irqs |=3D STAT_RESP_READY;
+	}
+}
+
+static bool hci_pio_process_cmd(struct i3c_hci *hci, struct hci_pio_data=
 *pio)
+{
+	while (pio->curr_xfer &&
+	       (pio_reg_read(INTR_STATUS) & STAT_CMD_QUEUE_READY)) {
+		/*
+		 * Always process the data FIFO before sending the command
+		 * so needed TX data or RX space is available upfront.
+		 */
+		hci_pio_queue_data(hci, pio);
+		/*
+		 * Then queue our response request. This will also process
+		 * the response FIFO in case it got suddenly filled up
+		 * with results from previous commands.
+		 */
+		hci_pio_queue_resp(hci, pio);
+		/*
+		 * Finally send the command.
+		 */
+		hci_pio_write_cmd(hci, pio->curr_xfer);
+		/*
+		 * And move on.
+		 */
+		pio->curr_xfer =3D pio->curr_xfer->next_xfer;
+	}
+	return !pio->curr_xfer;
+}
+
+static int hci_pio_queue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer=
, int n)
+{
+	struct hci_pio_data *pio =3D hci->io_data;
+	struct hci_xfer *prev_queue_tail;
+	int i;
+
+	DBG("n =3D %d", n);
+
+	/* link xfer instances together and initialize data count */
+	for (i =3D 0; i < n - 1; i++) {
+		xfer[i].next_xfer =3D (i + 1 < n) ? &xfer[i + 1] : NULL;
+		xfer[i].next_data =3D NULL;
+		xfer[i].next_resp =3D NULL;
+		xfer[i].data_left =3D xfer[i].data_len;
+	}
+
+	spin_lock_irq(&pio->lock);
+	PK_debug_trace_reset();
+	prev_queue_tail =3D pio->xfer_queue;
+	pio->xfer_queue =3D &xfer[n - 1];
+	if (pio->curr_xfer) {
+		prev_queue_tail->next_xfer =3D xfer;
+	} else {
+		pio->curr_xfer =3D xfer;
+		if (!hci_pio_process_cmd(hci, pio))
+			pio->enabled_irqs |=3D STAT_CMD_QUEUE_READY;
+		pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
+		DBG("status =3D %#x/%#x",
+		    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+	}
+	spin_unlock_irq(&pio->lock);
+	return 0;
+}
+
+static bool hci_pio_dequeue_xfer_common(struct i3c_hci *hci,
+					struct hci_pio_data *pio,
+					struct hci_xfer *xfer, int n)
+{
+	struct hci_xfer *p, **p_prev_next;
+	int i;
+
+	/*
+	 * To safely dequeue a transfer request, it must be either entirely
+	 * processed, or not yet processed at all. If our request tail is
+	 * reachable from either the data or resp list that means the command
+	 * was submitted and not yet completed.
+	 */
+	for (p =3D pio->curr_resp; p; p =3D p->next_resp)
+		for (i =3D 0; i < n; i++)
+			if (p =3D=3D &xfer[i])
+				goto pio_screwed;
+	for (p =3D pio->curr_rx; p; p =3D p->next_data)
+		for (i =3D 0; i < n; i++)
+			if (p =3D=3D &xfer[i])
+				goto pio_screwed;
+	for (p =3D pio->curr_tx; p; p =3D p->next_data)
+		for (i =3D 0; i < n; i++)
+			if (p =3D=3D &xfer[i])
+				goto pio_screwed;
+
+	/*
+	 * The command was completed, or wasn't yet submitted.
+	 * Unlink it from the que if the later.
+	 */
+	p_prev_next =3D &pio->curr_xfer;
+	for (p =3D pio->curr_xfer; p; p =3D p->next_xfer) {
+		if (p =3D=3D &xfer[0]) {
+			*p_prev_next =3D xfer[n - 1].next_xfer;
+			break;
+		}
+		p_prev_next =3D &p->next_xfer;
+	}
+
+	/* return true if we actually unqueued something */
+	return !!p;
+
+pio_screwed:
+	/*
+	 * Life is tough. We must invalidate the hardware state and
+	 * discard everything that is still queued.
+	 */
+	for (p =3D pio->curr_resp; p; p =3D p->next_resp) {
+		p->response =3D FIELD_PREP(RESP_ERR_FIELD, RESP_ERR_ABORTED);
+		if (p->completion)
+			complete(p->completion);
+	}
+	for (p =3D pio->curr_xfer; p; p =3D p->next_xfer) {
+		p->response =3D FIELD_PREP(RESP_ERR_FIELD, RESP_ERR_ABORTED);
+		if (p->completion)
+			complete(p->completion);
+	}
+	pio->curr_xfer =3D pio->curr_rx =3D pio->curr_tx =3D pio->curr_resp =3D=
 NULL;
+
+	return true;
+}
+
+static bool hci_pio_dequeue_xfer(struct i3c_hci *hci, struct hci_xfer *x=
fer, int n)
+{
+	struct hci_pio_data *pio =3D hci->io_data;
+	int ret;
+
+	spin_lock_irq(&pio->lock);
+	DBG("n=3D%d status=3D%#x/%#x", n,
+	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+	DBG("main_status =3D %#x/%#x",
+	    readl(hci->base_regs + 0x20), readl(hci->base_regs + 0x28));
+	PK_debug_trace();
+
+	ret =3D hci_pio_dequeue_xfer_common(hci, pio, xfer, n);
+	spin_unlock_irq(&pio->lock);
+	return ret;
+}
+
+static void hci_pio_set_ibi_thresh(struct i3c_hci *hci,
+				   struct hci_pio_data *pio, u_int thresh_val)
+{
+	u32 regval =3D pio->reg_queue_thresh;
+
+	regval &=3D ~QUEUE_IBI_STATUS_THLD;
+	regval |=3D FIELD_PREP(QUEUE_IBI_STATUS_THLD, thresh_val);
+	/* write the threshold reg only if it changes */
+	if (regval !=3D pio->reg_queue_thresh) {
+		pio_reg_write(QUEUE_THLD_CTRL, regval);
+		pio->reg_queue_thresh =3D regval;
+		DBG("%d", thresh_val);
+	}
+}
+
+static bool hci_pio_get_ibi_segment(struct i3c_hci *hci,
+				    struct hci_pio_data *pio)
+{
+	struct hci_pio_ibi_data *ibi =3D &pio->ibi;
+	u_int nr_words, thresh_val;
+	u32 *p;
+
+	p =3D ibi->data_ptr;
+	p +=3D (ibi->seg_len - ibi->seg_cnt) / 4;
+
+	while ((nr_words =3D ibi->seg_cnt/4)) {
+		/* determine our IBI queue threshold value */
+		thresh_val =3D min_t(u_int, nr_words, pio->max_ibi_thresh);
+		hci_pio_set_ibi_thresh(hci, pio, thresh_val);
+		/* bail out if we don't have that amount of data ready */
+		if (!(pio_reg_read(INTR_STATUS) & STAT_IBI_STATUS_THLD))
+			return false;
+		/* extract the data from the IBI port */
+		nr_words =3D thresh_val;
+		ibi->seg_cnt -=3D nr_words * 4;
+		DBG("now %d left %d", nr_words * 4, ibi->seg_cnt);
+		while (nr_words--)
+			*p++ =3D pio_reg_read(IBI_PORT);
+	}
+
+	if (ibi->seg_cnt) {
+		/*
+		 * There are trailing bytes in the last word.
+		 * Fetch it and extract bytes in an endian independent way.
+		 * Unlike the TX case, we must not write past the end of
+		 * the destination buffer.
+		 */
+		u32 data;
+		u8 *p_byte =3D (u8 *)p;
+
+		hci_pio_set_ibi_thresh(hci, pio, 1);
+		if (!(pio_reg_read(INTR_STATUS) & STAT_IBI_STATUS_THLD))
+			return false;
+		DBG("trailing %d", ibi->seg_cnt);
+		data =3D pio_reg_read(IBI_PORT);
+		data =3D cpu_to_le32(data);
+		while (ibi->seg_cnt--) {
+			*p_byte++ =3D data;
+			data >>=3D 8;
+		}
+	}
+
+	return true;
+}
+
+static bool hci_pio_prep_new_ibi(struct i3c_hci *hci, struct hci_pio_dat=
a *pio)
+{
+	struct hci_pio_ibi_data *ibi =3D &pio->ibi;
+	struct i3c_dev_desc *dev;
+	struct i3c_hci_dev_data *dev_data;
+	struct hci_pio_dev_ibi_data *dev_ibi;
+	u32 ibi_status;
+
+	/*
+	 * We have a new IBI. Try to set up its payload retrieval.
+	 * When returning true, the IBI data has to be consumed whether
+	 * or not we are set up to capture it. If we return true with
+	 * ibi->slot =3D=3D NULL that means the data payload has to be
+	 * drained out of the IBI port and dropped.
+	 */
+
+	ibi_status =3D pio_reg_read(IBI_PORT);
+	DBG("status =3D %#x", ibi_status);
+	ibi->addr =3D FIELD_GET(IBI_SLAVE_ADDR, ibi_status);
+	if (ibi_status & IBI_ERROR) {
+		ERR("IBI error from %#x", ibi->addr);
+		return false;
+	}
+
+	ibi->last_seg =3D ibi_status & IBI_LAST_STATUS;
+	ibi->seg_len =3D FIELD_GET(IBI_DATA_LENGTH, ibi_status);
+	ibi->seg_cnt =3D ibi->seg_len;
+
+	dev =3D i3c_hci_addr_to_dev(hci, ibi->addr);
+	if (!dev) {
+		ERR("IBI for unknown device %#x", ibi->addr);
+		return true;
+	}
+
+	dev_data =3D i3c_dev_get_master_data(dev);
+	dev_ibi =3D dev_data->ibi_data;
+	ibi->max_len =3D dev_ibi->max_len;
+
+	if (ibi->seg_len > ibi->max_len) {
+		ERR("IBI payload too big (%d > %d)",
+		    ibi->seg_len, ibi->max_len);
+		return true;
+	}
+
+	ibi->slot =3D i3c_generic_ibi_get_free_slot(dev_ibi->pool);
+	if (!ibi->slot) {
+		ERR("no free slot for IBI");
+	} else {
+		ibi->slot->len =3D 0;
+		ibi->data_ptr =3D ibi->slot->data;
+	}
+	return true;
+}
+
+static void hci_pio_free_ibi_slot(struct i3c_hci *hci, struct hci_pio_da=
ta *pio)
+{
+	struct hci_pio_ibi_data *ibi =3D &pio->ibi;
+	struct hci_pio_dev_ibi_data *dev_ibi;
+
+	if (ibi->slot) {
+		dev_ibi =3D ibi->slot->dev->common.master_priv;
+		i3c_generic_ibi_recycle_slot(dev_ibi->pool, ibi->slot);
+		ibi->slot =3D NULL;
+	}
+}
+
+static bool hci_pio_process_ibi(struct i3c_hci *hci, struct hci_pio_data=
 *pio)
+{
+	struct hci_pio_ibi_data *ibi =3D &pio->ibi;
+
+	if (!ibi->slot && !ibi->seg_cnt && ibi->last_seg)
+		if (!hci_pio_prep_new_ibi(hci, pio))
+			return false;
+
+	for (;;) {
+		u32 ibi_status;
+		u_int ibi_addr;
+
+		if (ibi->slot) {
+			if (!hci_pio_get_ibi_segment(hci, pio))
+				return false;
+			ibi->slot->len +=3D ibi->seg_len;
+			ibi->data_ptr +=3D ibi->seg_len;
+			if (ibi->last_seg) {
+				/* was the last segment: submit it and leave */
+				i3c_master_queue_ibi(ibi->slot->dev, ibi->slot);
+				ibi->slot =3D NULL;
+				hci_pio_set_ibi_thresh(hci, pio, 1);
+				return true;
+			}
+		} else if (ibi->seg_cnt) {
+			/*
+			 * No slot but a non-zero count. This is the result
+			 * of some error and the payload must be drained.
+			 * This normally does not happen therefore no need
+			 * to be extra optimized here.
+			 */
+			hci_pio_set_ibi_thresh(hci, pio, 1);
+			do {
+				if (!(pio_reg_read(INTR_STATUS) & STAT_IBI_STATUS_THLD))
+					return false;
+				pio_reg_read(IBI_PORT);
+			} while (--ibi->seg_cnt);
+			if (ibi->last_seg)
+				return true;
+		}
+
+		/* try to move to the next segment right away */
+		hci_pio_set_ibi_thresh(hci, pio, 1);
+		if (!(pio_reg_read(INTR_STATUS) & STAT_IBI_STATUS_THLD))
+			return false;
+		ibi_status =3D pio_reg_read(IBI_PORT);
+		ibi_addr =3D FIELD_GET(IBI_SLAVE_ADDR, ibi_status);
+		if (ibi->addr !=3D ibi_addr) {
+			/* slave address changed before last segment */
+			ERR("unexp IBI address changed from %d to %d",
+			    ibi->addr, ibi_addr);
+			hci_pio_free_ibi_slot(hci, pio);
+		}
+		ibi->last_seg =3D ibi_status & IBI_LAST_STATUS;
+		ibi->seg_len =3D FIELD_GET(IBI_DATA_LENGTH, ibi_status);
+		ibi->seg_cnt =3D ibi->seg_len;
+		if (ibi->slot && ibi->slot->len + ibi->seg_len > ibi->max_len) {
+			ERR("IBI payload too big (%d > %d)",
+			    ibi->slot->len + ibi->seg_len, ibi->max_len);
+			hci_pio_free_ibi_slot(hci, pio);
+		}
+	}
+
+	return false;
+}
+
+static int hci_pio_request_ibi(struct i3c_hci *hci, struct i3c_dev_desc =
*dev,
+			       const struct i3c_ibi_setup *req)
+{
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+	struct i3c_generic_ibi_pool *pool;
+	struct hci_pio_dev_ibi_data *dev_ibi;
+
+	dev_ibi =3D kmalloc(sizeof(*dev_ibi), GFP_KERNEL);
+	if (!dev_ibi)
+		return -ENOMEM;
+	pool =3D i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(pool)) {
+		kfree(dev_ibi);
+		return PTR_ERR(pool);
+	}
+	dev_ibi->pool =3D pool;
+	dev_ibi->max_len =3D req->max_payload_len;
+	dev_data->ibi_data =3D dev_ibi;
+	return 0;
+}
+
+static void hci_pio_free_ibi(struct i3c_hci *hci, struct i3c_dev_desc *d=
ev)
+{
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+	struct hci_pio_dev_ibi_data *dev_ibi =3D dev_data->ibi_data;
+
+	dev_data->ibi_data =3D NULL;
+	i3c_generic_ibi_free_pool(dev_ibi->pool);
+	kfree(dev_ibi);
+}
+
+static void hci_pio_recycle_ibi_slot(struct i3c_hci *hci,
+				    struct i3c_dev_desc *dev,
+				    struct i3c_ibi_slot *slot)
+{
+	struct i3c_hci_dev_data *dev_data =3D i3c_dev_get_master_data(dev);
+	struct hci_pio_dev_ibi_data *dev_ibi =3D dev_data->ibi_data;
+
+	i3c_generic_ibi_recycle_slot(dev_ibi->pool, slot);
+}
+
+static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
+			u32 status)
+{
+	/* TODO: this ought to be more sophisticated eventually */
+
+	if (pio_reg_read(INTR_STATUS) & STAT_RESP_READY) {
+		/* this may happen when an error is signaled with ROC unset */
+		u32 resp =3D pio_reg_read(RESPONSE_QUEUE_PORT);
+
+		ERR("orphan response (%#x) on error", resp);
+	}
+
+	/* just bust out everything with pending responses for now */
+	hci_pio_dequeue_xfer_common(hci, pio, pio->curr_resp, 1);
+	/* ... and half-way TX transfers if any */
+	if (pio->curr_tx &&
+	    pio->curr_tx->data_left !=3D pio->curr_tx->data_len)
+		hci_pio_dequeue_xfer_common(hci, pio, pio->curr_tx, 1);
+	/* then reset the hardware */
+	i3c_hci_pio_reset(hci);
+	i3c_hci_resume(hci);
+
+	DBG("status=3D%#x/%#x",
+	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+}
+
+static bool hci_pio_irq_handler(struct i3c_hci *hci, u_int unused)
+{
+	struct hci_pio_data *pio =3D hci->io_data;
+	u32 status;
+
+	spin_lock(&pio->lock);
+	status =3D pio_reg_read(INTR_STATUS);
+	DBG("(in) status: %#x/%#x", status, pio->enabled_irqs);
+	status &=3D pio->enabled_irqs;
+	if (!status) {
+		spin_unlock(&pio->lock);
+		return false;
+	}
+
+	if (unlikely(status & (STAT_TRANSFER_ERR|STAT_TRANSFER_ABORT)))
+		PK_debug_trace();
+
+	if (status & STAT_IBI_STATUS_THLD)
+		hci_pio_process_ibi(hci, pio);
+
+	if (status & STAT_RX_THLD)
+		if (hci_pio_process_rx(hci, pio))
+			pio->enabled_irqs &=3D ~STAT_RX_THLD;
+	if (status & STAT_TX_THLD)
+		if (hci_pio_process_tx(hci, pio))
+			pio->enabled_irqs &=3D ~STAT_TX_THLD;
+	if (status & STAT_RESP_READY)
+		if (hci_pio_process_resp(hci, pio))
+			pio->enabled_irqs &=3D ~STAT_RESP_READY;
+
+	if (unlikely(status & (STAT_TRANSFER_ERR|STAT_TRANSFER_ABORT)))
+		hci_pio_err(hci, pio, status);
+
+	if (status & STAT_CMD_QUEUE_READY)
+		if (hci_pio_process_cmd(hci, pio))
+			pio->enabled_irqs &=3D ~STAT_CMD_QUEUE_READY;
+
+	pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
+	DBG("(out) status: %#x/%#x",
+	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
+	spin_unlock(&pio->lock);
+	return true;
+}
+
+const struct hci_io_ops i3c_hci_pio =3D {
+	.init			=3D hci_pio_init,
+	.cleanup		=3D hci_pio_cleanup,
+	.queue_xfer		=3D hci_pio_queue_xfer,
+	.dequeue_xfer		=3D hci_pio_dequeue_xfer,
+	.irq_handler		=3D hci_pio_irq_handler,
+	.request_ibi		=3D hci_pio_request_ibi,
+	.free_ibi		=3D hci_pio_free_ibi,
+	.recycle_ibi_slot	=3D hci_pio_recycle_ibi_slot,
+};
--=20
2.26.2


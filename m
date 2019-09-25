From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V9 2/2] mailbox: introduce ARM SMC based mailbox
Date: Wed, 25 Sep 2019 02:09:11 +0000
Message-ID: <1569377224-5755-3-git-send-email-peng.fan@nxp.com>
References: <1569377224-5755-1-git-send-email-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1569377224-5755-1-git-send-email-peng.fan@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

This mailbox driver implements a mailbox which signals transmitted data
via an ARM smc (secure monitor call) instruction. The mailbox receiver
is implemented in firmware and can synchronously return data when it
returns execution to the non-secure world again.
An asynchronous receive path is not implemented.
This allows the usage of a mailbox to trigger firmware actions on SoCs
which either don't have a separate management processor or on which such
a core is not available. A user of this mailbox could be the SCP
interface.

Modified from Andre Przywara's v2 patch
https://lore.kernel.org/patchwork/patch/812999/

Cc: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mailbox/Kconfig                |   7 ++
 drivers/mailbox/Makefile               |   2 +
 drivers/mailbox/arm-smc-mailbox.c      | 167 +++++++++++++++++++++++++++++=
++++
 include/linux/mailbox/arm-smccc-mbox.h |  20 ++++
 4 files changed, 196 insertions(+)
 create mode 100644 drivers/mailbox/arm-smc-mailbox.c
 create mode 100644 include/linux/mailbox/arm-smccc-mbox.h

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ab4eb750bbdd..7707ee26251a 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -16,6 +16,13 @@ config ARM_MHU
 	  The controller has 3 mailbox channels, the last of which can be
 	  used in Secure mode only.
=20
+config ARM_SMC_MBOX
+	tristate "Generic ARM smc mailbox"
+	depends on OF && HAVE_ARM_SMCCC
+	help
+	  Generic mailbox driver which uses ARM smc calls to call into
+	  firmware for triggering mailboxes.
+
 config IMX_MBOX
 	tristate "i.MX Mailbox"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index c22fad6f696b..93918a84c91b 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)	+=3D mailbox-test.o
=20
 obj-$(CONFIG_ARM_MHU)	+=3D arm_mhu.o
=20
+obj-$(CONFIG_ARM_SMC_MBOX)	+=3D arm-smc-mailbox.o
+
 obj-$(CONFIG_IMX_MBOX)	+=3D imx-mailbox.o
=20
 obj-$(CONFIG_ARMADA_37XX_RWTM_MBOX)	+=3D armada-37xx-rwtm-mailbox.o
diff --git a/drivers/mailbox/arm-smc-mailbox.c b/drivers/mailbox/arm-smc-ma=
ilbox.c
new file mode 100644
index 000000000000..6f0b5fd6ad1b
--- /dev/null
+++ b/drivers/mailbox/arm-smc-mailbox.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2016,2017 ARM Ltd.
+ * Copyright 2019 NXP
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox/arm-smccc-mbox.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+typedef unsigned long (smc_mbox_fn)(unsigned int, unsigned long,
+				    unsigned long, unsigned long,
+				    unsigned long, unsigned long,
+				    unsigned long);
+
+struct arm_smc_chan_data {
+	unsigned int function_id;
+	smc_mbox_fn *invoke_smc_mbox_fn;
+};
+
+static int arm_smc_send_data(struct mbox_chan *link, void *data)
+{
+	struct arm_smc_chan_data *chan_data =3D link->con_priv;
+	struct arm_smccc_mbox_cmd *cmd =3D data;
+	unsigned long ret;
+
+	if (ARM_SMCCC_IS_64(chan_data->function_id)) {
+		ret =3D chan_data->invoke_smc_mbox_fn(chan_data->function_id,
+						    cmd->args_smccc64[0],
+						    cmd->args_smccc64[1],
+						    cmd->args_smccc64[2],
+						    cmd->args_smccc64[3],
+						    cmd->args_smccc64[4],
+						    cmd->args_smccc64[5]);
+	} else {
+		ret =3D chan_data->invoke_smc_mbox_fn(chan_data->function_id,
+						    cmd->args_smccc32[0],
+						    cmd->args_smccc32[1],
+						    cmd->args_smccc32[2],
+						    cmd->args_smccc32[3],
+						    cmd->args_smccc32[4],
+						    cmd->args_smccc32[5]);
+	}
+
+	mbox_chan_received_data(link, (void *)ret);
+
+	return 0;
+}
+
+static unsigned long __invoke_fn_hvc(unsigned int function_id,
+				     unsigned long arg0, unsigned long arg1,
+				     unsigned long arg2, unsigned long arg3,
+				     unsigned long arg4, unsigned long arg5)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_hvc(function_id, arg0, arg1, arg2, arg3, arg4,
+		      arg5, 0, &res);
+	return res.a0;
+}
+
+static unsigned long __invoke_fn_smc(unsigned int function_id,
+				     unsigned long arg0, unsigned long arg1,
+				     unsigned long arg2, unsigned long arg3,
+				     unsigned long arg4, unsigned long arg5)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(function_id, arg0, arg1, arg2, arg3, arg4,
+		      arg5, 0, &res);
+	return res.a0;
+}
+
+static const struct mbox_chan_ops arm_smc_mbox_chan_ops =3D {
+	.send_data	=3D arm_smc_send_data,
+};
+
+static struct mbox_chan *
+arm_smc_mbox_of_xlate(struct mbox_controller *mbox,
+		      const struct of_phandle_args *sp)
+{
+	return mbox->chans;
+}
+
+static int arm_smc_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct mbox_controller *mbox;
+	struct arm_smc_chan_data *chan_data;
+	int ret;
+
+	mbox =3D devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	mbox->of_xlate =3D arm_smc_mbox_of_xlate;
+	mbox->num_chans =3D 1;
+	mbox->chans =3D devm_kzalloc(dev, sizeof(*mbox->chans), GFP_KERNEL);
+	if (!mbox->chans)
+		return -ENOMEM;
+
+	chan_data =3D devm_kzalloc(dev, sizeof(*chan_data), GFP_KERNEL);
+	if (!chan_data)
+		return -ENOMEM;
+
+	ret =3D of_property_read_u32(dev->of_node, "arm,func-id",
+				   &chan_data->function_id);
+	if (ret)
+		return ret;
+
+	if (of_device_is_compatible(dev->of_node, "arm,smc-mbox"))
+		chan_data->invoke_smc_mbox_fn =3D __invoke_fn_smc;
+	else
+		chan_data->invoke_smc_mbox_fn =3D __invoke_fn_hvc;
+
+
+	mbox->chans->con_priv =3D chan_data;
+
+	mbox->txdone_poll =3D false;
+	mbox->txdone_irq =3D false;
+	mbox->ops =3D &arm_smc_mbox_chan_ops;
+	mbox->dev =3D dev;
+
+	platform_set_drvdata(pdev, mbox);
+
+	ret =3D devm_mbox_controller_register(dev, mbox);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "ARM SMC mailbox enabled.\n");
+
+	return ret;
+}
+
+static int arm_smc_mbox_remove(struct platform_device *pdev)
+{
+	struct mbox_controller *mbox =3D platform_get_drvdata(pdev);
+
+	mbox_controller_unregister(mbox);
+	return 0;
+}
+
+static const struct of_device_id arm_smc_mbox_of_match[] =3D {
+	{ .compatible =3D "arm,smc-mbox", },
+	{ .compatible =3D "arm,hvc-mbox", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, arm_smc_mbox_of_match);
+
+static struct platform_driver arm_smc_mbox_driver =3D {
+	.driver =3D {
+		.name =3D "arm-smc-mbox",
+		.of_match_table =3D arm_smc_mbox_of_match,
+	},
+	.probe		=3D arm_smc_mbox_probe,
+	.remove		=3D arm_smc_mbox_remove,
+};
+module_platform_driver(arm_smc_mbox_driver);
+
+MODULE_AUTHOR("Peng Fan <peng.fan@nxp.com>");
+MODULE_DESCRIPTION("Generic ARM smc mailbox driver");
+MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mailbox/arm-smccc-mbox.h b/include/linux/mailbox=
/arm-smccc-mbox.h
new file mode 100644
index 000000000000..d35fb89a77f5
--- /dev/null
+++ b/include/linux/mailbox/arm-smccc-mbox.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_ARM_SMCCC_MBOX_H_
+#define _LINUX_ARM_SMCCC_MBOX_H_
+
+#include <linux/types.h>
+
+/**
+ * struct arm_smccc_mbox_cmd - ARM SMCCC message structure
+ * @args_smccc32/64:	actual usage of registers is up to the protocol
+ *			(within the SMCCC limits)
+ */
+struct arm_smccc_mbox_cmd {
+	union {
+		u32 args_smccc32[6];
+		u64 args_smccc64[6];
+	};
+};
+
+#endif /* _LINUX_ARM_SMCCC_MBOX_H_ */
--=20
2.16.4

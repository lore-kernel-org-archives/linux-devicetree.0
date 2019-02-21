From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V4 2/4] firmware: imx: enable imx scu general irq function
Date: Thu, 21 Feb 2019 09:19:28 +0000
Message-ID: <1550740354-2701-2-git-send-email-Anson.Huang@nxp.com>
References: <1550740354-2701-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550740354-2701-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

The System Controller Firmware (SCFW) controls RTC, thermal
and WDOG etc., these resources' interrupt function are managed
by SCU. When any IRQ pending, SCU will notify Linux via MU general
interrupt channel #3, and Linux kernel needs to call SCU APIs
to get IRQ status and notify each module to handle the interrupt.

Since there is no data transmission for SCU IRQ notification, so
doorbell mode is used for this MU channel, and SCU driver will
use notifier mechanism to broadcast to every module which registers
the SCU block notifier.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V3:
	- use alias to get general MU interrupt channel id and then get resource I=
D,
	  this is to support different MU instance;
	- add return value check for imx_scu_enable_general_irq_channel().
---
 drivers/firmware/imx/imx-scu.c   | 116 +++++++++++++++++++++++++++++++++++=
++++
 include/linux/firmware/imx/sci.h |   3 +
 2 files changed, 119 insertions(+)

diff --git a/drivers/firmware/imx/imx-scu.c b/drivers/firmware/imx/imx-scu.=
c
index 2bb1a19..1dcd7b3 100644
--- a/drivers/firmware/imx/imx-scu.c
+++ b/drivers/firmware/imx/imx-scu.c
@@ -7,6 +7,7 @@
  *
  */
=20
+#include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/types.h>
 #include <linux/firmware/imx/ipc.h>
@@ -21,6 +22,8 @@
=20
 #define SCU_MU_CHAN_NUM		8
 #define MAX_RX_TIMEOUT		(msecs_to_jiffies(30))
+#define IMX_SC_IRQ_FUNC_STATUS	2
+#define IMX_SC_IRQ_NUM_GROUP	6
=20
 struct imx_sc_chan {
 	struct imx_sc_ipc *sc_ipc;
@@ -41,6 +44,7 @@ struct imx_sc_ipc {
 	u32 *msg;
 	u8 rx_size;
 	u8 count;
+	u32 mu_resource_id;
 };
=20
 /*
@@ -77,7 +81,23 @@ static int imx_sc_linux_errmap[IMX_SC_ERR_LAST] =3D {
 	-EIO,	 /* IMX_SC_ERR_FAIL */
 };
=20
+struct imx_sc_msg_irq_get_status {
+	struct imx_sc_rpc_msg hdr;
+	union {
+		struct {
+			u16 resource;
+			u8 group;
+			u8 reserved;
+		} __packed req;
+		struct {
+			u32 status;
+		} __packed resp;
+	} data;
+};
+
 static struct imx_sc_ipc *imx_sc_ipc_handle;
+static struct work_struct imx_sc_general_irq_work;
+static BLOCKING_NOTIFIER_HEAD(imx_scu_notifier_chain);
=20
 static inline int imx_sc_to_linux_errno(int errno)
 {
@@ -194,9 +214,90 @@ int imx_scu_call_rpc(struct imx_sc_ipc *sc_ipc, void *=
msg, bool have_resp)
 }
 EXPORT_SYMBOL(imx_scu_call_rpc);
=20
+int imx_scu_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&imx_scu_notifier_chain, nb);
+}
+EXPORT_SYMBOL(imx_scu_register_notifier);
+
+int imx_scu_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&imx_scu_notifier_chain, nb);
+}
+EXPORT_SYMBOL(imx_scu_unregister_notifier);
+
+static int imx_scu_notifier_call_chain(unsigned long status, u8 *group)
+{
+	return blocking_notifier_call_chain(&imx_scu_notifier_chain,
+					    status, (void *)group);
+}
+
+static void imx_scu_general_irq_work_handler(struct work_struct *work)
+{
+	struct imx_sc_msg_irq_get_status msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+	u32 irq_status;
+	int ret;
+	u8 i;
+
+	for (i =3D 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
+		hdr->ver =3D IMX_SC_RPC_VERSION;
+		hdr->svc =3D IMX_SC_RPC_SVC_IRQ;
+		hdr->func =3D IMX_SC_IRQ_FUNC_STATUS;
+		hdr->size =3D 2;
+
+		msg.data.req.resource =3D imx_sc_ipc_handle->mu_resource_id;
+		msg.data.req.group =3D i;
+
+		ret =3D imx_scu_call_rpc(imx_sc_ipc_handle, &msg, true);
+		if (ret) {
+			pr_err("get irq status failed, ret %d\n", ret);
+			return;
+		}
+
+		irq_status =3D msg.data.resp.status;
+		if (!irq_status)
+			continue;
+
+		imx_scu_notifier_call_chain(irq_status, &i);
+	}
+}
+
+static void imx_scu_rxdb_callback(struct mbox_client *c, void *msg)
+{
+	schedule_work(&imx_sc_general_irq_work);
+}
+
+static int imx_scu_enable_general_irq_channel(struct device *dev)
+{
+	struct mbox_client *cl;
+	struct mbox_chan *ch;
+	int ret =3D 0;
+
+	cl =3D devm_kzalloc(dev, sizeof(*cl), GFP_KERNEL);
+	if (!cl)
+		return -ENOMEM;
+
+	cl->dev =3D dev;
+	cl->rx_callback =3D imx_scu_rxdb_callback;
+
+	/* SCU general IRQ uses general interrupt channel 3 */
+	ch =3D mbox_request_channel_byname(cl, "gip3");
+	if (IS_ERR(ch)) {
+		ret =3D PTR_ERR(ch);
+		dev_err(dev, "failed to request mbox chan gip3, ret %d\n", ret);
+		return ret;
+	}
+
+	INIT_WORK(&imx_sc_general_irq_work, imx_scu_general_irq_work_handler);
+
+	return ret;
+}
+
 static int imx_scu_probe(struct platform_device *pdev)
 {
 	struct device *dev =3D &pdev->dev;
+	struct of_phandle_args spec;
 	struct imx_sc_ipc *sc_ipc;
 	struct imx_sc_chan *sc_chan;
 	struct mbox_client *cl;
@@ -246,6 +347,21 @@ static int imx_scu_probe(struct platform_device *pdev)
=20
 	imx_sc_ipc_handle =3D sc_ipc;
=20
+	ret =3D imx_scu_enable_general_irq_channel(dev);
+	if (ret)
+		dev_warn(dev,
+			"failed to enable general irq channel: %d\n", ret);
+
+	if (!of_parse_phandle_with_args(dev->of_node, "mboxes",
+				       "#mbox-cells", 0, &spec))
+		i =3D of_alias_get_id(spec.np, "mu");
+
+	/* use mu1 as general mu irq channel if failed */
+	if (i < 0)
+		i =3D 1;
+
+	imx_sc_ipc_handle->mu_resource_id =3D IMX_SC_R_MU_0A + i;
+
 	dev_info(dev, "NXP i.MX SCU Initialized\n");
=20
 	return devm_of_platform_populate(dev);
diff --git a/include/linux/firmware/imx/sci.h b/include/linux/firmware/imx/=
sci.h
index ebc5509..9d608db 100644
--- a/include/linux/firmware/imx/sci.h
+++ b/include/linux/firmware/imx/sci.h
@@ -15,4 +15,7 @@
=20
 #include <linux/firmware/imx/svc/misc.h>
 #include <linux/firmware/imx/svc/pm.h>
+
+int imx_scu_register_notifier(struct notifier_block *nb);
+int imx_scu_unregister_notifier(struct notifier_block *nb);
 #endif /* _SC_SCI_H */
--=20
2.7.4

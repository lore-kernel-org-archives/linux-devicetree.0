From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 4/4] rtc: imx-sc: add rtc alarm support
Date: Thu, 14 Feb 2019 03:44:48 +0000
Message-ID: <1550115535-14488-5-git-send-email-Anson.Huang@nxp.com>
References: <1550115535-14488-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550115535-14488-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-rtc
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add i.MX system controller RTC alarm support, the RTC alarm
is implemented via SIP(silicon provider) runtime service call
and ARM-Trusted-Firmware will communicate with system controller
via MU(message unit) IPC to set RTC alarm. When RTC alarm fires,
system controller will generate a common MU irq event and notify
system controller RTC driver to handle the irq event.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No V1 patch, just add it into the i.MX SC general irq support patch series,
to support system controller RTC's alarm function and also to provide an
example of how to use general MU irq, this patch depends on the i.MX SC
general irq support patch set, so add it into same patch series.
--
 drivers/rtc/rtc-imx-sc.c | 100 +++++++++++++++++++++++++++++++++++++++++++=
++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c
index 60570a2..147545e 100644
--- a/drivers/rtc/rtc-imx-sc.c
+++ b/drivers/rtc/rtc-imx-sc.c
@@ -3,6 +3,7 @@
  * Copyright 2018 NXP.
  */
=20
+#include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/arm-smccc.h>
 #include <linux/firmware/imx/sci.h>
 #include <linux/module.h>
@@ -11,11 +12,17 @@
 #include <linux/rtc.h>
=20
 #define IMX_SC_TIMER_FUNC_GET_RTC_SEC1970	9
+#define IMX_SC_TIMER_FUNC_SET_RTC_ALARM		8
 #define IMX_SC_TIMER_FUNC_SET_RTC_TIME		6
=20
+#define IMX_SC_IRQ_FUNC_ENABLE			1
+
 #define IMX_SIP_SRTC			0xC2000002
 #define IMX_SIP_SRTC_SET_TIME		0x0
=20
+#define SC_IRQ_GROUP_RTC    2
+#define SC_IRQ_RTC          1
+
 static struct imx_sc_ipc *rtc_ipc_handle;
 static struct rtc_device *imx_sc_rtc;
=20
@@ -24,6 +31,24 @@ struct imx_sc_msg_timer_get_rtc_time {
 	u32 time;
 } __packed;
=20
+struct imx_sc_msg_timer_enable_irq {
+	struct imx_sc_rpc_msg hdr;
+	u32 mask;
+	u16 resource;
+	u8 group;
+	u8 enable;
+} __packed;
+
+struct imx_sc_msg_timer_rtc_set_alarm {
+	struct imx_sc_rpc_msg hdr;
+	u16 year;
+	u8 mon;
+	u8 day;
+	u8 hour;
+	u8 min;
+	u8 sec;
+} __packed;
+
 static int imx_sc_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct imx_sc_msg_timer_get_rtc_time msg;
@@ -60,9 +85,80 @@ static int imx_sc_rtc_set_time(struct device *dev, struc=
t rtc_time *tm)
 	return res.a0;
 }
=20
+static int imx_sc_rtc_alarm_irq_enable(struct device *dev, unsigned int en=
able)
+{
+	struct imx_sc_msg_timer_enable_irq msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+	int ret;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D IMX_SC_RPC_SVC_IRQ;
+	hdr->func =3D IMX_SC_IRQ_FUNC_ENABLE;
+	hdr->size =3D 3;
+
+	msg.resource =3D IMX_SC_R_MU_1A;
+	msg.group =3D SC_IRQ_GROUP_RTC;
+	msg.mask =3D SC_IRQ_RTC;
+	msg.enable =3D enable;
+
+	ret =3D imx_scu_call_rpc(rtc_ipc_handle, &msg, true);
+	if (ret) {
+		dev_err(dev, "enable rtc irq failed, ret %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int imx_sc_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alr=
m)
+{
+	struct imx_sc_msg_timer_rtc_set_alarm msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+	int ret;
+	struct rtc_time *alrm_tm =3D &alrm->time;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D IMX_SC_RPC_SVC_TIMER;
+	hdr->func =3D IMX_SC_TIMER_FUNC_SET_RTC_ALARM;
+	hdr->size =3D 3;
+
+	msg.year =3D alrm_tm->tm_year + 1900;
+	msg.mon =3D alrm_tm->tm_mon + 1;
+	msg.day =3D alrm_tm->tm_mday;
+	msg.hour =3D alrm_tm->tm_hour;
+	msg.min =3D alrm_tm->tm_min;
+	msg.sec =3D alrm_tm->tm_sec;
+
+	ret =3D imx_scu_call_rpc(rtc_ipc_handle, &msg, true);
+	if (ret) {
+		dev_err(dev, "set rtc alarm failed, ret %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct rtc_class_ops imx_sc_rtc_ops =3D {
 	.read_time =3D imx_sc_rtc_read_time,
 	.set_time =3D imx_sc_rtc_set_time,
+	.set_alarm =3D imx_sc_rtc_set_alarm,
+	.alarm_irq_enable =3D imx_sc_rtc_alarm_irq_enable,
+};
+
+static int imx_sc_rtc_alarm_sc_notify(struct notifier_block *nb,
+					unsigned long event, void *group)
+{
+	/* ignore non-rtc irq */
+	if (!((event & SC_IRQ_RTC) && (*(u8 *)group =3D=3D SC_IRQ_GROUP_RTC)))
+		return 0;
+
+	rtc_update_irq(imx_sc_rtc, 1, RTC_IRQF | RTC_AF);
+
+	return 0;
+}
+
+static struct notifier_block imx_sc_rtc_alarm_sc_notifier =3D {
+	.notifier_call =3D imx_sc_rtc_alarm_sc_notify,
 };
=20
 static int imx_sc_rtc_probe(struct platform_device *pdev)
@@ -73,6 +169,8 @@ static int imx_sc_rtc_probe(struct platform_device *pdev=
)
 	if (ret)
 		return ret;
=20
+	device_init_wakeup(&pdev->dev, true);
+
 	imx_sc_rtc =3D devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(imx_sc_rtc))
 		return PTR_ERR(imx_sc_rtc);
@@ -87,6 +185,8 @@ static int imx_sc_rtc_probe(struct platform_device *pdev=
)
 		return ret;
 	}
=20
+	imx_scu_register_notifier(&imx_sc_rtc_alarm_sc_notifier);
+
 	return 0;
 }
=20
--=20
2.7.4

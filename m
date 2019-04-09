From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V6 4/4] rtc: imx-sc: add rtc alarm support
Date: Tue, 9 Apr 2019 02:43:31 +0000
Message-ID: <1554777487-31075-4-git-send-email-Anson.Huang@nxp.com>
References: <1554777487-31075-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1554777487-31075-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "sboyd@kernel.org" <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
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
Changes since V5:
	- move the irq alarm enable RPC to imx-scu-irq driver, and rtc driver just call the
	  API to enable/disable alarm.
---
 drivers/rtc/rtc-imx-sc.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c
index 19642bf..3eb4db0 100644
--- a/drivers/rtc/rtc-imx-sc.c
+++ b/drivers/rtc/rtc-imx-sc.c
@@ -3,6 +3,7 @@
  * Copyright 2018 NXP.
  */
 
+#include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/arm-smccc.h>
 #include <linux/firmware/imx/sci.h>
 #include <linux/module.h>
@@ -11,11 +12,15 @@
 #include <linux/rtc.h>
 
 #define IMX_SC_TIMER_FUNC_GET_RTC_SEC1970	9
+#define IMX_SC_TIMER_FUNC_SET_RTC_ALARM		8
 #define IMX_SC_TIMER_FUNC_SET_RTC_TIME		6
 
 #define IMX_SIP_SRTC			0xC2000002
 #define IMX_SIP_SRTC_SET_TIME		0x0
 
+#define SC_IRQ_GROUP_RTC    2
+#define SC_IRQ_RTC          1
+
 static struct imx_sc_ipc *rtc_ipc_handle;
 static struct rtc_device *imx_sc_rtc;
 
@@ -24,6 +29,16 @@ struct imx_sc_msg_timer_get_rtc_time {
 	u32 time;
 } __packed;
 
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
@@ -60,9 +75,74 @@ static int imx_sc_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	return res.a0;
 }
 
+static int imx_sc_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
+{
+	imx_scu_irq_enable(SC_IRQ_GROUP_RTC, SC_IRQ_RTC, enable);
+
+	return 0;
+}
+
+static int imx_sc_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	return 0;
+}
+
+static int imx_sc_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct imx_sc_msg_timer_rtc_set_alarm msg;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	int ret;
+	struct rtc_time *alrm_tm = &alrm->time;
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = IMX_SC_RPC_SVC_TIMER;
+	hdr->func = IMX_SC_TIMER_FUNC_SET_RTC_ALARM;
+	hdr->size = 3;
+
+	msg.year = alrm_tm->tm_year + 1900;
+	msg.mon = alrm_tm->tm_mon + 1;
+	msg.day = alrm_tm->tm_mday;
+	msg.hour = alrm_tm->tm_hour;
+	msg.min = alrm_tm->tm_min;
+	msg.sec = alrm_tm->tm_sec;
+
+	ret = imx_scu_call_rpc(rtc_ipc_handle, &msg, true);
+	if (ret) {
+		dev_err(dev, "set rtc alarm failed, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = imx_sc_rtc_alarm_irq_enable(dev, alrm->enabled);
+	if (ret) {
+		dev_err(dev, "enable rtc alarm failed, ret %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct rtc_class_ops imx_sc_rtc_ops = {
 	.read_time = imx_sc_rtc_read_time,
 	.set_time = imx_sc_rtc_set_time,
+	.read_alarm = imx_sc_rtc_read_alarm,
+	.set_alarm = imx_sc_rtc_set_alarm,
+	.alarm_irq_enable = imx_sc_rtc_alarm_irq_enable,
+};
+
+static int imx_sc_rtc_alarm_sc_notify(struct notifier_block *nb,
+					unsigned long event, void *group)
+{
+	/* ignore non-rtc irq */
+	if (!((event & SC_IRQ_RTC) && (*(u8 *)group == SC_IRQ_GROUP_RTC)))
+		return 0;
+
+	rtc_update_irq(imx_sc_rtc, 1, RTC_IRQF | RTC_AF);
+
+	return 0;
+}
+
+static struct notifier_block imx_sc_rtc_alarm_sc_notifier = {
+	.notifier_call = imx_sc_rtc_alarm_sc_notify,
 };
 
 static int imx_sc_rtc_probe(struct platform_device *pdev)
@@ -73,6 +153,8 @@ static int imx_sc_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	device_init_wakeup(&pdev->dev, true);
+
 	imx_sc_rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(imx_sc_rtc))
 		return PTR_ERR(imx_sc_rtc);
@@ -87,6 +169,8 @@ static int imx_sc_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	imx_scu_irq_register_notifier(&imx_sc_rtc_alarm_sc_notifier);
+
 	return 0;
 }
 
-- 
2.7.4

Return-Path: <SRS0=NeMx=OH=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V3 2/4] rtc: add i.MX system controller RTC support
Date: Wed, 28 Nov 2018 09:57:29 +0000
Message-ID: <1543398696-3140-3-git-send-email-Anson.Huang@nxp.com>
References: <1543398696-3140-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1543398696-3140-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng DONG <aisheng.dong@nxp.com>, Andy Gross <andy.gross@linaro.org>, "arnd@arndb.de" <arnd@arndb.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "amit.kucheria@linaro.org" <amit.kucheria@linaro.org>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "olof@lixom.net" <olof@lixom.net>, "LW@KARO-electronics.de" <LW@KARO-electronics.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

i.MX8QXP is an ARMv8 SoC which has a Cortex-M4 system controller
inside, the system controller is in charge of controlling power,
clock and secure rtc etc..

This patch adds i.MX system controller RTC driver support,
Linux kernel has to communicate with system controller via MU
(message unit) IPC to set/get RTC time and other alarm functions,
since the RTC set time needs to be done in secure EL3 mode (required
by system controller firmware) and alarm functions needs to be done
with general MU IRQ handle, these depend on other components which
are NOT ready, so this patch ONLY enables the RTC time read.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V2:
	- make rtc_ipc_handle/imx_sc_rtc static;
	- remove comma in last entry of imx_sc_dt_ids;
	- rename rtc_device.
 drivers/rtc/Kconfig      |   6 +++
 drivers/rtc/Makefile     |   1 +
 drivers/rtc/rtc-imx-sc.c | 107 +++++++++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 114 insertions(+)
 create mode 100644 drivers/rtc/rtc-imx-sc.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index a819ef0..3b9642e 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1677,6 +1677,12 @@ config RTC_DRV_SNVS
 	   This driver can also be built as a module, if so, the module
 	   will be called "rtc-snvs".
=20
+config RTC_DRV_IMX_SC
+	tristate "NXP i.MX System Controller RTC support"
+	help
+	   If you say yes here you get support for the NXP i.MX System
+	   Controller RTC module.
+
 config RTC_DRV_SIRFSOC
 	tristate "SiRFSOC RTC"
 	depends on ARCH_SIRF
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 290c173..f97c05e 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_RTC_DRV_GOLDFISH)	+=3D rtc-goldfish.o
 obj-$(CONFIG_RTC_DRV_HID_SENSOR_TIME) +=3D rtc-hid-sensor-time.o
 obj-$(CONFIG_RTC_DRV_HYM8563)	+=3D rtc-hym8563.o
 obj-$(CONFIG_RTC_DRV_IMXDI)	+=3D rtc-imxdi.o
+obj-$(CONFIG_RTC_DRV_IMX_SC)	+=3D rtc-imx-sc.o
 obj-$(CONFIG_RTC_DRV_ISL12022)	+=3D rtc-isl12022.o
 obj-$(CONFIG_RTC_DRV_ISL12026)	+=3D rtc-isl12026.o
 obj-$(CONFIG_RTC_DRV_ISL1208)	+=3D rtc-isl1208.o
diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c
new file mode 100644
index 0000000..b8e331e
--- /dev/null
+++ b/drivers/rtc/rtc-imx-sc.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2018 NXP.
+ */
+
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/firmware/imx/sci.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+
+#define IMX_SC_TIMER_FUNC_GET_RTC_SEC1970	9
+#define IMX_SC_TIMER_FUNC_SET_RTC_TIME		6
+
+static struct imx_sc_ipc *rtc_ipc_handle;
+static struct rtc_device *imx_sc_rtc;
+
+struct imx_sc_msg_req_timer_get_rtc_time {
+	struct imx_sc_rpc_msg hdr;
+} __packed;
+
+struct imx_sc_msg_resp_timer_get_rtc_time {
+	struct imx_sc_rpc_msg hdr;
+	u32 time;
+} __packed;
+
+static int imx_sc_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct imx_sc_msg_resp_timer_get_rtc_time *resp;
+	struct imx_sc_msg_req_timer_get_rtc_time msg;
+	struct imx_sc_rpc_msg *hdr =3D &msg.hdr;
+	int ret;
+
+	hdr->ver =3D IMX_SC_RPC_VERSION;
+	hdr->svc =3D IMX_SC_RPC_SVC_TIMER;
+	hdr->func =3D IMX_SC_TIMER_FUNC_GET_RTC_SEC1970;
+	hdr->size =3D 1;
+
+	ret =3D imx_scu_call_rpc(rtc_ipc_handle, &msg, true);
+	if (ret) {
+		pr_err("read rtc time failed, ret %d\n", ret);
+		return ret;
+	}
+
+	resp =3D (struct imx_sc_msg_resp_timer_get_rtc_time *)&msg;
+	rtc_time_to_tm(resp->time, tm);
+
+	return 0;
+}
+
+static const struct rtc_class_ops imx_sc_rtc_ops =3D {
+	.read_time =3D imx_sc_rtc_read_time,
+};
+
+static int imx_sc_rtc_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret =3D imx_scu_get_handle(&rtc_ipc_handle);
+	if (ret) {
+		if (ret =3D=3D -EPROBE_DEFER)
+			return ret;
+
+		dev_err(&pdev->dev, "failed to get ipc handle: %d!\n", ret);
+		return ret;
+	}
+
+	imx_sc_rtc =3D devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(imx_sc_rtc)) {
+		ret =3D PTR_ERR(imx_sc_rtc);
+		return ret;
+	}
+
+	imx_sc_rtc->ops =3D &imx_sc_rtc_ops;
+	imx_sc_rtc->range_min =3D 0;
+	imx_sc_rtc->range_max =3D U32_MAX;
+
+	ret =3D rtc_register_device(imx_sc_rtc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register rtc: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id imx_sc_dt_ids[] =3D {
+	{ .compatible =3D "nxp,imx8qxp-sc-rtc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, imx_sc_dt_ids);
+
+static struct platform_driver imx_sc_rtc_driver =3D {
+	.driver =3D {
+		.name	=3D "imx-sc-rtc",
+		.of_match_table =3D imx_sc_dt_ids,
+	},
+	.probe		=3D imx_sc_rtc_probe,
+};
+module_platform_driver(imx_sc_rtc_driver);
+
+MODULE_AUTHOR("Anson Huang <Anson.Huang@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX System Controller RTC Driver");
+MODULE_LICENSE("GPL");
--=20
2.7.4

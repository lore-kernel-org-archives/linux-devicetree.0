Return-Path: <SRS0=+1U8=QV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr150085.outbound.protection.outlook.com ([40.107.15.85]:49888
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727868AbfBNLpw (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 14 Feb 2019 06:45:52 -0500
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 2/4] watchdog: imx_sc: Add i.MX system controller watchdog
 support
Date: Thu, 14 Feb 2019 11:44:56 +0000
Message-ID: <1550144346-1187-3-git-send-email-Anson.Huang@nxp.com>
References: <1550144346-1187-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1550144346-1187-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Andy Gross <andy.gross@linaro.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

i.MX8QXP is an ARMv8 SoC which has a Cortex-M4 system controller
inside, the system controller is in charge of controlling power,
clock and watchdog etc..

This patch adds i.MX system controller watchdog driver support,
watchdog operation needs to be done in secure EL3 mode via
ARM-Trusted-Firmware, using SMC call, CPU will trap into
ARM-Trusted-Firmware and then it will request system controller
to do watchdog operation via IPC.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/watchdog/Kconfig      |  13 +++
 drivers/watchdog/Makefile     |   1 +
 drivers/watchdog/imx_sc_wdt.c | 210 ++++++++++++++++++++++++++++++++++++++=
++++
 3 files changed, 224 insertions(+)
 create mode 100644 drivers/watchdog/imx_sc_wdt.c

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 65c3c42..5c5b8ba 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -625,6 +625,19 @@ config IMX2_WDT
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx2_wdt.
=20
+config IMX_SC_WDT
+	tristate "IMX SC Watchdog"
+	depends on ARCH_MXC || COMPILE_TEST
+	select WATCHDOG_CORE
+	help
+	  This is the driver for the system controller watchdog
+	  on the NXP i.MX SoCs with system controller inside.
+	  If you have one of these processors and wish to have
+	  watchdog support enabled, say Y, otherwise say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imx_sc_wdt.
+
 config UX500_WATCHDOG
 	tristate "ST-Ericsson Ux500 watchdog"
 	depends on MFD_DB8500_PRCMU
diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
index 4e78a8c..0c9da63 100644
--- a/drivers/watchdog/Makefile
+++ b/drivers/watchdog/Makefile
@@ -68,6 +68,7 @@ obj-$(CONFIG_NUC900_WATCHDOG) +=3D nuc900_wdt.o
 obj-$(CONFIG_TS4800_WATCHDOG) +=3D ts4800_wdt.o
 obj-$(CONFIG_TS72XX_WATCHDOG) +=3D ts72xx_wdt.o
 obj-$(CONFIG_IMX2_WDT) +=3D imx2_wdt.o
+obj-$(CONFIG_IMX_SC_WDT) +=3D imx_sc_wdt.o
 obj-$(CONFIG_UX500_WATCHDOG) +=3D ux500_wdt.o
 obj-$(CONFIG_RETU_WATCHDOG) +=3D retu_wdt.o
 obj-$(CONFIG_BCM2835_WDT) +=3D bcm2835_wdt.o
diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
new file mode 100644
index 0000000..ae52e34
--- /dev/null
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2018-2019 NXP.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/io.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/watchdog.h>
+
+#define DEFAULT_TIMEOUT 60
+/*
+ * Software timer tick implemented in scfw side, support 10ms to 0xfffffff=
f ms
+ * in theory, but for normal case, 1s~128s is enough, you can change this =
max
+ * value in case it's not enough.
+ */
+#define MAX_TIMEOUT 128
+
+#define IMX_SIP_TIMER			0xC2000002
+#define IMX_SIP_TIMER_START_WDOG		0x01
+#define IMX_SIP_TIMER_STOP_WDOG		0x02
+#define IMX_SIP_TIMER_SET_WDOG_ACT	0x03
+#define IMX_SIP_TIMER_PING_WDOG		0x04
+#define IMX_SIP_TIMER_SET_TIMEOUT_WDOG	0x05
+#define IMX_SIP_TIMER_GET_WDOG_STAT	0x06
+#define IMX_SIP_TIMER_SET_PRETIME_WDOG	0x07
+
+#define SC_TIMER_WDOG_ACTION_PARTITION	0
+
+static bool nowayout =3D WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0000);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (defau=
lt=3D"
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
+static unsigned int timeout =3D DEFAULT_TIMEOUT;
+module_param(timeout, uint, 0000);
+MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default=3D"
+		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
+
+static struct watchdog_device imx_sc_wdd;
+
+static int imx_sc_wdt_ping(struct watchdog_device *wdog)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_PING_WDOG,
+		      0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+static int imx_sc_wdt_start(struct watchdog_device *wdog)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_START_WDOG,
+		      0, 0, 0, 0, 0, 0, &res);
+	if (res.a0)
+		return res.a0;
+
+	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_SET_WDOG_ACT,
+		      SC_TIMER_WDOG_ACTION_PARTITION,
+		      0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+static int imx_sc_wdt_stop(struct watchdog_device *wdog)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_STOP_WDOG,
+		      0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+static int imx_sc_wdt_set_timeout(struct watchdog_device *wdog,
+				unsigned int timeout)
+{
+	struct arm_smccc_res res;
+
+	wdog->timeout =3D timeout;
+	arm_smccc_smc(IMX_SIP_TIMER, IMX_SIP_TIMER_SET_TIMEOUT_WDOG,
+		      timeout * 1000, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+static const struct watchdog_ops imx_sc_wdt_ops =3D {
+	.owner =3D THIS_MODULE,
+	.start =3D imx_sc_wdt_start,
+	.stop  =3D imx_sc_wdt_stop,
+	.ping  =3D imx_sc_wdt_ping,
+	.set_timeout =3D imx_sc_wdt_set_timeout,
+};
+
+static const struct watchdog_info imx_sc_wdt_info =3D {
+	.identity	=3D "i.MX SC watchdog timer",
+	.options	=3D WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING |
+			  WDIOF_MAGICCLOSE | WDIOF_PRETIMEOUT,
+};
+
+#ifdef CONFIG_PM_SLEEP
+static int imx_sc_wdt_suspend(struct device *dev)
+{
+	if (test_bit(WDOG_ACTIVE, &imx_sc_wdd.status))
+		imx_sc_wdt_stop(&imx_sc_wdd);
+
+	return 0;
+}
+
+static int imx_sc_wdt_resume(struct device *dev)
+{
+	if (test_bit(WDOG_ACTIVE, &imx_sc_wdd.status))
+		imx_sc_wdt_start(&imx_sc_wdd);
+
+	return 0;
+}
+
+static const struct dev_pm_ops imx_sc_wdt_pm_ops =3D {
+	.suspend =3D imx_sc_wdt_suspend,
+	.resume =3D imx_sc_wdt_resume,
+};
+
+#define IMX_SC_WDT_PM_OPS	(&imx_sc_wdt_pm_ops)
+
+#else
+
+#define IMX_SC_WDT_PM_OPS	NULL
+
+#endif
+
+static int imx_sc_wdt_probe(struct platform_device *pdev)
+{
+	struct watchdog_device *wdt =3D &imx_sc_wdd;
+	int err;
+
+	platform_set_drvdata(pdev, wdt);
+
+	wdt->info =3D &imx_sc_wdt_info;
+	wdt->ops =3D &imx_sc_wdt_ops;
+	wdt->min_timeout =3D 1;
+	wdt->max_timeout =3D MAX_TIMEOUT;
+	wdt->parent =3D &pdev->dev;
+	watchdog_set_drvdata(wdt, NULL);
+
+	err =3D watchdog_init_timeout(wdt, DEFAULT_TIMEOUT, &pdev->dev);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to init the wdog timeout:%d\n",
+			err);
+		return err;
+	}
+
+	err =3D watchdog_register_device(wdt);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to register watchdog device\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static int imx_sc_wdt_remove(struct platform_device *pdev)
+{
+	struct watchdog_device *wdt =3D platform_get_drvdata(pdev);
+
+	imx_sc_wdt_stop(wdt);
+
+	watchdog_unregister_device(wdt);
+
+	return 0;
+}
+
+static void imx_sc_wdt_shutdown(struct platform_device *pdev)
+{
+	struct watchdog_device *wdt =3D platform_get_drvdata(pdev);
+
+	if (watchdog_active(wdt))
+		imx_sc_wdt_stop(wdt);
+}
+
+static const struct of_device_id imx_sc_wdt_dt_ids[] =3D {
+	{ .compatible =3D "fsl,imx8qxp-sc-wdt", },
+	{ /*sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx_sc_wdt_dt_ids);
+
+static struct platform_driver imx_sc_wdt_driver =3D {
+	.probe		=3D imx_sc_wdt_probe,
+	.remove		=3D imx_sc_wdt_remove,
+	.shutdown	=3D imx_sc_wdt_shutdown,
+	.driver		=3D {
+		.name	=3D "imx-sc-wdt",
+		.of_match_table =3D imx_sc_wdt_dt_ids,
+		.pm	=3D IMX_SC_WDT_PM_OPS,
+	},
+};
+
+module_platform_driver(imx_sc_wdt_driver);
+
+MODULE_AUTHOR("Robin Gong <yibin.gong@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX system controller watchdog driver");
+MODULE_LICENSE("GPL v2");
--=20
2.7.4

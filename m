From: Oliver Graute <oliver.graute@kococonnector.com>
Subject: [PATCH v1] watchdog: imx_sc: this patch just fixes whitespaces
Date: Thu, 5 Sep 2019 07:44:16 +0000
Message-ID: <20190905073730.22258-1-oliver.graute@kococonnector.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "oliver.graute@gmail.com" <oliver.graute@gmail.com>
Cc: Oliver Graute <oliver.graute@kococonnector.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vge>
List-Id: devicetree@vger.kernel.org

Fix only whitespace errors in imx_sc_wdt_probe()

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 drivers/watchdog/imx_sc_wdt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/watchdog/imx_sc_wdt.c b/drivers/watchdog/imx_sc_wdt.c
index 78eaaf75a263..94db949042c9 100644
--- a/drivers/watchdog/imx_sc_wdt.c
+++ b/drivers/watchdog/imx_sc_wdt.c
@@ -175,12 +175,12 @@ static int imx_sc_wdt_probe(struct platform_device *p=
dev)
 	watchdog_stop_on_unregister(wdog);
=20
 	ret =3D devm_watchdog_register_device(dev, wdog);
-=20
- 	if (ret) {
- 		dev_err(dev, "Failed to register watchdog device\n");
- 		return ret;
- 	}
-=20
+
+	if (ret) {
+		dev_err(dev, "Failed to register watchdog device\n");
+		return ret;
+	}
+
 	ret =3D imx_scu_irq_group_enable(SC_IRQ_GROUP_WDOG,
 				       SC_IRQ_WDOG,
 				       true);
--=20
2.17.1

From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND 1/3] dt-bindings: clock: imx8mm: Add GPIO clocks
Date: Sun, 12 May 2019 10:17:08 +0000
Message-ID: <1557655926-12915-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <08E01C7B0B1DA14D9F5AB10C0C2AF991@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add macro for the GPIO clocks of the i.MX8MM.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
No change, just resend patch with correct encoding.
---
 include/dt-bindings/clock/imx8mm-clock.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings=
/clock/imx8mm-clock.h
index 1b4353e..fe47798 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -239,6 +239,12 @@
=20
 #define IMX8MM_CLK_NAND_USDHC_BUS_RAWNAND_CLK	222
=20
-#define IMX8MM_CLK_END				223
+#define IMX8MM_CLK_GPIO1_ROOT			223
+#define IMX8MM_CLK_GPIO2_ROOT			224
+#define IMX8MM_CLK_GPIO3_ROOT			225
+#define IMX8MM_CLK_GPIO4_ROOT			226
+#define IMX8MM_CLK_GPIO5_ROOT			227
+
+#define IMX8MM_CLK_END				228
=20
 #endif
--=20
2.7.4

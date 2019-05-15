From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 1/3] dt-bindings: clock: imx8mm: Add SNVS clock
Date: Wed, 15 May 2019 01:29:53 +0000
Message-ID: <1557883490-22360-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <0B56FF142FDB6246A7385E3330CB0D7A@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, Jacky Bai <ping.bai@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add macro for the SNVS clock of the i.MX8MM.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
This patch is based on patch: https://patchwork.kernel.org/patch/10939997/
---
 include/dt-bindings/clock/imx8mm-clock.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings=
/clock/imx8mm-clock.h
index fe47798..83f6673 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -245,6 +245,8 @@
 #define IMX8MM_CLK_GPIO4_ROOT			226
 #define IMX8MM_CLK_GPIO5_ROOT			227
=20
-#define IMX8MM_CLK_END				228
+#define IMX8MM_CLK_SNVS_ROOT			228
+
+#define IMX8MM_CLK_END				229
=20
 #endif
--=20
2.7.4

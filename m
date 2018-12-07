From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH 1/3] dt-bindings: clock: imx7ulp: add HSRUN mode related
 clocks
Date: Fri, 7 Dec 2018 10:03:29 +0000
Message-ID: <1544176659-32022-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

There are HSRUN mode clock mux and divider in SCG1 module,
and SMC1 can control i.MX7ULP CPU to run in RUN mode or
HSRUN mode, the mode switch bits are actually a clock mux,
add these clocks for clock driver and dtb to use.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 include/dt-bindings/clock/imx7ulp-clock.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/imx7ulp-clock.h b/include/dt-binding=
s/clock/imx7ulp-clock.h
index 008c5ee..21d872e 100644
--- a/include/dt-bindings/clock/imx7ulp-clock.h
+++ b/include/dt-bindings/clock/imx7ulp-clock.h
@@ -54,8 +54,10 @@
 #define IMX7ULP_CLK_SOSC_BUS_CLK	41
 #define IMX7ULP_CLK_FIRC_BUS_CLK	42
 #define IMX7ULP_CLK_SPLL_BUS_CLK	43
+#define IMX7ULP_CLK_HSRUN_SYS_SEL	44
+#define IMX7ULP_CLK_HSRUN_CORE_DIV	45
=20
-#define IMX7ULP_CLK_SCG1_END		44
+#define IMX7ULP_CLK_SCG1_END		46
=20
 /* PCC2 */
 #define IMX7ULP_CLK_DMA1		0
@@ -106,4 +108,9 @@
=20
 #define IMX7ULP_CLK_PCC3_END		16
=20
+/* SMC1 */
+#define IMX7ULP_CLK_ARM			0
+
+#define IMX7ULP_CLK_SMC1_END		1
+
 #endif /* __DT_BINDINGS_CLOCK_IMX7ULP_H */
--=20
2.7.4

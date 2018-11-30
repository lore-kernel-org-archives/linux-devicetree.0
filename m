From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] clk: imx6q: add DCICx clocks gate
Date: Fri, 30 Nov 2018 06:31:40 +0000
Message-ID: <1543559158-2891-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "clement.peron@devialet.com" <clement.peron@devialet.com>, "colin.didier@devialet.com" <colin.didier@devialet.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On i.MX6QP/i.MX6Q/i.MX6DL, there are DCIC1/DCIC2 clocks
gate in CCM_CCGR0 register, add them into clock tree for
clock management.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/clk/imx/clk-imx6q.c               | 2 ++
 include/dt-bindings/clock/imx6qdl-clock.h | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index bbe0c60..31a9d94 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -737,6 +737,8 @@ static void __init imx6q_clocks_init(struct device_node=
 *ccm_node)
 	clk[IMX6QDL_CLK_CAN1_SERIAL]  =3D imx_clk_gate2("can1_serial",   "can_roo=
t",          base + 0x68, 16);
 	clk[IMX6QDL_CLK_CAN2_IPG]     =3D imx_clk_gate2("can2_ipg",      "ipg",  =
             base + 0x68, 18);
 	clk[IMX6QDL_CLK_CAN2_SERIAL]  =3D imx_clk_gate2("can2_serial",   "can_roo=
t",          base + 0x68, 20);
+	clk[IMX6QDL_CLK_DCIC1]        =3D imx_clk_gate2("dcic1",         "ipu1_po=
df",         base + 0x68, 24);
+	clk[IMX6QDL_CLK_DCIC2]        =3D imx_clk_gate2("dcic2",         "ipu2_po=
df",         base + 0x68, 26);
 	clk[IMX6QDL_CLK_ECSPI1]       =3D imx_clk_gate2("ecspi1",        "ecspi_r=
oot",        base + 0x6c, 0);
 	clk[IMX6QDL_CLK_ECSPI2]       =3D imx_clk_gate2("ecspi2",        "ecspi_r=
oot",        base + 0x6c, 2);
 	clk[IMX6QDL_CLK_ECSPI3]       =3D imx_clk_gate2("ecspi3",        "ecspi_r=
oot",        base + 0x6c, 4);
diff --git a/include/dt-bindings/clock/imx6qdl-clock.h b/include/dt-binding=
s/clock/imx6qdl-clock.h
index 87b068f..b3cef29 100644
--- a/include/dt-bindings/clock/imx6qdl-clock.h
+++ b/include/dt-bindings/clock/imx6qdl-clock.h
@@ -274,6 +274,8 @@
 #define IMX6QDL_CLK_EPIT1			261
 #define IMX6QDL_CLK_EPIT2			262
 #define IMX6QDL_CLK_MMDC_P0_IPG			263
-#define IMX6QDL_CLK_END				264
+#define IMX6QDL_CLK_DCIC1			264
+#define IMX6QDL_CLK_DCIC2			265
+#define IMX6QDL_CLK_END				266
=20
 #endif /* __DT_BINDINGS_CLOCK_IMX6QDL_H */
--=20
2.7.4

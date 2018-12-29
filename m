From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6sx: correct backward compatible of gpt
Date: Sat, 29 Dec 2018 10:01:18 +0000
Message-ID: <1546077384-5343-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX6SX has same GPT type as i.MX6DL, in GPT driver, it uses
below TIMER_OF_DECLARE, so the backward compatible should be
"fsl,imx6dl-gpt", correct it.

TIMER_OF_DECLARE(imx6sx_timer, "fsl,imx6sx-gpt", imx6dl_timer_init_dt);

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 272ff61..d1375d3 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -467,7 +467,7 @@
 			};
=20
 			gpt: gpt@2098000 {
-				compatible =3D "fsl,imx6sx-gpt", "fsl,imx31-gpt";
+				compatible =3D "fsl,imx6sx-gpt", "fsl,imx6dl-gpt";
 				reg =3D <0x02098000 0x4000>;
 				interrupts =3D <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
 				clocks =3D <&clks IMX6SX_CLK_GPT_BUS>,
--=20
2.7.4

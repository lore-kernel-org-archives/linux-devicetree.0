From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: [PATCH] arm64: dts: imx8mq: Add pwm
Date: Mon, 14 Jan 2019 17:30:34 +0100
Message-ID: <20190114163034.GA24531@bogon.m.sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We can reuse the pwm from fsl,imx27-pwm as with other imx SOCs.

Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
---
This is against linux-next (next-20190114)

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 44 +++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mq.dtsi
index 8e9d6d5ed7b2..53ed0bdfc06a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -252,6 +252,50 @@
 				clocks =3D <&clk IMX8MQ_CLK_WDOG3_ROOT>;
 				status =3D "disabled";
 			};
+
+			pwm1: pwm@30660000 {
+				compatible =3D "fsl,imx8mq-pwm", "fsl,imx27-pwm";
+				reg =3D <0x30660000 0x10000>;
+				interrupts =3D <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_PWM1_ROOT>,
+				<&clk IMX8MQ_CLK_PWM1_ROOT>;
+				clock-names =3D "ipg", "per";
+				#pwm-cells =3D <2>;
+				status =3D "disabled";
+			};
+
+			pwm2: pwm@30670000 {
+				compatible =3D "fsl,imx8mq-pwm", "fsl,imx27-pwm";
+				reg =3D <0x30670000 0x10000>;
+				interrupts =3D <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_PWM2_ROOT>,
+				<&clk IMX8MQ_CLK_PWM2_ROOT>;
+				clock-names =3D "ipg", "per";
+				#pwm-cells =3D <2>;
+				status =3D "disabled";
+			};
+
+			pwm3: pwm@30680000 {
+				compatible =3D "fsl,imx8mq-pwm", "fsl,imx27-pwm";
+				reg =3D <0x30680000 0x10000>;
+				interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_PWM3_ROOT>,
+				<&clk IMX8MQ_CLK_PWM3_ROOT>;
+				clock-names =3D "ipg", "per";
+				#pwm-cells =3D <2>;
+				status =3D "disabled";
+			};
+
+			pwm4: pwm@30690000 {
+				compatible =3D "fsl,imx8mq-pwm", "fsl,imx27-pwm";
+				reg =3D <0x30690000 0x10000>;
+				interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
+				clocks =3D <&clk IMX8MQ_CLK_PWM4_ROOT>,
+				<&clk IMX8MQ_CLK_PWM4_ROOT>;
+				clock-names =3D "ipg", "per";
+				#pwm-cells =3D <2>;
+				status =3D "disabled";
+			};
 		};
 =

 		bus@30400000 { /* AIPS2 */
-- =

2.20.1

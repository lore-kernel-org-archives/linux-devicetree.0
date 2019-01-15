From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: [PATCH] arm64: dts: imx8mq: Add system reset controller
Date: Tue, 15 Jan 2019 12:46:41 +0100
Message-ID: <20190115114641.GA15870@bogon.m.sigxcpu.org>
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

We can reuse the src from fsl,imx51-src as with other imx SOCs.

Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
---
I'm mostly interested in the syscon part to be able to use regmap for
MIPI DSI here.

Patch is against next-20190114 plus Lucas "arm64: dts: imx8mq: move
watchdog nodes to correct location" but also applies to

    https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git/log/=
?h=3Dimx/dt64

It will conflict with "arm64: dts: imx8mq: add GPC power domains" which
is not yet in any tree I've seen.

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dt=
s/freescale/imx8mq.dtsi
index 0225eae2216e..7b1e0bdbd932 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -252,6 +252,13 @@
 				              "clk_ext1", "clk_ext2",
 				              "clk_ext3", "clk_ext4";
 			};
+
+			src: src@30390000 {
+				compatible =3D "fsl,imx8mq-src", "fsl,imx51-src", "syscon";
+				reg =3D <0x30390000 0x10000>;
+				interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+				#reset-cells =3D <1>;
+			};
 		};
 =

 		bus@30400000 { /* AIPS2 */
-- =

2.20.1

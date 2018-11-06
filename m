From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] ARM: dts: imx6sll: remove unused property in gpc node
Date: Tue, 6 Nov 2018 09:19:36 +0000
Message-ID: <1541495675-14706-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

The "fsl,mf-mix-wakeup-irq" is ONLY used as a temporary
solution in NXP's internal tree for Mega/Fast Mix off
feature after suspend, upstream kernel does NOT need it,
remove it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 arch/arm/boot/dts/imx6sll.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6sll.dtsi b/arch/arm/boot/dts/imx6sll.dts=
i
index 5ff4b99..62847c6 100644
--- a/arch/arm/boot/dts/imx6sll.dtsi
+++ b/arch/arm/boot/dts/imx6sll.dtsi
@@ -593,7 +593,6 @@
 				#interrupt-cells =3D <3>;
 				interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent =3D <&intc>;
-				fsl,mf-mix-wakeup-irq =3D <0x7c00000 0x7d00 0x0 0x1400640>;
 			};
=20
 			iomuxc: pinctrl@20e0000 {
--=20
2.7.4

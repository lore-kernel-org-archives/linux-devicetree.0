From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 2/3] ARM: dts: imx7ulp: add mmdc support
Date: Thu, 28 Feb 2019 01:23:52 +0000
Message-ID: <1551316741-7848-2-git-send-email-Anson.Huang@nxp.com>
References: <1551316741-7848-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551316741-7848-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX7ULP has a MMDC module to control DDR, it reuses
i.MX6Q's MMDC module, add support for it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- use "memory-controller" as MMDC node name to make it more generic.
---
 arch/arm/boot/dts/imx7ulp.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/imx7ulp.dtsi b/arch/arm/boot/dts/imx7ulp.dts=
i
index fca6e50..78f6117 100644
--- a/arch/arm/boot/dts/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/imx7ulp.dtsi
@@ -286,6 +286,12 @@
 			status =3D "disabled";
 		};
=20
+		mmdc: memory-controller@40ab0000 {
+			compatible =3D "fsl,imx7ulp-mmdc", "fsl,imx6q-mmdc";
+			reg =3D <0x40ab0000 0x1000>;
+			clocks =3D <&pcc3 IMX7ULP_CLK_MMDC>;
+		};
+
 		iomuxc1: pinctrl@40ac0000 {
 			compatible =3D "fsl,imx7ulp-iomuxc1";
 			reg =3D <0x40ac0000 0x1000>;
--=20
2.7.4

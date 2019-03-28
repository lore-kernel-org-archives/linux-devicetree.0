Return-Path: <SRS0=pEqb=R7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr80054.outbound.protection.outlook.com ([40.107.8.54]:59648
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727089AbfC1Dvw (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 27 Mar 2019 23:51:52 -0400
From: Wen He <wen.he_1@nxp.com>
Subject: [PATCH 1/2] arm64: dts: ls1028a: Add properties for Mali DP500 node
Date: Thu, 28 Mar 2019 03:51:46 +0000
Message-ID: <20190328035309.18703-1-wen.he_1@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>, "brian.starkey@arm.com" <brian.starkey@arm.com>, Wen He <wen.he_1@nxp.com>
List-ID: <devicetree@vger.kernel.org>

The LS1028A has a LCD controller and Displayport interface that
connects to eDP and Displayport connectors on the LS1028A board.

This patch enables the LCD controller driver on the LS1028A.

Signed-off-by: Alison Wang <alison.wang@nxp.com>
Signed-off-by: Wen He <wen.he_1@nxp.com>
---
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1028a.dtsi
index 8dd3501b1333..0d5963bb46c5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -70,6 +70,27 @@
 		clock-output-names =3D "sysclk";
 	};
=20
+	dpclk: dpclk {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <27000000>;
+		clock-output-names=3D "dpclk";
+	};
+
+	aclk: aclk {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <650000000>;
+		clock-output-names=3D "aclk";
+	};
+
+	pclk: pclk {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <650000000>;
+		clock-output-names=3D "pclk";
+	};
+
 	reboot {
 		compatible =3D"syscon-reboot";
 		regmap =3D <&dcfg>;
@@ -433,4 +454,20 @@
 			};
 		};
 	};
+
+	dp0: malidp@f080000 {
+		compatible =3D "arm,mali-dp500";
+		reg =3D <0x0 0xf080000 0x0 0x10000>;
+		interrupts =3D <0 222 IRQ_TYPE_LEVEL_HIGH>,
+			     <0 223 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names =3D "DE", "SE";
+		clocks =3D <&dpclk>, <&aclk>, <&aclk>, <&pclk>;
+		clock-names =3D "pxlclk", "mclk", "aclk", "pclk";
+		arm,malidp-output-port-lines =3D /bits/ 8 <8 8 8>;
+		port {
+			dp0_out: endpoint {
+
+			};
+		};
+	};
 };
--=20
2.17.1

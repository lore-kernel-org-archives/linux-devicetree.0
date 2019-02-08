Return-Path: <SRS0=bjk3=QP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50070.outbound.protection.outlook.com ([40.107.5.70]:14256
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727393AbfBHScv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Feb 2019 13:32:51 -0500
From: Frank Li <frank.li@nxp.com>
Subject: [PATCH 2/4] arm64: dts: imx8qxp: added ddr performance monitor nodes
Date: Fri, 8 Feb 2019 18:32:42 +0000
Message-ID: <1549650743-27581-2-git-send-email-Frank.Li@nxp.com>
References: <1549650743-27581-1-git-send-email-Frank.Li@nxp.com>
In-Reply-To: <1549650743-27581-1-git-send-email-Frank.Li@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "mark.rutland@arm.com" <mark.rutland@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "lznuaa@gmail.com" <lznuaa@gmail.com>
Cc: Frank Li <frank.li@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add ddr performance monitor

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index 4c3dd95..243d7b3 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -79,6 +79,13 @@
 		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
=20
+	ddr_pmu0: ddr_pmu@5c020000 {
+		compatible =3D "fsl,imx8-ddr-pmu";
+		reg =3D <0x0 0x5c020000 0x0 0x10000>;
+		interrupt-parent =3D <&gic>;
+		interrupts =3D <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	psci {
 		compatible =3D "arm,psci-1.0";
 		method =3D "smc";
--=20
2.5.2

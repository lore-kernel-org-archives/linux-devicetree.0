Return-Path: <SRS0=u60/=R5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr50056.outbound.protection.outlook.com ([40.107.5.56]:51362
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727492AbfCZTXe (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Mar 2019 15:23:34 -0400
From: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 1/2] arm64: dts: add fsl-dpaa2-console node for DPAA2
 platforms
Date: Tue, 26 Mar 2019 19:23:29 +0000
Message-ID: <1553628194-25119-2-git-send-email-ioana.ciornei@nxp.com>
References: <1553628194-25119-1-git-send-email-ioana.ciornei@nxp.com>
In-Reply-To: <1553628194-25119-1-git-send-email-ioana.ciornei@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add the fsl-dpaa2-console device tree node for the following
DPAA2 based platforms: LS1088A, LS2080A, LS2088A and LX2160A.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1088a.dtsi
index de93b42b1f51..5eee5db3ed6c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -571,6 +571,11 @@
 			clock-names =3D "apb_pclk", "wdog_clk";
 		};
=20
+		fsl-dpaa2-console@0x08340020 {
+			compatible =3D "fsl,dpaa2-console";
+			reg =3D <0x00000000 0x08340020 0 0x2>;
+		};
+
 		fsl_mc: fsl-mc@80c000000 {
 			compatible =3D "fsl,qoriq-mc";
 			reg =3D <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls208xa.dtsi
index 6d6ca166f86b..f1521e6d8da0 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -321,6 +321,11 @@
 			};
 		};
=20
+		fsl-dpaa2-console@0x08340020 {
+			compatible =3D "fsl,dpaa2-console";
+			reg =3D <0x00000000 0x08340020 0 0x2>;
+		};
+
 		fsl_mc: fsl-mc@80c000000 {
 			compatible =3D "fsl,qoriq-mc";
 			reg =3D <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-lx2160a.dtsi
index 660e78e46268..8febaa517913 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -777,6 +777,11 @@
 			dma-coherent;
 		};
=20
+		fsl-dpaa2-console@0x08340020 {
+			compatible =3D "fsl,dpaa2-console";
+			reg =3D <0x00000000 0x08340020 0 0x2>;
+		};
+
 		fsl_mc: fsl-mc@80c000000 {
 			compatible =3D "fsl,qoriq-mc";
 			reg =3D <0x00000008 0x0c000000 0 0x40>,
--=20
1.9.1

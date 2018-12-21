From: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 1/3] arm64: dts: add dpaa2-console node for DPAA2 platforms
Date: Fri, 21 Dec 2018 15:31:09 +0000
Message-ID: <1545406240-3061-2-git-send-email-ioana.ciornei@nxp.com>
References: <1545406240-3061-1-git-send-email-ioana.ciornei@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545406240-3061-1-git-send-email-ioana.ciornei@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Li <leoyang.li@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Roy Pledge <roy.pledge@nxp.com>, Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
List-Id: devicetree@vger.kernel.org

Add the dpaa2-console device tree node for the following
DPAA2 based platforms: LS1088A, LS2080A and LS2088A.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 5 +++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1088a.dtsi
index e73e55f..664e337 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -569,6 +569,11 @@
 			clock-names =3D "apb_pclk", "wdog_clk";
 		};
=20
+		dpaa2-console@0x08340020 {
+			compatible =3D "dpaa2-console";
+			reg =3D <0x00000000 0x08340020 0 0x2>;
+		};
+
 		fsl_mc: fsl-mc@80c000000 {
 			compatible =3D "fsl,qoriq-mc";
 			reg =3D <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls208xa.dtsi
index d188774..6db6ea4 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -333,6 +333,11 @@
 			};
 		};
=20
+		dpaa2-console@0x08340020 {
+			compatible =3D "dpaa2-console";
+			reg =3D <0x00000000 0x08340020 0 0x2>;
+		};
+
 		fsl_mc: fsl-mc@80c000000 {
 			compatible =3D "fsl,qoriq-mc";
 			reg =3D <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
--=20
1.9.1

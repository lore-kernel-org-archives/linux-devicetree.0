From: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
Subject: [PATCH 1/2] arm64: dts: ls1088a: Move fsl-mc node
Date: Tue, 4 Dec 2018 16:33:06 +0000
Message-ID: <1543941180-5147-1-git-send-email-ruxandra.radulescu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

The fsl-mc node should sit under the soc node, so move it to
its proper location.

Fixes: ac7c9ff741fb ("arm64: dts: ls1088a: add fsl-mc hardware resource man=
ager node")

Signed-off-by: Ioana Radulescu <ruxandra.radulescu@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 142 ++++++++++++---------=
----
 1 file changed, 71 insertions(+), 71 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1088a.dtsi
index a07f612..ba5ce73 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -174,77 +174,6 @@
 			     <1 10 IRQ_TYPE_LEVEL_LOW>;/* Hypervisor PPI */
 	};
=20
-	fsl_mc: fsl-mc@80c000000 {
-		compatible =3D "fsl,qoriq-mc";
-		reg =3D <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
-		      <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
-		msi-parent =3D <&its>;
-		#address-cells =3D <3>;
-		#size-cells =3D <1>;
-
-		/*
-		 * Region type 0x0 - MC portals
-		 * Region type 0x1 - QBMAN portals
-		 */
-		ranges =3D <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
-			  0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
-
-		dpmacs {
-			#address-cells =3D <1>;
-			#size-cells =3D <0>;
-
-			dpmac1: dpmac@1 {
-				compatible =3D "fsl,qoriq-mc-dpmac";
-				reg =3D <1>;
-			};
-
-			dpmac2: dpmac@2 {
-				compatible =3D "fsl,qoriq-mc-dpmac";
-				reg =3D <2>;
-			};
-
-			dpmac3: dpmac@3 {
-				compatible =3D "fsl,qoriq-mc-dpmac";
-				reg =3D <3>;
-			};
-
-			dpmac4: dpmac@4 {
-				compatible =3D "fsl,qoriq-mc-dpmac";
-				reg =3D <4>;
-			};
-
-			dpmac5: dpmac@5 {
-				compatible =3D "fsl,qoriq-mc-dpmac";
-				reg =3D <5>;
-			};
-
-			dpmac6: dpmac@6 {
-				compatible =3D "fsl,qoriq-mc-dpmac";
-				reg =3D <6>;
-			};
-
-			dpmac7: dpmac@7 {
-				compatible =3D "fsl,qoriq-mc-dpmac";
-				reg =3D <7>;
-			};
-
-			dpmac8: dpmac@8 {
-				compatible =3D "fsl,qoriq-mc-dpmac";
-				reg =3D <8>;
-			};
-
-			dpmac9: dpmac@9 {
-				compatible =3D "fsl,qoriq-mc-dpmac";
-				reg =3D <9>;
-			};
-
-			dpmac10: dpmac@a {
-				compatible =3D "fsl,qoriq-mc-dpmac";
-				reg =3D <0xa>;
-			};
-		};
-	};
-
 	psci {
 		compatible =3D "arm,psci-0.2";
 		method =3D "smc";
@@ -638,6 +567,77 @@
 			clocks =3D <&clockgen 4 3>, <&clockgen 4 3>;
 			clock-names =3D "apb_pclk", "wdog_clk";
 		};
+
+		fsl_mc: fsl-mc@80c000000 {
+			compatible =3D "fsl,qoriq-mc";
+			reg =3D <0x00000008 0x0c000000 0 0x40>,	 /* MC portal base */
+			      <0x00000000 0x08340000 0 0x40000>; /* MC control reg */
+			msi-parent =3D <&its>;
+			#address-cells =3D <3>;
+			#size-cells =3D <1>;
+
+			/*
+			 * Region type 0x0 - MC portals
+			 * Region type 0x1 - QBMAN portals
+			 */
+			ranges =3D <0x0 0x0 0x0 0x8 0x0c000000 0x4000000
+				  0x1 0x0 0x0 0x8 0x18000000 0x8000000>;
+
+			dpmacs {
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				dpmac1: dpmac@1 {
+					compatible =3D "fsl,qoriq-mc-dpmac";
+					reg =3D <1>;
+				};
+
+				dpmac2: dpmac@2 {
+					compatible =3D "fsl,qoriq-mc-dpmac";
+					reg =3D <2>;
+				};
+
+				dpmac3: dpmac@3 {
+					compatible =3D "fsl,qoriq-mc-dpmac";
+					reg =3D <3>;
+				};
+
+				dpmac4: dpmac@4 {
+					compatible =3D "fsl,qoriq-mc-dpmac";
+					reg =3D <4>;
+				};
+
+				dpmac5: dpmac@5 {
+					compatible =3D "fsl,qoriq-mc-dpmac";
+					reg =3D <5>;
+				};
+
+				dpmac6: dpmac@6 {
+					compatible =3D "fsl,qoriq-mc-dpmac";
+					reg =3D <6>;
+				};
+
+				dpmac7: dpmac@7 {
+					compatible =3D "fsl,qoriq-mc-dpmac";
+					reg =3D <7>;
+				};
+
+				dpmac8: dpmac@8 {
+					compatible =3D "fsl,qoriq-mc-dpmac";
+					reg =3D <8>;
+				};
+
+				dpmac9: dpmac@9 {
+					compatible =3D "fsl,qoriq-mc-dpmac";
+					reg =3D <9>;
+				};
+
+				dpmac10: dpmac@a {
+					compatible =3D "fsl,qoriq-mc-dpmac";
+					reg =3D <0xa>;
+				};
+			};
+		};
 	};
=20
 	firmware {
--=20
2.7.4

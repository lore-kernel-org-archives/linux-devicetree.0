From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V3 3/3] ARM: dts: imx: make MMDC node name generic
Date: Thu, 28 Feb 2019 02:48:42 +0000
Message-ID: <1551321831-11597-3-git-send-email-Anson.Huang@nxp.com>
References: <1551321831-11597-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551321831-11597-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Node name should be generic, so use "memory-controller"
instead of "mmdc" for MMDC node name, also remove "mmdc"
label for platforms with single MMDC node.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V2:
	- remove "mmdc" label for single MMDC node.
---
 arch/arm/boot/dts/imx6qdl.dtsi | 4 ++--
 arch/arm/boot/dts/imx6sl.dtsi  | 2 +-
 arch/arm/boot/dts/imx6sx.dtsi  | 2 +-
 arch/arm/boot/dts/imx6ul.dtsi  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dts=
i
index fe17a34..4c7278b 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -1129,13 +1129,13 @@
 				reg =3D <0x021ac000 0x4000>;
 			};
=20
-			mmdc0: mmdc@21b0000 { /* MMDC0 */
+			mmdc0: memory-controller@21b0000 { /* MMDC0 */
 				compatible =3D "fsl,imx6q-mmdc";
 				reg =3D <0x021b0000 0x4000>;
 				clocks =3D <&clks IMX6QDL_CLK_MMDC_P0_IPG>;
 			};
=20
-			mmdc1: mmdc@21b4000 { /* MMDC1 */
+			mmdc1: memory-controller@21b4000 { /* MMDC1 */
 				reg =3D <0x021b4000 0x4000>;
 			};
=20
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 4b4813f..733ea50 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -922,7 +922,7 @@
 				status =3D "disabled";
 			};
=20
-			mmdc: mmdc@21b0000 {
+			memory-controller@21b0000 {
 				compatible =3D "fsl,imx6sl-mmdc", "fsl,imx6q-mmdc";
 				reg =3D <0x021b0000 0x4000>;
 				clocks =3D <&clks IMX6SL_CLK_MMDC_P0_IPG>;
diff --git a/arch/arm/boot/dts/imx6sx.dtsi b/arch/arm/boot/dts/imx6sx.dtsi
index 5b16e65..df0c595 100644
--- a/arch/arm/boot/dts/imx6sx.dtsi
+++ b/arch/arm/boot/dts/imx6sx.dtsi
@@ -1017,7 +1017,7 @@
 				status =3D "disabled";
 			};
=20
-			mmdc: mmdc@21b0000 {
+			memory-controller@21b0000 {
 				compatible =3D "fsl,imx6sx-mmdc", "fsl,imx6q-mmdc";
 				reg =3D <0x021b0000 0x4000>;
 				clocks =3D <&clks IMX6SX_CLK_MMDC_P0_IPG>;
diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 62ed30c..a77bbca 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -914,7 +914,7 @@
 				status =3D "disabled";
 			};
=20
-			mmdc: mmdc@21b0000 {
+			memory-controller@21b0000 {
 				compatible =3D "fsl,imx6ul-mmdc", "fsl,imx6q-mmdc";
 				reg =3D <0x021b0000 0x4000>;
 				clocks =3D <&clks IMX6UL_CLK_MMDC_P0_IPG>;
--=20
2.7.4

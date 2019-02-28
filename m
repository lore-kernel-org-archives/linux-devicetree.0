From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V2 1/3] dt-bindings: memory-controllers: freescale: add MMDC
 binding doc
Date: Thu, 28 Feb 2019 01:23:48 +0000
Message-ID: <1551316741-7848-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Freescale MMDC (Multi Mode DDR Controller) driver is supported
since i.MX6Q, but not yet documented, this patch adds binding
doc for MMDC module driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- use "memory-controller" as MMDC node name and update examples.
---
 .../bindings/memory-controllers/fsl/mmdc.txt       | 31 ++++++++++++++++++=
++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/fs=
l/mmdc.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.=
txt b/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.txt
new file mode 100644
index 0000000..5750274
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/mmdc.txt
@@ -0,0 +1,31 @@
+Freescale Multi Mode DDR controller (MMDC)
+
+Required properties :
+- compatible : should be one of following:
+	for i.MX6Q/i.MX6DL:
+	- "fsl,imx6q-mmdc";
+	for i.MX6SL:
+	- "fsl,imx6sl-mmdc", "fsl,imx6q-mmdc";
+	for i.MX6SLL:
+	- "fsl,imx6sll-mmdc", "fsl,imx6q-mmdc";
+	for i.MX6SX:
+	- "fsl,imx6sx-mmdc", "fsl,imx6q-mmdc";
+	for i.MX6UL/i.MX6ULL/i.MX6ULZ:
+	- "fsl,imx6ul-mmdc", "fsl,imx6q-mmdc";
+	for i.MX7ULP:
+	- "fsl,imx7ulp-mmdc", "fsl,imx6q-mmdc";
+- reg : address and size of MMDC DDR controller registers
+
+Optional properties :
+- clocks : the clock provided by the SoC to access the MMDC registers
+
+Example :
+	mmdc0: memory-controller@21b0000 { /* MMDC0 */
+		compatible =3D "fsl,imx6q-mmdc";
+		reg =3D <0x021b0000 0x4000>;
+		clocks =3D <&clks IMX6QDL_CLK_MMDC_P0_IPG>;
+	};
+
+	mmdc1: memory-controller@21b4000 { /* MMDC1 */
+		reg =3D <0x021b4000 0x4000>;
+	};
--=20
2.7.4

From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V5 4/4] ARM: dts: imx6qdl: Improve mmdc1 node
Date: Tue, 12 Mar 2019 02:24:20 +0000
Message-ID: <1552357127-1283-4-git-send-email-Anson.Huang@nxp.com>
References: <1552357127-1283-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552357127-1283-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add MMDC1 compatible string which is missing, and also set
it to be disabled by default, as most of the platforms ONLY
use single channel MMDC0, if dual MMDC channels are used, it
can be enabled in board dts file.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
New patch.
---
 arch/arm/boot/dts/imx6qdl.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dts=
i
index 4c7278b..8c51364 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -1136,7 +1136,9 @@
 			};
=20
 			mmdc1: memory-controller@21b4000 { /* MMDC1 */
+				compatible =3D "fsl,imx6q-mmdc";
 				reg =3D <0x021b4000 0x4000>;
+				status =3D "disabled";
 			};
=20
 			weim: weim@21b8000 {
--=20
2.7.4

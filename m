From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V4 1/4] dt-bindings: fsl: scu: add general interrupt support
Date: Thu, 21 Feb 2019 09:19:22 +0000
Message-ID: <1550740354-2701-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Add scu general interrupt function support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since V3:
	- make general MU interrupt channel as optional;
	- rename "gi3" to "gip3" according to driver/dts change.
---
 .../devicetree/bindings/arm/freescale/fsl,scu.txt      | 18 ++++++++++++--=
----
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/=
Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 72d481c..4a9b9ab 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -22,9 +22,11 @@ Required properties:
 -------------------
 - compatible:	should be "fsl,imx-scu".
 - mbox-names:	should include "tx0", "tx1", "tx2", "tx3",
-			       "rx0", "rx1", "rx2", "rx3".
-- mboxes:	List of phandle of 4 MU channels for tx and 4 MU channels
-		for rx. All 8 MU channels must be in the same MU instance.
+			       "rx0", "rx1", "rx2", "rx3";
+		include "gip3" if want to support general MU interrupt.
+- mboxes:	List of phandle of 4 MU channels for tx, 4 MU channels for
+		rx, and 1 optional MU channel for general interrupt.
+		All MU channels must be in the same MU instance.
 		Cross instances are not allowed. The MU instance can only
 		be one of LSIO MU0~M4 for imx8qxp and imx8qm. Users need
 		to make sure use the one which is not conflict with other
@@ -34,6 +36,7 @@ Required properties:
 		Channel 1 must be "tx1" or "rx1".
 		Channel 2 must be "tx2" or "rx2".
 		Channel 3 must be "tx3" or "rx3".
+		General interrupt rx channel must be "gip3".
 		e.g.
 		mboxes =3D <&lsio_mu1 0 0
 			  &lsio_mu1 0 1
@@ -42,7 +45,8 @@ Required properties:
 			  &lsio_mu1 1 0
 			  &lsio_mu1 1 1
 			  &lsio_mu1 1 2
-			  &lsio_mu1 1 3>;
+			  &lsio_mu1 1 3
+			  &lsio_mu1 3 3>;
 		See Documentation/devicetree/bindings/mailbox/fsl,mu.txt
 		for detailed mailbox binding.
=20
@@ -133,7 +137,8 @@ firmware {
 	scu {
 		compatible =3D "fsl,imx-scu";
 		mbox-names =3D "tx0", "tx1", "tx2", "tx3",
-			     "rx0", "rx1", "rx2", "rx3";
+			     "rx0", "rx1", "rx2", "rx3",
+			     "gip3";
 		mboxes =3D <&lsio_mu1 0 0
 			  &lsio_mu1 0 1
 			  &lsio_mu1 0 2
@@ -141,7 +146,8 @@ firmware {
 			  &lsio_mu1 1 0
 			  &lsio_mu1 1 1
 			  &lsio_mu1 1 2
-			  &lsio_mu1 1 3>;
+			  &lsio_mu1 1 3
+			  &lsio_mu1 3 3>;
=20
 		clk: clk {
 			compatible =3D "fsl,imx8qxp-clk", "fsl,scu-clk";
--=20
2.7.4

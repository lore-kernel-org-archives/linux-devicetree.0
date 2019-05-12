From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND V4 1/3] dt-bindings: watchdog: move i.MX system
 controller watchdog binding to SCU
Date: Sun, 12 May 2019 10:10:30 +0000
Message-ID: <1557655528-12816-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <4BD8A2D60EC3E14C97C5590BA1ECE00F@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm->
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

i.MX system controller watchdog depends on SCU driver to support
interrupt function, so it needs to be subnode of SCU node in DT,
binding doc should be moved to fsl,scu.txt as well.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No change, just resend patch with correct encoding.
---
 .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 15 ++++++++++++++
 .../bindings/watchdog/fsl-imx-sc-wdt.txt           | 24 ------------------=
----
 2 files changed, 15 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-w=
dt.txt

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/=
Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 5d7dbab..1b56557 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -133,6 +133,16 @@ RTC bindings based on SCU Message Protocol
 Required properties:
 - compatible: should be "fsl,imx8qxp-sc-rtc";
=20
+Watchdog bindings based on SCU Message Protocol
+------------------------------------------------------------
+
+Required properties:
+- compatible: should be:
+              "fsl,imx8qxp-sc-wdt"
+              followed by "fsl,imx-sc-wdt";
+Optional properties:
+- timeout-sec: contains the watchdog timeout in seconds.
+
 Example (imx8qxp):
 -------------
 aliases {
@@ -185,6 +195,11 @@ firmware {
 		rtc: rtc {
 			compatible =3D "fsl,imx8qxp-sc-rtc";
 		};
+
+		watchdog {
+			compatible =3D "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
+			timeout-sec =3D <60>;
+		};
 	};
 };
=20
diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt =
b/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
deleted file mode 100644
index 02b87e9..0000000
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* Freescale i.MX System Controller Watchdog
-
-i.MX system controller watchdog is for i.MX SoCs with system controller in=
side,
-the watchdog is managed by system controller, users can ONLY communicate w=
ith
-system controller from secure mode for watchdog operations, so Linux i.MX =
system
-controller watchdog driver will call ARM SMC API and trap into ARM-Trusted=
-Firmware
-for watchdog operations, ARM-Trusted-Firmware is running at secure EL3 mod=
e and
-it will request system controller to execute the watchdog operation passed=
 from
-Linux kernel.
-
-Required properties:
-- compatible:	Should be :
-		"fsl,imx8qxp-sc-wdt"
-		followed by "fsl,imx-sc-wdt";
-
-Optional properties:
-- timeout-sec : Contains the watchdog timeout in seconds.
-
-Examples:
-
-watchdog {
-	compatible =3D "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
-	timeout-sec =3D <60>;
-};
--=20
2.7.4

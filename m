Return-Path: <SRS0=KptV=RY=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V9 1/4] dt-bindings: watchdog: add i.MX system controller
 watchdog
Date: Thu, 21 Mar 2019 02:26:38 +0000
Message-ID: <1553134884-1720-2-git-send-email-Anson.Huang@nxp.com>
References: <1553134884-1720-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1553134884-1720-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, Andy Gross <andy.gross@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add i.MX system controller watchdog binding doc.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V8:
	- add optional property "timeout-sec" according to driver change.
---
 .../bindings/watchdog/fsl-imx-sc-wdt.txt           | 24 ++++++++++++++++++=
++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-w=
dt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt =
b/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
new file mode 100644
index 0000000..02b87e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
@@ -0,0 +1,24 @@
+* Freescale i.MX System Controller Watchdog
+
+i.MX system controller watchdog is for i.MX SoCs with system controller in=
side,
+the watchdog is managed by system controller, users can ONLY communicate w=
ith
+system controller from secure mode for watchdog operations, so Linux i.MX =
system
+controller watchdog driver will call ARM SMC API and trap into ARM-Trusted=
-Firmware
+for watchdog operations, ARM-Trusted-Firmware is running at secure EL3 mod=
e and
+it will request system controller to execute the watchdog operation passed=
 from
+Linux kernel.
+
+Required properties:
+- compatible:	Should be :
+		"fsl,imx8qxp-sc-wdt"
+		followed by "fsl,imx-sc-wdt";
+
+Optional properties:
+- timeout-sec : Contains the watchdog timeout in seconds.
+
+Examples:
+
+watchdog {
+	compatible =3D "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
+	timeout-sec =3D <60>;
+};
--=20
2.7.4

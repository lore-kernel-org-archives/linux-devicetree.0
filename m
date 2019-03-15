Return-Path: <SRS0=iz5u=RS=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V8 1/4] dt-bindings: watchdog: add i.MX system controller
 watchdog
Date: Fri, 15 Mar 2019 06:17:16 +0000
Message-ID: <1552630331-32068-2-git-send-email-Anson.Huang@nxp.com>
References: <1552630331-32068-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1552630331-32068-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "heiko@sntech.de" <heiko@sntech.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, Andy Gross <andy.gross@linaro.org>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add i.MX system controller watchdog binding doc.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
New patch, as watchdog node is moved out of SCU, so we need to add binding =
doc for it.
---
 .../devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt  | 20 ++++++++++++++++=
++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-w=
dt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt =
b/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
new file mode 100644
index 0000000..e461c85
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-sc-wdt.txt
@@ -0,0 +1,20 @@
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
+Examples:
+
+watchdog {
+	compatible =3D "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
+};
--=20
2.7.4

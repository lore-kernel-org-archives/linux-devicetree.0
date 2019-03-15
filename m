Return-Path: <SRS0=iz5u=RS=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V8 4/4] arm64: dts: imx8qxp: add system controller watchdog
 support
Date: Fri, 15 Mar 2019 06:17:42 +0000
Message-ID: <1552630331-32068-5-git-send-email-Anson.Huang@nxp.com>
References: <1552630331-32068-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1552630331-32068-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "heiko@sntech.de" <heiko@sntech.de>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, Andy Gross <andy.gross@linaro.org>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, "olof@lixom.net" <olof@lixom.net>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Add i.MX8QXP system controller watchdog support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since previous version:
	- remove label as we ONLY have one watchdog.
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/d=
ts/freescale/imx8qxp.dtsi
index 4c3dd95..279482d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -443,4 +443,8 @@
 			power-domains =3D <&pd IMX_SC_R_GPIO_7>;
 		};
 	};
+
+	watchdog {
+		compatible =3D "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
+	};
 };
--=20
2.7.4

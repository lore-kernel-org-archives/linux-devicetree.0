Return-Path: <SRS0=KptV=RY=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V9 3/4] arm64: defconfig: add support for i.MX system
 controller watchdog
Date: Thu, 21 Mar 2019 02:26:57 +0000
Message-ID: <1553134884-1720-4-git-send-email-Anson.Huang@nxp.com>
References: <1553134884-1720-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1553134884-1720-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, Andy Gross <andy.gross@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Enable CONFIG_IMX_SC_WDT as module to support i.MX system
controller watchdog.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
no changes.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f575401..b4000aa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -429,6 +429,7 @@ CONFIG_WATCHDOG=3Dy
 CONFIG_ARM_SP805_WATCHDOG=3Dy
 CONFIG_S3C2410_WATCHDOG=3Dy
 CONFIG_IMX2_WDT=3Dy
+CONFIG_IMX_SC_WDT=3Dm
 CONFIG_MESON_GXBB_WATCHDOG=3Dm
 CONFIG_MESON_WATCHDOG=3Dm
 CONFIG_RENESAS_WDT=3Dy
--=20
2.7.4

Return-Path: <SRS0=KptV=RY=nxp.com=anson.huang@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH V9 0/4] Add i.MX8QXP system controller watchdog
Date: Thu, 21 Mar 2019 02:26:29 +0000
Message-ID: <1553134884-1720-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>, Andy Gross <andy.gross@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "ezequiel@collabora.com" <ezequiel@collabora.com>, "stefan.wahren@i2se.com" <stefan.wahren@i2se.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

i.MX8QXP is an ARMv8 Cortex-A35 SoC with a Cortex-M4 system controller
inside, the system controller manages overall power, clock, secure RTC
and watchdog etc., so Linux kernel running on A35 needs to communicate
with system controller for watchdog operation, this system controller
watchdog will call SMC to trap to EL3 secure world ARM-Trusted-Firmware
and then it will request system controller to do the watchdog operation
via IPC.

Changes since V8:
	- change the timeout value to be from DT instead of from module parameter,
	  and also update the binding doc and dts to add timeout property.

Anson Huang (4):
  dt-bindings: watchdog: add i.MX system controller watchdog
  watchdog: imx_sc: Add i.MX system controller watchdog support
  arm64: defconfig: add support for i.MX system controller watchdog
  arm64: dts: imx8qxp: add system controller watchdog support

 .../bindings/watchdog/fsl-imx-sc-wdt.txt           |  24 +++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   5 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/watchdog/Kconfig                           |  16 ++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/imx_sc_wdt.c                      | 177 +++++++++++++++++=
++++
 6 files changed, 224 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/fsl-imx-sc-w=
dt.txt
 create mode 100644 drivers/watchdog/imx_sc_wdt.c

--=20
2.7.4

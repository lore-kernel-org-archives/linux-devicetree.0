Return-Path: <SRS0=zazs=QZ=lists.infradead.org=linux-arm-kernel-bounces+robh=kernel.org@kernel.org>
From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH RESEND V2 0/4] Add i.MX8QXP system controller watchdog support
Date: Mon, 18 Feb 2019 06:53:39 +0000
Message-ID: <1550472539-16590-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+robh=kernel.org@lists.infradead.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>, Aisheng Dong <aisheng.dong@nxp.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Daniel Baluta <daniel.baluta@nxp.com>, Andy Gross <andy.gross@linaro.org>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "heiko@sntech.de" <heiko@sntech.de>, "arnd@arndb.de" <arnd@arndb.de>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "jagan@amarulasolutions.com" <jagan@amarulasolutions.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "olof@lixom.net" <olof@lixom.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

i.MX8QXP is an ARMv8 Cortex-A35 SoC with a Cortex-M4 system controller inside,
the system controller manages overall power, clock, secure RTC and watchdog
etc., so Linux kernel running on A35 needs to communicate with system
controller for watchdog operation, this system controller watchdog will
call SMC to trap to EL3 secure world ARM-Trusted-Firmware and then it will
request system controller to do the watchdog operation via IPC.

This V2 patch series addresses all the comments from V1, and change log is inside
each patch of this V2 series.

Below are the patch dependency:

The dt-binding and imx8qxp.dtsi patch are based on my thermal patch series as below:
https://patchwork.kernel.org/patch/10800699/

Anson Huang (4):
  dt-bindings: fsl: scu: add watchdog binding
  watchdog: imx_sc: Add i.MX system controller watchdog support
  arm64: defconfig: add support for i.MX system controller watchdog
  arm64: dts: freescale: imx8qxp: add watchdog support

 .../devicetree/bindings/arm/freescale/fsl,scu.txt  |  10 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   4 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/watchdog/Kconfig                           |  13 ++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/imx_sc_wdt.c                      | 210 +++++++++++++++++++++
 6 files changed, 239 insertions(+)
 create mode 100644 drivers/watchdog/imx_sc_wdt.c

-- 
2.7.4


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

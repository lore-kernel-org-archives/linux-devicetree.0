From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v3 0/6] provide power off support for iMX6 with external PMIC
Date: Tue,  6 Jun 2017 09:31:40 +0200
Message-ID: <20170606073146.26882-1-o.rempel@pengutronix.de>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de, Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

This patch series is providing power off support for Freescale/NXP iMX6 based
boards with external power management integrated circuit (PMIC).

changes:
v3:
 - set pm_power_off_prepare = NULL on .remove.
 - documentation and spelling fixes.
 - use %pf instead of lookup_symbol_name.

Oleksij Rempel (6):
  ARM: imx6q: provide documentation for new fsl,pmic-stby-poweroff
    property
  ARM: imx6: register pm_power_off handler if "fsl,pmic-stby-poweroff"
    is set
  kernel/reboot.c: export pm_power_off_prepare
  regulator: pfuze100: add fsl,pmic-stby-poweroff property
  regulator: pfuze100-regulator: provide pm_power_off_prepare handler
  ARM: dts: imx6: RIoTboard provide standby on power off option

 .../devicetree/bindings/clock/imx6q-clock.txt      |  8 ++
 .../devicetree/bindings/regulator/pfuze100.txt     |  7 ++
 arch/arm/boot/dts/imx6dl-riotboard.dts             |  5 ++
 arch/arm/mach-imx/pm-imx6.c                        | 27 +++++++
 drivers/regulator/pfuze100-regulator.c             | 92 ++++++++++++++++++++++
 kernel/reboot.c                                    |  1 +
 6 files changed, 140 insertions(+)

-- 
2.11.0


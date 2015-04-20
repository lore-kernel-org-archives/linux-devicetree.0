From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 0/3] clk: imx28: add DC-DC clock domain
Date: Mon, 20 Apr 2015 21:45:20 +0000
Message-ID: <1429566323-8263-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Shawn Guo <shawn.guo@linaro.org>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <fabio.estevam@freescale.com>, Marek Vasut <marex@denx.de>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This patch series integrates the DC-DC clock domain into the i.MX28 clock 
driver. That enables consumers to change DC-DC clock frequency in order to avoid
interferences without changing hardware. The final patch in the near future 
should handle the i.MX23, too.

 * patch 1 contains the update for the DT binding documentation
 * patch 2 defines the PMU as the clock consumer
 * patch 3 is extension of the clock driver

All information about the DC-DC clock was taken from the reference manual [1].
Unfortunately the logical diagram doesn't contain the DC-DC clock domain,
so i decide to create a ASCII diagramm (please look at patch 1).

The series is related to the upcoming MXS PMU and regulator driver 
(last patch [2], working repo [3]).
 
At the end i still have a question:

The MXS PMU driver will using the syscon interface for accessing the
HW_POWER registers. The ctrl register for the DC-DC clock domain is located
under HW_POWER and not under HW_CLKCTRL.

So should the clock registration be done in clock driver like in patch 3 or
in the upcoming PMU driver?

Any other comments about the implementation are also welcome.

Regards
Stefan

[1] - http://cache.freescale.com/files/dsp/doc/ref_manual/MCIMX28RM.pdf
      i.MX28 Applications Processor Reference Manual, Rev. 2, 08/2013
      11.12.10 DC-DC Miscellaneous Register (HW_POWER_MISC)
[2] - http://marc.info/?l=linux-pm&m=142698428606221&w=2
[3] - https://github.com/lategoodbye/linux-mxs-power/tree/syscon

Stefan Wahren (3):
  DT: imx28-clock: add ids for DC-DC clock domain
  ARM: imx28: define PMU as clock consumer
  clk: imx28: add DC-DC clock domain

 .../devicetree/bindings/clock/imx28-clock.txt      |    3 ++
 arch/arm/boot/dts/imx28.dtsi                       |    2 ++
 drivers/clk/mxs/clk-imx28.c                        |   33 +++++++++++++++++---
 3 files changed, 33 insertions(+), 5 deletions(-)

-- 
1.7.9.5

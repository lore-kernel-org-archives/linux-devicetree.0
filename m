From: Bai Ping <ping.bai@nxp.com>
Subject: [PATCH v2 00/12] Add basic code support for imx6sll
Date: Tue, 27 Dec 2016 17:47:38 +0800
Message-ID: <1482832070-22668-1-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, daniel.lezcano@linaro.org, linux-gpio@vger.kernel.org, p.zabel@pengutronix.de, jacky.baip@gmail.com, fabio.estevam@nxp.com, tglx@linutronix.de, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The i.MX 6SoloLiteLite application processors are NXP's
latest additions to a growing family of multimedia-focused
products offering high-performance processing optimized for
lowest power consumption. The i.MX 6SoloLiteLite processors
feature NXP's advanced implementation of the ARM Cortex-A9 core,
which can be interfaced with LPDDR3 and LPDDR2 DRAM memory devices.

i.MX6SLL is a new SOC of the i.MX6 family, shares many common modules,
so most of the MSL code can be resued from i.MX6 serious SOC.


change for V2:
    -  address comments in dts and dtsi from Fabio.
    -  split the doc update into two patch, fix typo.
    -  address comments in clock driver, add necessary 'const'qualifier.

Bai Ping (12):
  ARM: imx: Add basic msl support for imx6sll
  driver: clocksource: add gpt timer for imx6sll
  Document: dt: binding: imx: update clock doc for imx6sll
  driver: clk: imx: Add clock driver for imx6sll
  Document: dt: binding: imx: update pinctrl doc for imx6sll
  driver: pinctrl: imx: Add pinctrl driver support for imx6sll
  ARM: dts: imx: Add basic dtsi for imx6sll
  ARM: dts: imx: Add imx6sll EVK board dts support
  ARM: debug: Add low level debug support for imx6sll
  ARM: imx: Add suspend/resume support for imx6sll
  ARM: imx: correct i.mx6sll dram io low power mode
  ARM: configs: enable imx6sll support in defconfig

 .../devicetree/bindings/clock/imx6sll-clock.txt    |  37 +
 .../bindings/pinctrl/fsl,imx6sll-pinctrl.txt       |  37 +
 arch/arm/Kconfig.debug                             |   9 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/imx6sll-evk.dts                  | 474 +++++++++++
 arch/arm/boot/dts/imx6sll-pinfunc.h                | 882 +++++++++++++++++++++
 arch/arm/boot/dts/imx6sll.dtsi                     | 843 ++++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig               |   1 +
 arch/arm/include/debug/imx-uart.h                  |  10 +
 arch/arm/mach-imx/Kconfig                          |   8 +
 arch/arm/mach-imx/Makefile                         |   1 +
 arch/arm/mach-imx/cpu.c                            |   3 +
 arch/arm/mach-imx/cpuidle-imx6sl.c                 |   7 +-
 arch/arm/mach-imx/gpc.c                            |   8 +
 arch/arm/mach-imx/mach-imx6sl.c                    |  10 +-
 arch/arm/mach-imx/mxc.h                            |   6 +
 arch/arm/mach-imx/pm-imx6.c                        |  49 +-
 arch/arm/mach-imx/suspend-imx6.S                   |  29 +-
 drivers/clk/imx/Makefile                           |   1 +
 drivers/clk/imx/clk-imx6sll.c                      | 369 +++++++++
 drivers/clocksource/timer-imx-gpt.c                |   1 +
 drivers/pinctrl/freescale/Kconfig                  |   7 +
 drivers/pinctrl/freescale/Makefile                 |   1 +
 drivers/pinctrl/freescale/pinctrl-imx6sll.c        | 385 +++++++++
 include/dt-bindings/clock/imx6sll-clock.h          | 204 +++++
 25 files changed, 3352 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/imx6sll-clock.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6sll-pinctrl.txt
 create mode 100644 arch/arm/boot/dts/imx6sll-evk.dts
 create mode 100644 arch/arm/boot/dts/imx6sll-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imx6sll.dtsi
 create mode 100644 drivers/clk/imx/clk-imx6sll.c
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx6sll.c
 create mode 100644 include/dt-bindings/clock/imx6sll-clock.h

-- 
1.9.1

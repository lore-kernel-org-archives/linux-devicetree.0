From: <Frank.Li@freescale.com>
Subject: [PATCH v3 0/7] add basic support for i.mx6 ul chip
Date: Fri, 10 Jul 2015 01:16:37 +0800
Message-ID: <1436462204-32654-1-git-send-email-Frank.Li@freescale.com>
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
To: shawn.guo@linaro.org, lznuaa@gmail.com, linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: Frank Li <Frank.Li@freescale.com>
List-Id: devicetree@vger.kernel.org

From: Frank Li <Frank.Li@freescale.com>

Add basic function support i.mx6ul.
add simple dts.
add full pin function define
add clock support.
add low level debug

Change from v2 to v3:
 - Remove pinctrl patch in list because shawn already acked.
 - UPdate dts file according to shawn's feedback.
 - Update Document according to shawn's feedback.
 - update pinfun.h, change to low case. use space after define
 - add soc_id

Change from v1 to v2:
 - Remove unnecessary clk_register_clkdev for gpt
 - use fat iomux in dts
 - use macro GPIO_ACTIVE_LOW

Anson Huang (1):
  ARM: imx: add low-level debug support for i.mx6ul

Frank Li (6):
  ARM: imx: add i.mx6ul msl support
  ARM: imx: add imx6ul clk tree support
  Document: dt: binding: imx: update document for imx6ul support
  ARM: dts: add i.mx6ul pin function include file
  ARM: dts: imx: add imx6ul and imx6ul evk board support
  ARM: imx: imx_v6_v7_defconfig enable imx6ul support

 .../devicetree/bindings/clock/imx6ul-clock.txt     |  13 +
 .../bindings/pinctrl/fsl,imx6ul-pinctrl.txt        |  36 +
 arch/arm/Kconfig.debug                             |   9 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/imx6ul-14x14-evk.dts             | 278 ++++++
 arch/arm/boot/dts/imx6ul-pinfunc.h                 | 938 +++++++++++++++++++++
 arch/arm/boot/dts/imx6ul.dtsi                      | 607 +++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig               |   1 +
 arch/arm/include/debug/imx-uart.h                  |  13 +
 arch/arm/mach-imx/Kconfig                          |   8 +
 arch/arm/mach-imx/Makefile                         |   1 +
 arch/arm/mach-imx/cpu.c                            |   3 +
 arch/arm/mach-imx/mach-imx6ul.c                    |  43 +
 arch/arm/mach-imx/mxc.h                            |   6 +
 drivers/clk/imx/Makefile                           |   1 +
 drivers/clk/imx/clk-imx6ul.c                       | 432 ++++++++++
 include/dt-bindings/clock/imx6ul-clock.h           | 240 ++++++
 17 files changed, 2631 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/imx6ul-clock.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/fsl,imx6ul-pinctrl.txt
 create mode 100644 arch/arm/boot/dts/imx6ul-14x14-evk.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-pinfunc.h
 create mode 100644 arch/arm/boot/dts/imx6ul.dtsi
 create mode 100644 arch/arm/mach-imx/mach-imx6ul.c
 create mode 100644 drivers/clk/imx/clk-imx6ul.c
 create mode 100644 include/dt-bindings/clock/imx6ul-clock.h

-- 
1.9.1

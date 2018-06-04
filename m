From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v5 0/4] Reintroduce i.MX EPIT Timer
Date: Mon,  4 Jun 2018 12:00:31 +0200
Message-ID: <20180604100035.19558-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Didier <colin.didier@devialet.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, =?UTF-8?q?Cl=C3=A9ment=20Peron?= <clement.peron@devialet.com>
List-Id: devicetree@vger.kernel.org

From: Clément Peron <clement.peron@devialet.com>

As suggested in the commit message we have added the device tree support,
proper bindings and we moved the driver into the correct folder.

Moreover we made some changes like use of relaxed IO accesor,
implement sched_clock, delay_timer and reduce the clockevents min_delta.

Changes since v4:
- removed ipg clk
- change in dt epit to timer
- add introduction in doc
- add all compatibles in doc
- update epit entry for other i.MX device-trees

Changes since v3:
- Clean Kconfig
- Rename imx6q-epit to imx31-epit
- Update doc and bindings
- Indent and fix

Changes since v2 (Thanks Fabio Estevam):
- Removed unused ckil clock
- Add out_iounmap
- Check and handle if clk_prepare_enable failed
- Fix comment typo

Changes since v1 (Thanks Vladimir Zapolskiy):
- Add OF dependency in Kconfig
- Sort header
- Use BIT macro
- Remove useless comments
- Fix incorrect indent
- Fix memory leak
- Add check and handle possible returned error

Clément Peron (2):
  ARM: imx: remove inexistant EPIT timer init
  dt-bindings: timer: add i.MX EPIT timer binding

Colin Didier (2):
  clocksource: add driver for i.MX EPIT timer
  ARM: dts: imx: add missing compatible and clock properties for EPIT

 .../devicetree/bindings/timer/fsl,imxepit.txt |  21 ++
 arch/arm/boot/dts/imx25.dtsi                  |   8 +-
 arch/arm/boot/dts/imx6qdl.dtsi                |  10 +-
 arch/arm/boot/dts/imx6sl.dtsi                 |  14 +-
 arch/arm/boot/dts/imx6sx.dtsi                 |  10 +-
 arch/arm/boot/dts/imx6ul.dtsi                 |  10 +-
 arch/arm/mach-imx/common.h                    |   1 -
 drivers/clocksource/Kconfig                   |  11 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-imx-epit.c          | 265 ++++++++++++++++++
 10 files changed, 338 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,imxepit.txt
 create mode 100644 drivers/clocksource/timer-imx-epit.c

-- 
2.17.0

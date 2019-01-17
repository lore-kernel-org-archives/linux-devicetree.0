From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v5 00/14] qcom: spmi: add support for hierarchical IRQ chip
Date: Wed, 16 Jan 2019 19:32:20 -0500
Message-ID: <20190117003234.22127-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds hierarchical IRQ chip support to spmi-gpio so
that device tree consumers can request an IRQ directly from the GPIO
block rather than having to request an IRQ from the underlying PMIC.

For more background information, see the email thread with Linus
Walleij's excellent description of the problem at
https://www.spinics.net/lists/linux-gpio/msg34655.html.

This work was tested on a LG Nexus 5 (hammerhead) phone. My status page
at https://masneyb.github.io/nexus-5-upstream/ describes what is working
so far with the upstream kernel.

Changes since v4:
- Patch 3: Remove unnecessary u16 cast on device_get_match_data()
- Patch 5: Change '&struct gpiochip' in kernel doc to
  '&struct gpio_chip'

High-level changes since v3:
- Add missing variants to spmi-gpio driver and device tree binding doc
  that are already in use in device tree.
- Introduce patch that disassociates the old virq if hwirq mapping
  already exists and then drop it at the end of the series. This is to
  not break git bisect for existing boards.
- Migrate arm64 device tree files.
- There are 8 new patches in this series and I denoted this in the notes
  on the relevant patches.

High-level changes since v2:
- Dropped patch to mfd/qcom-spmi-pmic.c
- Patch 3 is new and adds two new functions to gpiolib
- Patch 6 is new and corrects the only other upstream user of spmi-gpio

High-level changes since v1:
- Patches 1 and 2 are new. This brought in a third subsystem (mfd).
- I have detailed changelogs attached to the notes on patches 3-5.

Brian Masney (14):
  dt-bindings: pinctrl: qcom-pmic-gpio: add qcom,pmi8998-gpio binding
  pinctrl: qcom: spmi-gpio: add support for three new variants
  pinctrl: qcom: spmi-gpio: hardcode IRQ counts
  spmi: pmic-arb: convert to v2 irq interfaces to support hierarchical
    IRQ chips
  gpio: add irq domain activate/deactivate functions
  spmi: pmic-arb: disassociate old virq if hwirq mapping already exists
  qcom: spmi-gpio: add support for hierarchical IRQ chip
  ARM: dts: qcom: pm8941: add interrupt controller properties
  ARM: dts: qcom: pma8084: add interrupt controller properties
  arm64: dts: qcom: pm8005: add interrupt controller properties
  arm64: dts: qcom: pm8998: add interrupt controller properties
  arm64: dts: qcom: pmi8994: add interrupt controller properties
  arm64: dts: qcom: pmi8998: add interrupt controller properties
  spmi: pmic-arb: revert "disassociate old virq if hwirq mapping already
    exists"

 .../bindings/pinctrl/qcom,pmic-gpio.txt       |   1 +
 arch/arm/boot/dts/qcom-pm8941.dtsi            |  38 +----
 arch/arm/boot/dts/qcom-pma8084.dtsi           |  24 +---
 arch/arm64/boot/dts/qcom/pm8005.dtsi          |   6 +-
 arch/arm64/boot/dts/qcom/pm8998.dtsi          |  28 +---
 arch/arm64/boot/dts/qcom/pmi8994.dtsi         |  12 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |  16 +--
 drivers/gpio/gpiolib.c                        |  37 +++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      | 136 ++++++++++++++----
 drivers/spmi/spmi-pmic-arb.c                  |  58 +++++---
 include/linux/gpio/driver.h                   |   5 +
 11 files changed, 205 insertions(+), 156 deletions(-)

-- 
2.17.2

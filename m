From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v3 0/6] qcom: spmi: add support for hierarchical IRQ chip
Date: Wed,  9 Jan 2019 20:12:52 -0500
Message-ID: <20190110011258.17227-1-masneyb@onstation.org>
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
so far with an upstream kernel.

High-level changes since v2:
- Dropped patch to mfd/qcom-spmi-pmic.c
- Patch 3 is new and adds two new functions to gpiolib
- Patch 6 is new and corrects the only other upstream user of spmi-gpio

High-level changes since v1:
- Patches 1 and 2 are new. This brought in a third subsystem (mfd).
- I have detailed changelogs attached to the notes on patches 3-5.

Brian Masney (6):
  pinctrl: qcom: spmi-gpio: hardcode IRQ counts
  spmi: pmic-arb: convert to v2 irq interfaces to support hierarchical
    IRQ chips
  gpio: add irq domain activate/deactivate functions
  qcom: spmi-gpio: add support for hierarchical IRQ chip
  ARM: dts: qcom: pm8941: add interrupt controller properties
  ARM: dts: qcom: pma8084: add interrupt controller properties

 arch/arm/boot/dts/qcom-pm8941.dtsi       |  38 +------
 arch/arm/boot/dts/qcom-pma8084.dtsi      |  24 +---
 drivers/gpio/gpiolib.c                   |  37 +++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 134 +++++++++++++++++++----
 drivers/spmi/spmi-pmic-arb.c             |  58 ++++++----
 include/linux/gpio/driver.h              |   5 +
 6 files changed, 194 insertions(+), 102 deletions(-)

-- 
2.17.2

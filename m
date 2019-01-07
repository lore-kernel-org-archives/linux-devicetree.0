From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH v2 0/5] qcom: spmi: add support for hierarchical IRQ chip
Date: Sun,  6 Jan 2019 21:11:40 -0500
Message-ID: <20190107021145.6370-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, lee.jones@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds hierarchical IRQ chip support to spmi-gpio so
that device tree consumers can request an IRQ directly from the GPIO
block rather than having to request an IRQ from the underlying PMIC.
The first two patches in this series removes some IRQ count code that
was causing the IRQs to be prematurely initialized. Patch three
converts pmic-arb to use the version 2 IRQ interface. Patches 4/5
add support for the hierarchical IRQ chip to spmi-gpio.

For more background information, see the email thread with Linus
Walleij's excellent description of the problem at
https://www.spinics.net/lists/linux-gpio/msg34655.html.

Patches 3-5 need to be applied in the order that are presented here in
order to allow for a proper bisection. Patch 5 depends on the presence
of 1-4. Part of the series can be applied without any breakage.

This work was tested on a LG Nexus 5 (hammerhead) phone. My status page
at https://masneyb.github.io/nexus-5-upstream/ describes what is working
so far with an upstream kernel.

High-level changes since v1:
- Patches 1 and 2 are new. This brought in a third subsystem (mfd).
- I have detailed changelogs attached to the notes on patches 3-5.

Brian Masney (5):
  spmi: pmic-arb: hardcode IRQ counts
  mfd: qcom-spmi-pmic: use devm_mfd_add_devices instead of
    devm_of_platform_populate
  spmi: pmic-arb: convert to v2 irq interfaces to support hierarchical
    IRQ chips
  qcom: spmi-gpio: add support for hierarchical IRQ chip
  ARM: dts: qcom: msm8974: add interrupt controller properties

 arch/arm/boot/dts/qcom-pm8941.dtsi       |  39 +-----
 drivers/mfd/Kconfig                      |   1 +
 drivers/mfd/qcom-spmi-pmic.c             |  61 ++++++++-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 160 +++++++++++++++++++----
 drivers/spmi/spmi-pmic-arb.c             |  58 +++++---
 5 files changed, 233 insertions(+), 86 deletions(-)

-- 
2.17.2

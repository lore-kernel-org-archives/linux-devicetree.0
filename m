From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 0/9] qcom: ssbi-gpio: add support for hierarchical IRQ chip
Date: Fri, 25 Jan 2019 11:22:53 -0500
Message-ID: <20190125162302.14036-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, marc.zyngier@arm.com, lee.jones@linaro.org
Cc: tglx@linutronix.de, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds hierarchical IRQ chip support to ssbi-gpio so
that device tree consumers can request an IRQ directly from the GPIO
block rather than having to request an IRQ from the underlying PMIC.

For more background information, see the email thread with Linus
Walleij's excellent description of the problem at
https://www.spinics.net/lists/linux-gpio/msg34655.html.

This change was not tested on any actual hardware, however the same
change was made to spmi-gpio and tested on a LG Nexus 5 (hammerhead)
phone. That patch series is available at
https://lore.kernel.org/lkml/20190119204252.18370-1-masneyb@onstation.org/
and is queued for the next merge window.

Brian Masney (9):
  pinctrl: qcom: ssbi-gpio: hardcode IRQ counts
  genirq: introduce irq_domain_translate_twocell
  mfd: pm8xxx: convert to v2 irq interfaces to support hierarchical IRQ
    chips
  mfd: pm8xxx: disassociate old virq if hwirq mapping already exists
  qcom: ssbi-gpio: add support for hierarchical IRQ chip
  arm: dts: qcom: apq8064: add interrupt controller properties
  arm: dts: qcom: msm8660: add interrupt controller properties
  arm: dts: qcom: mdm9615: add interrupt controller properties
  mfd: pm8xxx: revert "disassociate old virq if hwirq mapping already
    exists"

 arch/arm/boot/dts/qcom-apq8064.dtsi      |  46 +------
 arch/arm/boot/dts/qcom-mdm9615.dtsi      |   9 +-
 arch/arm/boot/dts/qcom-msm8660.dtsi      |  47 +------
 drivers/mfd/qcom-pm8xxx.c                |  86 +++++++-----
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 161 +++++++++++++++++++----
 include/linux/irqdomain.h                |   5 +
 kernel/irq/irqdomain.c                   |  21 +++
 7 files changed, 218 insertions(+), 157 deletions(-)

-- 
2.17.2

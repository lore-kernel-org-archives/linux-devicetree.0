From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 0/3] qcom: spmi: add support for hierarchical IRQ chip
Date: Sat, 29 Dec 2018 06:47:52 -0500
Message-ID: <20181229114755.8711-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, sboyd@kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org
Cc: marc.zyngier@arm.com, shawnguo@kernel.org, dianders@chromium.org, linux-gpio@vger.kernel.org, nicolas.dechesne@linaro.org, niklas.cassel@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds hierarchical IRQ chip support to spmi-gpio so
that device tree consumers can request an IRQ directly from the GPIO
block rather than having to request an IRQ from the underlying PMIC.
The first patch in this series converts pmic-arb to use the version 2
IRQ interface and patches 2 and 3 add support for the hierarchical
IRQ chip to spmi-gpio.

For more background information, see the email thread with Linus
Walleij's excellent description of the problem at
https://www.spinics.net/lists/linux-gpio/msg34655.html.

The patches need to be applied in the order that I have them in order
to allow for a proper bisection, however part of the series can be
applied without any breakage. Maybe the spmi-arb change can go in
for v4.21 and the spmi-gpio changes can go in for v4.22?

This work was tested on a LG Nexus 5 (hammerhead) phone. My status page
at https://masneyb.github.io/nexus-5-upstream/ describes what is working
so far with an upstream kernel.

Brian Masney (3):
  spmi: pmic-arb: convert to v2 irq interfaces to support hierarchical
    IRQ chips
  qcom: spmi-gpio: add support for hierarchical IRQ chip
  ARM: dts: qcom: msm8974: add interrupt properties

 arch/arm/boot/dts/qcom-pm8941.dtsi       |   3 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 119 ++++++++++++++++++++++-
 drivers/spmi/spmi-pmic-arb.c             |  91 ++++++++++++-----
 3 files changed, 182 insertions(+), 31 deletions(-)

-- 
2.17.2

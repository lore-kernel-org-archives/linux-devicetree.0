From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH v2 0/3] pinctrl: Qualcomm 8x74 pinctrl driver
Date: Thu, 5 Dec 2013 18:10:02 -0800
Message-ID: <1386295805-13708-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series adds a pinctrl, pinmux, pinconf and gpiolib driver for the
Qualcomm TLMM block found in recent Qualcomm SoCs (8x60 and newer).
It designed with both v2 and v3 of the block in mind and comes with initial
definitions for the 8x74 SoCs.
This should be filled in with more data and definitions for more SoCs.

Regards,
Bjorn

v2
--
* Replaced subnode dt parsing with generic pinctrl function
* Installing irq_handler as chained irq handler
* Added call to handle_bad_irq() when no irqs are pending in irq handler
* Creating irq mapping at probe() and cleaned up the code accordingly
* Replaced pinctrl_add_gpio_range with gpiochip_add_pin_range
* Other minor updates based on review comments

Bjorn Andersson (3):
  pinctrl: Add Qualcomm TLMM driver
  pinctrl: Add msm8x74 configuration
  pinctrl: Add documentation for pinctrl-msm8x74

 .../bindings/pinctrl/qcom,msm8x74-pinctrl.txt      |   92 ++
 drivers/pinctrl/Kconfig                            |   10 +
 drivers/pinctrl/Makefile                           |    2 +
 drivers/pinctrl/pinctrl-msm.c                      | 1028 ++++++++++++++++++++
 drivers/pinctrl/pinctrl-msm.h                      |  123 +++
 drivers/pinctrl/pinctrl-msm8x74.c                  |  636 ++++++++++++
 6 files changed, 1891 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,msm8x74-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-msm.c
 create mode 100644 drivers/pinctrl/pinctrl-msm.h
 create mode 100644 drivers/pinctrl/pinctrl-msm8x74.c

-- 
1.8.2.2

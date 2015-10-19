From: Pramod Kumar <pramodku@broadcom.com>
Subject: [PATCH 00/11] Generalized broadcom cygnus gpio driver
Date: Mon, 19 Oct 2015 11:13:07 +0530
Message-ID: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jonas Gorski <jogo@openwrt.org>, Pramod Kumar <pramodku@broadcom.com>
List-Id: devicetree@vger.kernel.org

Generalized pinctrl-cygnus-gpio driver so that it could be used for all
iProc architecture based future SoCs having same gpio pin controller.
Generalization process made the below changes in driver-

1. Removed pin mapping from driver and addressed this via DT through
"gpio-ranges" property.
2. Addressed number of pins from DT through "ngpios" property and removed
from driver.
3. Since all iProc based SoCs would use this driver hence renamed all
variables/macros/functions and even file name on iproc.

This patchset applies on v4.3-rc4 and is tested on cygnus SVK and could be
find at-
https://github.com/Broadcom/arm64-linux/tree/iproc-gpio-v1

Pramod Kumar (11):
  dt-bindings: pinctrl: Optional DT property to support pin mappings
  pinctrl: Remove GPIO to Pinctrl pin mapping from driver
  dts: pinctrl: Add GPIO to Pinctrl pin mapping in DT
  dt-binding: Add new compatible string for gpio controller driver
  dt-binding: Add ngpios property to GPIO controller node
  dts: define ngpios property in gpio controller's node
  pinctrl: use ngpios propety from DT
  pinctrl: Add new compatible string to GPIO controller driver
  gpio: Rename func/macro/var to IP-block,iproc
  Documentation: Rename gpio controller name from cygnus to iproc
  pinctrl: Rename gpio driver from cygnus to iproc

 .../{brcm,cygnus-gpio.txt => brcm,iproc-gpio.txt}  |  25 +-
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |  56 +-
 drivers/pinctrl/bcm/Kconfig                        |  30 +-
 drivers/pinctrl/bcm/Makefile                       |   2 +-
 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c          | 909 ---------------------
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           | 759 +++++++++++++++++
 6 files changed, 854 insertions(+), 927 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{brcm,cygnus-gpio.txt => brcm,iproc-gpio.txt} (75%)
 delete mode 100644 drivers/pinctrl/bcm/pinctrl-cygnus-gpio.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c

-- 
1.9.1


From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v2 0/2] Additional iProc GPIO support
Date: Mon,  2 May 2016 13:51:46 -0700
Message-ID: <1462222308-4869-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add support to the iProc GPIO driver for v2 and v3 revisions of the iProc GPIO
controllers. The v2 revision is used on NSP with drive strength pinconf
feature disabled and the v3 revision is used on Stingray with all pinconf
features disabled

Changes from v1:
 - Changed to use compatible strings "brcm,iproc-gpio-v2" and
"brcm,iproc-gpio-v3" to deal with differences among various iProc based SoCs
 - Removed DT header "include/dt-bindings/pinctrl/brcm,iproc-gpio.h"

Patch series is developed based on Linux v4.6-rc1 and available at:
https://github.com/Broadcom/cygnus-linux/tree/iproc-gpio-v2

Ray Jui (2):
  dt-bindings: Update iProc GPIO bindings
  pinctrl: iproc: Add v2/v3 GPIO support

 .../bindings/pinctrl/brcm,iproc-gpio.txt           |  11 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           | 115 +++++++++++++++++++--
 2 files changed, 119 insertions(+), 7 deletions(-)

-- 
2.1.4


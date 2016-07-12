From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH v3 0/2] Additional iProc GPIO support
Date: Tue, 12 Jul 2016 10:39:16 -0700
Message-ID: <1468345158-17676-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add support to the iProc GPIO driver for the NSP and Stingray iProc based SoCs.
The integration in NSP has drive strength pinconf feature disabled and the
integration in Stingray has all pinconf related features disabled and handled
by a different IP block

GITHUB repo: https://github.com/Broadcom/cygnus-linux.git
branch: iproc-gpio-v3

Changes from v2:
 - Rebased to v4.7-rc1
 - Changed to use SoC specific compatible string to handle SoC specific
changes in both NSP and Stingray

Changes from v1:
 - Changed to use compatible strings "brcm,iproc-gpio-v2" and
"brcm,iproc-gpio-v3" to deal with differences among various iProc based SoCs
 - Removed DT header "include/dt-bindings/pinctrl/brcm,iproc-gpio.h"

Ray Jui (2):
  dt-bindings: Update iProc GPIO bindings
  pinctrl: iproc: Add NSP and Stingray GPIO support

 .../bindings/pinctrl/brcm,iproc-gpio.txt           |  18 +++-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           | 118 +++++++++++++++++++--
 2 files changed, 127 insertions(+), 9 deletions(-)

-- 
2.1.4

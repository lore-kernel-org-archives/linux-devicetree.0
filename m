From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH 0/4] Additional iProc GPIO support
Date: Tue, 12 Apr 2016 17:15:19 -0700
Message-ID: <1460506523-6249-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add support to the iProc GPIO driver to allow PINCONF functions to be
disabled individually. Also add a new compatible string "brcm,iproc-gpio-only"
that allows this driver to be used as a pure GPIO driver without any PINCONF
functions enabled

Patch series is developed based on Linux v4.6-rc1 and available at:
https://github.com/Broadcom/cygnus-linux/tree/iproc-gpio-v1

Ray Jui (4):
  dt-bindings: Update iProc GPIO bindings
  pinctrl: iproc: Allow certain PINCONF functions to be disabled
  dt-bindings: Update iProc GPIO bindings
  pinctrl: iproc: Allow PINCONF to be disabled completely

 .../bindings/pinctrl/brcm,iproc-gpio.txt           |  12 ++-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c           | 106 +++++++++++++++++++--
 include/dt-bindings/pinctrl/brcm,iproc-gpio.h      |  52 ++++++++++
 3 files changed, 162 insertions(+), 8 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/brcm,iproc-gpio.h

-- 
2.1.4

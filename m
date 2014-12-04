From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH 0/4] Add pinctrl support to Broadcom Cygnus SoC
Date: Thu, 4 Dec 2014 13:56:07 -0800
Message-ID: <1417730171-30455-1-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <Ray Jui <rjui@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>
Cc: Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patchset contains the initial pinctrl support for the Broadcom Cygnus SoC.
The Cygnus pinctrl controller supports group based alternate function configuration

Ray Jui (4):
  pinctrl: Broadcom Cygnus pinctrl device tree binding
  pinctrl: cygnus: add initial pinctrl support
  ARM: mach-bcm: enable pinctrl support for Cygnus
  ARM: dts: enable pinctrl for Broadcom Cygnus

 .../bindings/pinctrl/brcm,cygnus-pinctrl.txt       |   92 +++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |    5 +
 arch/arm/mach-bcm/Kconfig                          |    1 +
 drivers/pinctrl/Kconfig                            |    7 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-bcm-cygnus.c               |  753 ++++++++++++++++++++
 6 files changed, 859 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,cygnus-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-bcm-cygnus.c

-- 
1.7.9.5


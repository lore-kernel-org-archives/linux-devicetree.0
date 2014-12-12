From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v5 0/3] Add gpio support to Broadcom Cygnus SoC
Date: Thu, 11 Dec 2014 16:05:03 -0800
Message-ID: <1418342706-14755-1-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Ray Jui <rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patchset contains the initial GPIO support for the Broadcom Cygnus SoC.
Cygnus has 3 GPIO controllers: 1) the ASIU GPIO; 2) the chipCommonG GPIO;
and 3) the ALWAYS-ON GPIO. All 3 types of GPIO controllers are supported by
the same Cygnus GPIO driver

Changes from v4:
 - Use DT property "linux,gpio-base" to define GPIO base number
 - factorize common code to improve code readability and reduce code size
 - remove "bcm_" prefix on function and struct names
 - improve debugging prints
 - default GPIO_BCM_CYGNUS to y in Kconfig (it still depends on
   ARCH_BCM_CYGNUS). This way we do not need to select it from the
   arch/arm/mach-bcm/Kconfig
 - Get rid of redundant MAINTAINER entry for this driver. It will be maintained
   by Broadcom iProc/Cygnus maintainers
 - Update device tree document based on driver changes

Changes from v3:
 - Fix dt property tpyo
 - Fix incorrect GPIO compatible ID in device tree binding document example

Changes from v2:
 - Consolidate different compatible IDs into "brcm,cygnus-gpio"
 - Get rid of redundant "no-interrupt" property

Changes from v1:
 - Get rid of inline qualifier
 - Get rid of redundant check in the ISR
 - Other minor fixes to imrove code readability

Ray Jui (3):
  gpio: Cygnus: define Broadcom Cygnus GPIO binding
  gpio: Cygnus: add GPIO driver
  ARM: dts: enable GPIO for Broadcom Cygnus

 .../devicetree/bindings/gpio/brcm,cygnus-gpio.txt  |   87 +++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |   33 ++
 drivers/gpio/Kconfig                               |   12 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-bcm-cygnus.c                     |  613 ++++++++++++++++++++
 5 files changed, 746 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,cygnus-gpio.txt
 create mode 100644 drivers/gpio/gpio-bcm-cygnus.c

-- 
1.7.9.5

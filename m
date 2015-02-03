From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH v3 0/4] Add pinctrl support to Broadcom Cygnus SoC
Date: Mon, 2 Feb 2015 18:01:30 -0800
Message-ID: <1422928894-20716-1-git-send-email-rjui@broadcom.com>
References: <Ray Jui <rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Ray Jui <rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>
Cc: Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

This patchset contains the initial pinctrl (IOMUX) support for the Broadcom
Cygnus SoC. The Cygnus IOMUX controller supports group based mux configuration
and allows certain pins to be muxed to GPIO function individually

Changes from v2:
 - Consolidate all Broadcom pinctrl drivers into drivers/pinctrl/bcm/*
 - Change the Cygnus IOMUX driver to use standard Linux pinctrl subnode
properties such as "function" and "groups" for pinmux configuration, instead
of non-standard properties such as "brcm,function" and "brcm,group"
 - Use real function names like "spi0", "lcd", "key", and etc. instead of HW
specific mux names like "alt1", "alt2", "alt3", and etc.
 - Add suffix "grp" to all group names
 - Add support to allow individual pins to be muxed to GPIO function through
subsystem callbacks "gpio_request_enable" and "gpio_disable_free", and get rid
of all GPIO groups
 - Other minor improvements in the driver

Changes from v1:
 - Fix a typo in device tree binding document

Ray Jui (4):
  pinctrl: bcm: consolidate Broadcom pinctrl drivers
  pinctrl: Broadcom Cygnus pinctrl device tree binding
  pinctrl: cygnus: add initial IOMUX driver support
  ARM: dts: enable IOMUX for Broadcom Cygnus

 .../bindings/pinctrl/brcm,cygnus-pinmux.txt        |  159 +++
 arch/arm/boot/dts/bcm-cygnus.dtsi                  |    6 +
 drivers/pinctrl/Kconfig                            |   19 +-
 drivers/pinctrl/Makefile                           |    4 +-
 drivers/pinctrl/bcm/Kconfig                        |   34 +
 drivers/pinctrl/bcm/Makefile                       |    5 +
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             | 1455 ++++++++++++++++++++
 drivers/pinctrl/bcm/pinctrl-bcm2835.c              | 1072 ++++++++++++++
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c           | 1087 +++++++++++++++
 drivers/pinctrl/pinctrl-bcm281xx.c                 | 1455 --------------------
 drivers/pinctrl/pinctrl-bcm2835.c                  | 1072 --------------
 11 files changed, 3821 insertions(+), 2547 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,cygnus-pinmux.txt
 create mode 100644 drivers/pinctrl/bcm/Kconfig
 create mode 100644 drivers/pinctrl/bcm/Makefile
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm281xx.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-bcm2835.c
 create mode 100644 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
 delete mode 100644 drivers/pinctrl/pinctrl-bcm281xx.c
 delete mode 100644 drivers/pinctrl/pinctrl-bcm2835.c

-- 
1.7.9.5

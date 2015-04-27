From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH v2 0/2] pinctrl for NXP LPC18xx family
Date: Tue, 28 Apr 2015 00:14:07 +0200
Message-ID: <1430172849-3147-1-git-send-email-manabian@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de, devicetree@vger.kernel.org, ariel.dalessandro@gmail.com, ezequiel@vanguardiasur.com.ar, Joachim Eastwood <manabian@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch set adds a pinctrl driver for NXP LPC18xx/43xx devices.

The pinctrl driver uses the generic muxing and properties DT bindings as
described in pinctrl-bindings.txt. There is still two TODOs left in the
pinctrl driver regarding property control of special usb1 pins but I would
like it merged regardless of this. Support will be added once I get USB up
and running on the MCU.

Checkpatch complains a lot about the driver but that's what you get when
you embedd a large function/pin spec table from the data sheet I guess.

Changes since v1:
 - minor white space fixes
 - split pinctrl/gpio patch set
 - rebase on v4.1-rc1

Since there were no comments on v1. I hope that these drivers can
make it to Linux 4.1.

There are no dependencies in this patch set. The DTS changes will
be sent separately to arm-soc once this patch set goes upstream.

Base support for the NXP LPC18xx family can be found here:
http://marc.info/?l=linux-arm-kernel&m=143016894704253&w=2


Joachim Eastwood (2):
  pinctrl: add lpc18xx pinctrl driver
  doc: dt: add documentation for lpc1850-scu pinctrl driver

 .../bindings/pinctrl/nxp,lpc1850-scu.txt           |   57 +
 drivers/pinctrl/Kconfig                            |    9 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-lpc18xx.c                  | 1144 ++++++++++++++++++++
 4 files changed, 1211 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
 create mode 100644 drivers/pinctrl/pinctrl-lpc18xx.c

-- 
1.8.0


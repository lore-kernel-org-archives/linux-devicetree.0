From: Michel Pollet <michel.pollet@bp.renesas.com>
Subject: [PATCH v1 0/5] Renesas R9A06G032 PINCTRL Driver
Date: Thu, 14 Jun 2018 12:00:16 +0100
Message-ID: <1528974029-29617-1-git-send-email-michel.pollet@bp.renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Cc: phil.edworthy@renesas.com, Michel Pollet <buserror+upstream@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

*WARNING* -- this requires:
+ R9A06G032 base patch v9
+ R9A06G032 SMP patch v5

This implements the pinctrl driver for the R9A06G032. Apart from
the file names, I had to keep using RZN1_ as the headers etc are
already extensively in use -- u-boot, vmworks, cm3 code and threadx
use these constants and the base support to implement pinmux on this
SoC.

Also, there is an existing pretty extensive webapp that allows
configuring the pinmux externally that generates either source
code (for non DT based OSes) or an included .dtsi file for board
specific configs.

Note, I used renesas,rzn1-pinmux node to specify the pinmux constants,
and I also don't use some of the properties documented in
pinctrl-bindings.txt on purpose, as they are too limited for my use
(I need to be able to set, clear, ignore or reset level, pull up/down
and function as the pinmux might be set by another OS/core running
concurently).

v1
 + Just supports fhe UART0 on the DB board.

Michel Pollet (5):
  dt-bindings: Add the r9a06g032-pinctrl.h file
  dt-bindings: clock: renesas,r9a06g032-pinctrl: documentation
  pinctrl: renesas: Renesas R9A06G032 pinctrl driver
  ARM: dts: Renesas R9A06G032 pinctrl node
  ARM: dts: Renesas RZN1D-DB Board: Add UART0 pinmux node

 .../bindings/pinctrl/renesas,r9a06g032-pinctrl.txt | 124 +++
 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts        |  13 +
 arch/arm/boot/dts/r9a06g032.dtsi                   |   8 +
 drivers/pinctrl/Kconfig                            |  10 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-r9a06g032.c                | 890 +++++++++++++++++++++
 include/dt-bindings/pinctrl/r9a06g032-pinctrl.h    | 191 +++++
 7 files changed, 1237 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,r9a06g032-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-r9a06g032.c
 create mode 100644 include/dt-bindings/pinctrl/r9a06g032-pinctrl.h

-- 
2.7.4

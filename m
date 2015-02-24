From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH 0/2] pinctrl: Support for IMG Pistachio
Date: Mon, 23 Feb 2015 18:15:02 -0800
Message-ID: <1424744104-14151-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

This series adds support for the pin and GPIO controllers on the IMG
Pistachio SoC.  Pistachio's pin controller manages 99 pins, 90 of
which are MFIOs which can be muxed between multiple functions or used
as GPIOs.  The GPIO control for the 90 MFIOs is broken up into banks
of 16.  While this driver supports only Pistachio, it should hopefully
be easy to extend it to support future IMG SoCs.

Test on an IMG Pistachio BuB.  Based on 4.0-rc1 + my series adding
Pistachio platform support [1], which introduces the MACH_PISTACHIO
Kconfig symbol.  A branch with this series and the dependent patches
is available at [2].  I'd like this to go through the MIPS tree with
Linus'/Alex's ACKs if possible.

Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Cc: James Hartley <james.hartley@imgtec.com>
Cc: James Hogan <james.hogan@imgtec.com>

[1] https://lkml.org/lkml/2015/2/23/694
[2] https://github.com/abrestic/linux/tree/pistachio-pinctrl-v1

Andrew Bresticker (2):
  pinctrl: Add Pistachio SoC pin control binding document
  pinctrl: Add Pistachio SoC pin control driver

 .../bindings/pinctrl/img,pistachio-pinctrl.txt     |  217 +++
 drivers/pinctrl/Kconfig                            |    6 +
 drivers/pinctrl/Makefile                           |    1 +
 drivers/pinctrl/pinctrl-pistachio.c                | 1513 ++++++++++++++++++++
 4 files changed, 1737 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/img,pistachio-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-pistachio.c

-- 
2.2.0.rc0.207.ga3a616c

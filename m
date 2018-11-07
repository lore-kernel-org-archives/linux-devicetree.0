Return-Path: <SRS0=7Z3r=NS=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 0/2] pinctrl: Add RZ/A2 pin and gpio driver
Date: Wed,  7 Nov 2018 13:20:07 -0500
Message-Id: <20181107182009.61718-1-chris.brandt@renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: jacopo mondi <jacopo@jmondi.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The pin controller in the RZ/A2 is nothing like the pin controller in
the RZ/A1. That's a good thing! This pin controller is much more simple
and easier to configure.

So, this driver is faily simple (I hope).


Chris Brandt (2):
  pinctrl: Add RZ/A2 pin and gpio controller
  dt-bindings: pinctrl: Add RZ/A2 pinctrl and GPIO

 .../bindings/pinctrl/renesas,rza2-pinctrl.txt      |  88 ++++
 drivers/pinctrl/Kconfig                            |  11 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-rza2.c                     | 530 +++++++++++++++++++++
 include/dt-bindings/pinctrl/r7s9210-pinctrl.h      |  47 ++
 5 files changed, 677 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.txt
 create mode 100644 drivers/pinctrl/pinctrl-rza2.c
 create mode 100644 include/dt-bindings/pinctrl/r7s9210-pinctrl.h

-- 
2.16.1

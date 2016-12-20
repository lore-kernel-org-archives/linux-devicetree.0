From: Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 0/5] mfd: dt: Add bindings for the Aspeed MFDs
Date: Tue, 20 Dec 2016 17:45:30 +1030
Message-ID: <20161220071535.27542-1-andrew@aj.id.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Corey Minyard <minyard@acm.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lee,

Here's v4 of the Aspeed LPC MFD devicetree bindings series. v3 can be found at:

  https://lkml.org/lkml/2016/12/5/835

Changes since v3:

* Based on Arnd's argument[1], drop the addition of the mfd/syscon bindings
  directory as well as the the last patch in v3, which moved a number of
  existing bindings. Eventually the Aspeed display controller will have a
  device-specific driver so it doesn't belong there either.

* Add a compatible string for the AST2400 in the LPC Host Controller bindings
  as requested by Joel and slightly tweak the reg description for Rob.

[1] https://lkml.org/lkml/2016/12/13/202

Andrew Jeffery (5):
  mfd: dt: Fix "indicates" typo in mfd bindings document
  mfd: dt: ranges, #address-cells and #size-cells as optional properties
  mfd: dt: Add Aspeed Low Pin Count Controller bindings
  mfd: dt: Add bindings for the Aspeed LPC Host Controller (LHC)
  mfd: dt: Add bindings for the Aspeed SoC Display Controller (GFX)

 .../devicetree/bindings/mfd/aspeed-gfx.txt         |  17 +++
 .../devicetree/bindings/mfd/aspeed-lpc.txt         | 137 +++++++++++++++++++++
 Documentation/devicetree/bindings/mfd/mfd.txt      |  12 +-
 3 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-gfx.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt

-- 
2.9.3

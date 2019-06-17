From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 0/4] Add support for Marvell 98DX1135
Date: Tue, 18 Jun 2019 09:54:54 +1200
Message-ID: <20190617215458.32688-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The Marvell 98DX1135 is a switch chip with an integrated ARMv5 CPU, it is
similar to the 98DX4122 with differences in clocking and pin control.

I haven't added a separate dts for the SoC since it would be so similar t=
o
kirkwood-98dx4122.dtsi.

Changes in v2:
- Update description of mv98dx1135-core-clock
- Collect review from Andrew

Chris Packham (4):
  dt-bindings: pinctrl: mvebu: Document bindings for 98DX1135
  dt-bindings: clock: mvebu: Add compatible string for 98dx1135 core
    clock
  pinctrl: mvebu: Add support for MV98DX1135
  clk: kirkwood: Add support for MV98DX1135

 .../bindings/clock/mvebu-core-clock.txt       |   1 +
 .../pinctrl/marvell,kirkwood-pinctrl.txt      |  44 +-
 drivers/clk/mvebu/kirkwood.c                  |  17 +
 drivers/pinctrl/mvebu/pinctrl-kirkwood.c      | 576 +++++++++---------
 4 files changed, 357 insertions(+), 281 deletions(-)

--=20
2.21.0

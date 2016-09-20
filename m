From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 0/3] r7s72100: dts: enable mmcif
Date: Tue, 20 Sep 2016 11:46:17 -0400
Message-ID: <20160920154620.18653-1-chris.brandt@renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-Id: devicetree@vger.kernel.org

This series enables the mmc driver for the RZ/A1.
Nothing needed to be changed with the actual sh_mmcif driver.
It worked fine as-is.

As you can see, the status in the rskrza1 dst was left
as disabled because I wanted to leave that code in there
for refernce for someone later that actually has a board with
an actaul eMMC chip. I tested with an MMC Plus card.

For version 2:
* First first patch that adds the clock has already been accepted
* Add in the 3rd "card detect" interrupt that no one uses, but it
  is documented in the hardware manual so it is reflected in the
  DT.

Chris Brandt (3):
  ARM: dts: r7s72100: add mmcif to device tree
  mmc: sh_mmcif: Document r7s72100 DT bindings
  ARM: dts: rskrza1: add mmc DT support

 Documentation/devicetree/bindings/mmc/renesas,mmcif.txt |  4 ++++
 arch/arm/boot/dts/r7s72100-rskrza1.dts                  | 17 +++++++++++++++++
 arch/arm/boot/dts/r7s72100.dtsi                         | 12 ++++++++++++
 3 files changed, 33 insertions(+)

-- 
2.9.2

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCHv2 0/3] arm64/clk: update Marvell Armada CP110 system controller driver
Date: Wed, 21 Dec 2016 11:26:54 +0100
Message-ID: <1482316017-22154-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>
Cc: Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hello,

This small set of commits updates the Marvell Armada CP110 system
controller driver, its Device Tree binding, and Device Tree
representation, to take into account three new things:

 - The clock driver now handles clock n°9 (GOP) as a child of clock
   n°18 (controls SD/MMC and GOP)

 - The DT representation is adjusted to name clock n°18 "sd-mmc-gop"
   instead of just "sd-mmc".

 - The clock driver now handles clock n°5 (MG) as a child of clock n°6
   (MG_CORE).

This set of commits is some preparation work to add networking support
for Marvell Armada 7K/8K.

I would expect patches 1 and 2 to be taken by the clock maintainers,
and patch 3 be taken by the Marvell EBU maintainers.

Changes since v1:

 - Addition of the handling of the MG and MG_CORE clocks (n°5 and
   n°6), also needed for the networking support on Marvell Aramda
   7K/8K.

Thanks,

Thomas

Thomas Petazzoni (3):
  dt-bindings: arm: update Armada CP110 system controller binding
  clk: mvebu: adjust clock handling for the CP110 system controller
  arm64: dts: marvell: adjust name of sd-mmc-gop clock in syscon

 .../bindings/arm/marvell/cp110-system-controller0.txt       |  6 +++---
 arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi        |  2 +-
 arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi         |  2 +-
 drivers/clk/mvebu/cp110-system-controller.c                 | 13 +++++++++++--
 4 files changed, 16 insertions(+), 7 deletions(-)

-- 
2.7.4


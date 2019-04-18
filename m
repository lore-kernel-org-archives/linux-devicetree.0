From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 0/3] arm64: allwinner: Enable AXP803's USB power supply
Date: Fri, 19 Apr 2019 00:18:01 +0800
Message-ID: <20190418161804.17723-1-wens@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Lee Jones <lee.jones@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

This series follows up on the A83T USB OTG series. The USB power supply
portion of the AXP803, the PMIC used with the A64, is identical to the
part in the AXP813/AXP818, used with the A83T.

This series enables the USB power supply in the AXP803 using the AXP813's
compatible string as a fallback. The per-model compatible string is still
added as a contigency.

Patch 1 adds an mfd cell for the USB power supply, to the AXP803.

Patch 2 adds a device node for the USB power supply.

Patch 3 enables the USB power supply on the Bananapi M64.

Unfortunately the original Pine64 does not wire up the USB power supply,
and I don't have any other A64 boards.

The mfd patch can go in through the mfd tree. There are no compile-time
dependencies. We, sunxi, can take the DT patches.

Please have a look.


Regards
ChenYu


Chen-Yu Tsai (3):
  mfd: axp20x: add USB power supply mfd cell to AXP803
  arm64: dts: allwinner: axp803: add USB power supply node
  arm64: dts: allwinner: a64: bananapi-m64: Enable PMIC USB power supply

 arch/arm64/boot/dts/allwinner/axp803.dtsi                 | 6 ++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts | 5 +++++
 drivers/mfd/axp20x.c                                      | 5 +++++
 3 files changed, 16 insertions(+)

-- 
2.20.1

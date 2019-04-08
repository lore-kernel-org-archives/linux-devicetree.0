From: Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH 0/6] ARM: sun8i: a83t: Support Camera Sensor Interface controller
Date: Tue,  9 Apr 2019 00:57:38 +0800
Message-ID: <20190408165744.11672-1-wens@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Hi everyone,

This series adds support for the camera sensor interface controller
found on the Allwinner A83T SoC. The controller is similar to the one
found on  the H3, with the addition of a MIPI CSI-2 interface. However,
this series only supports parallel and BT.656 interfaces, based on the
existing driver.

Patch 1 adds an undocumented clock parent of the CSI MCLK. This was
found after finding the default value to sometimes work and sometimes
not, and then comparing against BSP code.

Patch 2 adds a compatible string for the A83T variant.

Patch 3 adds support for the A83T variant to the existing sun6i-csi
driver.

Patch 4 adds a device node for the controller, as well as commonly
used pin muxing options.

Patch 5 adds a pin muxing option for I2C1 on the PE pins, used in
conjunction with the CSI pins.

Patch 6 provides an example usage of the CSI controller: the Bananapi M3
with its camera module attached.

Please have a look.


Regards
ChenYu


Chen-Yu Tsai (6):
  clk: sunxi-ng: a83t: Add pll-video0 as parent of csi-mclk
  dt-bindings: media: sun6i-csi: Add compatible string for A83T variant
  media: sun6i: Support A83T variant
  ARM: dts: sun8i: a83t: Add device node for CSI (Camera Sensor
    Interface)
  ARM: dts: sun8i: a83t: Add I2C2 pinmux setting for PE pins
  [DO NOT MERGE] ARM: dts: sun8i: a83t: bananapi-m3: Enable BPI OV5640
    camera

 .../devicetree/bindings/media/sun6i-csi.txt   |   1 +
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts  | 101 ++++++++++++++++++
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  37 +++++++
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c         |   5 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |   1 +
 5 files changed, 143 insertions(+), 2 deletions(-)

-- 
2.20.1

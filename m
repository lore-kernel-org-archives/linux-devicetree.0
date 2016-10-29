From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 0/2] ARM: dts: sun6i: hummingbird-a31: Enable display output through VGA bridge
Date: Sat, 29 Oct 2016 19:06:09 +0800
Message-ID: <20161029110611.28951-1-wens@csie.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hi,

This is v3 of my sun6i DRM/KMS display enablement series. Most of the
patches in v2 were merged, leaving only the dumb-vga-dac patch and the
hummingbird-a31 VGA output patch.

A few things were changed, mainly the DAC enable method from a GPIO
to a regulator supply.

Changes since v2:

  - Changed the enable-gpio of dumb-vga-dac to vdd-supply regulator.
    This better matches the hardware that I have: the DAC has a fixed
    regulator dropping the voltage from the board-wide 5V to 3.3V the
    DAC uses. The regulator is controlled through a GPIO pin.

  - Renamed the node of the VGA connector from "vga" to "vga-connector".

  - Renamed the node of the VGA DAC from "bridge" to "vga-dac".


Regards
ChenYu


Chen-Yu Tsai (2):
  drm/bridge: dumb-vga-dac: Support a VDD regulator supply
  ARM: dts: sun6i: hummingbird-a31: Enable display output through VGA
    bridge

 .../bindings/display/bridge/dumb-vga-dac.txt       |  2 +
 arch/arm/boot/dts/sun6i-a31-hummingbird.dts        | 76 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/dumb-vga-dac.c              | 35 ++++++++++
 3 files changed, 113 insertions(+)

-- 
2.9.3

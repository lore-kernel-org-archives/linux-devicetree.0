From: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 0/2] Introduce Tanix TX6 box DT
Date: Fri, 16 Aug 2019 22:53:40 +0200
Message-ID: <20190816205342.29552-1-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, mripard@kernel.org, wens@csie.org
Cc: jernej.skrabec@siol.net, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series adds support for Tanix TX6 box:
- Allwinner H6 Quad-core 64-bit ARM Cortex-A53
- GPU Mali-T720
- 4GiB DDR3 RAM (3GiB useable)
- 100Mbps EMAC via AC200 EPHY
- Cdtech 47822BS Wifi/BT
- 2x USB 2.0 Host and 1x USB 3.0 Host
- HDMI port
- IR receiver
- 64GiB eMMC
- 5V/2A DC power supply

Patch 1 adds compatible strings to dt bindings documentation.

Patch 2 adds Tanix TX6 DT.

Best regards,
Jernej

Jernej Skrabec (2):
  dt-bindings: arm: sunxi: Add compatible for Tanix TX6 board
  arm64: dts: allwinner: h6: Introduce Tanix TX6 board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h6-tanix-tx6.dts     | 100 ++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dts

--=20
2.22.1

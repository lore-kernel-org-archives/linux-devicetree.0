From: Kieran Bingham <kbingham@kernel.org>
Subject: [PATCH 0/8] r8a77995 D3 DU and LVDS support
Date: Thu, 15 Feb 2018 08:38:15 +0000
Message-ID: <1518683903-10681-1-git-send-email-kbingham@kernel.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simon Horman <horms@verge.net.au>, geert@glider.be, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
List-Id: devicetree@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Provide the PFC groups for the DU pin controls, and update the bindings for
both the DU and LVDS to cover the r8a77995.

Add dt nodes for the DU, and LVDS, and enable VGA on the Draak board.
Provide support for HDMI out through the ADV7511 component, on the LVDS channel.

Finally provide a 'proof-of-concept' patch for the ADV7612 device which shares
the same bus and demonstrates setting the I2C slave maps such that they do not
conflict with the ADV7511.

This series is dependant upon the LVDS rework from Laurent which is not yet
finalised, however the DU only patches are not blocked by this.


Kieran Bingham (8):
  pinctrl: sh-pfc: r8a77995: Add DU support
  dt-bindings: display: renesas,du: Document r8a77995 bindings
  dt-bindings: display: renesas,lvds: Add LVDS binding for D3
  arm64: dts: renesas: r8a77995: add DU support
  arm64: dts: renesas: r8a77995: Add LVDS support
  arm64: dts: renesas: r8a77995-draak: Enable DU
  arm64: dts: renesas: r8a77995-draak: Add HDMI Out through ADV7511
  [PoC] arm64: dts: renesas: r8a77995-draak: Add ADV7612

 .../bindings/display/bridge/renesas,lvds.txt       |   1 +
 .../devicetree/bindings/display/renesas,du.txt     |   2 +
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     | 150 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  87 ++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c              | 101 ++++++++++++++
 5 files changed, 341 insertions(+)

-- 
2.7.4

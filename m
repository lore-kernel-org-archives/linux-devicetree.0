From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 0/3] Add support for Pine H64 model B w/ Wi-Fi support
Date: Tue, 24 Jul 2018 09:15:48 +0800
Message-ID: <20180724011551.49603-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

Pine H64 has made a new "model B", on which "Euler bus" and "EXP bus"
are dropped, one LED is stripped and the Wi-Fi become an on-board
RTL8723BS.

Add support for this board, with the Wi-Fi support.

Wi-Fi support is also introduced for model A, but disabled.

Icenowy Zheng (3):
  arm64: allwinner: dts: h6: add Pine H64 model B
  arm64: allwinner: dts: h6: add pinmux for MMC1
  arm64: allwinner: dts: h6: add Wi-Fi support for Pine H64 model A/B

 arch/arm64/boot/dts/allwinner/Makefile        |  1 +
 .../allwinner/sun50i-h6-pine-h64-model-b.dts  | 28 +++++++++++++++
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts | 34 +++++++++++++++++--
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  8 +++++
 4 files changed, 69 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dts

-- 
2.18.0

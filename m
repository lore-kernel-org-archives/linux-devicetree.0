From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 0/4] Allwinner H6 SPDIF support
Date: Thu, 11 Apr 2019 23:44:18 +0200
Message-ID: <20190411214422.2267-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

*H6 DMA support IS REQUIRED*

Allwinner H6 SoC has a SPDIF controller called One Wire Audio (OWA) which
is different from the previous H3 generation but still compatible.

Difference are an increase of fifo sizes and there is now the possibility
to output the master clock on a pin.

Also this series require the DMA working on H6, a first version has been
submitted by Jernej Škrabec but is not yet accepted (as this moment):
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=89011

This patch has been tested on Beelink GS1 on top of sunxi/for-next with
the series above applied.

Clément Péron (4):
  dt-bindings: sound: sun4i-spdif: Add Allwinner H6 compatible
  arm64: dts: allwinner: Add SPDIF node for Allwinner H6
  arm64: dts: allwinner: h6: Enable SPDIF for Beelink GS1
  arm64: defconfig: Enable Sun4i SPDIF module

 .../bindings/sound/sunxi,sun4i-spdif.txt      |  3 +-
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 ++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 39 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 4 files changed, 46 insertions(+), 1 deletion(-)

-- 
2.17.1

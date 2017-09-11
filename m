From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 0/4] Add SimpleFB support for Allwinner H3 SoC
Date: Mon, 11 Sep 2017 23:55:25 +0800
Message-ID: <20170911155529.62891-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

This patchset adds devicetree-side support of SimpleFB on Allwinner H3
SoC.

The DE2 CCU is initialized and used by the SimpleFB node, in order to
furtherly coexist with the DRM code.

The first patch adds pipelines for DE2 displays in simplefb-sunxi
device tree binding.

The second patch adds DE2 CCU device node for H3 SoC, and the skeleton
of the node enters the H3/H5 common DTSI; the H5 support is splited
into the third patch, as they will enter different tree.

The fourth patch finally adds simplefb nodes, using the
pipeline strings introduced in the first patch.

Icenowy Zheng (4):
  dt-bindings: simplefb-sunxi: add pipelines for DE2
  ARM: sun8i: h3/h5: add DE2 CCU device node for H3
  arm64: allwinner: h5: add compatible string for DE2 CCU
  ARM: sunxi: h3/h5: add simplefb nodes

 .../bindings/display/simple-framebuffer-sunxi.txt  |  4 ++
 arch/arm/boot/dts/sun8i-h3.dtsi                    |  4 ++
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                 | 43 ++++++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |  4 ++
 4 files changed, 55 insertions(+)

-- 
2.13.5

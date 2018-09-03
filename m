From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 0/3] Changes A64 HDMI PHY compatible to R40
Date: Mon,  3 Sep 2018 21:34:31 +0800
Message-ID: <20180903133434.58188-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

It is used to be believed that the A64 HDMI PHY has the PLL-VIDEO mux
which is introduced in R40, because A64 has two PLL-VIDEOs. However,
experiments show that the mux is not present in A64, so the compatible
string of dual-PLL-input HDMI PHY clock must be changed to use R40 in
it rather than A64.

This patchset does this change.

Because the compatible string is introduced in 4.19, this patchset
should be applied to 4.19 during RC stage, otherwise this error will
exist forever for DT compatibility.

Icenowy Zheng (3):
  dt-bindings: change the A64 HDMI PHY binding to R40
  drm/sun4i: change A64 HDMI PHY binding to R40
  ARM: sun8i: dts: r40: drop A64 fallback compatible string of HDMI PHY

 .../devicetree/bindings/display/sunxi/sun4i-drm.txt         | 6 +++---
 arch/arm/boot/dts/sun8i-r40.dtsi                            | 3 +--
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c                      | 6 +++---
 3 files changed, 7 insertions(+), 8 deletions(-)

-- 
2.18.0

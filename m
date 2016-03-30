From: Jean-Francois Moine <moinejf@free.fr>
Subject: [PATCH 0/3] clk: sunxi: Add the clocks used for audio/video on sun8i
Date: Wed, 30 Mar 2016 19:13:37 +0200
Message-ID: <cover.1459358017.git.moinejf@free.fr>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Emilio Lopez <emilio@elopez.com.ar>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series replaces a part of a previous series about
"Add a DRM display driver to the Allwinner H3".

I will resubmit the H3 DRM video driver and also submit the H3
components for audio on HDMI as soon as the HDMI PHY of the H3
(and A64) will be known.

Changes:
- simplify and use the 'recalc' callback (Chen-Yu Tsai)
- add a SoC type in the compatibles (Maxime Ripard)
- audio PLL added

Jean-Francois Moine (3):
  clk: sunxi: Add sun6i/8i display support
  clk: sunxi: Add sun6i/8i PLL video support
  clk: sunxi: Add sun8i PLL audio support

 Documentation/devicetree/bindings/clock/sunxi.txt |   3 +
 drivers/clk/sunxi/clk-sunxi.c                     | 151 ++++++++++++++++++++++
 2 files changed, 154 insertions(+)

-- 
2.8.0


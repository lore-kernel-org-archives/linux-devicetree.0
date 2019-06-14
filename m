From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 0/9] drm/sun4i: Allwinner R40 MIPI-DSI support
Date: Fri, 14 Jun 2019 22:13:15 +0530
Message-ID: <20190614164324.9427-1-jagan@amarulasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Michael Trimarchi <michael@amarulasolutions.com>, linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

This is v2 version for supporting MIPI-DSI on Allwinner R40 from
initial version[4].

The controller look similar like, Allwinnwe A64 so it has
dependencies with A64 MIPI DSI changes, DSI fixes and R40 pwm 
driver [1] [2] [3]. 

PLL-MIPI, dclk divders logic bpp/lanes are properly work for R40,
like A31, A64.

Changes for v2:
- drop tcon top lcd clock patch
- add TODO text while adding tcon lcd support
- add patch for registering tcon top clock gates in probe
- change tcon-ch0 in tcon_lcd0 to CLK_TCON_LCD0
- change mod clock in dphy to tcon_top with index 3 

[1] https://patchwork.freedesktop.org/series/61310/
[2] https://patchwork.freedesktop.org/series/60847/ 
[3] https://lore.kernel.org/patchwork/cover/862766/ 
[4] https://patchwork.freedesktop.org/series/62062/

Any inputs?
Jagan.

Jagan Teki (9):
  dt-bindings: display: Add TCON LCD compatible for R40
  drm/sun4i: tcon: Add TCON LCD support for R40
  ARM: dts: sun8i: r40: Use tcon top clock index macros
  drm/sun4i: tcon_top: Use clock name index macros
  drm/sun4i: tcon_top: Register clock gates in probe
  dt-bindings: sun6i-dsi: Add R40 MIPI-DSI compatible (w/ A64 fallback)
  dt-bindings: sun6i-dsi: Add R40 DPHY compatible (w/ A31 fallback)
  ARM: dts: sun8i: r40: Add MIPI DSI pipeline
  [DO NOT MERGE] ARM: dts: sun8i-r40: bananapi-m2-ultra: Enable Bananapi S070WV20-CT16 DSI panel

 .../bindings/display/sunxi/sun4i-drm.txt      |   1 +
 .../bindings/display/sunxi/sun6i-dsi.txt      |   2 +
 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |  36 ++++++
 arch/arm/boot/dts/sun8i-r40.dtsi              |  78 ++++++++++++-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   8 ++
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c        | 103 ++++++++++--------
 6 files changed, 178 insertions(+), 50 deletions(-)

-- 
2.18.0.321.gffc6fa0e3

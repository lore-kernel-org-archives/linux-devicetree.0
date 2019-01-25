From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 00/11] ARM: sun8i: a23: Enable display pipeline
Date: Fri, 25 Jan 2019 11:23:03 +0800
Message-ID: <20190125032314.20915-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi everyone,

This series enables the display pipeline on the Allwinner A23 SoC.
A few fixes are included for corner cases when the frontend isn't
enabled.

The A23 display pipeline is very much the same as the A33, except
that the A23 does not have the SAT IP block embedded within the
display backend.

MIPI DSI is not covered as I do not have a device that uses it.

Patch 1 fixes the pll-mipi clock on the A23.

Patch 2 adds compatible strings for the various hardware blocks
of the A23 display pipeline.

Patch 3 through 5 fix some issues in our DRM plane support, namely
declaring support for formats when we shouldn't.

Patch 6 adds support for the A23 display pipeline to the driver.

Patch 7 is a small cleanup before moving the display pipeline device
nodes.

Patch 8 moves the display nodes from the A33-specific dtsi file to
the A23-A33 shared dtsi file. Note that the MIPI DSI device nodes are
not moved.

Patch 9 adds compatible strings to the display nodes in the A23-specific
dtsi file.

Patch 10 enables the display pipeline for the shared A23/A33 Q8 tablet
dtsi file. The compatible string should be filled in by the tablet dts
files.

Patch 11 fills in the compatible string for the standard A23 Q8 tablet.
Note the compatible string is not for the specific model used in the
tablet, as it varies between production runs. Rather it is just one that
works.

Please have a look. Patch 3 might be worth applying as a fix, but might
not be worth the trouble. It could just as easily be applied for -next
and then backported.

Also, the fixes tags are no longer line wrapped, unlike patches I've
sent in the past.


Regards
ChenYu

Chen-Yu Tsai (11):
  clk: sunxi-ng: sun8i-a23: Enable PLL-MIPI LDOs when ungating it
  dt-bindings: display: sun4i-drm: Add compatible strings for A23
    display
  drm/sun4i: backend: Remove BGRX8888 from list of supported formats
  drm/sun4i: layer: Assign backend pointer before calling DRM helpers
  drm/sun4i: layer: support just backend formats when frontend is
    unavailable
  drm/sun4i: Add support for A23 display pipeline
  ARM: dts: sun8i-a23-a33: Move NAND controller device node to sort by
    address
  ARM: dts: sun8i-a33: Move display pipeline nodes to a23/a33 common
    dtsi
  ARM: dts: sun8i-a23: Add compatible strings to display pipeline device
    nodes
  ARM: dts: sun8i-q8-common: Enable display pipeline with RGB LCD panel
  ARM: dts: sun8i-a23-q8: Set compatible string for LCD panel

 .../bindings/display/sunxi/sun4i-drm.txt      |   5 +
 arch/arm/boot/dts/sun8i-a23-a33.dtsi          | 175 ++++++++++++++--
 arch/arm/boot/dts/sun8i-a23-q8-tablet.dts     |   4 +
 arch/arm/boot/dts/sun8i-a23.dtsi              |  20 ++
 arch/arm/boot/dts/sun8i-a33.dtsi              | 194 ++++--------------
 arch/arm/boot/dts/sun8i-q8-common.dtsi        |  37 ++++
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c          |   2 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c         |   5 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   2 +
 drivers/gpu/drm/sun4i/sun4i_frontend.c        |   4 +
 drivers/gpu/drm/sun4i/sun4i_layer.c           |  37 +++-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   1 +
 drivers/gpu/drm/sun4i/sun6i_drc.c             |   1 +
 13 files changed, 310 insertions(+), 177 deletions(-)

-- 
2.20.1

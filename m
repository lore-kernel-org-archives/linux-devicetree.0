From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH RESEND v2 00/12] Analogix ANX6345 RGB-(e)DP bridge support
Date: Sun,  3 Feb 2019 10:54:49 -0800
Message-ID: <20190203185501.8958-1-anarsoul@gmail.com>
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
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Archit Taneja <architt@codeaurora.org>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

This patchset brings support for Analogix ANX6345 RGB-(e)DP bridge, which
is used by some Allwinner A64 laptops, such as Pinebook and Olimex
TERES-I.

It reuses some definitions from ANX78xx driver that already exists in the
kernel tree, but the driver code itself is rewritten due to significant
difference between ANX6345 and ANX78xx.

This patchset also enables the bridge on Pinebook and TERES-I and adds 1%
tolerance into dotclock check in sun4i driver in case if bridge is
connected

v2: - sort Kconfig and Makefile entries alphabetically
    - remove panel supply from anx6345
    - add support for panels into anx6345 driver
    - add compatible and binding for generic eDP panel
    - replace patch that adds 5% tolerance for dotclock check in sun4i
      driver for panel and bridges with patch that adds 1% tolerance
      in case if bridge is connected.

Icenowy Zheng (8):
  drm/bridge: move ANA78xx driver to analogix subdirectory
  drm/bridge: split some definitions of ANX78xx to dedicated headers
  drm/bridge: extract some Analogix I2C DP common code
  dt-bindings: Add ANX6345 DP/eDP transmitter binding
  drm/bridge: Add Analogix anx6345 support
  arm64: allwinner: a64: add pinmux for RGB666 LCD
  arm64: allwinner: a64: enable LCD-related hardware for Pinebook
  arm64: allwinner: a64: enable LCD-related hardware for TERES-I

Vasily Khoruzhick (4):
  drm/sun4i: rgb: Add 1% tolerance to dclk frequency check when bridge
    is connected
  drm/panel: simple: don't fail if we don't have panel desc
  dt-bindings: add binding for generic eDP panel
  drm/panel: simple: add generic eDP panel

 .../bindings/display/bridge/anx6345.txt       |  56 ++
 .../bindings/display/panel/panel-edp.txt      |   7 +
 .../dts/allwinner/sun50i-a64-pinebook.dts     |  74 ++
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts |  71 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |   9 +
 drivers/gpu/drm/bridge/Kconfig                |  10 -
 drivers/gpu/drm/bridge/Makefile               |   4 +-
 drivers/gpu/drm/bridge/analogix-anx78xx.h     | 719 ---------------
 drivers/gpu/drm/bridge/analogix/Kconfig       |  25 +
 drivers/gpu/drm/bridge/analogix/Makefile      |   4 +
 .../drm/bridge/analogix/analogix-anx6345.c    | 845 ++++++++++++++++++
 .../bridge/{ => analogix}/analogix-anx78xx.c  | 146 +--
 .../drm/bridge/analogix/analogix-anx78xx.h    | 265 ++++++
 .../drm/bridge/analogix/analogix-i2c-dptx.c   | 169 ++++
 .../drm/bridge/analogix/analogix-i2c-dptx.h   | 258 ++++++
 .../bridge/analogix/analogix-i2c-txcommon.h   | 240 +++++
 drivers/gpu/drm/panel/panel-simple.c          |  24 +-
 drivers/gpu/drm/sun4i/sun4i_rgb.c             |  16 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |   1 +
 19 files changed, 2049 insertions(+), 894 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx6345.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.txt
 delete mode 100644 drivers/gpu/drm/bridge/analogix-anx78xx.h
 create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
 rename drivers/gpu/drm/bridge/{ => analogix}/analogix-anx78xx.c (90%)
 create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.h
 create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-i2c-dptx.h
 create mode 100644 drivers/gpu/drm/bridge/analogix/analogix-i2c-txcommon.h

-- 
2.20.1

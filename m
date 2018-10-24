From: Eric Anholt <eric@anholt.net>
Subject: [PATCH 0/3] drm: tinydrm driver for adafruit PiTFT 3.5" touchscreen
Date: Wed, 24 Oct 2018 11:43:10 -0700
Message-ID: <20181024184313.2967-1-eric@anholt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, Eric Anholt <eric@anholt.net>
List-Id: devicetree@vger.kernel.org

I was going to start working on making the vc4 driver work with
tinydrm panels, but it turned out tinydrm didn't have the panel I had
previously bought.  So, last night I ported the fbtft staging
driver over to DRM.

It seems to work (with DT at
https://github.com/anholt/linux/commits/drm-misc-next-hx8357d) --
fbdev works great including rotated, and so does modetest.  However,
when X11 comes up at 16bpp, I get:

https://photos.app.goo.gl/8tuhzPFFoDGamEfk8

If I have tinydrm set a preferred bpp of 24, X looks great.  Noralf,
any ideas?

Eric Anholt (3):
  dt-bindings: new binding for Himax HX8357D display panels
  drm: Add an hx8367d tinydrm driver.
  drm/tinydrm: Fix setting of the column/page end addresses.

 .../bindings/display/himax,hx8357d.txt        |  25 ++
 drivers/gpu/drm/tinydrm/Kconfig               |  11 +
 drivers/gpu/drm/tinydrm/Makefile              |   1 +
 drivers/gpu/drm/tinydrm/hx8357d.c             | 262 ++++++++++++++++++
 drivers/gpu/drm/tinydrm/hx8357d.h             |  71 +++++
 drivers/gpu/drm/tinydrm/mipi-dbi.c            |   4 +-
 6 files changed, 372 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/himax,hx8357d.txt
 create mode 100644 drivers/gpu/drm/tinydrm/hx8357d.c
 create mode 100644 drivers/gpu/drm/tinydrm/hx8357d.h

-- 
2.19.1

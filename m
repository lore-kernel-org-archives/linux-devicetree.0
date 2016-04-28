From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 0/2 v2] drm/arcpgu: Get use of dedicated memory area for frame buffer
Date: Thu, 28 Apr 2016 17:19:54 +0300
Message-ID: <1461853196-15599-1-git-send-email-abrodkin@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This mini-series allows to allocate frame buffer memory in desired
location. Allocation of a frame buffer memory in a special memory region
allows bypassing of so-called IO Coherency aperture which is typically set
as a range 0x8z-0xAz.

I.e. all data traffic to PGU bypasses IO Coherency block
and saves its bandwidth for other peripherals.

Cc: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: devicetree@vger.kernel.org

Changes v1 -> v2:
 * Reserved memory size bumped from 16Mb to 32Mb.

 * Reserved area in AXS103 boards moved to the very end of available DDR.

Alexey Brodkin (2):
  drm/arcpgu: use dedicated memory area for frame buffer
  ARC: [axs10x] Specify reserved memory for frame buffer

 arch/arc/boot/dts/axc001.dtsi     | 22 ++++++++++++++++++++--
 arch/arc/boot/dts/axc003.dtsi     | 14 ++++++++++++++
 arch/arc/boot/dts/axc003_idu.dtsi | 14 ++++++++++++++
 arch/arc/boot/dts/axs10x_mb.dtsi  |  2 +-
 drivers/gpu/drm/arc/arcpgu_drv.c  |  6 ++++++
 5 files changed, 55 insertions(+), 3 deletions(-)

-- 
2.5.5

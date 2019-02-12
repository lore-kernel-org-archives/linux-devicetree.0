From: "Hean-Loong, Ong" <hean.loong.ong@intel.com>
Subject: [PATCHv13 0/3] Intel FPGA Video and Image Processing Suite
Date: Tue, 12 Feb 2019 10:36:20 +0800
Message-ID: <20190212023623.2646-1-hean.loong.ong@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, Rienk de Jong <rienk.dejong@quest-innovations.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, hean.loong.ong@intel.com, chin.liang.see@intel.com, Ong@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Ong, Hean Loong <hean.loong.ong@intel.com>

The FPGA FrameBuffer Soft IP could be seen  as the GPU and the DRM driver
patch here is allocating memory for information to be streamed from the
ARM/Linux to the display port.

Basically the driver just wraps the information such as the pixels to be
drawn by the Sodt IP FrameBuffer 2.

The piece of hardware in discussion is the SoC FPGA where Linux runs on
the ARM chip and the FGPA is driven by its NIOS soft core with its own
proprietary firmware.

For example the application from the ARM Linux would have to write
information on the /dev/fb0 with the information stored in the
SDRAM to be fetched by the Framebuffer 2 Soft IP and displayed
on the Display Port Monitor.

Ong Hean Loong (1):
  ARM:socfpga-defconfig Intel FPGA Video and Image Processing Suite

Ong, Hean Loong (2):
  ARM:dt-bindings:display Intel FPGA Video and Image Processing Suite
  ARM:drm ivip Intel FPGA Video and Image Processing Suite

 .../devicetree/bindings/display/altr,vip-fb2.txt   |   63 ++++
 arch/arm/configs/socfpga_defconfig                 |    5 +
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/ivip/Kconfig                       |   14 +
 drivers/gpu/drm/ivip/Makefile                      |    6 +
 drivers/gpu/drm/ivip/intel_vip_conn.c              |   91 ++++++
 drivers/gpu/drm/ivip/intel_vip_drv.c               |  335 ++++++++++++++++++++
 drivers/gpu/drm/ivip/intel_vip_drv.h               |   73 +++++
 9 files changed, 590 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/altr,vip-fb2.txt
 create mode 100644 drivers/gpu/drm/ivip/Kconfig
 create mode 100644 drivers/gpu/drm/ivip/Makefile
 create mode 100644 drivers/gpu/drm/ivip/intel_vip_conn.c
 create mode 100644 drivers/gpu/drm/ivip/intel_vip_drv.c
 create mode 100644 drivers/gpu/drm/ivip/intel_vip_drv.h

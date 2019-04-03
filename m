From: <VenkataRajesh.Kalakodima@in.bosch.com>
Subject: [PATCH 0/8] v4.19.0 Added Color Management Module
Date: Wed, 3 Apr 2019 18:44:36 +0530
Message-ID: <1554297284-14009-1-git-send-email-VenkataRajesh.Kalakodima@in.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="n"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kalakodima venkata rajesh <venkatarajesh.kalakodima@in.bosch.com>
List-Id: devicetree@vger.kernel.org

From: kalakodima venkata rajesh <venkatarajesh.kalakodima@in.bosch.com>

This patchset adds rcar- display unit color management module (CMM) function feature, Which allows correction and adjustment of the display data, through updating Look up table (gamma) and  Cubic look up table (CTM)  property values 

Base color management module reference code taken from below link,
https://github.com/renesas-rcar/du_cmm .
-	In above code, modified variable namingâ€™s and removed un used functionalities.
-	Introduce new functions for queueing cubic look up table and look up table events.

-	Implemented interfaces in color management module to set CLU /LUT table using standard DRM data structures as input.
	Look up table is a 1D-LUT that converts each of three-color components by using a lookup table. LUT is used for gamma correction.							
	Cubic look up table is a three-dimensional LUT (3D-LUT) that converts the input three-color-component data into desired three color Components by using a lookup table

-	Implemented atomic check helper functions for enable/disable LUT and CLU (Gamma and Color Transformation Matrix properties).
-	Allocated memory necessary for cubic look up table and look up table and added mode fix up callback function
-	Added update gamma and color transformation matrix properties in commit tail function, If any change in property values.

kalakodima venkata rajesh (8):
  drm: Add DU CMM support functions
  drm: Add DU CMM support boot and clk changes
  drm: rcar-du: Give a name to clu table samples
  drm: rcar-du: Refactor the code with new functions
  drm: rcar-du: Implement interfaces to set clu and lut using drm data
    structures
  drm: rcar-du: Implement atomic_check to check for gamma and ctm
    properties
  drm: rcar-du: update gamma and ctm properties in commit tail
  drm: rcar-du: Add shutdown callback function in platform_driver

 .../boot/dts/renesas/r8a7795-es1-salvator-x.dts    |    5 +
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |    5 +
 .../arm64/boot/dts/renesas/r8a7795-salvator-xs.dts |    5 +
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |   29 +-
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |    6 +-
 .../arm64/boot/dts/renesas/r8a7796-salvator-xs.dts |    4 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |   25 +-
 .../arm64/boot/dts/renesas/r8a77965-salvator-x.dts |    7 +-
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |    7 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   27 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |    4 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |    3 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |  106 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          |   35 +
 drivers/gpu/drm/rcar-du/Makefile                   |    2 +
 drivers/gpu/drm/rcar-du/rcar_du_cmm.c              | 1470 ++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |   82 ++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   28 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |   85 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   16 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |    2 +-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |    1 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |    5 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   25 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |   92 ++
 include/drm/bridge/dw_hdmi.h                       |    1 +
 include/drm/drm_atomic.h                           |   25 +
 include/drm/drm_ioctl.h                            |    7 +
 28 files changed, 2082 insertions(+), 27 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_cmm.c

-- 
2.7.4

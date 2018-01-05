From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 00/10] Xilinx ZynqMP DisplayPort subsystem DRM KMS driver
Date: Thu, 4 Jan 2018 18:05:49 -0800
Message-ID: <1515117959-18068-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This patchset adds the DRM KMS driver for Xilinx ZynqMP DisplayPort subsystem. The Xilinx ZynqMP SoC has a hardened full display pipeline which supports blending of up to 2 planes, and the encoder is DisplayPort v1.2 compatible.

This series mainly includes 2 sets: Xilinx DRM KMS (patch 1/10 - 5/10) and ZynqMP DP subsystem drivers (patch 6/10 - 10/10).

The Xilinx DRM KMS is intended as a common layer shared across other (upcoming) Xilinx sub-drivers. It helps sub-drivers for both hardened as well as soft IPs interoperate together.

ZynqMP DP subsystem driver is a sub-driver that implements corresponding drm objects (crtc, plane, encoder, connector,,,) for ZynqMP SoC display pipeline. The entire pipeline is mainly partitioned into 2 blocks: generic display logic (zynqmp_disp.c) such as blending, csc,,, and the DP transmitter logic (zynqmp_dp.c).

Thanks,
-hyun

Hyun Kwon (10):
  dt-bindings: display: xlnx: Add Xilinx kms bindings
  drm: xlnx: Add xlnx crtc of Xilinx DRM KMS
  drm: xlnx: Add xlnx fb of Xilinx DRM KMS
  drm: xlnx: Add xlnx gem of Xilinx DRM KMS
  drm: xlnx: Xilinx DRM KMS driver
  dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings
  drm: xlnx: DRM KMS driver for Xilinx ZynqMP DP subsystem display
  drm: xlnx: DRM KMS driver for Xilinx ZynqMP DisplayPort
  drm: xlnx: ZynqMP DP subsystem DRM KMS driver
  drm: xlnx: zynqmp: Add debugfs

 .../devicetree/bindings/display/xlnx/xlnx,kms.txt  |   20 +
 .../bindings/display/xlnx/xlnx,zynqmp-dpsub.txt    |   94 +
 MAINTAINERS                                        |    8 +
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/xlnx/Kconfig                       |   44 +
 drivers/gpu/drm/xlnx/Makefile                      |    5 +
 drivers/gpu/drm/xlnx/xlnx_crtc.c                   |  195 ++
 drivers/gpu/drm/xlnx/xlnx_crtc.h                   |   70 +
 drivers/gpu/drm/xlnx/xlnx_drv.c                    |  436 +++
 drivers/gpu/drm/xlnx/xlnx_drv.h                    |   22 +
 drivers/gpu/drm/xlnx/xlnx_fb.c                     |  468 +++
 drivers/gpu/drm/xlnx/xlnx_fb.h                     |   30 +
 drivers/gpu/drm/xlnx/xlnx_gem.c                    |   39 +
 drivers/gpu/drm/xlnx/xlnx_gem.h                    |   18 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c                 | 3261 ++++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_disp.h                 |   28 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   | 2168 +++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_dp.h                   |   29 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c                |  141 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h                |   19 +
 21 files changed, 7098 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,kms.txt
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.txt
 create mode 100644 drivers/gpu/drm/xlnx/Kconfig
 create mode 100644 drivers/gpu/drm/xlnx/Makefile
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_crtc.c
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_crtc.h
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_drv.c
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_drv.h
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_fb.c
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_fb.h
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_gem.c
 create mode 100644 drivers/gpu/drm/xlnx/xlnx_gem.h
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_disp.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_disp.h
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dp.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dp.h
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dpsub.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dpsub.h

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

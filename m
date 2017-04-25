From: hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Subject: [PATCHv2 0/3] Intel FPGA VIP Frame Buffer II DRM Driver
Date: Tue, 25 Apr 2017 10:06:43 +0800
Message-ID: <1493086006-4392-1-git-send-email-hean.loong.ong@intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: tien.hock.loh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ong Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Hi,

The new Intel Arria10 SOC FPGA devkit has a Display Port IP component 
which requires a new driver. This is a virtual driver in which the
FGPA hardware would enable the Display Port based on the information
and data provided from the DRM frame buffer from the OS. Basically all
all information with reagrds to resolution and bits per pixel are
pre-configured on the FPGA design and these information are fed to
the driver via the device tree information as part of the hardware 
information.

Further information can be obtained from
https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/ug/ug_vip.pdf

Ong, Hean Loong (3):
  dt-bindings: display: Intel FPGA VIP drm driver Devicetree bindings
  ARM: drm: Intel FPGA VIP Frame Buffer II drm driver
  ARM: socfpga: drm driver updates in socfpga_defconfig

 .../devicetree/bindings/display/altr,vip-fb2.txt   |  30 ++++
 arch/arm/configs/socfpga_defconfig                 |   4 +
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/ivip/Kconfig                       |  13 ++
 drivers/gpu/drm/ivip/Makefile                      |   9 +
 drivers/gpu/drm/ivip/intel_vip_conn.c              |  96 ++++++++++
 drivers/gpu/drm/ivip/intel_vip_core.c              | 171 ++++++++++++++++++
 drivers/gpu/drm/ivip/intel_vip_drv.h               |  55 ++++++
 drivers/gpu/drm/ivip/intel_vip_of.c                | 195 +++++++++++++++++++++
 10 files changed, 576 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/altr,vip-fb2.txt
 create mode 100644 drivers/gpu/drm/ivip/Kconfig
 create mode 100644 drivers/gpu/drm/ivip/Makefile
 create mode 100644 drivers/gpu/drm/ivip/intel_vip_conn.c
 create mode 100644 drivers/gpu/drm/ivip/intel_vip_core.c
 create mode 100644 drivers/gpu/drm/ivip/intel_vip_drv.h
 create mode 100644 drivers/gpu/drm/ivip/intel_vip_of.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

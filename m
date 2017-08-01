From: "Hean Loong, Ong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCHv4 0/3] Intel FPGA VIP Frame Buffer II drm driver
Date: Tue,  1 Aug 2017 10:31:31 +0800
Message-ID: <1501554694-3378-1-git-send-email-hean.loong.ong@intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Ong Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

The FPGA FrameBuffer Soft IP could be seen  as the GPU and the DRM driver patch here is allocating memory for  information to be streamed from the ARM/Linux to the display port.
Basically the driver just wraps the information such as the pixels to  be drawn by the FPGA FrameBuffer 2.
 
The piece of hardware in discussion is the SoC FPGA where Linux runs  on the ARM chip and the FGPA is driven by its NIOS soft core with its  own proprietary firmware.
 
 For example the application from the ARM Linux would have to write  information on the /dev/fb0 with the information stored in the SDRAM  to be fetched by the FPGA framebuffer IP and displayed on the Display  Port Monitor.


Ong Hean Loong (3):
  ARM:dt-bindings Intel FPGA Video and Image Processing Suite
  ARM:socfpga-defconfig Intel FPGA Video and Image Processing Suite
  DRM:ivip Intel FPGA Video and Image Processing Suite

 .../devicetree/bindings/display/altr,vip-fb2.txt   |  39 ++++
 arch/arm/configs/socfpga_defconfig                 |   6 +
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/ivip/Kconfig                       |  13 ++
 drivers/gpu/drm/ivip/Makefile                      |   9 +
 drivers/gpu/drm/ivip/intel_vip_conn.c              |  96 ++++++++++
 drivers/gpu/drm/ivip/intel_vip_core.c              | 183 ++++++++++++++++++
 drivers/gpu/drm/ivip/intel_vip_drv.h               |  54 ++++++
 drivers/gpu/drm/ivip/intel_vip_of.c                | 204 +++++++++++++++++++++
 10 files changed, 607 insertions(+)
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

From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH v2 0/3] Add support for ARM Mali Display Processors
Date: Mon, 25 Apr 2016 15:19:21 +0100
Message-ID: <1461593964-27722-1-git-send-email-Liviu.Dudau@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, DRI devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Brian Starkey <Brian.Starkey@arm.com>, David Brown <David.Brown@arm.com>
List-Id: devicetree@vger.kernel.org

Hello,

This is the second revision of the driver for the Mali Display Processors (Mali DP).
Currently, the driver supports the Display Engine found in Mali DP500, DP550
and DP650, with up to 3 planes that can be rotated by the hardware. There are
features that the hardware supports that are not currently implemented in the
driver, but in the current form it is capable of supporting X11 using fbdev
emulation as well as Wayland with pixman rendering.

Changes in v2 vs initial RFC:
 - merged malidp_crtc_mode_set_nofb into malidp_crtc_enable and removed the
   mode_set hooks. This removed the need for a custom destroy hook as well,
   switched to using drm_crtc_cleanup for that.
 - implemented proper async support for atomic page flip.
 - removed un-necessary checks and empty hooks.
 - clarifications in the bindings document for the use of interrupt-names.
 - removed the MALIDP_HW_FEATURE_DS (display split) from this version pending
   further development
 - Renamed module from malidp to mali-dp.
 - Added MAINTAINERS update

Many thanks,
Liviu

Liviu Dudau (3):
  dt/bindings: display: Add DT bindings for Mali Display Processors.
  drm/arm: Add support for Mali Display Processors
  MAINTAINERS: Add entry for Mali-DP driver

 .../devicetree/bindings/display/arm,malidp.txt     |  65 ++
 drivers/gpu/drm/arm/Kconfig                        |  16 +
 drivers/gpu/drm/arm/Makefile                       |   2 +
 drivers/gpu/drm/arm/malidp_crtc.c                  | 259 +++++++
 drivers/gpu/drm/arm/malidp_drv.c                   | 538 ++++++++++++++
 drivers/gpu/drm/arm/malidp_drv.h                   |  54 ++
 drivers/gpu/drm/arm/malidp_hw.c                    | 774 +++++++++++++++++++++
 drivers/gpu/drm/arm/malidp_hw.h                    | 189 +++++
 drivers/gpu/drm/arm/malidp_planes.c                | 337 +++++++++
 drivers/gpu/drm/arm/malidp_regs.h                  | 172 +++++
 MAINTAINERS                                        | 10 +++++++++-
 11 files changed, 2415 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/arm,malidp.txt
 create mode 100644 drivers/gpu/drm/arm/malidp_crtc.c
 create mode 100644 drivers/gpu/drm/arm/malidp_drv.c
 create mode 100644 drivers/gpu/drm/arm/malidp_drv.h
 create mode 100644 drivers/gpu/drm/arm/malidp_hw.c
 create mode 100644 drivers/gpu/drm/arm/malidp_hw.h
 create mode 100644 drivers/gpu/drm/arm/malidp_planes.c
 create mode 100644 drivers/gpu/drm/arm/malidp_regs.h

-- 
2.8.0

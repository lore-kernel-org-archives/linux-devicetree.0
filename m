From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC][PATCH 0/2] Initial support for ARM Mali Display Processors
Date: Fri,  1 Apr 2016 17:21:50 +0100
Message-ID: <1459527712-9488-1-git-send-email-Liviu.Dudau@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, David Brown <David.Brown-5wv7dgnIgG8@public.gmane.org>, Brian Starkey <Brian.Starkey-5wv7dgnIgG8@public.gmane.org>
Cc: DRI devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

Here is the public first version of the driver for the Mali Display Processors.
Currently, the driver supports the Display Engine found in Mali DP500, DP550
and DP650, with up to 3 planes that can be rotated by the hardware. There are
features that the hardware supports that are not currently implemented in the
driver, but in the current form it is capable of supporting X11 using fbdev
emulation as well as Wayland with pixman rendering.

The patchset is submitted as an RFC to gather feedback and to catch early
mistakes in the driver. I would appreciate any comments that you might have as
well as code reviews if possible.

Many thanks,
Liviu

Liviu Dudau (2):
  dt/bindings: display: Add DT bindings for Mali Display Processors.
  drm/arm: Add support for Mali Display Processors

 .../devicetree/bindings/display/arm,malidp.txt     |  65 ++
 drivers/gpu/drm/arm/Kconfig                        |  15 +
 drivers/gpu/drm/arm/Makefile                       |   2 +
 drivers/gpu/drm/arm/malidp_crtc.c                  | 279 ++++++++
 drivers/gpu/drm/arm/malidp_drv.c                   | 483 +++++++++++++
 drivers/gpu/drm/arm/malidp_drv.h                   |  49 ++
 drivers/gpu/drm/arm/malidp_hw.c                    | 774 +++++++++++++++++++++
 drivers/gpu/drm/arm/malidp_hw.h                    | 192 +++++
 drivers/gpu/drm/arm/malidp_planes.c                | 339 +++++++++
 drivers/gpu/drm/arm/malidp_regs.h                  | 172 +++++
 10 files changed, 2370 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/arm,malidp.txt
 create mode 100644 drivers/gpu/drm/arm/malidp_crtc.c
 create mode 100644 drivers/gpu/drm/arm/malidp_drv.c
 create mode 100644 drivers/gpu/drm/arm/malidp_drv.h
 create mode 100644 drivers/gpu/drm/arm/malidp_hw.c
 create mode 100644 drivers/gpu/drm/arm/malidp_hw.h
 create mode 100644 drivers/gpu/drm/arm/malidp_planes.c
 create mode 100644 drivers/gpu/drm/arm/malidp_regs.h

-- 
2.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/7] drm/vc4: Add writeback support to the VC4 driver
Date: Fri,  2 Jun 2017 10:32:05 +0200
Message-ID: <1496392332-8722-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eben Upton <eben-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Hollingworth, Gordon" <gordon-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, "Cobley, Dom" <dom-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This series adds a driver for the TXP (transposer) block which is
providing writeback support.

Note that adding support for this IP required reworking a bit how the
VC4 driver handles commits (vc4_kms.c). I also had to support a new use
case in vc4_crtc.c because the TXP IP is completely bypassing the
pixelvalve element (it's taking its data directly from the HVS FIFO).

First patch is adding a new helper to the core to wait for all pageflips
to be done. It can be used as a replacement for
drm_atomic_helper_wait_for_vblanks() when your HW is only generating
a single frame (AKA oneshot mode), which implies a single VBLANK event.
In this situation, if drm_atomic_helper_wait_for_vblanks() is called
after the VBLANK event has been sent, we face a timeout because vblank
counter (used to detect when vblanks are happening) is never updated
again.
Daniel, I'm not sure this is exactly what you had in mind when you
proposed this approach, so feel free to comment on this patch.

Patches 2 to 4 are modifying the current logic to make it work with
the TXP block.

Patches 5 and 6 are adding code to support the TXP and documenting the
bindings.
And the last patch is defining the TXP block in bcm283x.dtsi.

This series depends on Brian Starkey/Liviu Dudau patchset [1] and has
been tested on a RPi2 with the kms_writeback tests provided here [2].

Regards,

Boris

[1]https://lists.freedesktop.org/archives/dri-devel/2017-May/141796.html
[2]https://github.com/dliviu/intel-gpu-tools/tree/master

Boris Brezillon (7):
  drm: Add drm_atomic_helper_wait_for_flip_done()
  drm/vc4: Fix vblank handling
  drm/vc4: Mimic drm_atomic_helper_commit() behavior
  drm/vc4: Use drm_atomic_helper_wait_for_flip_done()
  drm/vc4: Add support for the TXP (transposer) block
  dt-bindings: Document the VC4 TXP module nodes.
  ARM: dts: bcm283x: Add Transposer block

 .../devicetree/bindings/display/brcm,bcm-vc4.txt   |  12 +
 arch/arm/boot/dts/bcm283x.dtsi                     |   6 +
 drivers/gpu/drm/drm_atomic_helper.c                |  30 ++
 drivers/gpu/drm/vc4/Makefile                       |   1 +
 drivers/gpu/drm/vc4/vc4_crtc.c                     | 206 +++++++--
 drivers/gpu/drm/vc4/vc4_debugfs.c                  |   1 +
 drivers/gpu/drm/vc4/vc4_drv.c                      |   1 +
 drivers/gpu/drm/vc4/vc4_drv.h                      |  10 +
 drivers/gpu/drm/vc4/vc4_kms.c                      |  47 +-
 drivers/gpu/drm/vc4/vc4_regs.h                     |   1 +
 drivers/gpu/drm/vc4/vc4_txp.c                      | 509 +++++++++++++++++++++
 include/drm/drm_atomic_helper.h                    |   3 +
 12 files changed, 755 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/vc4/vc4_txp.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

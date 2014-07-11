From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: [PATCH 0/8] tilcdc-panel: Backlight and GPIO devicetree support
Date: Fri, 11 Jul 2014 11:18:46 -0300
Message-ID: <1405088334-11215-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, daniel.vetter-/w4YWyX8dFk@public.gmane.org, =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello all,

This patchset adds the required changes to support an optional backlight
and GPIO for the tilcdc panel driver.

There was some code to support a backlight, but it was somewhat broken
and undocumented. I've followed the nice implementation in panel-simple
and added a similar one here.

The enable GPIO is required to turn on and off devices with such capability.
Also here, I've followed panel-simple which looks correct.

In addition to this there are very minor cosmetic cleanups and a larger
error path fix in tilcdc's DRM driver .load error path.

This patchset applies on top of drm-next branch which contains the latest
tilcdc pushed by Guido.

If at all possible, I'd like to get this merged for v3.17. If a pull request
is needed, don't hesitate to ask and I'll prepare one.

Comments and tests welcome!

Ezequiel Garcia (8):
  drm/tilcdc: Fix the error path in tilcdc_load()
  drm/tilcdc: panel: Add missing of_node_put
  drm/tilcdc: panel: Remove unused variable
  drm/tilcdc: panel: Spurious whitespace removal
  drm/tilcdc: panel: Use devm_kzalloc to simplify the error path
  drm/tilcdc: panel: Fix backlight devicetree support
  drm/tilcdc: panel: Set return value explicitly
  drm/tilcdc: panel: Add support for enable GPIO

 .../devicetree/bindings/drm/tilcdc/panel.txt       |  7 ++
 drivers/gpu/drm/tilcdc/tilcdc_drv.c                | 60 +++++++++++++++---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c              | 74 +++++++++++++++++-----
 3 files changed, 114 insertions(+), 27 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

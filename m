From: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH 0/3] Add ANX7814 I2C bridge driver
Date: Thu, 24 Mar 2016 11:41:43 +0100
Message-ID: <1458816106-11596-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, span-RZiUC8FWO7+l5r2w9Jh5Rg@public.gmane.org, nathan.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, drinkcat-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, jb.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, cawa.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, cjiao-RZiUC8FWO7+l5r2w9Jh5Rg@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

This patch set to introduces the anx7814 slimport transmitter driver. These
new series will replace the old series that can be found here [1]. The reason
why I introduce these new series is because the driver changed significantly.
The old approach used a polled state machine ans was not really well using the
kernel mode setting API. With this new driver I tried to use better the drm API
and use an interrupt driven model.

Wating for your comments...

[1] https://lwn.net/Articles/666885/

Enric Balletbo i Serra (3):
  of: Add vendor prefix for Analogix Semiconductor
  devicetree: Add ANX7814 SlimPort transmitter binding.
  drm: bridge: anx78xx: Add anx78xx driver support.

 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 .../devicetree/bindings/video/bridge/anx7814.txt   |   41 +
 drivers/gpu/drm/bridge/Kconfig                     |    8 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/anx78xx.c                   | 1433 ++++++++++++++++++++
 drivers/gpu/drm/bridge/anx78xx.h                   |  719 ++++++++++
 6 files changed, 2203 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/anx7814.txt
 create mode 100644 drivers/gpu/drm/bridge/anx78xx.c
 create mode 100644 drivers/gpu/drm/bridge/anx78xx.h

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

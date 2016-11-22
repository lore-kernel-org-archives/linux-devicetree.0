From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/2] da8xx: fix section mismatch in new drivers
Date: Tue, 22 Nov 2016 13:57:46 +0100
Message-ID: <1479819468-4016-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sekhar noticed there's a section mismatch in the da8xx-mstpri and
da8xx-ddrctl drivers. This is caused by calling
of_flat_dt_get_machine_name() which has an __init annotation.

This series addresses this issue by open coding routines that return
the machine compatible string in both drivers. Once a general function
for that in of/base is merged, we'll remove them.

v1 -> v2:
- drop patch [1/3] from v1
- introduce internal routines in the drivers instead of a general
  function in of/base.c

Bartosz Golaszewski (2):
  bus: da8xx-mstpri: drop the call to of_flat_dt_get_machine_name()
  memory: da8xx-ddrctl: drop the call to of_flat_dt_get_machine_name()

 drivers/bus/da8xx-mstpri.c    | 22 ++++++++++++++++++++--
 drivers/memory/da8xx-ddrctl.c | 22 ++++++++++++++++++++--
 2 files changed, 40 insertions(+), 4 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

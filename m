From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [RFC v2] da850: DDR2/mDDR memory controller driver
Date: Tue, 25 Oct 2016 15:41:15 +0200
Message-ID: <1477402876-22472-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a follow-up for the series[1] adding new bus and memory drivers
to better support the TI LCD controller on the da850-lcdk board.

The general consensus of the discussion that followed was that DT is
not the right tool for this kind of SoC performance tweaks.

In order to avoid committing to stable DT bindings, we only introduce
two common properties (compatible and reg) while the configuration
register values are hard-coded for each board (currently only lcdk).

In the future, once linux gets a proper framework for performance
knobs, we'll convert this driver to using the better solution.

I'm sending a single patch this time as RFC to get some reviews and
see it the approach is viewed as correct.

[1] https://lkml.org/lkml/2016/10/17/613

v1 -> v2:
- changed the compatible string to make it more descriptive
- changed the DT bindings description to describe the device, not the
  driver's functionalities
- switched to using of_machine_is_compatible() instead of handcoding
  the same functionality
- used platform_get_resource() instead of ioremapping registers by hand

Bartosz Golaszewski (1):
  ARM: memory: da8xx-ddrctl: new driver

 .../memory-controllers/ti-da8xx-ddrctl.txt         |  20 +++
 drivers/memory/Kconfig                             |   8 +
 drivers/memory/Makefile                            |   1 +
 drivers/memory/da8xx-ddrctl.c                      | 175 +++++++++++++++++++++
 4 files changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti-da8xx-ddrctl.txt
 create mode 100644 drivers/memory/da8xx-ddrctl.c

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

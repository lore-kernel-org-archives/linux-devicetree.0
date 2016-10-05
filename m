From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/2] ARM: davinci: initial infrastructure for LCDC
Date: Wed,  5 Oct 2016 15:05:30 +0200
Message-ID: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Karl Beldan <karl.beldan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

After discussing the matter with Laurent Pinchart it turned out that
using ti,tilcdc,panel was wrong and we should go with the new
simple-vga-dac driver proposed by Maxime Ripard and currently being
reviewed.

The da850-lcdk board on which I'm working has a THS8135 video DAC for
which the new driver seems to be best suited and we'll be able to
query the connected display for supported modes instead of hardcoding
them in the dt as is needed for the panel driver.

In the meantime I'm posting two patches based on Karl Beldan's
previous work that can already be merged.

The first one adds OF_DEV_AUXDATA entry to da8xx-dt.c. I changed the
compatible string to the new one we're introducing in the tilcdc
driver.

The second adds the lcd pins and the display node to da850.dtsi. As
suggested by Sekhar: I moved the pins node, which was previously in
da850-lcdk.dts, to da850.dtsi. I also squashed Karl's two patches and
removed the panel node.

Tested on a da850-lcdk with an LCD display connected over VGA with
two patches already posted to the drm mailing list:

  drm: tilcdc: add a da850-specific compatible string
  drm: tilcdc: add a workaround for failed clk_set_rate()

and some additional work-in-progress/hacks on top of that.

Karl Beldan (2):
  ARM: davinci: da8xx-dt: add OF_DEV_AUXDATA entry for lcdc
  ARM: dts: da850: add a node for the LCD controller

 arch/arm/boot/dts/da850.dtsi     | 29 +++++++++++++++++++++++++++++
 arch/arm/mach-davinci/da8xx-dt.c |  1 +
 2 files changed, 30 insertions(+)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH v5 0/2] drm/panel: simple: add support for Sharp LQ150X1LG11 panels
Date: Mon, 21 Nov 2016 16:00:47 +0100
Message-ID: <1479740449-20201-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

This patch seems to have been forgotten? Thierry said that a
resend was not needed, but time is passing and the merge window
is nearing, so I'm resending anyway with the squashed .bpc-fix.

v4 -> v5 changes:
- change sharp_lq150x1lg11.bpc to 6 as noted by Thierry
- rebased onto v4.9-rc6

v3 -> v4 changes:
- addressed review comments from Rob (lvds -> sellvds and a couple of typos).

Cheers,
Peter

Gustaf Lindström (1):
  drm/panel: simple: add support for Sharp LQ150X1LG11 panels

Peter Rosin (1):
  dt-bindings: display: Add Sharp LQ150X1LG11 panel binding

 .../bindings/display/panel/sharp,lq150x1lg11.txt   | 36 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

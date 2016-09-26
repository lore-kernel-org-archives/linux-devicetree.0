From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: [PATCH v3 0/2] drm/panel: simple: add support for Sharp LQ150X1LG11 panels
Date: Tue, 27 Sep 2016 00:27:10 +0200
Message-ID: <1474928832-8766-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Gustaf=20Lindstr=C3=B6m?= <gl-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

I'm back with a new attempt at getting this panel upstream. This time
with the bindings in a separate commit, as I hear that is preferred.

I think I covered all the pins on the panel...

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

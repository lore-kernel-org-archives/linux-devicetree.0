From: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RESEND v2 0/3] drm/bridge: add Silicon Image SiI8620 driver
Date: Wed, 11 May 2016 08:11:07 +0200
Message-ID: <1462947070-2391-1-git-send-email-a.hajda@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "open list:DRM DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Inki, Daniel,

This is RESEND of the patchset from 01-08-2016 (5 months already).
The only change is added ack for bindings, thanks Rob.
I have put Inki as the main recipient because Sii8620 is present on Samsung
dev board and since drivers of bridges have no dedicated maintainer the practice
is (am I right?) to push such drivers via DRM device maintainers.
Inki could you take a look?

I have added also Daniel to check if include/linux/mhl.h is correct enough
and in proper location, I hope I have addressed this kind request correctly.

Below original message:

This version of patchset contains fixes of interrupt pin and binding description
according to Rob Herring comments.

This patchset adds MHL bridge driver for Silicon Image SiI8620 chip.
The chip is quite powerful, supports MHL versions up to 3.0. It is present
in multiple mobile devices.

I have put common MHL definitions into include/linux/mhl.h header file,
similarily to include/linux/hdmi.h.

The patchset is based on latest exynos-drm-next branch.

Regards
Andrzej


Andrzej Hajda (3):
  video: add header file for Mobile High-Definition Link (MHL) interface
  dt-bindings: add Silicon Image SiI8620 bridge bindings
  drm/bridge: add Silicon Image SiI8620 driver

 .../bindings/video/bridge/sil-sii8620.txt          |   33 +
 drivers/gpu/drm/bridge/Kconfig                     |    7 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/sil-sii8620.c               | 1558 ++++++++++++++++++++
 drivers/gpu/drm/bridge/sil-sii8620.h               | 1517 +++++++++++++++++++
 include/linux/mhl.h                                |  292 ++++
 6 files changed, 3408 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/sil-sii8620.txt
 create mode 100644 drivers/gpu/drm/bridge/sil-sii8620.c
 create mode 100644 drivers/gpu/drm/bridge/sil-sii8620.h
 create mode 100644 include/linux/mhl.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

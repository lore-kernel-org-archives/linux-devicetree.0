From: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 0/3] drm/omap: Support for dispc memory bandwidth limit
Date: Tue, 14 Nov 2017 14:47:52 +0200
Message-ID: <20171114124755.14277-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

=EF=BB=BFHi,

Changes since v1:
- Use the crtc->mode_valid and not connector->mode_valid as the limit is re=
ally
  posed by the 'crtc' (DISPC)
- Bandwidth calculation changed: do the calculation in place + extended com=
ment
- looked for better place to document the max-memory-bandwidth, but
  can not find any suitable document. Creating a new txt file for only one
  property did not seemed feasable.

This series will add simple memory bandwidth limit support to reject modes
which, if used with one plane in full size would fail the limit.

Regards,
Peter
---
Peter Ujfalusi (3):
  dt-bindings: display/ti: Add optional property to set memory bandwidth
    limit
  drm/omap: dss: Add support for reporting memory bandwidth limitation
  drm/omap: Filter displays mode based on bandwidth limit

 .../devicetree/bindings/display/ti/ti,dra7-dss.txt |  5 +++
 .../bindings/display/ti/ti,omap2-dss.txt           |  4 +++
 .../bindings/display/ti/ti,omap3-dss.txt           |  4 +++
 .../bindings/display/ti/ti,omap4-dss.txt           |  4 +++
 .../bindings/display/ti/ti,omap5-dss.txt           |  4 +++
 drivers/gpu/drm/omapdrm/dss/dispc.c                | 13 ++++++++
 drivers/gpu/drm/omapdrm/dss/omapdss.h              |  2 ++
 drivers/gpu/drm/omapdrm/omap_crtc.c                | 37 ++++++++++++++++++=
++++
 drivers/gpu/drm/omapdrm/omap_drv.c                 |  5 +++
 drivers/gpu/drm/omapdrm/omap_drv.h                 |  3 ++
 10 files changed, 81 insertions(+)

--=20
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki


Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Bu=
siness ID: 0615521-4. Kotipaikka/Domicile: Helsinki


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

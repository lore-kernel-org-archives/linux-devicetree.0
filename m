From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/9] ipu-v3/imx-drm PRG/PRE extension
Date: Fri, 17 Feb 2017 19:28:21 +0100
Message-ID: <20170217182830.32618-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

this is the first round of patches to enable the Prefetch Resolve Gasket
and the Prefetch Resolve Engine as found on the i.MX6 QuadPlus. Basically
those units are external extensions to the IPUv3 that are able to prefetch
display data from DRAM to an internal SRAM region, transforming the
periodic realtime requests from the display FIFOs into larger bursts of
normal memory requests, which do mix better with other DRAM traffic in the
system.

The PRE can do a number of transformations on the fly, like changing
component and plane ordering, as well resolving the Vivante GPU tiling
format into linear scanlines. None of those transformations are used
right now.

This initial patchset uses the PRG/PRE units as linear prefetchers only.
It does however hook up most of the interactions between imx-drm, IPUv3
and PRG/PRE, so that adding those transformations should be an
incremental change over that. Also the devicetree binding fully describe
the devices, so that no further changes should be necessary.

Regards,
Lucas

Lucas Stach (9):
  gpu: ipu-v3: remove AXI ID setting for IC channel
  gpu: ipu-v3: add DT binding for the Prefetch Resolve Engine
  gpu: ipu-v3: add driver for Prefetch Resolve Engine
  gpu: ipu-v3: add DT binding for the Prefetch Resolve Gasket
  gpu: ipu-v3: add driver for Prefetch Resolve Gasket
  gpu: ipu-v3: extend the IPUv3 DT binding for i.MX6 QuadPlus
  gpu: ipu-v3: hook up PRG unit
  drm/imx: enable/disable PRG on CRTC enable/disable
  drm/imx: use PRG/PRE when possible

 .../bindings/display/imx/fsl-imx-drm.txt           |  53 +++
 drivers/gpu/drm/imx/imx-drm-core.c                 |   5 +
 drivers/gpu/drm/imx/imx-drm.h                      |   3 +
 drivers/gpu/drm/imx/ipuv3-crtc.c                   |   2 +
 drivers/gpu/drm/imx/ipuv3-plane.c                  | 122 +++++-
 drivers/gpu/ipu-v3/Makefile                        |   2 +-
 drivers/gpu/ipu-v3/ipu-common.c                    |   7 +
 drivers/gpu/ipu-v3/ipu-image-convert.c             |   2 -
 drivers/gpu/ipu-v3/ipu-pre.c                       | 290 +++++++++++++++
 drivers/gpu/ipu-v3/ipu-prg.c                       | 413 +++++++++++++++++++++
 drivers/gpu/ipu-v3/ipu-prv.h                       |  15 +
 include/video/imx-ipu-v3.h                         |  15 +
 12 files changed, 923 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/ipu-v3/ipu-pre.c
 create mode 100644 drivers/gpu/ipu-v3/ipu-prg.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Michael Tretter <m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 0/7] Add support for Video Data Order Adapter
Date: Mon,  2 Jan 2017 14:23:45 +0100
Message-ID: <20170102132352.23669-1-m.tretter@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Tretter <m.tretter-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

This is v3 of a patch series that adds support for the Video Data Order
Adapter (VDOA) that can be found on Freescale i.MX6. It converts the
macroblock tiled format produced by the CODA 960 video decoder to a
raster-ordered format for scanout.

Changes since v2:

- Patch 1/7: Update commit message to include binding change; fix
  spelling/style in binding documentation

Changes since v1:

- Dropped patch 8/9 of v1
- Patch 1/7: Add devicetree binding documentation for fsl-vdoa
- Patch 6/7: I merged patch 5/9 and patch 8/9 of v1 into a single patch
- Patch 6/7: Use dt compatible instead of a phandle to find VDOA device
- Patch 6/7: Always check VDOA availability even if disabled via module
  parameter and do not print a message if VDOA cannot be found
- Patch 6/7: Do not change the CODA context in coda_try_fmt()
- Patch 6/7: Allocate an additional internal frame if the VDOA is in use


Michael Tretter (3):
  [media] coda: fix frame index to returned error
  [media] coda: use VDOA for un-tiling custom macroblock format
  [media] coda: support YUYV output if VDOA is used

Philipp Zabel (4):
  [media] dt-bindings: Add a binding for Video Data Order Adapter
  [media] coda: add i.MX6 VDOA driver
  [media] coda: correctly set capture compose rectangle
  [media] coda: add debug output about tiling

 .../devicetree/bindings/media/fsl-vdoa.txt         |  21 ++
 arch/arm/boot/dts/imx6qdl.dtsi                     |   2 +
 drivers/media/platform/Kconfig                     |   3 +
 drivers/media/platform/coda/Makefile               |   1 +
 drivers/media/platform/coda/coda-bit.c             |  93 ++++--
 drivers/media/platform/coda/coda-common.c          | 175 ++++++++++-
 drivers/media/platform/coda/coda.h                 |   3 +
 drivers/media/platform/coda/imx-vdoa.c             | 335 +++++++++++++++++++++
 drivers/media/platform/coda/imx-vdoa.h             |  58 ++++
 9 files changed, 649 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl-vdoa.txt
 create mode 100644 drivers/media/platform/coda/imx-vdoa.c
 create mode 100644 drivers/media/platform/coda/imx-vdoa.h

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

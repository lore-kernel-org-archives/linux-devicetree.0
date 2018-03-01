Return-Path: <SRS0=Pbk3=FX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:50133 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1162478AbeCAWEy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 1 Mar 2018 17:04:54 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v7 0/4] R-Car DU: Convert LVDS code to bridge driver
Date: Fri,  2 Mar 2018 00:05:35 +0200
Message-Id: <20180301220540.11959-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: dri-devel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello,

This patch series addresses a design mistake that dates back from the initial
DU support. Support for the LVDS encoders, which are IP cores separate from
the DU, was bundled in the DU driver. Worse, both the DU and LVDS were
described through a single DT node.

To fix the, patches 1/4 and 2/4 define new DT bindings for the LVDS
encoders, and deprecate their description inside the DU bindings. To retain
backward compatibility with existing DT, patch 3/4 then patch the device tree
at runtime to convert the legacy bindings to the new ones.

With the DT side addressed, patch 4/4 converts the LVDS support code to a
separate bridge driver.

I decided to go for live DT patching in patch 3/4 because implementing
support for both the legacy and new bindings in the driver would have been
very intrusive, and prevented further cleanups. This version relies more
heavily on overlays to avoid touching the internals of the OF core compared to
v2, even if manual fixes to the device tree are still needed.

I plan to send a pull request by the end of the week if no new issue is
discovered.

Compared to v6, patch 3/4 now exists in two variants, to accommodate Frank's
"[PATCH v4 0/4] of: change overlay apply input data from unflattened" patch
series. If that series can't make it to v4.17, patch 3/4 variant 1 will be
used. Otherwise I will go with variant 2.

Compared to v5, I've dropped the OF changeset halpers series as Frank raised
concerns about hidding it in the middle of a driver patch series. I've thus
copied the implementation of of_changeset_add_property_copy() in the driver to
avoid blocking this series. The function arguments are identical, so when the
OF changeset helpers will land it will be very easy to drop the private copy
and use the of_changeset_add_property_copy() helper.

Compared to v4, the patch "of: changeset: Add of_changeset_node_move method"
has been dropped as it's not needed. The patches that update the DT sources to
the new DU and LVDS bindings have been dropped as well to avoid spamming the
lists as they depend on the driver changes going in first to avoid
regressions and haven't been changed.

Compared to v3, this series uses the OF changeset API to update properties
instead of accessing the internals of the property structure. This removes the
local implementation of functions to look up nodes by path and update
properties. In order to do this, I pulled in Pantelis' patch series titled
"[PATCH v2 0/5] of: dynamic: Changesets helpers & fixes" at Rob's request, and
rebased it while taking two small review comments into account.

Rob, I'd like this series to be merged in v4.17. As the changeset helpers are
now a dependency, I'd need you to merge them early (ideally on top of
v4.16-rc1) and provide a stable branch, or get your ack to merge them through
Dave's tree if they don't conflict with what you have and will queue for
v4.17.

This version also drops the small fix to the Porter board device tree that has
been queued for v4.17 already.

Compared to v2, the biggest change is in patch 3/4. Following Rob's and
Frank's reviews it was clear that modifying the unflattened DT structure of
the overlay before applying it wasn't popular. I have thus decided to use one
overlay source per SoC to move as much of the DT changes to the overlay as
possible, and only perform manual modifications (that are still needed as some
of the information is board-specific) on the system DT after applying the
overlay. As a result the overlay is parsed and applied without being modified.

Compared to v1, this series update the r8a7792 and r8a7794 device tree sources
and incorporate review feedback as described by the changelogs of individual
patches.

Laurent Pinchart (4):
  dt-bindings: display: renesas: Add R-Car LVDS encoder DT bindings
  dt-bindings: display: renesas: Deprecate LVDS support in the DU
    bindings
  drm: rcar-du: Fix legacy DT to create LVDS encoder nodes
  drm: rcar-du: Convert LVDS encoder code to bridge driver

 .../bindings/display/bridge/renesas,lvds.txt       |  56 +++
 .../devicetree/bindings/display/renesas,du.txt     |  31 +-
 MAINTAINERS                                        |   1 +
 drivers/gpu/drm/rcar-du/Kconfig                    |   6 +-
 drivers/gpu/drm/rcar-du/Makefile                   |  10 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  21 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   5 -
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          | 175 +------
 drivers/gpu/drm/rcar-du/rcar_du_encoder.h          |  12 -
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c          |  93 ----
 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h          |  24 -
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c          | 238 ----------
 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h          |  64 ---
 drivers/gpu/drm/rcar-du/rcar_du_of.c               | 334 +++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_of.h               |  20 +
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |  79 ++++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |  53 +++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |  53 +++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |  53 +++
 .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |  53 +++
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 524 +++++++++++++++++++++
 22 files changed, 1282 insertions(+), 637 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdscon.h
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c
 delete mode 100644 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_lvds.c

-- 
Regards,

Laurent Pinchart


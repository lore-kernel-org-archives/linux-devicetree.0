From: Damian Kos <dkos-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 0/6] drm: add support for Cadence MHDP DPI/DP bridge.
Date: Mon, 8 Oct 2018 22:42:06 +0100
Message-ID: <1539034953-11274-1-git-send-email-dkos@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark
 Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Damian Kos <dkos-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Piotr
 Sroka <piotrs-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: jbergsagel-l0cyMroinI0@public.gmane.org, rafalc-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org, quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello!

This is the series of patches that will add support for the Cadence's DPI/DP
bridge. Please note that this is a preliminary version of the driver and there
will be more patches in the future with updates, fixes and improvements.
Please keep that in mind when looking at FIXME/TODO/XXX comments.

Initially, MHDP driver was developed as a DRM bridge driver and was planed to
be placed in drivers/gpu/drm/bridge/mhdp.c.  However, there was already
a driver for Cadence's DP controller developed by RockChip, but that driver
uses the different DRM framework and looks like a part of a bigger system.
Both controllers (including firmware) are quite different internally
(MST/FEC/DSC support, link training done by driver, additional commands, IRQ's
etc.) but they have similar register map, except for Framer/Streamer (which is
noticeably different), so they appear similar.

The following patches contain:
- Moving common code to drivers/gpu/drm/bridge/cdns-mhdp-common.* and
  modifying it a bit (mostly new prefixes for functions and data types) so it
  can be used by two, higher level, drivers.
- Modifying existing RockChip's DP driver to use the common code after changes
  made to it (use the new cdns_mhdp_device structure and new function names).
- Modifying DRM helpers a bit. Some are required for new driver, some are
  updates from DP 1.2 to 1.3 or 1.4.
- Adding documentation for device tree bindings.
- Adding preliminary Cadence DPI/DP bridge driver.

Some of the things that will be added later on include (but are not limited
to):
- DSC support
- FEC support
- HDCP support

Changes in v2:
- Added actual description of what the patch contains, what is it for and
  what's going on here in general.
- New structure. Now we have one common low level driver + two high level
  drivers - one for RockChip with minimum changes and one, more general, for
  Cadence.
- Dropped some changes made to DRM helpers.
- Updated the device tree bindings document.

Changes in v3:
- Corrected dt-bindings document
- Enabled some clocks at startup (since FW doesn't do that anymore).
- Changed Firmware file name to match the file on Linux Firmware repo.
- Added SST audio support
- Made common functions (in cdns-mhdp-common.*) public.

Changes in v4:
- Fixed Kconfig in drm/rockchip
- Fixed Signed-offs
- dp_link_status() is no longer public since it's used only in drm_dp_helper.c
- Replaced EXTRA_CFLAGS with ccflags-y in drm/rockchip Makefile

Changes in v5:
- Fixed Kconfig in drm/rockchip again
- Moved cdn-dp-reg.h (cdns-mhdp-common.h) to include/drm/bridge instead of
    drivers/gpu/drm/bridge/
- Updated the mhdp_validate_cr function

Changes in v6:
- Added Reviewed-bys for already reviewed patches
- Dropped patch v5-0003 (that made dp_get_lane_status helper public)
- Added patch with MST support
- Added patch with Cadence SD0801 PHY init


Damian Kos (2):
  drm/rockchip: prepare common code for cdns and rk dpi/dp driver
  drm/bridge: add PHY initialization in mhdp8546 driver.

Piotr Sroka (1):
  drm/bridge: add support for MST in mhdp8546 driver

Quentin Schulz (3):
  drm/dp: fix link probing for devices supporting DP 1.4+
  dt-bindings: drm/bridge: Document Cadence MHDP bridge bindings
  drm: bridge: add support for Cadence MHDP DPI/DP bridge

 .../bindings/display/bridge/cdns,mhdp.txt     |   43 +
 drivers/gpu/drm/bridge/Kconfig                |    9 +
 drivers/gpu/drm/bridge/Makefile               |    3 +
 drivers/gpu/drm/bridge/cdns-mhdp-common.c     | 1107 +++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp-mst.c        |  594 +++++++
 drivers/gpu/drm/bridge/cdns-mhdp.c            | 1371 +++++++++++++++++
 drivers/gpu/drm/bridge/cdns-mhdp.h            |  209 +++
 drivers/gpu/drm/drm_dp_helper.c               |   30 +-
 drivers/gpu/drm/rockchip/Kconfig              |    4 +-
 drivers/gpu/drm/rockchip/Makefile             |    2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  234 +--
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |   43 +-
 drivers/gpu/drm/rockchip/cdn-dp-reg.c         |  969 ------------
 include/drm/bridge/cdns-mhdp-cbs.h            |   27 +
 .../drm/bridge/cdns-mhdp-common.h             |  174 ++-
 15 files changed, 3669 insertions(+), 1150 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp.txt
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-common.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-mst.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp.c
 create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp.h
 delete mode 100644 drivers/gpu/drm/rockchip/cdn-dp-reg.c
 create mode 100644 include/drm/bridge/cdns-mhdp-cbs.h
 rename drivers/gpu/drm/rockchip/cdn-dp-reg.h => include/drm/bridge/cdns-mhdp-common.h (77%)

-- 
2.17.1

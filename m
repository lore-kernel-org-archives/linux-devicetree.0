From: Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v12 0/5] Add Rockchip RGA V4l2 support
Date: Wed, 11 Oct 2017 15:29:33 +0800
Message-ID: <20171011072938.383-1-jacob-chen@iotwrt.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, Jacob Chen <jacob-chen-fyOeoxGR3m/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

change in V12:
- adding an entry to MAINTAINERS 
- fix checkpatch

change in V11:
- fix compile warning

change in V10:
- move to rockchip/rga
- changes according to comments
- some style changes

change in V9:
- remove protduff things
- test with the latest v4l2-compliance

change in V8:
- remove protduff things

change in V6,V7:
- correct warning in checkpatch.pl

change in V5:
- v4l2-compliance: handle invalid pxielformat
- v4l2-compliance: add subscribe_event
- add colorspace support

change in V4:
- document the controls.
- change according to Hans's comments

change in V3:
- rename the controls.
- add pm_runtime support.
- enable node by default.
- correct spelling in documents.

change in V2:
- generalize the controls.
- map buffers (10-50 us) in every cmd-run rather than in buffer-import to avoid get_free_pages failed on
actively used systems.
- remove status in dt-bindings examples.

Jacob Chen (5):
  dt-bindings: Document the Rockchip RGA bindings
  rockchip/rga: v4l2 m2m support
  MAINTAINERS: add entry for Rockchip RGA driver
  ARM: dts: rockchip: add RGA device node for RK3288
  arm64: dts: rockchip: add RGA device node for RK3399

 .../devicetree/bindings/media/rockchip-rga.txt     |   33 +
 MAINTAINERS                                        |    7 +
 arch/arm/boot/dts/rk3288.dtsi                      |   11 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |   11 +
 drivers/media/platform/Kconfig                     |   15 +
 drivers/media/platform/Makefile                    |    2 +
 drivers/media/platform/rockchip/rga/Makefile       |    3 +
 drivers/media/platform/rockchip/rga/rga-buf.c      |  154 +++
 drivers/media/platform/rockchip/rga/rga-hw.c       |  421 ++++++++
 drivers/media/platform/rockchip/rga/rga-hw.h       |  437 +++++++++
 drivers/media/platform/rockchip/rga/rga.c          | 1012 ++++++++++++++++++++
 drivers/media/platform/rockchip/rga/rga.h          |  125 +++
 12 files changed, 2231 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-rga.txt
 create mode 100644 drivers/media/platform/rockchip/rga/Makefile
 create mode 100644 drivers/media/platform/rockchip/rga/rga-buf.c
 create mode 100644 drivers/media/platform/rockchip/rga/rga-hw.c
 create mode 100644 drivers/media/platform/rockchip/rga/rga-hw.h
 create mode 100644 drivers/media/platform/rockchip/rga/rga.c
 create mode 100644 drivers/media/platform/rockchip/rga/rga.h

-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

From: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH V4 0/4] Add driver for GE B850v3 LVDS/DP++ Bridge
Date: Fri,  5 Aug 2016 00:36:57 +0200
Message-ID: <cover.1470346720.git.peter.senna@collabora.com>
References: <1464626385-19253-1-git-send-email-peter.senna@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1464626385-19253-1-git-send-email-peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

The series adds a driver that creates a drm_bridge and a drm_connector for the
LVDS to DP++ display bridge of the GE B850v3.

There are two physical bridges on the video signal pipeline: a STDP4028(LVDS to
DP) and a STDP2690(DP to DP++).  The hardware and firmware made it complicated
for this binding to comprise two device tree nodes, as the design goal is to
configure both bridges based on the LVDS signal, which leave the driver
powerless to control the video processing pipeline. The two bridges behaves as
a single bridge, and the driver is only needed for telling the host about EDID /
HPD, and for giving the host powers to ack interrupts. The video signal
pipeline is as follows:

  Host -> LVDS|--(STDP4028)--|DP -> DP|--(STDP2690)--|DP++ -> Video output

The patches from the series:
 [1/4] Change the imx-ldb driver to allow attaching a bridge and not only a LVDS
       panel.

 [2/4] Devicetree documentation for the GE B850v3 LVDS/DP++ Bridge

 [3/4] Add the driver, make changes to MAINTAINERS, Kconfig and Makefile

 [4/4] Make the changes to the B850v3 dts file to enable the GE B850v3
       LVDS/DP++ Bridge.

Changes from V3:
 - Removed the patch that was configuring the mapping between IPUs and external
   displays on the dts file

Peter Senna Tschudin (4):
  drm/imx-ldb: Add support to drm-bridge
  Documentation/devicetree/bindings: b850v3_lvds_dp
  drm/bridge: Add driver for GE B850v3 LVDS/DP++ Bridge
  dts/imx6q-b850v3: Use GE B850v3 LVDS/DP++ Bridge

 .../devicetree/bindings/ge/b850v3-lvds-dp.txt      |  37 ++
 MAINTAINERS                                        |   8 +
 arch/arm/boot/dts/imx6q-b850v3.dts                 |  30 ++
 drivers/gpu/drm/bridge/Kconfig                     |  11 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/ge_b850v3_lvds_dp.c         | 397 +++++++++++++++++++++
 drivers/gpu/drm/imx/imx-ldb.c                      | 118 +++---
 7 files changed, 562 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
 create mode 100644 drivers/gpu/drm/bridge/ge_b850v3_lvds_dp.c

-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

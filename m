From: Peter Senna Tschudin <peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH V7 0/4] Add driver for GE B850v3 LVDS/DP++ Bridge
Date: Sun,  1 Jan 2017 21:24:28 +0100
Message-ID: <cover.1483301745.git.peter.senna@collabora.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, jslaby-AlSwsSmVLrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, martyn.welch-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, peter.senna-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, peter.senna-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
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

This series depends on commit dc80d7038883 ("drm/imx-ldb: Add support to
drm-bridge") which is already on linux-next.

The patches from the series:
 [1/4] Devicetree documentation for the GE B850v3 LVDS/DP++ Bridge

 [2/4] Update the MAINTAINERS file

 [3/4] Add the driver, make changes to Kconfig and Makefile

 [4/4] Make the changes to the B850v3 dts file to enable the GE B850v3
       LVDS/DP++ Bridge.

Tested on next20161224.

Changes from V6:
 - Removed check for pixel clock as the bridge supports up to 330Mhz while the
   host is limited to 264 MHz in very specific conditions.
 - Added a second mutex to avoid concurrency issues while acking interrupts
   from threaded interrupt handlers.
 - Renamed the edid mutex to be more descriptive.
 - Added a .detach() function that disables the interrupts.
 - Adopted i2c_new_secondary_device() and updated the dts and documentation to
   match the new method.
 - Removed useless test to drm_bridge_add()
 - Did some refactoring around devm_request_threaded_irq()
 - Added a missing call to i2c_unregister_device() on the i2c_driver.remove()
   function.

Changes from V5:
 - Change to MAINTAINERS in a separate patch
 - Reworked interrupt handler initialization
 - Removed useless calls to: drm_connector_register(),
   drm_helper_hpd_irq_event(), and drm_bridge_enable()

Changes from V4:
 - Renamed the i2c_driver.name from "ge,b850v3-lvds-dp" to "b850v3-lvds-dp" to
   remove the comma from the driver name

Changes from V3:
 - Removed the patch that was configuring the mapping between IPUs and external
   displays on the dts file

Peter Senna Tschudin (4):
  Documentation/devicetree/bindings: b850v3_lvds_dp
  MAINTAINERS: Add entry for GE B850v3 LVDS/DP++ Bridge
  drm/bridge: Add driver for GE B850v3 LVDS/DP++ Bridge
  dts/imx6q-b850v3: Use GE B850v3 LVDS/DP++ Bridge

 .../devicetree/bindings/ge/b850v3-lvds-dp.txt      |  39 +++
 MAINTAINERS                                        |   8 +
 arch/arm/boot/dts/imx6q-b850v3.dts                 |  30 ++
 drivers/gpu/drm/bridge/Kconfig                     |  11 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 drivers/gpu/drm/bridge/ge_b850v3_lvds_dp.c         | 384 +++++++++++++++++++++
 6 files changed, 473 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ge/b850v3-lvds-dp.txt
 create mode 100644 drivers/gpu/drm/bridge/ge_b850v3_lvds_dp.c

-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

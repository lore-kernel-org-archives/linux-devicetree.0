From: <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH 0/3] Yet another stab at a fpga framework
Date: Fri, 1 Aug 2014 17:28:35 -0500
Message-ID: <1406932118-13885-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pavel-ynQEQJNshbs@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

[resend with fixed email settings]

The idea of the framework is to provide consistent ways of
programming raw images into FPGA's.

Programming from device tree overlays is supported.

The core (fpga-mgr.c) does not include a userspace interface
and just exports kernel functions.

This approach separates the core from the interfaces.

Each interface can be enabled or disabled in the defconfig.
In some production contexts, interfaces that might be used
during development can be disabled.

The core exports kernel functions to:
  * write the fpga from a buffer or using the firmware layer
  * get fpga status
  * find a particular fpga manager from a device tree phandle
  * register/unregister lower level fpga drivers.

The bus allows us to:
  * program fpga from a device tree overlay using firmware.
  * automatically reload firmware and reprogram fpga during resume.

The sysfs interface:
  * read only, get the name and status of fpga manager.

I have a configfs interface patch which I haven't included,
adds configfs as a separate file.

TODO:
  * Enable bridges after fpga programming, disable during suspend

Alan Tull (3):
  fpga manager framework core
  fpga bus driver
  fpga sysfs interface

 drivers/Kconfig          |    2 +
 drivers/Makefile         |    1 +
 drivers/fpga/Kconfig     |   27 +++
 drivers/fpga/Makefile    |   12 ++
 drivers/fpga/bus.c       |  145 ++++++++++++++++
 drivers/fpga/fpga-mgr.c  |  431 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/fpga/sysfs.c     |   69 ++++++++
 include/linux/fpga-mgr.h |  137 +++++++++++++++
 8 files changed, 824 insertions(+)
 create mode 100644 drivers/fpga/Kconfig
 create mode 100644 drivers/fpga/Makefile
 create mode 100644 drivers/fpga/bus.c
 create mode 100644 drivers/fpga/fpga-mgr.c
 create mode 100644 drivers/fpga/sysfs.c
 create mode 100644 include/linux/fpga-mgr.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

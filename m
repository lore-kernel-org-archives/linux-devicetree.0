From: <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH v2 0/3] FPGA Framework with DT and sysfs support
Date: Wed, 22 Oct 2014 14:50:02 -0500
Message-ID: <1414007405-32186-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-ynQEQJNshbs@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Followup to "Yet another stab at a fpga framework"
(https://lkml.org/lkml/2014/8/1/517)

One of the problems with writing this framework has been the
wide variety of use cases.  My perspective has mostly been
for a fpga bolted to a SoC.  Having said that, I really hope
this can be useful for as many uses as possible, while still
being integrated into the kernel in a way that is Linux-like.

Three basic methods of programming a FPGA are supported:
 * Load firmware using sysfs (see patch 0002 header for example)
 * Load firmware using Device Tree overlay (see patch 0003)
 * The core fpga-mgr.c exports enough functions for any driver
   to use to get the FPGA programmed.  If someone needs another
   interface, the core functions should give enough
   functionality to make that possible.

If the fpga is programmed using firmware, resume is supported.

Big looming problem in firmware class for us here is that FPGA
image files can easily be 10's to 100's of megabytes.  If we
have FPGA's that are chained, the image file for several FPGA's
is concatenated.  So then you can multiply that.

High level changes from previous version:
 * I went ahead and put the sysfs interface into the core
   although I think it could just as well be separate.
 * Rework the state/status stuff to stop the programming
   steps.  In the event of error, the state machine is left
   at a state with '_ERR' in its name. state is available
   in sysfs, including these error states.
 * Added ability to reset the FPGA from sysfs.  If people
   like this, let me know.  If not it may not be needed as
   that should happen in the normal programming steps.

bus.c adds support for programming from Device Tree overlays.
That code was tested from Pantelis' branch; the rest of this
was tested on for-next.

Alan


Alan Tull (3):
  fpga manager: add sysfs interface document
  fpga manager: framework core
  fpga manager: bus driver

 Documentation/ABI/testing/sysfs-class-fpga-manager |   38 ++
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/fpga/Kconfig                               |   28 +
 drivers/fpga/Makefile                              |   11 +
 drivers/fpga/bus.c                                 |  124 +++++
 drivers/fpga/fpga-mgr.c                            |  551 ++++++++++++++++++++
 include/linux/fpga-mgr.h                           |  117 +++++
 8 files changed, 872 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-manager
 create mode 100644 drivers/fpga/Kconfig
 create mode 100644 drivers/fpga/Makefile
 create mode 100644 drivers/fpga/bus.c
 create mode 100644 drivers/fpga/fpga-mgr.c
 create mode 100644 include/linux/fpga-mgr.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

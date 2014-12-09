From: <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH v3 0/3] FPGA Manager Framework
Date: Tue, 9 Dec 2014 10:27:58 -0600
Message-ID: <1418142481-6167-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-ynQEQJNshbs@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Improvements in this version:

Fixed things in the framework that were left over from my original
version that was a character driver.  In particular, make the
struct device be present in the fpga_manager struct, not as a
pointer, so container_of will work.

Also rewrote the part that handles DT notifications.  Now this
section takes notifications instead of being another device to
load/unload.

Still want to integrate bridge enable/disable with this, but
that's not done yet.

Alan Tull (3):
  fpga manager: add sysfs interface document
  fpga manager: framework core
  fpga manager: device tree overlay support

 Documentation/ABI/testing/sysfs-class-fpga-manager |   38 ++
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/fpga/Kconfig                               |   28 +
 drivers/fpga/Makefile                              |   10 +
 drivers/fpga/fpga-mgr.c                            |  587 ++++++++++++++++++++
 include/linux/fpga-mgr.h                           |  107 ++++
 7 files changed, 773 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-manager
 create mode 100644 drivers/fpga/Kconfig
 create mode 100644 drivers/fpga/Makefile
 create mode 100644 drivers/fpga/fpga-mgr.c
 create mode 100644 include/linux/fpga-mgr.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

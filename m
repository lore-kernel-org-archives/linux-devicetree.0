From: <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH v2 0/3] fpga bridge framework
Date: Thu, 23 Oct 2014 18:51:04 -0500
Message-ID: <1414108267-22058-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, iws-lulEs6mt1IksTUYHLfqkUA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-ynQEQJNshbs@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, philip-6RQC9ztksjxg9hUCZPvPmw@public.gmane.org, rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org, s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, kyle.teske-acOepvfBmUk@public.gmane.org, nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, cesarb-PWySMVKUnqmsTnJN9+BGXg@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mgerlach-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, yvanderv-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>

Followup to bridge framework that was posted on 2013/10/3

This is a driver for enabling/disabling the fpga bridges under control
of a sys entry.  It has a common framework and individual drivers for
the various bridges.

This framework uses the reset driver where appropriate.

Alan


Alan Tull (3):
  add sysfs document for fpga bridges
  ARM: dts: socfpga: fpga bridges bindings docs
  fpga bridge driver

 Documentation/ABI/testing/sysfs-class-fpga-bridge  |    5 +
 .../bindings/fpga/altera-fpga2sdram-bridge.txt     |   57 +++++
 .../bindings/fpga/altera-hps2fpga-bridge.txt       |   53 +++++
 drivers/misc/Kconfig                               |    3 +-
 drivers/misc/Makefile                              |    1 +
 drivers/misc/fpga-bridge/Kconfig                   |   20 ++
 drivers/misc/fpga-bridge/Makefile                  |    6 +
 drivers/misc/fpga-bridge/altera-fpga2sdram.c       |  236 ++++++++++++++++++++
 drivers/misc/fpga-bridge/altera-hps2fpga.c         |  220 ++++++++++++++++++
 drivers/misc/fpga-bridge/fpga-bridge.c             |  230 +++++++++++++++++++
 drivers/misc/fpga-bridge/fpga-bridge.h             |   51 +++++
 11 files changed, 881 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-bridge
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
 create mode 100644 drivers/misc/fpga-bridge/Kconfig
 create mode 100644 drivers/misc/fpga-bridge/Makefile
 create mode 100644 drivers/misc/fpga-bridge/altera-fpga2sdram.c
 create mode 100644 drivers/misc/fpga-bridge/altera-hps2fpga.c
 create mode 100644 drivers/misc/fpga-bridge/fpga-bridge.c
 create mode 100644 drivers/misc/fpga-bridge/fpga-bridge.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

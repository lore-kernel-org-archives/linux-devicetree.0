From: Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: [PATCH v17 0/6] Device Tree support for FPGA Programming
Date: Thu, 25 Feb 2016 17:25:05 -0600
Message-ID: <1456442711-29138-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org
Cc: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
List-Id: devicetree@vger.kernel.org

v17 has a rewrite of devicetree/bindings/fpga/fpga-region.txt for clarity
and uses the overlay notifications that I've introduced and are being
discussed.

I'm mostly submitting to see if the bindings are looking acceptable-ish.

The bridge has been stable a long time.  I hope that can go in also.

Alan Tull (6):
  fpga: add bindings document for fpga region
  ARM: socfpga: add bindings document for fpga bridge drivers
  add sysfs document for fpga bridge class
  fpga: add fpga bridge framework
  fpga: fpga-region: device tree control for FPGA
  ARM: socfpga: fpga bridge driver support

 Documentation/ABI/testing/sysfs-class-fpga-bridge  |   11 +
 .../bindings/fpga/altera-fpga2sdram-bridge.txt     |   15 +
 .../bindings/fpga/altera-hps2fpga-bridge.txt       |   47 ++
 .../devicetree/bindings/fpga/fpga-region.txt       |  491 +++++++++++++++++
 drivers/fpga/Kconfig                               |   21 +
 drivers/fpga/Makefile                              |    7 +
 drivers/fpga/altera-fpga2sdram.c                   |  174 ++++++
 drivers/fpga/altera-hps2fpga.c                     |  213 ++++++++
 drivers/fpga/fpga-bridge.c                         |  388 ++++++++++++++
 drivers/fpga/fpga-region.c                         |  555 ++++++++++++++++++++
 include/linux/fpga/fpga-bridge.h                   |   55 ++
 include/linux/fpga/fpga-mgr.h                      |    2 +
 12 files changed, 1979 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-bridge
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-fpga2sdram-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/altera-hps2fpga-bridge.txt
 create mode 100644 Documentation/devicetree/bindings/fpga/fpga-region.txt
 create mode 100644 drivers/fpga/altera-fpga2sdram.c
 create mode 100644 drivers/fpga/altera-hps2fpga.c
 create mode 100644 drivers/fpga/fpga-bridge.c
 create mode 100644 drivers/fpga/fpga-region.c
 create mode 100644 include/linux/fpga/fpga-bridge.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

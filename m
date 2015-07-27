From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/5] iio: adc: hi8435: Add Holt HI-8435 threshold detector
Date: Tue, 28 Jul 2015 02:05:00 +0300
Message-ID: <1438038300-12855-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This adds the folowing:
- Holt threshold detector driver for HI-8435 chip
- Add Holt vendor prefix
- Document HI-8435 DT bindings
- Add periodic polling functionality to SYSFS trigger
- Support triggered events

PDF file can be found here:
http://www.holtic.com/products/3081-hi-8435.aspx

Vladimir Barinov (3):
[1/5] iio: adc: hi8435: Holt HI-8435 threshold detector
[2/5] dt: Add vendor prefix 'holt'
[3/5] dt: Document Holt HI-8435 bindings
[4/5] iio: trigger: Add periodic polling to SYSFS trigger
[5/5] iio: Support triggered events

---
This patchset is against the 'kernel/git/torvalds/linux.git' repo.

 Documentation/ABI/testing/sysfs-bus-iio-adc-hi8435    |   76 ++
 Documentation/ABI/testing/sysfs-bus-iio-trigger-sysfs |   11 
 Documentation/devicetree/bindings/iio/adc/hi8435.txt  |   25 
 Documentation/devicetree/bindings/vendor-prefixes.txt |    1 
 drivers/iio/Kconfig                                   |    6 
 drivers/iio/Makefile                                  |    1 
 drivers/iio/adc/Kconfig                               |   11 
 drivers/iio/adc/Makefile                              |    1 
 drivers/iio/adc/hi8435.c                              |  659 ++++++++++++++++++
 drivers/iio/industrialio-core.c                       |    4 
 drivers/iio/industrialio-trigger.c                    |   12 
 drivers/iio/industrialio-triggered-event.c            |   67 +
 drivers/iio/trigger/iio-trig-sysfs.c                  |   58 +
 include/linux/iio/iio.h                               |    1 
 include/linux/iio/triggered_event.h                   |   11 
 15 files changed, 940 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-hi8435
 create mode 100644 drivers/iio/adc/hi8435.c
 create mode 100644 Documentation/devicetree/bindings/iio/adc/hi8435.txt
 create mode 100644 drivers/iio/industrialio-triggered-event.c
 create mode 100644 include/linux/iio/triggered_event.h

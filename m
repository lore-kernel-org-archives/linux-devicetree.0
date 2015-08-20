From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v4 0/4] iio: adc: hi8435: Add Holt HI-8435 threshold detector
Date: Thu, 20 Aug 2015 22:37:01 +0300
Message-ID: <1440099421-4762-1-git-send-email-vladimir.barinov@cogentembedded.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, cory.tusar@pid1solutions.com
List-Id: devicetree@vger.kernel.org

Hello,

This adds the folowing:
- Support triggered events
- Add Holt vendor prefix
- Holt threshold detector driver for HI-8435 chip
- Document HI-8435 DT bindings

PDF file can be found here:
http://www.holtic.com/products/3081-hi-8435.aspx

Vladimir Barinov (4):
[1/4] iio: Support triggered events
[2/4] dt: Add vendor prefix 'holt'
[3/4] iio: adc: hi8435: Holt HI-8435 threshold detector
[4/4] dt: Document Holt HI-8435 bindings

---
This patchset is against the 'kernel/git/jic23/iio.git' repo, 'togreg' branch.

 Documentation/ABI/testing/sysfs-bus-iio               |    1 
 Documentation/ABI/testing/sysfs-bus-iio-adc-hi8435    |   39 +
 Documentation/devicetree/bindings/iio/adc/hi8435.txt  |   21 
 Documentation/devicetree/bindings/vendor-prefixes.txt |    1 
 drivers/iio/Kconfig                                   |    6 
 drivers/iio/Makefile                                  |    1 
 drivers/iio/adc/Kconfig                               |   11 
 drivers/iio/adc/Makefile                              |    1 
 drivers/iio/adc/hi8435.c                              |  535 ++++++++++++++++++
 drivers/iio/industrialio-core.c                       |    4 
 drivers/iio/industrialio-trigger.c                    |   12 
 drivers/iio/industrialio-triggered-event.c            |   68 ++
 include/linux/iio/iio.h                               |    3 
 include/linux/iio/triggered_event.h                   |   11 
 14 files changed, 710 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-adc-hi8435
 create mode 100644 Documentation/devicetree/bindings/iio/adc/hi8435.txt
 create mode 100644 drivers/iio/adc/hi8435.c
 create mode 100644 drivers/iio/industrialio-triggered-event.c
 create mode 100644 include/linux/iio/triggered_event.h

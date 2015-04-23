From: Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/4] Add support for BMC150 magnetometer
Date: Thu, 23 Apr 2015 21:34:04 +0300
Message-ID: <1429814048-22808-1-git-send-email-irina.tirdea@intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is the second version for adding support for Bosch BMC150
magnetometer. It mostly contains fixes suggested by Jonathan.

Changes in v2:
 - renamed IIO_CHAN_INFO_CALIBREPETITIONS to IIO_CHAN_INFO_OVERSAMPLING_RATIO
 - split the main patch in two patches: one that adds main functionality and
another that adds oversampling_ratio
 - fixed driver code and device tree bindings according to Jonathan's review
 - updated the available sampling frequencies depending on oversampling_ratio

Irina Tirdea (4):
  iio: magn: Add support for BMC150 magnetometer
  iio: magn: bmc150_magn: Add devicetree binding documentation
  iio: core: Introduce IIO_CHAN_INFO_OVERSAMPLING_RATIO
  iio: magn: bmc150_magn: add oversampling ratio

 Documentation/ABI/testing/sysfs-bus-iio            |   12 +
 .../bindings/iio/magnetometer/bmc150_magn.txt      |   22 +
 drivers/iio/industrialio-core.c                    |    1 +
 drivers/iio/magnetometer/Kconfig                   |   14 +
 drivers/iio/magnetometer/Makefile                  |    2 +
 drivers/iio/magnetometer/bmc150_magn.c             | 1111 ++++++++++++++++++++
 include/linux/iio/iio.h                            |    1 +
 7 files changed, 1163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/bmc150_magn.txt
 create mode 100644 drivers/iio/magnetometer/bmc150_magn.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

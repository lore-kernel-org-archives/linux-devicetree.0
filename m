From: Andreas Klinger <ak-n176/SwNRljddJNmlsFzeA@public.gmane.org>
Subject: [PATCH 0/2] iio: distance: devantech srf04 us ranger
Date: Sun, 29 Jan 2017 00:57:48 +0100
Message-ID: <20170128235748.GA4775@andreas>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, shraddha.6596-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, w@1wt.eu, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sjenning-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, ksenija.stanojevic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ak-n176/SwNRljddJNmlsFzeA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds support for the devantech srf04 ultrasonic ranger as
IIO device.

The device is able to recognize objects in a range of 1 cm and 3 meters.
The theoretical resolution is about 3 mm, practically more or less 1 cm.

Use cases for this device are level metering in tanks or distance measuring
in robotics.

This driver works by triggering the device and waiting for the echo, for
which a GPIO is set when send out and reset when the echo is received. 
The echo must be an interrupt and the time between rising and falling is
measured.

The returned distance is calculated with a ultrasonic speed of 343 m/s
which is the correct value at 20 degrees celsius.
For different temperatures one might want to compensate the temperature.
Look at the source code for details.

Documenation can be found at:
http://www.robot-electronics.co.uk/htm/srf04tech.htm

Andreas Klinger (2):
  iio: distance: add dt binding for devantech-srf04
  iio: distance: add devantech us ranger srf04

 .../bindings/iio/proximity/devantech-srf04.txt     |  17 ++
 MAINTAINERS                                        |   6 +
 drivers/iio/proximity/Kconfig                      |  11 +
 drivers/iio/proximity/Makefile                     |   1 +
 drivers/iio/proximity/srf04.c                      | 269 +++++++++++++++++++++
 5 files changed, 304 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/devantech-srf04.txt
 create mode 100644 drivers/iio/proximity/srf04.c

-- 
2.1.4

From: Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 0/3] iio:magnetometer:ak8975: fix and enhancements
Date: Thu, 17 Mar 2016 17:43:25 +0100
Message-ID: <cover.1458231723.git.gregor.boirie@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Irina Tirdea <irina.tirdea-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Baluta <daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Gregor Boirie <gregor.boirie-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Various fixes and enhancements for the ak8975 magnetometers family driver.

Changes since v1:
* get rid of silly le16 to cpu conversion since SMBUS handles this for us when
  reading words (patch 3/6)
* get rid of axes caching and serialize bus access between trigger handler and
  read_raw
* pack triggered buffer sampling bus accesses into a single SMBUS data block
  access
* use channel address within read_raw

Changes since v2:
* use devm_regulator_get to allow dummy regulator usage
* ensure regulator is properly disabled
* drop first 3 patches since applied
* document in_magn_matrix sysfs attribute
* single line comments where appropriate
* remove explicit zero init for shift field of iio_chan_spec structure as that's
  the default
* drop unnecessary ak8975_read_axis signature modification
* remove useless cosmetic changes related to ak8975_channels
* normalize and make error handling code paths clearer
* make ak8975_remove less nitpick'able :)

Gregor.

Gregor Boirie (3):
  iio:magnetometer:ak8975: fix missing regulator_disable
  iio:magnetometer:ak8975: mounting matrix support
  iio:magnetometer:ak8975: triggered buffer support

 Documentation/ABI/testing/sysfs-bus-iio-ak8975     |  46 ++++
 .../bindings/iio/magnetometer/ak8975.txt           |  10 +
 drivers/iio/magnetometer/Kconfig                   |   2 +
 drivers/iio/magnetometer/ak8975.c                  | 255 +++++++++++++++++----
 4 files changed, 271 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-ak8975

-- 
2.1.4

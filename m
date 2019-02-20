From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 0/9] iio mount matrix - revitalize missing bindings documentation and provide code for bmc150, bmg160, bma180, itg3200, hmc584x
Date: Wed, 20 Feb 2019 15:00:47 +0100
Message-ID: <cover.1550671256.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>
Cc: letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch series adds the mount-matrix to several iio sensor drivers
used in handheld devices.

The mount-matrix translates the quite arbitrary orientation of the sensor
on some printed circuit board to user-tangible orientation in handheld
devices that relates to typical screen orientation.

There was a bindings documentation by Linus Walleij but the patch
did not make it into mainline. Therefore I resend it here.

Next I have added some clarifications (at least I hope it clarifies)
in a second patch.

Finally, the patch set implements the hooks for the mount matrix
in several iio drivers: bmc150, bma180, bmg160, itg3200, hmc5843.
This includes also one patch for the bma180 to convert it to devm API.

We use them in different variants of the omap3-gta04 so a separate
patch set will provide device tree additions for them.


H. Nikolaus Schaller (8):
  iio: bindings: clarifications for mount-matrix bindings
  iio: accel: bmc150: add mount matrix support
  iio: accel: bma180: add mount matrix support
  iio: accel: bma180: convert to devm
  iio: gyro: bmg160: add mount matrix support
  iio: gyro: itg3200: add mount matrix support
  iio: magnetometer: bmc150: add mount matrix support
  iio: magnetometer: hmc5843: add mount matrix support

Linus Walleij (1):
  iio: document bindings for mounting matrices

 .../devicetree/bindings/iio/mount-matrix.txt  | 162 ++++++++++++++++++
 drivers/iio/accel/bma180.c                    |  70 ++++----
 drivers/iio/accel/bmc150-accel-core.c         |  19 ++
 drivers/iio/gyro/bmg160_core.c                |  19 ++
 drivers/iio/gyro/itg3200_core.c               |  18 ++
 drivers/iio/magnetometer/bmc150_magn.c        |  19 ++
 drivers/iio/magnetometer/hmc5843.h            |   1 +
 drivers/iio/magnetometer/hmc5843_core.c       |  14 ++
 include/linux/iio/gyro/itg3200.h              |   1 +
 9 files changed, 288 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/mount-matrix.txt

-- 
2.19.1

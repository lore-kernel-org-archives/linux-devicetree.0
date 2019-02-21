From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 00/10] iio mount matrix - revitalize missing bindings documentation and provide code for bmc150, bmg160, bma180, itg3200, hmc584x
Date: Thu, 21 Feb 2019 18:02:45 +0100
Message-ID: <cover.1550768574.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, Song Qiang <songqiang1304521@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Martin Kelly <mkelly@xevo.com>, Jonathan Marek <jonathan@marek.ca>, Brian Masney <masneyb@onstation.org>, Stephan Gerhold <stephan@gerhold.net>
Cc: letux-kernel@openphoenux.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Fixes V2:
* make get_mount_matrix() functions more readable (use temp variable)
  (suggested by Jonathan and Andy)
* add these readability improvements also for ak8975 and mpu6050
  (suggested by Jonathan and Andy)
* squash bindings documentation into single commit for better discussion
  (suggested by Linus)
* FOR DISCUSSION: add some more clarifications to the bindings documentation
  and an attempt to define the magnetometer orientation
* add "iio: Allow to read mount matrix from ACPI" to the beginning of
  the series to make it compile
  (suggested by Andy)
* replace of_iio_read_mount_matrix() by iio_read_mount_matrix()
  (required by "iio: Allow to read mount matrix from ACPI")
* drop patch to convert bma180 to devm (potential race)
  (suggested by Jonathan)

PATCH V1 2019-02-20 15:01:02:
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


Andy Shevchenko (1):
  iio: Allow to read mount matrix from ACPI

H. Nikolaus Schaller (8):
  iio: accel: bmc150: add mount matrix support
  iio: accel: bma180: add mount matrix support
  iio: gyro: bmg160: add mount matrix support
  iio: gyro: itg3200: add mount matrix support
  iio: magnetometer: bmc150: add mount matrix support
  iio: magnetometer: hmc5843: add mount matrix support
  iio: mpu6050: improve code readability
  iio: ak8975: improve code readability

Linus Walleij (1):
  iio: document bindings for mounting matrices

 .../devicetree/bindings/iio/mount-matrix.txt  | 204 ++++++++++++++++++
 drivers/iio/accel/bma180.c                    |  18 +-
 drivers/iio/accel/bmc150-accel-core.c         |  21 ++
 drivers/iio/accel/kxsd9.c                     |   4 +-
 drivers/iio/gyro/bmg160_core.c                |  21 ++
 drivers/iio/gyro/itg3200_core.c               |  20 ++
 drivers/iio/gyro/mpu3050-core.c               |   3 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c    |  10 +-
 drivers/iio/industrialio-core.c               |  46 ++--
 drivers/iio/magnetometer/ak8974.c             |   5 +-
 drivers/iio/magnetometer/ak8975.c             |  13 +-
 drivers/iio/magnetometer/bmc150_magn.c        |  21 ++
 drivers/iio/magnetometer/hmc5843.h            |   1 +
 drivers/iio/magnetometer/hmc5843_core.c       |  20 +-
 include/linux/iio/gyro/itg3200.h              |   1 +
 include/linux/iio/iio.h                       |   4 +-
 16 files changed, 361 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/mount-matrix.txt

-- 
2.19.1

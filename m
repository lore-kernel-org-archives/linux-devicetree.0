From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH v2 0/3] add support for Sensirion SPS30 PM sensor
Date: Thu,  6 Dec 2018 22:04:40 +0100
Message-ID: <20181206210443.21052-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, jic23@jic23.retrosnub.co.uk, a.brauchli@elementarea.net, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch series adds support for Sensirion SPS30 particulate matter
sensor. Along with a driver itself, new channel type and modifiers
for distinguishing between coarse and fine particles measurements are
introduced.

Sensor datasheet can be downloaded from

https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/0_Datasheets/Particulate_Matter/Sensirion_PM_Sensors_SPS30_Datasheet.pdf

v2:
 * add support for PM1 and PM4 measurements
 * get rid of variable length arrays
 * do proper cleanup via devm_add_action_or_reset()
 * add extra level of precision (two decimal places) while displaying
   measurements
 * improve comments a little bit
 * slight refactoring and general improvements here and there

Tomasz Duszynski (3):
  iio: add IIO_MASSCONCENTRATION channel type
  iio: chemical: add support for Sensirion SPS30 sensor
  iio: chemical: sps30: add device tree support

 Documentation/ABI/testing/sysfs-bus-iio       |  17 +-
 .../bindings/iio/chemical/sensirion,sps30.txt |  12 +
 drivers/iio/chemical/Kconfig                  |  11 +
 drivers/iio/chemical/Makefile                 |   1 +
 drivers/iio/chemical/sps30.c                  | 406 ++++++++++++++++++
 drivers/iio/industrialio-core.c               |   5 +
 include/uapi/linux/iio/types.h                |   5 +
 tools/iio/iio_event_monitor.c                 |  10 +
 8 files changed, 466 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/sensirion,sps30.txt
 create mode 100644 drivers/iio/chemical/sps30.c

--
2.19.2

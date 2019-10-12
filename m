From: Dan Robertson <dan@dlrobertson.com>
Subject: [PATCH v3 0/2] iio: add driver for Bosch BMA400 accelerometer
Date: Sat, 12 Oct 2019 19:25:23 +0000
Message-ID: <20191012192525.21040-1-dan@dlrobertson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, devicetree@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Dan Robertson <dan@dlrobertson.com>
List-Id: devicetree@vger.kernel.org

This patchset adds a IIO driver for the Bosch BMA400 3-axes ultra low-power
accelerometer.  The initial implementation of the driver adds read support for
the acceleration and temperature data registers. The driver also has support
for reading and writing to the output data rate, oversampling ratio, and scale
configuration registers.

Version 3 implements the feedback from reviewers of the v2 patchset.

Cheers,

 - Dan

Changes in v3:

 * Use yaml format for DT bindings
 * Remove strict dependency on OF
 * Tidy Kconfig dependencies
 * Stylistic changes
 * Do not soft-reset device on remove

Changes in v2:

 * Implemented iio_info -> read_avail
 * Stylistic changes
 * Implemented devicetree bindings

Dan Robertson (2):
  dt-bindings: iio: accel: bma400: add bindings
  iio: (bma400) add driver for the BMA400

 .../devicetree/bindings/iio/accel/bma400.yaml |  39 +
 drivers/iio/accel/Kconfig                     |  18 +
 drivers/iio/accel/Makefile                    |   2 +
 drivers/iio/accel/bma400.h                    |  80 ++
 drivers/iio/accel/bma400_core.c               | 788 ++++++++++++++++++
 drivers/iio/accel/bma400_i2c.c                |  60 ++
 6 files changed, 987 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/bma400.yaml
 create mode 100644 drivers/iio/accel/bma400.h
 create mode 100644 drivers/iio/accel/bma400_core.c
 create mode 100644 drivers/iio/accel/bma400_i2c.c

-- 
2.23.0

From: Dan Robertson <dan@dlrobertson.com>
Subject: [PATCH v2 0/2] iio: add driver for Bosch BMA400 accelerometer
Date: Sat, 12 Oct 2019 03:54:18 +0000
Message-ID: <20191012035420.13904-1-dan@dlrobertson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: devicetree@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, Dan Robertson <dan@dlrobertson.com>
List-Id: devicetree@vger.kernel.org

This patchset adds a IIO driver for the Bosch BMA400 3-axes ultra low-power
accelerometer.  The initial implementation of the driver adds read support for
the acceleration and temperature data registers. The driver also has support
for reading and writing to the output data rate, oversampling ratio, and scale
configuration registers.

A huge thanks to the reviewers of the first version of the patchet!

Cheers,

 - Dan

Changes in v2:

 * Implemented iio_info -> read_avail
 * Stylistic changes
 * Implemented devicetree bindings

Dan Robertson (2):
  dt-bindings: iio: accel: bma400: add bindings
  iio: (bma400) add driver for the BMA400

 .../devicetree/bindings/iio/accel/bma400.txt  |  16 +
 drivers/iio/accel/Kconfig                     |  19 +
 drivers/iio/accel/Makefile                    |   2 +
 drivers/iio/accel/bma400.h                    |  86 ++
 drivers/iio/accel/bma400_core.c               | 839 ++++++++++++++++++
 drivers/iio/accel/bma400_i2c.c                |  58 ++
 6 files changed, 1020 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/bma400.txt
 create mode 100644 drivers/iio/accel/bma400.h
 create mode 100644 drivers/iio/accel/bma400_core.c
 create mode 100644 drivers/iio/accel/bma400_i2c.c

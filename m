Return-Path: <>
From: Martin Kelly <martin@martingkelly.com>
Subject: [PATCH v2 1/6] iio:bmi160: add SPDX identifiers
Date: Mon, 21 Jan 2019 18:04:26 -0800
Message-Id: <20190122020431.5338-1-martin@martingkelly.com>
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org, Martin Kelly <martin@martingkelly.com>
List-ID: <devicetree@vger.kernel.org>

From: Martin Kelly <martin@martingkelly.com>

Add SPDX identifiers (GPL 2) for the BMI160 driver. bmi160.h had an
identifier, but the other files did not.

Signed-off-by: Martin Kelly <martin@martingkelly.com>
---
 drivers/iio/imu/bmi160/bmi160_core.c | 5 +----
 drivers/iio/imu/bmi160/bmi160_i2c.c  | 5 +----
 drivers/iio/imu/bmi160/bmi160_spi.c  | 4 +---
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/imu/bmi160/bmi160_core.c b/drivers/iio/imu/bmi160/bmi160_core.c
index b10330b0f93f..ce61026d84c3 100644
--- a/drivers/iio/imu/bmi160/bmi160_core.c
+++ b/drivers/iio/imu/bmi160/bmi160_core.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * BMI160 - Bosch IMU (accel, gyro plus external magnetometer)
  *
  * Copyright (c) 2016, Intel Corporation.
  *
- * This file is subject to the terms and conditions of version 2 of
- * the GNU General Public License.  See the file COPYING in the main
- * directory of this archive for more details.
- *
  * IIO core driver for BMI160, with support for I2C/SPI busses
  *
  * TODO: magnetometer, interrupts, hardware FIFO
diff --git a/drivers/iio/imu/bmi160/bmi160_i2c.c b/drivers/iio/imu/bmi160/bmi160_i2c.c
index 5b1f7e6af651..e36f5e82d400 100644
--- a/drivers/iio/imu/bmi160/bmi160_i2c.c
+++ b/drivers/iio/imu/bmi160/bmi160_i2c.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * BMI160 - Bosch IMU, I2C bits
  *
  * Copyright (c) 2016, Intel Corporation.
  *
- * This file is subject to the terms and conditions of version 2 of
- * the GNU General Public License.  See the file COPYING in the main
- * directory of this archive for more details.
- *
  * 7-bit I2C slave address is:
  *      - 0x68 if SDO is pulled to GND
  *      - 0x69 if SDO is pulled to VDDIO
diff --git a/drivers/iio/imu/bmi160/bmi160_spi.c b/drivers/iio/imu/bmi160/bmi160_spi.c
index e521ad14eeac..c19e3df35559 100644
--- a/drivers/iio/imu/bmi160/bmi160_spi.c
+++ b/drivers/iio/imu/bmi160/bmi160_spi.c
@@ -1,11 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * BMI160 - Bosch IMU, SPI bits
  *
  * Copyright (c) 2016, Intel Corporation.
  *
- * This file is subject to the terms and conditions of version 2 of
- * the GNU General Public License.  See the file COPYING in the main
- * directory of this archive for more details.
  */
 #include <linux/acpi.h>
 #include <linux/module.h>
-- 
2.11.0

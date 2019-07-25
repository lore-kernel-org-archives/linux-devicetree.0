From: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v3 0/5] iio: imu: st_lsm6dsx: Add support for LSM9DS1
Date: Thu, 25 Jul 2019 07:31:27 +0200
Message-ID: <20190725053132.9589-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.bianconi83@gmail.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kepplinger <martin.kepplinger@puri.sm>
List-Id: devicetree@vger.kernel.org

Resend 2 of Lorenzo's patches that this builds upon. They have been previously
posted to linux-iio only:
https://lore.kernel.org/linux-iio/cover.1563226641.git.lorenzo@kernel.org/

Then, add support for the LSM9DS1 accel/gyro unit in 3 simple steps. This
is also only a resend and rebase of the v2:
https://lore.kernel.org/linux-iio/20190716093325.7683-1-martin.kepplinger@puri.sm/

So I call this v3 and Lorenzo, I hope that it's fine for you that I just
take your patches here - also since they mention to be intended for supporting
the device.


revision history
----------------
v3: rebase and add Lorenzo's patches in order to apply to the iio testing brach
v2: further simplifications based on Lorenzo's feedback
v1: initial change for adding lsm9ds1 support




Lorenzo Bianconi (2):
  iio: imu: st_lsm6dsx: move odr_table in st_lsm6dsx_sensor_settings
  iio: imu: st_lsm6dsx: move fs_table in st_lsm6dsx_sensor_settings

Martin Kepplinger (3):
  iio: imu: st_lsm6sdx: move register definitions to sensor_settings
    struct
  iio: imu: st_lsm6dsx: add support for accel/gyro unit of lsm9sd1
  dt-bindings: iio: imu: st_lsm6dsx: add lsm9ds1 device bindings

 .../bindings/iio/imu/st_lsm6dsx.txt           |   1 +
 drivers/iio/imu/st_lsm6dsx/Kconfig            |   1 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |  12 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  | 490 +++++++++++++++---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c   |   5 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c   |   5 +
 6 files changed, 440 insertions(+), 74 deletions(-)

-- 
2.20.1

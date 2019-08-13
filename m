From: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v4 0/3] iio: imu: st_lsm6dsx: Add support for LSM9DS1
Date: Tue, 13 Aug 2019 09:35:30 +0200
Message-ID: <20190813073533.8007-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.bianconi83@gmail.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kepplinger <martin.kepplinger@puri.sm>
List-Id: devicetree@vger.kernel.org

Add basic functionality for LSM9DS1. This has become a trivial addition
by now.

revision history
----------------
v4: rebase on top of today's iio testing branch with Lorenzo's recent work
v3: rebase and add Lorenzo's patches in order to apply to the iio testing brach
v2: further simplifications based on Lorenzo's feedback
v1: initial change for adding lsm9ds1 support


Martin Kepplinger (3):
  iio: imu: st_lsm6sdx: move register definitions to sensor_settings
    struct
  iio: imu: st_lsm6dsx: add support for accel/gyro unit of lsm9sd1
  dt-bindings: iio: imu: st_lsm6dsx: add lsm9ds1 device bindings

 .../bindings/iio/imu/st_lsm6dsx.txt           |   1 +
 drivers/iio/imu/st_lsm6dsx/Kconfig            |   2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |   8 ++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  | 118 ++++++++++++++++--
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c   |   5 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c   |   5 +
 6 files changed, 129 insertions(+), 10 deletions(-)

-- 
2.20.1

Return-Path: <SRS0=waX1=U4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:34992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726895AbfF2KOD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 29 Jun 2019 06:14:03 -0400
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] add support to STM LSM6DS3TR-C 6-axis Mems sensor
Date: Sat, 29 Jun 2019 12:13:52 +0200
Message-Id: <cover.1561802767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

Add support to STM LSM6DS3TR-C 6-axis sensor
https://www.st.com/resource/en/datasheet/lsm6ds3tr-c.pdf

Lorenzo Bianconi (2):
  iio: imu: st_lsm6dsx: add support to LSM6DS3TR-C
  dt-bindings: iio: imu: st_lsm6dsx: add lsm6ds3tr-c device bindings

 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
 drivers/iio/imu/st_lsm6dsx/Kconfig                       | 2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h                  | 2 ++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c           | 8 ++++----
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c             | 5 ++++-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c              | 5 +++++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c              | 5 +++++
 7 files changed, 22 insertions(+), 6 deletions(-)

-- 
2.21.0

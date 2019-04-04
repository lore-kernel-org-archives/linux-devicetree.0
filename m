Return-Path: <SRS0=dKdi=SG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727053AbfDDQCq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 4 Apr 2019 12:02:46 -0400
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] add support for LSM6DSR
Date: Thu,  4 Apr 2019 18:02:33 +0200
Message-Id: <cover.1554393393.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

Add support for LSM6DSR IMU mems sensor
https://www.st.com/resource/en/datasheet/lsm6dsr.pdf

Lorenzo Bianconi (2):
  iio: imu: st_lsm6dsx: add support to LSM6DSR
  dt-bindings: iio: imu: st_lsm6dsx: add lsm6dsr device bindings

 .../bindings/iio/imu/st_lsm6dsx.txt           |  1 +
 drivers/iio/imu/st_lsm6dsx/Kconfig            |  2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |  2 +
 .../iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c    |  8 +--
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  | 67 ++++++++++++++++++-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c   |  5 ++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c   |  5 ++
 7 files changed, 84 insertions(+), 6 deletions(-)

-- 
2.20.1

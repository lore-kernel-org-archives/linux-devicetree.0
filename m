Return-Path: <SRS0=qIkx=RS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727469AbfCOKIo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Mar 2019 06:08:44 -0400
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] add support for LSM6DSOX
Date: Fri, 15 Mar 2019 11:08:23 +0100
Message-Id: <cover.1552643968.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

Add support for LSM6DSOX IMU mems sensor
https://www.st.com/resource/en/datasheet/lsm6dsox.pdf

Please note I just compiled the series since I have no adapter for this sensor
but according to the datasheet it has a common register map with lsm6dso (at
least for supported features)

Lorenzo Bianconi (2):
  iio: imu: st_lsm6dsx: add support to LSM6DSOX
  dt-bindings: iio: imu: st_lsm6dsx: add lsm6dsox device bindings

 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
 drivers/iio/imu/st_lsm6dsx/Kconfig                       | 2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h                  | 2 ++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c           | 4 ++--
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c             | 3 ++-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c              | 5 +++++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c              | 5 +++++
 7 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.20.1

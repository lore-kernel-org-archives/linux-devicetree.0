Return-Path: <SRS0=3ErU=WB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbfHEKSz (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 5 Aug 2019 06:18:55 -0400
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] add support to STM ISM330DHCX 6-axis Mems sensor
Date: Mon,  5 Aug 2019 12:18:42 +0200
Message-Id: <cover.1564999807.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: lorenzo.bianconi@redhat.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Add support to STM ISM330DHCX 6-axis sensor
https://www.st.com/resource/en/datasheet/ism330dhcx.pdf

This series is based on '[v2,0/4] st_lsm6dsx: move {odr,fs}_table in'
https://patchwork.kernel.org/cover/11064381/

Lorenzo Bianconi (2):
  iio: imu: st_lsm6dsx: add support to ISM330DHCX
  dt-bindings: iio: imu: st_lsm6dsx: add ism330dhcx device bindings

 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
 drivers/iio/imu/st_lsm6dsx/Kconfig                       | 3 ++-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h                  | 2 ++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c           | 7 ++++---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c             | 5 ++++-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c              | 5 +++++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c              | 5 +++++
 7 files changed, 23 insertions(+), 5 deletions(-)

-- 
2.21.0

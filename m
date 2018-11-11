Return-Path: <SRS0=dUsd=NW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36577 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbeKLAE0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 11 Nov 2018 19:04:26 -0500
Received: by mail-wm1-f68.google.com with SMTP id v70-v6so5378444wmd.1
        for <devicetree@vger.kernel.org>; Sun, 11 Nov 2018 06:15:44 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 0/9] add i2c controller support to st_lsm6dsx driver
Date: Sun, 11 Nov 2018 15:15:27 +0100
Message-Id: <cover.1541945612.git.lorenzo.bianconi@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Introduce i2c controller support to st_lsm6dsx driver for lsm6dso sensor.
st_lsm6dsx sensor-hub supports up to 3 concurrent slave devices.
Add register map for lis2mdl magnetometer sensor.
Add hw FIFO support to st_lsm6dsx sensorhub driver.

Changes since v1:
- move back st_lsm6dsx_set_fifo_mode routine in fifo_lock critical section
  in st_lsm6dsx_flush_fifo
- improve documentation
- move st_lsm6dsx_sensor_set_enable definition in a separated patch
- move st_lsm6dsx_push_tagged_data definition in a separated patch
- use proper ts_ref for ext devices in st_lsm6dsx_push_tagged_data
- fix invalid iio_dev identification in st_lsm6dsx_push_tagged_data
  when ST_LSM6DSX_EXT1_TAG is read from the FIFO
- refactor st_lsm6dsx_shub_probe moving wai check in a dedicated routine
- fix abi issue in scale_available definition

Lorenzo Bianconi (9):
  iio: imu: st_lsm6dsx: introduce locked read/write utility routines
  iio: imu: st_lsm6dsx: reload trimming parameter at bootstrap
  iio: imu: st_lsm6dsx: remove static from st_lsm6dsx_set_watermark
  iio: imu: st_lsm6dsx: introduce ST_LSM6DSX_ID_EXT sensor ids
  iio: imu: st_lsm6dsx: introduce st_lsm6dsx_sensor_set_enable routine
  iio: imu: st_lsm6dsx: add i2c embedded controller support
  iio: imu: st_lsm6dsx: add st_lsm6dsx_push_tagged_data routine
  iio: imu: st_lsm6dsx: add hw FIFO support to i2c controller
  dt-bindings: iio: imu: st_lsm6dsx: add support to i2c pullup resistors

 .../bindings/iio/imu/st_lsm6dsx.txt           |   1 +
 drivers/iio/imu/st_lsm6dsx/Makefile           |   3 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       | 167 +++-
 .../iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c    | 165 ++--
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  | 283 +++++--
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c  | 777 ++++++++++++++++++
 .../linux/platform_data/st_sensors_pdata.h    |   2 +
 7 files changed, 1263 insertions(+), 135 deletions(-)
 create mode 100644 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c

-- 
2.19.1

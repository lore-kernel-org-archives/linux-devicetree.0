Return-Path: <SRS0=QYpu=LN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40185 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbeHaA5N (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Aug 2018 20:57:13 -0400
Received: by mail-wr1-f68.google.com with SMTP id n2-v6so9264285wrw.7
        for <devicetree@vger.kernel.org>; Thu, 30 Aug 2018 13:53:11 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: [PATCH 0/5] add support to STM LSM6DSO 6-axis Mems sensor
Date: Thu, 30 Aug 2018 22:52:54 +0200
Message-Id: <20180830205259.7029-1-lorenzo.bianconi@redhat.com>
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Lorenzo Bianconi (5):
  iio: imu: st_lsm6dsx: add read_fifo callback to fifo_ops
  iio: imu: st_lsm6dsx: make st_lsm6dsx_check_odr() non-static
  iio: imu: st_lsm6dsx: add addr/max_word_len to st_lsm6dsx_read_block()
  iio: imu: st_lsm6dsx: add support to LSM6DSO
  dt-bindings: iio: imu: st_lsm6dsx: add LSM6DSO device bindings

 .../bindings/iio/imu/st_lsm6dsx.txt           |   1 +
 drivers/iio/imu/st_lsm6dsx/Kconfig            |   2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |  18 +-
 .../iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c    | 166 ++++++++++++++++--
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  |  51 +++++-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c   |   5 +
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c   |   5 +
 7 files changed, 228 insertions(+), 20 deletions(-)

-- 
2.18.0

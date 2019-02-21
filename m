Return-Path: <SRS0=TIRm=Q4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfBUPUd (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 21 Feb 2019 10:20:33 -0500
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] add support for ASM330LHH
Date: Thu, 21 Feb 2019 16:20:19 +0100
Message-Id: <cover.1550753006.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, mario.tesi@st.com, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

Add support for ASM330LHH IMU mems sensor
https://www.st.com/resource/en/datasheet/asm330lhh.pdf

Lorenzo Bianconi (2):
  iio: imu: st_lsm6dsx: add support to ASM330LHH
  dt-bindings: iio: imu: st_lsm6dsx: add asm330lhh device bindings

 .../bindings/iio/imu/st_lsm6dsx.txt           |  1 +
 drivers/iio/imu/st_lsm6dsx/Kconfig            |  2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h       |  2 +
 .../iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c    |  8 ++--
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c  | 41 ++++++++++++++++++-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c   |  5 +++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c   |  5 +++
 7 files changed, 58 insertions(+), 6 deletions(-)

-- 
2.20.1

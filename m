Return-Path: <SRS0=rvea=RI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lists.gateworks.com ([108.161.130.12]:45460 "EHLO
        lists.gateworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfCEVHN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Mar 2019 16:07:13 -0500
From: Robert Jones <rjones@gateworks.com>
Subject: [PATCH 0/2] iio: accel: add support for LIS2DE12
Date: Tue,  5 Mar 2019 12:32:50 -0800
Message-Id: <20190305203252.13647-1-rjones@gateworks.com>
Sender: devicetree-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Robert Jones <rjones@gateworks.com>
List-ID: <devicetree@vger.kernel.org>

- Document the LIS2DE12 device tree binding.
- Add device tree support for STM LIS2DE12 accelerometer sensors.
- Add new st_sensor_settings entry for .wai == 0x33 devices with
  5376Hz capability.

Robert Jones (2):
  dt-bindings: iio: accel: add LIS2DE12 sensor device binding
  iio: accel: add support to LIS2DE12

 .../devicetree/bindings/iio/st-sensors.txt         |  1 +
 drivers/iio/accel/Kconfig                          |  2 +-
 drivers/iio/accel/st_accel.h                       |  2 +
 drivers/iio/accel/st_accel_core.c                  | 76 ++++++++++++++++++++++
 drivers/iio/accel/st_accel_i2c.c                   |  5 ++
 5 files changed, 85 insertions(+), 1 deletion(-)

-- 
2.9.2

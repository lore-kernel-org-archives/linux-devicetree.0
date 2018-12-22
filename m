Return-Path: <SRS0=bLD3=O7=gmail.com=akinobu.mita@kernel.org>
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH 00/12] media: mt9m001: switch soc_mt9m001 to a standard subdev sensor driver
Date: Sun, 23 Dec 2018 02:12:42 +0900
Message-Id: <1545498774-11754-1-git-send-email-akinobu.mita@gmail.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Rob Herring <robh@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-ID: <devicetree@vger.kernel.org>

This patchset converts soc_camera mt9m001 driver to a standard subdev
sensor driver.

Akinobu Mita (12):
  media: i2c: mt9m001: copy mt9m001 soc_camera sensor driver
  media: i2c: mt9m001: dt: add binding for mt9m001
  media: mt9m001: convert to SPDX license identifer
  media: mt9m001: add of_match_table
  media: mt9m001: introduce multi_reg_write()
  media: mt9m001: switch s_power callback to runtime PM
  media: mt9m001: remove remaining soc_camera specific code
  media: mt9m001: add media controller support
  media: mt9m001: register to V4L2 asynchronous subdevice framework
  media: mt9m001: support log_status ioctl and event interface
  media: mt9m001: make VIDIOC_SUBDEV_G_FMT ioctl work with
    V4L2_SUBDEV_FORMAT_TRY
  media: mt9m001: set all mbus format field when G_FMT and S_FMT ioctls

 .../devicetree/bindings/media/i2c/mt9m001.txt      |  37 +
 drivers/media/i2c/Kconfig                          |   9 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/mt9m001.c                        | 900 +++++++++++++++++++++
 4 files changed, 947 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/mt9m001.txt
 create mode 100644 drivers/media/i2c/mt9m001.c

Cc: Rob Herring <robh@kernel.org>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>
-- 
2.7.4

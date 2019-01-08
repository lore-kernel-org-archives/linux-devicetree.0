Return-Path: <SRS0=uJp/=PQ=gmail.com=akinobu.mita@kernel.org>
From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH v2 00/13] media: mt9m001: switch soc_mt9m001 to a standard subdev sensor driver
Date: Tue,  8 Jan 2019 23:51:37 +0900
Message-Id: <1546959110-19445-1-git-send-email-akinobu.mita@gmail.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Rob Herring <robh@kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
List-ID: <devicetree@vger.kernel.org>

This patchset converts soc_camera mt9m001 driver to a standard subdev
sensor driver.

* v2
- Update binding doc suggested by Rob Herring.
- Fix MODULE_LICENSE() masmatch.
- Sort headers alphabetically.
- Add new label for error handling in s_stream() callback.
- Replace pm_runtime_get_noresume() + pm_runtime_put_sync() with a
  single pm_runtime_idle() call in probe() function.
- Change the argument of mt9m001_power_o{n,ff} to struct device, and
  use them for runtime PM callbacks directly.
- Remove redundant Kconfig dependency
- Preserve subdev flags set by v4l2_i2c_subdev_init().
- Set initial try format with default configuration instead of
  current one.

Akinobu Mita (13):
  media: i2c: mt9m001: copy mt9m001 soc_camera sensor driver
  media: i2c: mt9m001: dt: add binding for mt9m001
  media: mt9m001: convert to SPDX license identifer
  media: mt9m001: sort headers alphabetically
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

 .../devicetree/bindings/media/i2c/mt9m001.txt      |  38 +
 drivers/media/i2c/Kconfig                          |   8 +
 drivers/media/i2c/Makefile                         |   1 +
 drivers/media/i2c/mt9m001.c                        | 884 +++++++++++++++++++++
 4 files changed, 931 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/mt9m001.txt
 create mode 100644 drivers/media/i2c/mt9m001.c

Cc: Rob Herring <robh@kernel.org>
Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
-- 
2.7.4

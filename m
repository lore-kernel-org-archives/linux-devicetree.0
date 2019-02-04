Return-Path: <SRS0=1fni=QL=linaro.org=rui.silva@kernel.org>
From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 0/5] iio: gyro: add fxas2100x driver
Date: Mon,  4 Feb 2019 17:00:07 +0000
Message-Id: <20190204170012.13617-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Hi,
This series introduce a NXP fxas2100x family tri axis gyroscope driver [0]
It add a core implementaiton plus an i2c and spi.

This device can be found in the warp7 board [1], where it was tested.

---
Cheers,
   Rui

[0]: https://www.nxp.com/docs/en/data-sheet/FXAS21002.pdf
[1]: https://www.element14.com/community/community/designcenter/single-board-computers/warp7/overview

Rui Miguel Silva (5):
  iio: gyro: add DT bindings to fxas2100x
  iio: gyro: fxas2100x: add core driver for fxas2100x gyroscope
  iio: gyro: fxas2100x: add i2c driver
  iio: gyro: fxas2100x: add spi driver
  ARM: dts: imx7s-warp: add fxas2100x gyroscope

 .../bindings/iio/gyroscope/fxas2100x.txt      |  14 +
 arch/arm/boot/dts/imx7s-warp.dts              |   5 +
 drivers/iio/gyro/Kconfig                      |  22 +
 drivers/iio/gyro/Makefile                     |   3 +
 drivers/iio/gyro/fxas2100x.h                  | 149 +++
 drivers/iio/gyro/fxas2100x_core.c             | 930 ++++++++++++++++++
 drivers/iio/gyro/fxas2100x_i2c.c              |  73 ++
 drivers/iio/gyro/fxas2100x_spi.c              |  70 ++
 8 files changed, 1266 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/fxas2100x.txt
 create mode 100644 drivers/iio/gyro/fxas2100x.h
 create mode 100644 drivers/iio/gyro/fxas2100x_core.c
 create mode 100644 drivers/iio/gyro/fxas2100x_i2c.c
 create mode 100644 drivers/iio/gyro/fxas2100x_spi.c

-- 
2.20.1

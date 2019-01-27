From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH v2 0/3] add support for PMS7003 PM sensor
Date: Sun, 27 Jan 2019 19:19:13 +0100
Message-ID: <20190127181916.19948-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, johan@kernel.org, robh@kernel.org, jic23@jic23.retrosnub.co.uk, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch series adds support for Plantower PMS7003 PM matter sensor.

Unfortunately datasheet is not available for download from the Plantower
website so one needs to find it elsewhere, for instance here:

https://download.kamami.com/p564008-p564008-PMS7003%20series%20data%20manua_English_V2.5.pdf

v2:
 * check number of bytes returned from serdev_device_write()
   (due to changes in linux 5.0 serdev api)
 * add missing pins descriptions to the driver binding
 * keep commands in the lookup table
 * buffer data and process everything in one go instead of using state machine
 * keep pm offset in channel address to simplify reading measurements

Tomasz Duszynski (3):
  iio: chemical: add support for Plantower PMS7003 sensor
  dt-bindings: add Plantower to the vendor prefixes
  dt-bindings: iio: chemical: pms7003: add device tree support

 .../iio/chemical/plantower,pms7003.txt        |  19 +
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 drivers/iio/chemical/Kconfig                  |  10 +
 drivers/iio/chemical/Makefile                 |   1 +
 drivers/iio/chemical/pms7003.c                | 343 ++++++++++++++++++
 5 files changed, 374 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
 create mode 100644 drivers/iio/chemical/pms7003.c

--
2.20.1

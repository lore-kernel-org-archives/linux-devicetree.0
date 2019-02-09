From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH v4 0/3] add support for PMS7003 PM sensor
Date: Sat,  9 Feb 2019 18:36:06 +0100
Message-ID: <20190209173609.13220-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, jic23@jic23.retrosnub.co.uk, pmeerw@pmeerw.net, johan@kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

This patch series adds support for Plantower PMS7003 PM matter sensor.

Unfortunately datasheet is not available for download from the Plantower
website so one needs to find it elsewhere, for instance here:

https://download.kamami.com/p564008-p564008-PMS7003%20series%20data%20manua_English_V2.5.pdf

v4:
 * add vendor prefix to set-gpios property

v3:
 * fix whitespaces
 * drop unused printk format specifier
 * make vcc-supply mandatory in dt binding
 * use a generic node name (air-pollution-sensor) instead of a sensor model

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

 .../iio/chemical/plantower,pms7003.txt        |  20 ++
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 drivers/iio/chemical/Kconfig                  |  10 +
 drivers/iio/chemical/Makefile                 |   1 +
 drivers/iio/chemical/pms7003.c                | 340 ++++++++++++++++++
 5 files changed, 372 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
 create mode 100644 drivers/iio/chemical/pms7003.c

--
2.20.1

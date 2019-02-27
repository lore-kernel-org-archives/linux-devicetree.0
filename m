From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH v3 0/7] iio: imu: adis16480: Add support for ADIS1649x family of devices
Date: Wed, 27 Feb 2019 18:14:21 +0200
Message-ID: <1551284068-4882-1-git-send-email-stefan.popa@analog.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org
Cc: Stefan Popa <stefan.popa@analog.com>, Michael.Hennerich@analog.com, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series has as main goal to add support for ADIS1649x family of devices as
part of the already existing adis16480, but on the way it also deals with some
outstanding items:

* Make drdy pin configurable
* Add OF device ID table
* Deal with the temperature max scale in a generic way
* Deal with sampling and filter freq in a generic way
* Add missing docs

Changes in v3:
Patch 1, 2, 3:
	- Nothing changed
Patch 4, 5:
	- Added to this series
Patch 6:
	- Added support for sampling and filter freq
Patch 7:
	- Nothing changed

Changes in v2:
Patch 1:
	- use DIO1 pin as default data ready signal instead of DIO2.
Patch 2:
	- nothing changed.
Patch 3, 4:
	- give the scale directly in the adis16480_chip_info struct.
Patch 5: 
	- document the use of DIO1 pin as default data ready signal.

Stefan Popa (7):
  iio: imu: adis16480: Add support for configurable drdy indicator
  iio: imu: adis16480: Add OF device ID table
  iio: imu: adis16480: Treat temperature scale in a generic way
  iio: imu: adis16480: Calculate the sampling frequency in a generic way
  iio: imu: adis16480: Deal with filter freq in a generic way
  iio: imu: adis16480: Add support for ADIS1649x family of devices
  iio: imu: adis16480: Add docs for ADIS16480 IMU

 .../devicetree/bindings/iio/imu/adi,adis16480.txt  |  49 ++++
 MAINTAINERS                                        |   1 +
 drivers/iio/imu/adis16480.c                        | 253 +++++++++++++++++++--
 3 files changed, 290 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/adi,adis16480.txt

-- 
2.7.4

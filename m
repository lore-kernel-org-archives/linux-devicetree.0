From: Stefan Popa <stefan.popa@analog.com>
Subject: [PATCH v2 0/5] iio: imu: adis16480: Add support for ADIS1649x family of devices
Date: Thu, 21 Feb 2019 15:15:01 +0200
Message-ID: <1550754906-24640-1-git-send-email-stefan.popa@analog.com>
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
* Add missing docs

Changes in v2:
Patch 1:
	- use DIO1 pin as default data ready signal instead of DIO2.
Patch 2:
	- nothing changed.
Patch 3, 4:
	- give the scale directly in the adis16480_chip_info struct.
Patch 5: 
	- document the use of DIO1 pin as default data ready signal.

Stefan Popa (5):
  iio: imu: adis16480: Add support for configurable drdy indicator
  iio: imu: adis16480: Add OF device ID table
  iio: imu: adis16480: Treat temperature scale in a generic way
  iio: imu: adis16480: Add support for ADIS1649x family of devices
  iio: imu: adis16480: Add docs for ADIS16480 IMU

 .../devicetree/bindings/iio/imu/adi,adis16480.txt  |  49 +++++
 MAINTAINERS                                        |   1 +
 drivers/iio/imu/adis16480.c                        | 197 ++++++++++++++++++++-
 3 files changed, 242 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/imu/adi,adis16480.txt

-- 
2.7.4

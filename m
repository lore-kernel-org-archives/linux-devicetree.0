From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH 0/4] add maxbotix ultrasonic iio driver
Date: Sun, 24 Feb 2019 17:21:28 +0100
Message-ID: <20190224162126.vzzstmm7rcv6mnh7@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jic23@kernel.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh+dt@kernel.org, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com
List-Id: devicetree@vger.kernel.org

This patch series adds support for MaxSonar-I2CXL ultrasonic distance
sensors of family mb12x2 using the i2c interface of vendor maxbotix
    
Implemented and tested functionality:
- reading the distance via in_distance_raw
- buffered mode with trigger
- make use of status gpio to announce completion of ranging


Andreas Klinger (4):
  maxbotix,mb12x2.txt: add dt doc for maxbotix,mb12x2
  iio/proximity: add mb12x2 driver to Kconfig and Makefile
  mb12x2.c: add mb12x2 ultrasonic distance iio sensor
  MAINTAINERS: add maintainer for maxbotix ultrasonic driver

 .../bindings/iio/proximity/maxbotix,mb12x2.txt     |  22 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 MAINTAINERS                                        |   7 +
 drivers/iio/proximity/Kconfig                      |  11 +
 drivers/iio/proximity/Makefile                     |   1 +
 drivers/iio/proximity/mb12x2.c                     | 283 +++++++++++++++++++++
 6 files changed, 325 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,mb12x2.txt
 create mode 100644 drivers/iio/proximity/mb12x2.c

-- 
2.11.0

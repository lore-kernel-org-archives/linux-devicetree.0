From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v2 0/4] add MaxBotix I2CXL ultrasonic iio driver
Date: Fri, 1 Mar 2019 14:41:27 +0100
Message-ID: <20190301134125.4zqbyzoc2exxigae@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, gregkh@linuxfoundation.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com, techsupport@maxbotix.com
List-Id: devicetree@vger.kernel.org

This patch series adds support for I2CXL-MaxSonar ultrasonic distance
sensors of family mb12x2 using the i2c interface of vendor MaxBotix
    
Implemented and tested functionality:
- reading the distance via in_distance_raw
- buffered mode with trigger
- make use of status gpio to announce completion of ranging


Changes in v2:
Thanks to the review of Andreas and Peter there are a couple of changes:
- rename type wildcard mb12x2 to i2cxl in dt binding
- split changes in vendor list and dt doc into two patches
- merge driver source and Kconfig/Makefile change into one patch
- reword dt documentation
- use directly __be16 datatype to read directly from i2c
- use s16 as return value from mb12x2_read_distance()

Andreas Klinger (4):
  dt-bindings: Add vendor prefix for MaxBotix
  dt-bindings: maxbotix,i2cxl: Add MaxBotix i2c ultrasonic rangers
  mb12x2.c: add distance iio sensor with i2c
  MAINTAINERS: add maintainer for maxbotix ultrasonic driver

 .../bindings/iio/proximity/maxbotix,i2cxl.txt      |  21 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 MAINTAINERS                                        |   7 +
 drivers/iio/proximity/Kconfig                      |  11 +
 drivers/iio/proximity/Makefile                     |   1 +
 drivers/iio/proximity/mb12x2.c                     | 283 +++++++++++++++++++++
 6 files changed, 324 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,i2cxl.txt
 create mode 100644 drivers/iio/proximity/mb12x2.c

-- 
2.11.0

From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v3 0/4] add MaxBotix I2CXL ultrasonic iio driver
Date: Sun, 17 Mar 2019 21:34:27 +0100
Message-ID: <20190317203230.rm7zdtobjda36awz@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, gregkh@linuxfoundation.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com, techsupport@maxbotix.com
List-Id: devicetree@vger.kernel.org

This patch series adds support for I2CXL-MaxSonar ultrasonic distance
sensors with i2c interface of vendor MaxBotix

Supported types are:
mb1202, mb1212, mb1222, mb1232, mb1242, mb7040, mb7137
    
Implemented and tested functionality:
- reading the distance via in_distance_raw
- buffered mode with trigger
- make use of irq to announce completion of ranging

Changes in v3:
Thanks to the review of Julia, Jonathan, Rob and Peter there are some
changes:
- fix missing mutex_unlock() in mb1232_read_distance()
- change file and function names to the tested type mb1232
- list all supported types in {of,i2c}_device_id as well as in Kconfig
- reduce former status gpio to pure interrupt for announcement of finished
  read cycle

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
  dt-bindings: maxbotix,mb1232: Add MaxBotix i2c ultrasonic rangers
  mb1232.c: add distance iio sensor with i2c
  MAINTAINERS: add maintainer for maxbotix ultrasonic driver

 .../bindings/iio/proximity/maxbotix,mb1232.txt     |  31 +++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 MAINTAINERS                                        |   7 +
 drivers/iio/proximity/Kconfig                      |  12 +
 drivers/iio/proximity/Makefile                     |   1 +
 drivers/iio/proximity/mb1232.c                     | 274 +++++++++++++++++++++
 6 files changed, 326 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.txt
 create mode 100644 drivers/iio/proximity/mb1232.c

-- 
2.11.0

From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v4 0/9] staging: iio: ad7780: move out of staging
Date: Thu, 28 Feb 2019 11:23:00 -0300
Message-ID: <cover.1551358569.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, giuliano.belinassi@usp.br, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series of patches contains the following:
 - Adds user input for the 'gain' and 'filter' GPIO pins for the ad778x
   family chips;
 - Filter reading for the ad778x;
 - Sets pattern macro values and mask for PATTERN status bits;
 - Adds ID values for the ad7170, ad7171, ad7780 and ad7781 for ID
   status bits checking;
 - Moves regulator initialization to after GPIO init to maintain
   consistency between probe and remove;
 - Copyright edits, adding SPDX identifier and new copyright holder;
 - Moves the ad7780 driver out of staging to the mainline;
 - Adds device tree binding for the ad7780 driver.

Renato Lui Geh (9):
  staging: iio: ad7780: add gain & filter gpio support
  staging: iio: ad7780: add filter reading to ad778x
  staging: iio: ad7780: set pattern values and masks directly
  staging:iio:ad7780: add chip ID values and mask
  staging: iio: ad7780: move regulator to after GPIO init
  staging: iio: ad7780: add SPDX identifier
  staging: iio: ad7780: add new copyright holder
  staging: iio: ad7780: moving ad7780 out of staging
  staging: iio: ad7780: add device tree binding

Changelog:
*v3
 - SPDX and regulator init as patches
 - Renamed filter to odr and ad778x_filter to ad778x_odr_avail
 - Removed unnecessary regulator disabling
 - Removed unnecessary AD_SD_CHANNEL macro
 - Changed unsigned int to unsigned long long to avoid overflow
*v4
 - Split gain & filter patch into two, with the new commit adding only
   filter reading
 - Changed pattern values to direct values, and added pattern mask
 - Added ID values and mask
 - Added new copyright holder
 - Added device tree binding to the ad7780 driver

 .../bindings/iio/adc/adi,ad7780.txt           |  48 +++
 drivers/iio/adc/Kconfig                       |  12 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ad7780.c                      | 365 ++++++++++++++++++
 drivers/staging/iio/adc/Kconfig               |  13 -
 drivers/staging/iio/adc/Makefile              |   1 -
 drivers/staging/iio/adc/ad7780.c              | 277 -------------
 7 files changed, 426 insertions(+), 291 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
 create mode 100644 drivers/iio/adc/ad7780.c
 delete mode 100644 drivers/staging/iio/adc/ad7780.c

--
2.21.0

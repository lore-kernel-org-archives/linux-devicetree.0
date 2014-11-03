From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: [PATCH v4 0/2] Initial support for voltage ADC
Date: Mon,  3 Nov 2014 17:24:28 +0200
Message-ID: <1415028270-25860-1-git-send-email-iivanov@mm-sol.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>
Cc: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Angelo Compagnucci <angelo.compagnucci@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi, 

This is the forth version of this driver. V3 could be found here [1].

Changes since v3.

- Addressed review comments from Hartmut Knaack and Mark Rutland:
  Better description of 'reg' property.
  Add # to address-cells and size-cells DT document.
  Dropped interrupt-names property, it was not actually used by driver.
  DT header file, which contain channels names definitions, is part of 
  documentation patch now.
  Clarified 'qcom,decimation' property. Hopefully it make sense now.
  Make more explicit that all reference channels configuration nodes have
  to be defined in DT.
- Promote dev_dbg to dev_err in error paths. Stan, I hope you are ok with this :-)
- Use 32 bit calculations in calibration routine.
- Read ADC result with one regmap call.
- Show status and state registers if ADC conversin fails. Errors should not
  normally happen, so I will like to see content of this registers in such cases.
- Use new struct iio_info::of_xlate for channel number translation.
- Removed device wakeup initialization code, which didn't make sense to me
  for such kind of device.

Patches depend on "iio: inkern: Add of_xlate function to struct iio_info" patch,
which is included in IIO testing branch [2].

[1] http://comments.gmane.org/gmane.linux.ports.arm.msm/9741
[2] http://git.kernel.org/cgit/linux/kernel/git/jic23/iio.git/log/?h=testing

Stanimir Varbanov (2):
  DT: iio: vadc: document dt binding
  iio: vadc: Qualcomm SPMI PMIC voltage ADC driver

 .../devicetree/bindings/iio/adc/qcom,spmi-vadc.txt |  129 +++
 drivers/iio/adc/Kconfig                            |   14 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/qcom-spmi-vadc.c                   | 1015 ++++++++++++++++++++
 include/dt-bindings/iio/qcom,spmi-vadc.h           |  119 +++
 5 files changed, 1278 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
 create mode 100644 drivers/iio/adc/qcom-spmi-vadc.c
 create mode 100644 include/dt-bindings/iio/qcom,spmi-vadc.h

-- 
1.9.1

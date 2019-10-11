From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 0/2] Add support for ADUX1020 sensor
Date: Sat, 12 Oct 2019 00:18:50 +0530
Message-ID: <20191011184852.12202-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org
Cc: alexandru.Ardelean@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds initial IIO driver support for ADUX1020 Photometric
sensor from Analog Devices. This sensor is usable for multiple optical
measurement applications, including gesture control and proximity sensing.

This initial driver includes support for only proximity mode with event
based interrupt. The driver validation has been performed using Shiratech
LTE mezzanine [1] connected to 96Boards Dragonboard410c [2].

Thanks,
Mani

[1] https://www.96boards.org/product/shiratech-lte/
[2] https://www.96boards.org/product/dragonboard410c/

Changes in v3:

Based on the review by Ardelean and Jonathan:

* Added error checks for regmap calls
* Added mutex locks where applicable
* Switched to devm_iio API
* Misc changes to the driver
* Added Reivewed-by tag from Rob for the bindings patch

Changes in v2:

* Converted the devicetree binding to YAML

Manivannan Sadhasivam (2):
  dt-bindings: iio: light: Add binding for ADUX1020
  iio: light: Add support for ADUX1020 sensor

 .../bindings/iio/light/adux1020.yaml          |  47 +
 drivers/iio/light/Kconfig                     |  11 +
 drivers/iio/light/Makefile                    |   1 +
 drivers/iio/light/adux1020.c                  | 849 ++++++++++++++++++
 4 files changed, 908 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/adux1020.yaml
 create mode 100644 drivers/iio/light/adux1020.c

-- 
2.17.1

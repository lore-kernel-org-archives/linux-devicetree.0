From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Add support for ADUX1020 sensor
Date: Mon,  7 Oct 2019 15:40:25 +0530
Message-ID: <20191007101027.8383-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, robh+dt@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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

Manivannan Sadhasivam (2):
  dt-bindings: iio: light: Add binding for ADUX1020
  iio: light: Add support for ADUX1020 sensor

 .../bindings/iio/light/adux1020.txt           |  22 +
 drivers/iio/light/Kconfig                     |  11 +
 drivers/iio/light/Makefile                    |   1 +
 drivers/iio/light/adux1020.c                  | 783 ++++++++++++++++++
 4 files changed, 817 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/adux1020.txt
 create mode 100644 drivers/iio/light/adux1020.c

-- 
2.17.1

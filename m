From: Renato Lui Geh <renatogeh@gmail.com>
Subject: [PATCH v2 0/2] dt-bindings: iio: adc: add ad7780 yaml and
 MAINTAINERS entry
Date: Fri, 24 May 2019 22:26:10 -0300
Message-ID: <cover.1558746978.git.renatogeh@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net, gregkh@linuxfoundation.org, stefan.popa@analog.com, alexandru.Ardelean@analog.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-usp@googlegroups.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset converts the old ad7780 device-tree binding to
the new YAML format, and adds an entry to MAINTAINERS.

Renato Lui Geh (2):
  dt-bindings: iio: adc: add adi,ad7780.yaml binding
  MAINTAINERS: add entry for ad7780 adc driver

 .../bindings/iio/adc/adi,ad7780.txt           | 48 ----------
 .../bindings/iio/adc/adi,ad7780.yaml          | 87 +++++++++++++++++++
 MAINTAINERS                                   |  9 ++
 3 files changed, 96 insertions(+), 48 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7780.txt
 create mode 100644 Documentation/devicetree/bindings/iio/adc/adi,ad7780.yaml

-- 
2.21.0

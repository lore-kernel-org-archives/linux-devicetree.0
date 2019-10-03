From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/7] Introduce max12xx ADC support
Date: Thu,  3 Oct 2019 19:33:54 +0200
Message-ID: <20191003173401.16343-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hello, here is a patchset updating the existing max1027.c driver (for
10-bit max1027/29/31 ADCs) with a few corrections/improvements and
then introducing their 12-bit cousins named max1227/29/31.

As on my hardware setup the "start conversion" and "end of conversion"
pin are not wired (which is absolutely fine for this chip), I also
updated the driver and the bindings to support optional interrupts. In
this case, triggered buffers are not available and the user must poll
the value from sysfs.

Thanks,
Miquèl


Changes in v2:
==============
* Removed the addition of three compatibles from patch 4 (the
  preparation patch) to add these lines back in patch 5 (the actual
  introduction).


Miquel Raynal (7):
  iio: adc: max1027: Add debugfs register read support
  iio: adc: max1027: Make it optional to use interrupts
  iio: adc: max1027: Reset the device at probe time
  iio: adc: max1027: Prepare the introduction of different resolutions
  iio: adc: max1027: Introduce 12-bit devices support
  dt-bindings: iio: adc: max1027: Mark interrupts as optional
  dt-bindings: iio: adc: max1027: Document max12xx series compatibles

 .../bindings/iio/adc/max1027-adc.txt          |  12 +-
 drivers/iio/adc/Kconfig                       |   4 +-
 drivers/iio/adc/max1027.c                     | 190 +++++++++++-------
 3 files changed, 133 insertions(+), 73 deletions(-)

-- 
2.20.1

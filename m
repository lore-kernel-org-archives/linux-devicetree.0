From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 0/2] iio: gyro: bmg160 add device tree support
Date: Mon, 18 Mar 2019 16:14:13 +0100
Message-ID: <cover.1552922054.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

There is no device tree support since the of_device_id table is missing.

H. Nikolaus Schaller (2):
  iio: gyro: bmg160: add device tree compatibility table
  dt-bindings: iio: add Bosch BMG160 gyroscope sensor

 .../bindings/iio/gyroscope/bmg160.txt         | 20 +++++++++++++++++++
 drivers/iio/gyro/bmg160_i2c.c                 |  9 +++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/gyroscope/bmg160.txt

-- 
2.19.1

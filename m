From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 0/4] iio: adc: ina2xx: Improve device identification
Date: Tue, 20 Aug 2019 16:11:37 +0200
Message-ID: <cover.1566310292.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, linux-iio@vger.kernel.org, =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>, Rob Herring <robh+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Jean Delvare <jdelvare@suse.com>, Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>
List-Id: devicetree@vger.kernel.org

Hi,

the purpose of this series is to improve ina226 identification. On systems
like Xilinx ZynqMP zcu102 (check dt in the tree) you can find out almost 20
ina226 chips and it is impossible to find out based on simple ina226 which
chip is repsonsible for what.
The series is adding two ways how to improve device identification.
Please let me know what you think I am happy to do changes in it.

Thanks,
Michal


Michal Simek (4):
  iio: adc: ina2xx: Define *device_node only once
  iio: adc: ina2xx: Setup better name then simple ina2xx
  dt-bindings: Add optional label property for ina2xx
  iio: adc: ina2xx: Use label proper for device identification

 .../devicetree/bindings/hwmon/ina2xx.txt          |  2 ++
 drivers/iio/adc/ina2xx-adc.c                      | 15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.17.1

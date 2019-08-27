From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH v2 0/2] hwmon: a new driver for Synaptics AS370 PVT sensor
Date: Tue, 27 Aug 2019 03:43:30 +0000
Message-ID: <20190827113214.13773d45@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <F0FE8A303FA1D74489DBBEF4AAF4DEB1@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add a new driver for Synaptics AS370 PVT sensor. Currently only
temperature is supported.

Jisheng Zhang (2):
  hwmon: Add Synaptics AS370 PVT sensor driver
  hwmon: (as370-hwmon) Add DT bindings for Synaptics AS370 PVT

Changes since v1
  - remove useless <linux/delay.h>
  - use GENMASK
  - remove useless bit operation
  - remove read_pvt()
  - use DIV_ROUND_CLOSEST()

 .../devicetree/bindings/hwmon/as370.txt       |  11 ++
 drivers/hwmon/Kconfig                         |  10 ++
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/as370-hwmon.c                   | 147 ++++++++++++++++++
 4 files changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/as370.txt
 create mode 100644 drivers/hwmon/as370-hwmon.c

--=20
2.23.0.rc1

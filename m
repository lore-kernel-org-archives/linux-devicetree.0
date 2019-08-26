From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [PATCH 0/2] hwmon: a new driver for Synaptics AS370 PVT sensor
Date: Mon, 26 Aug 2019 10:00:59 +0000
Message-ID: <20190826174942.2b28ff05@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <4D0CBE1D2191CE40B68239C6DFEC1C29@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add a new driver for Synaptics AS370 PVT sensor. Currently only
temperature is supported.

Jisheng Zhang (2):
  hwmon: Add Synaptics AS370 PVT sensor driver
  hwmon: (as370-hwmon) Add DT bindings for Synaptics AS370 PVT

 .../devicetree/bindings/hwmon/as370.txt       |  11 ++
 drivers/hwmon/Kconfig                         |  10 ++
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/as370-hwmon.c                   | 158 ++++++++++++++++++
 4 files changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/as370.txt
 create mode 100644 drivers/hwmon/as370-hwmon.c

--=20
2.23.0.rc1

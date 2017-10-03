From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v4 0/2] Add support for Maxim MAX6621 temperature sensor device
Date: Tue,  3 Oct 2017 18:08:26 +0000
Message-ID: <1507054108-195806-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
To: linux@roeck-us.net, robh+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: devicetree@vger.kernel.org

This patchset:
- support for MAX6621 temperature sensor;
- add documentation record for this device;

Vadim Pasternak (2):
  hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor
  Documentation: devicetree: add max6621 device

 .../devicetree/bindings/trivial-devices.txt        |   1 +
 drivers/hwmon/Kconfig                              |  14 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/max6621.c                            | 593 +++++++++++++++++++++
 4 files changed, 609 insertions(+)
 create mode 100644 drivers/hwmon/max6621.c

-- 
2.1.4


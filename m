From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 0/2] Add an initial DT binding doc for ina3221
Date: Thu, 20 Sep 2018 17:07:51 -0700
Message-ID: <20180921000753.21846-1-nicoleotsuka@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: afd@ti.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series adds a initial DT binding doc for ina3221. It adds
channel names (which should be according to board schematics)
and implements the corresponding actions (disabling channels)
in the driver.

Nicolin Chen (2):
  dt-bindings: hwmon: Add ina3221 documentation
  hwmon: ina3221: Get channel names from DT node

 .../devicetree/bindings/hwmon/ina3221.txt     | 23 +++++
 drivers/hwmon/ina3221.c                       | 88 +++++++++++++++++--
 2 files changed, 103 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt

-- 
2.17.1

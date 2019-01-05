From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 0/2] hwmon (ina3221) Add single-shot mode support
Date: Fri,  4 Jan 2019 16:49:02 -0800
Message-ID: <20190105004904.17947-1-nicoleotsuka@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

By default, ina3221, as a hardware monitor, continuously measures
the inputs and generates corresponding data. However, for battery
powered devices, this mode might be power consuming.

This series of patches add a feature of changing default operating
mode to its single-shot mode via DT.

Nicolin Chen (2):
  dt-bindings: hwmon: ina3221: Add ti,single-shot property
  hwmon: (ina3221) Implement ti,single-shot DT property

 .../devicetree/bindings/hwmon/ina3221.txt     | 10 +++++++
 drivers/hwmon/ina3221.c                       | 28 +++++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
2.17.1

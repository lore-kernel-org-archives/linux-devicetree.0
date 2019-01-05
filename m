From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v2 0/2] hwmon (ina3221) Add single-shot mode support
Date: Fri,  4 Jan 2019 19:06:34 -0800
Message-ID: <20190105030636.533-1-nicoleotsuka@gmail.com>
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

Changelog
v1->v2:
 * Cleaned-up PATCH-2

Nicolin Chen (2):
  dt-bindings: hwmon: ina3221: Add ti,single-shot property
  hwmon: (ina3221) Implement ti,single-shot DT property

 .../devicetree/bindings/hwmon/ina3221.txt     | 10 ++++++++++
 drivers/hwmon/ina3221.c                       | 20 +++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.17.1

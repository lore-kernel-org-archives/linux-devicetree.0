From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] hwmon: devicetree support for hih6130
Date: Thu, 27 Dec 2018 16:13:47 +0100
Message-ID: <20181227151349.29753-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

This patch set adds devicetree support for hih6130, so it can
be properly auto-probed using devicetree files

Andreas Kemnade (2):
  hwmon: (hih6130) add dtb compatibility tables
  devicetree: hwmon: Add bindings documentation for HIH6130

 Documentation/devicetree/bindings/hwmon/hih6130.txt | 12 ++++++++++++
 drivers/hwmon/hih6130.c                             | 11 ++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/hih6130.txt

-- 
2.11.0

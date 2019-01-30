From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 0/3] hwmon: pwm-fan: Add RPM support
Date: Wed, 30 Jan 2019 16:07:04 +0100
Message-ID: <1548860827-29796-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

Contrary to the gpio-fan the pwm-fan driver isn't easy to setup
with pwmconfig/fancontrol because of the missing hwmon sysfs entry
for actual revolutions per minute. This series adds this feature.

This series based on the recently submitted regulator support.

Stefan Wahren (3):
  dt-bindings: hwmon: Add tachometer interrupt to pwm-fan
  Documentation: pwm-fan: Add description for RPM support
  hwmon: pwm-fan: Add RPM support via external interrupt

 .../devicetree/bindings/hwmon/pwm-fan.txt          |  3 ++
 Documentation/hwmon/pwm-fan                        |  4 ++
 drivers/hwmon/pwm-fan.c                            | 55 ++++++++++++++++++++++
 3 files changed, 62 insertions(+)

-- 
2.7.4

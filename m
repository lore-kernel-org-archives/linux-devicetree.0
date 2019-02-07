From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V2 0/2] hwmon: pwm-fan: Add optional regulator support
Date: Thu,  7 Feb 2019 17:37:58 +0100
Message-ID: <1549557480-14436-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This small series implements the optional regulator support for the
pwm-fan driver.

Changes in V2:
- address Guenter's comments:
  - handle error case first
  - drop ENOSYS handling
  - implement more consistent bail out handling
- enable regulator before setup PWM
- make sure we disable regulator if probe fails

Stefan Wahren (2):
  dt-bindings: hwmon: Add optional regulator support to pwm-fan
  hwmon: pwm-fan: Add optional regulator support

 .../devicetree/bindings/hwmon/pwm-fan.txt          |  3 ++
 drivers/hwmon/pwm-fan.c                            | 39 +++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

-- 
2.7.4

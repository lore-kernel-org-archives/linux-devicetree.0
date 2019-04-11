From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V5 0/3] hwmon: pwm-fan: Add RPM support
Date: Thu, 11 Apr 2019 15:30:08 +0200
Message-ID: <1554989411-23666-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

Contrary to the gpio-fan the pwm-fan driver isn't easy to setup
with pwmconfig/fancontrol because of the missing hwmon sysfs entry
for actual revolutions per minute. This series adds this feature.

Changes in V5:
- address Guenter's and Robin's comments:
  - use of_property_read_u32 to get pulses-per-revolution
  - call platform_get_irq ealier to avoid glitches on the regulator
  - simplify pwm_fan_attrs_visible

Changes in V4:
- remove copy & paste artifact in dt-binding example
- switch to u64 for rpm calculation
- drop overflow handling and init atomic
- handle 0 not as valid irq
- reduce range of pulses_per_revolution
- handle probe defer of platform_get_irq
- delete timer properly in bail-out path

Changes in V3:
- rename property interrupt-ratio to pulses-per-revolution
  to avoid confusion with interrupt binding
- handle error case pulses-per-revolution = 0
- bail out properly in case we are unable to request the irq

Changes in V2:
- address Guenter's comments:
  - improve description of interrupts
  - use atomic_t to avoid races of the pulse counter
  - measure sample time to make rpm more reliable under load
  - make sysfs entry fan1_input conditional
- add dt-property to define interrupts per fan revolution
- example for fan with RPM support

Stefan Wahren (3):
  dt-bindings: hwmon: Add tachometer interrupt to pwm-fan
  Documentation: pwm-fan: Add description for RPM support
  hwmon: pwm-fan: Add RPM support via external interrupt

 .../devicetree/bindings/hwmon/pwm-fan.txt          |  21 +++-
 Documentation/hwmon/pwm-fan                        |   3 +
 drivers/hwmon/pwm-fan.c                            | 107 ++++++++++++++++++++-
 3 files changed, 126 insertions(+), 5 deletions(-)

-- 
2.7.4

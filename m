From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 2/3] Documentation: pwm-fan: Add description for RPM support
Date: Wed, 30 Jan 2019 16:07:06 +0100
Message-ID: <1548860827-29796-3-git-send-email-stefan.wahren@i2se.com>
References: <1548860827-29796-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548860827-29796-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This adds a short description for the new RPM support of the pwm-fan
driver.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/hwmon/pwm-fan | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/hwmon/pwm-fan b/Documentation/hwmon/pwm-fan
index 18529d2..a1ba34c 100644
--- a/Documentation/hwmon/pwm-fan
+++ b/Documentation/hwmon/pwm-fan
@@ -15,3 +15,7 @@ The driver implements a simple interface for driving a fan connected to
 a PWM output. It uses the generic PWM interface, thus it can be used with
 a range of SoCs. The driver exposes the fan to the user space through
 the hwmon's sysfs interface.
+
+The measured fan rotation speed returned via 'fan1_input' is derived
+from the sampled interrupts from the tachometer signal by assuming
+a 2 pulse-per-revolution fan.
-- 
2.7.4

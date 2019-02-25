From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC V2 2/3] Documentation: pwm-fan: Add description for RPM support
Date: Mon, 25 Feb 2019 16:59:18 +0100
Message-ID: <1551110359-19860-3-git-send-email-stefan.wahren@i2se.com>
References: <1551110359-19860-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551110359-19860-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This adds a short description for the new RPM support of the pwm-fan
driver.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/hwmon/pwm-fan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/hwmon/pwm-fan b/Documentation/hwmon/pwm-fan
index 18529d2..82fe967 100644
--- a/Documentation/hwmon/pwm-fan
+++ b/Documentation/hwmon/pwm-fan
@@ -15,3 +15,6 @@ The driver implements a simple interface for driving a fan connected to
 a PWM output. It uses the generic PWM interface, thus it can be used with
 a range of SoCs. The driver exposes the fan to the user space through
 the hwmon's sysfs interface.
+
+The fan rotation speed returned via the optional 'fan1_input' is extrapolated
+from the sampled interrupts from the tachometer signal within 1 second.
-- 
2.7.4

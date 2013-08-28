From: Oleksandr Kravchenko <o.v.kravchenko@globallogic.com>
Subject: [PATCH v5 1/2] staging: iio: Documentation sysfs-bus-iio add power_mode
Date: Wed, 28 Aug 2013 13:51:48 +0300
Message-ID: <1377687110-5632-1-git-send-email-o.v.kravchenko@globallogic.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, grygorii.strashko@globallogic.com
Cc: Oleksandr Kravchenko <o.v.kravchenko@globallogic.com>
List-Id: devicetree@vger.kernel.org

Add description about in_accelX_power_mode and
in_accel_power_mode_available.

Signed-off-by: Oleksandr Kravchenko <o.v.kravchenko@globallogic.com>
---
 Documentation/ABI/testing/sysfs-bus-iio |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index dda81ff..1a333f3 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -792,3 +792,13 @@ Contact:	linux-iio@vger.kernel.org
 Description:
 		This attribute is used to read the amount of quadrature error
 		present in the device at a given time.
+
+What:		/sys/.../iio:deviceX/in_accelX_power_mode
+KernelVersion:	3.11
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Specifies the chip power mode.
+		low_noise: reduce noise level from ADC,
+		low_power: enable low current consumption.
+		For a list of available output power modes read
+		in_accel_power_mode_available.
-- 
1.7.9.5

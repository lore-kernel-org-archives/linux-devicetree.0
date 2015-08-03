From: Matt Porter <mporter@konsulko.com>
Subject: [PATCH 3/3] MAINTAINERS: add max6675 driver
Date: Mon,  3 Aug 2015 16:56:50 -0400
Message-ID: <1438635410-3757-4-git-send-email-mporter@konsulko.com>
References: <1438635410-3757-1-git-send-email-mporter@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438635410-3757-1-git-send-email-mporter@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux IIO List <linux-iio@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add myself as the MAX6675 driver maintainer.

Signed-off-by: Matt Porter <mporter@konsulko.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a226416..355cc09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6543,6 +6543,13 @@ S:	Maintained
 F:	Documentation/hwmon/max6650
 F:	drivers/hwmon/max6650.c
 
+MAX6675 THERMOCOUPLE CONVERTER DRIVER
+M:	Matt Porter <mporter@konsulko.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/temperature/max6675.txt
+F:	drivers/iio/temperature/max6675.c
+
 MAX6697 HARDWARE MONITOR DRIVER
 M:	Guenter Roeck <linux@roeck-us.net>
 L:	lm-sensors@lm-sensors.org
-- 
2.1.4
